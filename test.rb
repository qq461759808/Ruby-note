# encoding: UTF-8
# 上方为指定代码中所用编码,"这个注释为魔法注释（magic comment）"
# #注释
=begin
多行注释
=end
#nil,false为假，其他都为真
print('Helloああ,\n',"World!\n")#输出函数，不会自动换行,""和''都可以用，但是''里的转义字都无法生效，除了\'
print "Hei!"#Ruby的函数可以省略括号，前面打个空格就可以
puts 'hhhh','w'#也是输出，在每个字符串后面都会加换行符
p "hh\n",'18923\n'#也是输出，转义字符不生效，在每个字符串后面都会加换行符，并且会打印出字符串两端的引号,单双引号都会变成双引号打印出来，表示打印出的是字符串
p 18923
print "hahaha=#{1+2-9}\n"# "#{...}"可以嵌入变量，表达式等
print 'hahaha=#{1+2-9}\n',"\n"
abc=2990
print "abc=#{abc}\n"
p "hahaha=#{1+2-9}"
p 'hahaha=#{1+2-9}'

if abc>0 then#条件判断
  p abc
end
if abc<1000#then可以省略
  p abc,""
elsif abc<2000#else if 写作elsif
  p abc,""
end
abc=990
while abc>0 do#循环语句
  p abc
  abc-=100
end
abc=999
while abc>0#do也可以省略
  puts abc
  abc=abc-200
end
8.times do#times 指定次数循环,do不能省略
  print 'a'
end
puts ""

shuzu=[12,34,"hehe"]#数组(array)，用[]
shuzu[5]=99##超下标会自动扩容，没赋值的位置为nil
puts "数组长度为#{shuzu.size}"#打印数组长度
p shuzu
shuzu.each do |i|#遍历数组，|..|中间填循环变量
  print("-#{i}-")
end

puts ""
sanlie={aa:"Fuck",:bb=>"shit","cc"=>"mbd"}# :abc 是符号（symbol），和字符串类似，:abc.to_s符号转字符串，"abc".to_sym字符串转符号。{}是散列(hash)，存键值对，键值对之间用:或=>
print sanlie["cc"],sanlie[:aa]#读取的时候注意符号不能少了:
sanlie[:ccc]="FFFFF"#给不存在的键赋值可以扩容
sanlie.each do |k,v|
  print "值为#{v}，键为#{k}\n"
end

#正则表达式
puts /aaa/=~"bbaaac"#查询字符串，有的话返回开始下标，没有则返回nil
puts /aaA/=~"bbaaacaaA"#
puts /aaA/i=~"bbaaacaaA"#加i表示不区分大小写

puts ARGV[0]#ARGV命令行参数
p "2".to_i#to.i 转成整数
file=File.open "hahaha.txt"#打开文件
puts "read",file.read#读取文件全部内容
file.close#关闭文件
file=File::open("hahaha.txt")#调用类方法时.可以替换成::
eachline=file.each_line#each_line 一行行读取
eachline.each do |line|
  print line
end
file.close
file=File.open "hahaha.txt"
file.each do |line|
  print line
end
puts ""

# re=Regexp.new ARGV[0]#用字符串创建正则表达式对象
# file=File.open ARGV[1]
# file.each_line do |line|
#   if re=~line
#     puts line
#   end
# end
# file.close

require "./testRequire"#require 引入其他模块
filterFile "dsf","test.txt"

#函数
def printHello
  puts "Hello,sir"
end
printHello

require "date"
puts (Date.today - Date.new(1993,2,24)).to_i#日期模块

require "pp"
sanlie={sds:"jhek",sdx:'jskd'}
pp sanlie#pp也是类似p的输出，但是会整理格式更方便查看
p sanlie

