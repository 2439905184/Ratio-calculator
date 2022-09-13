import std/strutils
import std/strformat
import std/math

echo "--- 欢迎使用比例计算器 ---"
echo "--- 请输入你要使用的功能"
echo "0 计算等比乘法"
echo "1 计算比值并转换成最近整数比"

proc 等比乘法():void
proc 最简整数比():void

var select:int = parseInt(stdin.readLine())
if select == 0:
  等比乘法()
elif select == 1:
  最简整数比()
else:
  echo "错误！不支持的选项"
  
# 计算最简整数比
proc fx(p1,p2:int):array[2,int] = 
  var answer:array[2,int]
  var c = gcd(p1,p2) # 求最大公因数
  answer[0] = int(p1 / c)
  answer[1] = int(p2 / c)
  return answer

proc 等比乘法() = 
  echo "请输入比率如4:3 就先输入一个4 回车 再输入3回车"
  var a:int = parseInt(stdin.readLine())
  var b:int = parseInt(stdin.readLine())
  # 结果
  var a1:int = 0
  var b1:int = 0
  echo "请输入循环次数"
  var times = parseInt(stdin.readLine())
  var f:File = open("等比乘法结果.txt",fmWrite)
  f.write(fmt"基础比例为: {a}:{b}" & "\n")
  for index in 1..times:
    a1 = a*index
    b1 = b*index
    f.write(fmt"{a1} {b1}" & "\n")
  f.close()
  echo "运算已完成: 请查看: 等比乘法结果.txt"

# 利用格式输入语句将输入的两个数分别赋给 a 和 b，然后判断 a 和 b 的关系，如果 a 小于 b，则利用中间变量 t 将其互换。再利用辗转相除法求出最大公约数，进而求出最小公倍数。最后用格式输出语句将其输出。
proc 最简整数比() = 
  echo "请输入现有的比 如127:64 就先输入一个127 回车 再输入64回车"
  var a:int = parseInt(stdin.readLine())
  var b:int = parseInt(stdin.readLine())
  var answer = fx(a,b)
  var f:File = open("化简结果.txt",fmWrite)
  f.write(fmt"输入为: {a}:{b}" & "\n")
  f.write(fmt"结果为: {answer[0]}:{answer[1]}")
  echo "运算已完成: 请查看: 化简结果.txt"