$abc=1#变量名前加$是全局变量
abc=2
ABC=3#首字母大写是常量，修改会警告，不会报错
Abc=4
# ABC=4
# Abc=5
Sz=[1,2,3]
Sz.freeze#冻结常量，让它不可修改，修改会直接报错
# Sz<<4#修改了，报错了
Sz=2#改内容会报错，但是好像改指向不会报错，这个算不算改指向？这里没有报错，只是警告
puts "Sz:#{Sz}"
Abc.freeze#冻结常量，让它不可修改。这里也没有报错，只是警告。。。
Abc=2
print $abc
puts abc
puts ABC
puts "Abc:#{Abc}"
puts "Abc_id:#{Abc.object_id}","Sz_id:#{Sz.object_id}"#感觉Ruby里存个数，存的应该只是一个指向，这里两个值为2的不同变量的id是一样的。（？）

a,*b,c=1,2,3,4,5#多重赋值，变量名前加*会把多个值搞成数组赋给它。值比变量少的时候会给分不到值的变量分配nil
p [a,b,c]
a,b=b,a#交换值
p [a,b]
shuzu=[1,2,3]
a,b,c=shuzu#用数组来进行多重赋值
p [a,b,c]
shuzu=[1,[2,3],4]
a,b,c=shuzu#还是多重赋值，用嵌套数组
p a,b,c
a,(b1,b2),c=shuzu#还还是多重赋值，用嵌套数组内部的值
p a,b1,b2,c

puts "".empty?#判断字符串是否为空，返回值为布尔的方法结尾按规定都应该是"?"

unless a>2 then#除非 条件 否则就执行。与if相反。then也能省略
  p "unless",a
end

case a
when 1
  print a
when 2
  print a,a
when 3
  print a,a,a
end
if String==="a"#===是更广义的相等，=== 可以与=~ 一样用来判断正则表达式是否匹配，或者判断右边的对象是否属于左边的类，等等。
  puts "String a"
end
puts "a#{a}" if a>0
puts "a#{a}" unless a<0
a="1"
b=a
c="1"
puts a.__id__#__id__ 显示变量的id
puts c.object_id#object_id 显示变量的id
pp a==c#判断值是否相等
pp a.equal? c#.equal? 判断id是否相同
pp a.equal? b
pp 1.eql?(1.0)#eql? 判断值和类型是否相同

8.times do |i|#循环次数会赋值给i
  puts "第#{i}次循环"
end
6.times{|i|#同上
  puts "i#{i}"
}

for i in 2..4 do#for循环，do可省略，..前后是范围。这种写法与Range.new(2,4)是等价的
  puts i
end

for i in shuzu#用for遍历
  p i
end

a=1
b=10
while a<b do#while循环，do可以省略
  puts a
  a+=1
end
a=1
until a>=b do#until循环，与while正好相反，do可以省略
  puts a
  a+=1
end
shuzu.each{|i|#用each来遍历
  p i
}
(1..6).each do |i|#用each来遍历
  p i
end
a=1
b=1
p "loop"
loop do#loop，死循环，do不能省略
  if a==10
    break#退出循环
  elsif a==3
    a+=1
    next#跳过本次进入下次循环
  end
  puts a
  if b<3
    b+=1
    redo#重做本次循环
  end
  a+=1
end

#方法
def aab
  return "a"
end
def printH(b,a="k")
  puts "printH","a#{a}","b#{b}"
  # if "k"==a
  #   return "k"#return可以省略,方法中执行的最后一句的结果会被当作返回值，如下面的"H"
  # elsif
  #   "H"
  # end
  aab#return可以省略,方法中执行的最后一句的结果会被当作返回值
end
p printH(a="c")#这种写法不会把"c"赋值给形参a，会把(a="c")这整个式子的值赋值给第一个形参b，想实现类似python中的那种关键字形参效果要用下面这个写法
def printGJZ(a:"axc",b:"bxc",c:"cxc",**d)#需要使用关键字的形参需写成 变量名:值 的形式，传参时只能用 关键字:值 的方式来传参，普通的传参方式无效，形参名前加**可以接受任意未定义的关键字形参
  puts "PrintGJZ","axc:#{a}","bxc:#{b}","cxc:#{c}","d:#{d}"
end
printGJZ(b:"bbb",v:"vvv")
sanlie={a:"a11",b:"bb2",c:"3"}
printGJZ sanlie#关键字形参可以直接存到散列里，然后用散列来传参

def testargs(a,*b,c)#参数前加*，该参数就可以接受多个值
  puts "a#{a}"
  puts "b#{b}"
  puts "c#{c}"
end
testargs 1,2,3,4,5,6,7
def testChaiShuZu a,b,c
puts "a:#{a}","b:#{b}","c:#{c}"#缩进好像不是必须的。缩进在用的时候按规定一般是两个空格表示一个缩进
end
shuzu=[1,2,3]
testChaiShuZu *shuzu#实参数组前加*可以把数组拆开分别传入函数中。注意，元素个数必须与参数数量一致
print "a";puts "b"#中间加;可以不换行

puts shuzu.class#.class显示对象属于哪个类
puts shuzu.instance_of? Hash#判断对象是否属于该类，返回真假

class TestClass#类名首字母必须要大写！不然会报错
  def initialize a
    @abc=a#变量名前加@会被识别为实例变量
  end
  def add
    @abc+=1
  end
  def abc#存取器的"取"方法
    @abc
  end
  def abc= value#存取器的"存"方法，注意变量名后的=
    @abc=value
  end
end
testclass=TestClass.new 3
testclass.add
puts testclass.abc#Ruby中无法直接访问实例变量，试过了，直接报错，需要写个同名方法，ruby中这种方法叫做存取器
#这样写存取器太繁琐了，所以Ruby又搞了其他的方式来简化，如下
class TestClass2
  def initialize a
    @ab=a
    @ac=a
  end
  attr_accessor :ab#存取器，读写
  attr_reader :ac#存取器，只读
  attr_writer :ac#存取器，只写
end

class TestClass3
  def defa
    abc=1#注意！这句话和下面的这句是完全不一样的。这句是创建一个名叫abc的变量并给它赋值为1
    self.abc=1#这句话是在调用"abc="这个函数，并传递参数 1。self是引用实例本身，self无法被赋值
    puts self
  end
  def abc= a

  end
end
tc3=TestClass3.new
tc3.defa

#上面都是实例方法，下面来定义类方法
#方法一，写完类再写一个名字前面加<<的类，专门来写类方法
class << TestClass3#注意！要先定义一次TestClass3才行，定义完TestClass3类再写这个<< TestClass3
  def fff
    puts self
  end
end
TestClass3::fff
#方法二，写类时，在里面套一层名字前面带 << 的类，在它里面写类方法
class TestClass4
  # class << TestClass4# TestClass4 可以写成 self ！
  #   def fff
  #     puts self
  #   end
  # end
  class << self# TestClass4 可以写成 self ！
    def fff
      puts self
    end
  end
end
TestClass4.fff
#方法三，写方法时在方法名前面加类名
class TestClass5
  def TestClass5.fff#写方法时在方法名前面加类名.
    puts self
  end
  def self.fffc#TestClass5 可以写成 self
    puts self
  end
end
TestClass5.fff
TestClass5.fffc

#类常量
class TestChang
  Chang=1#类常量可以直接定义
end
puts "TestChang:#{TestChang::Chang}"#常量可以直接用 类名::常量名 引出  .不行

class TestLeiBianLiang
  @@abc=0#变量名前加@@变量会变成类变量，类变量也不能在外部直接访问，需定义存取器，但是attr_accessor这种简单的写法无效。感觉很蠢，但是2。0版本好像没有好的解决方案
  def self.abc#存取器的"取"
    @@abc
  end
  def self.abc=value#存取器的"存"
    @@abc=value
  end
end
TestLeiBianLiang.abc =9
puts TestLeiBianLiang.abc

#方法权限
class TestQuanxian
  public#类似c++，这句下之下设为公有
  def fff
    puts "fff"
  end
  def ffc
    puts "ffc"
  end
  private#类似c++，这句下之下设为私有（在指定接收者的情况下不能调用该方法，只能使用缺省接收者的方式调用该方法，因此无法从实例的外部访）
  def ffa
    puts "ffa"
  end
  protected#类似c++，这句下之下设为保护级别，在同一个类（及其子类）中时可将该方法作为实例方法调用
  def ffb
    puts "ffb"
  end
  def ffd
    puts "ffd"
  end
  public :ffd#另外一种改权限的方式，权限后面写 符号(symbol)类型的方法名
end
tqx=TestQuanxian.new
tqx.fff
# tqx.ffa
# tqx.ffb
tqx.ffd

class TestQuanxian#Ruby可以像这样在已有类的基础上添加函数
  def fcc
    puts "fcc:#{self}"
  end
end
tqx.fcc
class TestJiCheng<TestQuanxian#继承，子类 < 父类
  def ffff
    puts "ffff"
  end
end
tjc=TestJiCheng.new
tjc.ffc

#取别名
def abcd
  puts "abcd"
end
alias old_abcd abcd#alias 别名 原名
old_abcd
def abcd#修改原方法
  puts "new_abcd"
end
old_abcd#取了别名的不会被修改到，还是原来的方法
abcd
alias :old_abcd2 :abcd#另一种写法
old_abcd2

tqx1=TestQuanxian.new
tqx2=TestQuanxian.new
class << tqx1#给 实例tqx1 添加方法
  def ccc
    puts "ccc"
  end
end
tqx1.ccc#
# tqx2.ccc
class << tqx2#对tqx2对象做操作
  undef fcc#undef 删除tqx2的方法fcc！
end
tqx1.fcc
# tqx2.fcc
class TestUndef
  def ffcc
    puts "ffcc"
  end
  def ffccc
    puts "ffccc"
  end
  undef ffcc#undef 删除方法ffcc！
end
# puts TestUndef.new.ffcc
puts TestUndef.new.ffccc

#模块
# include Math#引入模块Math,可以直接使用Math中的方法，感觉跟python的import一样，这儿好像没对，应该是Ruby的require跟python的import比较像。
# puts "Math.sqrt:#{sqrt 100}"
class TestMath
  include Math#将Math模块引入类中，使类包含Math的方法等。在使用上类似于继承，但是Ruby不支持多继承！这个应该可以算是弥补多继承的。这个操作叫做Mix-in
  def hahasqrt
    puts "TestMath.sqrt:#{sqrt 100}"#像这样可以直接使用
  end
end
TestMath.new.hahasqrt
# puts "Main.Math.sqrt:#{sqrt 100}"#类中引入不会作用于类外部（即使是同文档内），这里报错了
module TestModule
  Chang=1
  def TestDef
    puts "TestDef"
  end
  module_function :TestDef#模块方法需要用module_function声明一下才能在外部调用，注意后面写的是符号(symbol)不是函数，名字前面要加:。不声明直接在外部调用会报
  #错，已测试。module_function还有其他问题，会导致把该方法变成私有，并且无法（我试了没成功）改回公有，并将其改成模块方法。就是说这样之后可以 模块名.方法 来调用，但是无法在被类
  #include用实例对象 对象名.方法 来调用。要解决这种情况可以使用下面的extend self
  def TestDefSelf
    puts "TestDefSelf:#{self}"
  end
  module_function :TestDefSelf
end
puts TestModule::Chang#可以这样直接引出模块常量，.不行必须用::
# tm=TestModule.new#模块不能有对象，虽然在这里点出了new，但是运行这里就报错了
TestModule.TestDef
TestModule.TestDefSelf
class TestMath
  include TestModule
end
tm1=TestMath.new
# tm1.TestDefSelf#因为上面很近的那句很长的话的原因，这里会报错。
module TestExtend
  extend self#extend 类似 include。include是引入模块，并将模块方法变成类的实例方法。extend是引入模块，并将模块方法变成类的类方法。在这里extend self起到和module_function类似的
  #功能，可以从外部访问模块方法，并且不会影响引入模块的类的对象调用。就是上面那句很长的话说的不能的功能现在可以了
  def testDef
    puts "testDef"
  end
  def testDefSelf
    puts "extend:#{self}"#注意，模块中的self在以 模块方法 的形式调用和以 引入类的实例的方法 的形式来调用时，self指向的对象不同。一般不建议在定义为模块函数的方法中使用 self。
  end
end
TestExtend.testDefSelf
class TestMath
  include TestExtend
end
te=TestMath.new
te.testDefSelf
module TestExtendM
  def cm
    puts "Extend:Class Method"
  end
end
module TestIncludeM
  def im
    puts "Include:Instance Method"
  end
end
class TestICM
  extend TestExtendM
  include TestIncludeM
end
TestICM.new.im#上面说的 include是引入模块，并将模块方法变成类的实例方法。extend是引入模块，并将模块方法变成类的类方法。
TestICM.cm
puts TestMath.include? TestExtend#include? 判断类是否包含某模块
module TestExtend2
  def eff
    puts "eff"
  end
end
te.extend TestExtend2#extend 的另一个用法，可以把模块Mix-in入对象中
te.eff
p TestMath.ancestors#打印出TestMath的祖先（包括父类，被包含的模块等）
p TestMath.superclass#打印出TestMath的祖先的父类

p((1..5).to_a)#范围
p(Range.new(1,5).to_a)#效果跟1..5完全相同
p((1...5).to_a)#..的包头不包尾版本
p ("a"..."h").to_a#字符也可以生成范围
p ("a3"..."a9").to_a#这样也可以生成范围
p ("n1"..."o3").to_a#这样也可以生成范围
puts 4.succ#按顺序给出下个值，Range内部好像是用的这个succ来实现的

#运算符重载
class Dian
  @x=0
  @y=0
  attr_accessor :x,:y
  def initialize x,y
    @x=x
    @y=y
  end
  def + other#重载+号。
    self.class.new(x+other.x,y+other.y)
  end
  def -@#重载一元运算符，方法名中在运算符后面加@
    self.class.new(-@x,-@y)
  end
  def [] other#重载下标运算符[]
    if 0==other
      x
    elsif 1==other
      y
    end
  end
  def zero#临时在测试一些内容
    x=0#直接写x如果不赋值直接读取的话，会被当作实例变量@x来处理。但是在这儿执行x=0操作的话，是新建一个局部变量x，并赋值为0。
    @x=5
    puts "zero:#{x},#{y}"#注意，这里的x和y是不一样的，x是方法内的局部变量，而y是实例变量@y。
  end
  def to_s
    "#{@x},#{@y}"
  end
end
d1=Dian.new 1,2
d2=Dian.new 2,3
puts d1
puts d2
puts d1+d2
d1.zero
puts d1
puts -d1
puts d1[1]

#p与puts的不同，puts，print都是调用了对象的to_s函数，而p调用的是inspect函数
puts "\"".inspect#给程序员确认程序状态、调查对象内部信息等时用 inspect 方法。
puts "\"".to_s

#异常处理
br=1
begin#c++,python:try 开始监测代码
  if 2==br
    eval "ccc=1"
  end
  puts "a:#{a=ccc}"
rescue =>a#c++:catch  python:except 接收异常。程序员可以在这里对异常作出分析和处理。这里可以填参数，参数会接收异常对象，参数前要写=>，
  # 不填参数的话默认的异常对象是$!。$!是最后发生的异常（异常对象），$@是最后发生的异常的位置信息。class 异常的种类 ，message 异常信息，
  # backtrace 异常发生的位置信息（$@ 与 $!.backtrace 是等价的）
  puts "rescue:#{a}"
  # puts "rescue:#{$!}"
  br=2
  retry
ensure#c++,python:finally  扫尾代码，出不出现异常这里的代码都会被执行。
  puts "ensure"
end