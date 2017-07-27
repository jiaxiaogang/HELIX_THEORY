# List语言
***


- ### s表达式
```
	1. (1+2)*3
		a. (*(+1 2)3)
```

- ### 注释

```
;这是注释
```

- ### 打log:

```
(write "1")
(write-line "Hello world")
```

- ### list列表


- ### 三个基本构建块

```
	1. atom
		a. abc123
	2. list
		a. ( i am a list)
	3. string
		a. "I am a string"

```

- ### 数字运算符

```
+-*/

```


- ### 函数调用

```
f(x) 为: (f x)
cos(45) 为 cos 45

```

- ### 不区分大小写

```
cos 45和 COS 45是一致的
```

- ### 运算符

	1. 逻辑真
		1. t
	2. nil 表示 逻辑false; 还有空的列表

	- 算术运算符:
		- 表:
		- 下表列出了所有支持的LISP算术运算符。假设变量A=10和变量B=20则：
		- |运算符|描述|Example|
			|:---:|:---:|:---:|
			|+|增加了两个操作数|(+ A B) = 30|
			|-|从第一数减去第二个操作数|(- A B)= -10|
			|*|乘两个操作数|(* A B) = 200|
			|/|通过取消分子除以分子|(/ B A) = 2|
			|mod,rem|模运算符和其余整数除法后|(mod B A ) = 0|
			|incf|递增运算符，所指定的第二个参数增加整数值|(incf A 3)=13|
			|decf|递减操作符，通过指定的第二个参数减小整数值|(decf A 4) = 9|
			
		-	实例如下:


```

代码
(setq a 10)(setq b 20)(format t "~% A + B = ~d" (+ a b))(format t "~% A - B = ~d" (- a b))(format t "~% A x B = ~d" (* a b))(format t "~% B / A = ~d" (/ b a))(format t "~% Increment A by 3 = ~d" (incf a 3))(format t "~% Decrement A by 4 = ~d" (decf a 4))

打印结果:
A + B = 30A - B = -10A x B = 200B / A = 2Increment A by 3 = 13Decrement A by 4 = 9
```

- ### 比较(关系运算符)
	- 表
		- 假设变量A=10和变量B=20，则：
		
		- |Operator|描述|Example|
			|:---:|:---:|:---:|
			|=|检查如果操作数的值都相等与否，如果是的话那么条件为真。|(= A B)= true.|
			|/=|检查如果操作数的值都不同，或没有，如果值不相等，则条件为真。|(/= A B) =true.|
		|>|检查如果操作数的值单调递减。|(> A B) !=true.|
		|<|检查如果操作数的值单调递增。|(< A B) = true.|
		|>=|如有左操作数的值大于或等于下一个右操作数的值，如果是则条件检查为真。|(>= A B) !=true.|
		|<=|如有左操作数的值小于或等于其右操作数的值，如果是，则条件检查为真。|(<= A B) = true.|
		|max|它比较两个或多个参数，并返回最大值。|(max A B) 返回20|
		|min|它比较两个或多个参数，并返回最小值。|(min A B) 返回 20|
		
					





```

代码:

(setq a 10)(setq b 20)(format t "~% A = B is ~a" (= a b))(format t "~% A /= B is ~a" (/= a b))(format t "~% A > B is ~a" (> a b))(format t "~% A < B is ~a" (< a b))(format t "~% A >= B is ~a" (>= a b))(format t "~% A <= B is ~a" (<= a b))(format t "~% Max of A and B is ~d" (max a b))(format t "~% Min of A and B is ~d" (min a b))

打印结果:

A = B is NILA /= B is TA > B is NILA < B is TA >= B is NILA <= B is TMax of A and B is 20Min of A and B is 10

```


- ### 逻辑运算符(布尔)

	- 表
		- Common Lisp中提供了三种逻辑运算符：AND，OR，而不是运算符的布尔值。假定A=nil，B=5，

- |运算符|描述|示例|
	|:---:|:---:|:---:|
	|and|这需要任意数量的参数。该参数是从左向右计算。如果所有参数的计算结果为非零，那么最后一个参数的值返回。否则就返回nil。|(and A B) = NIL.|
	|or|这需要任意数量的参数。该参数是从左向右计算的，直到一个计算结果为非零，则此情况下返回参数值，否则返回nil。|(or A B) = 5.|
	|not|它接受一个参数，并返回t，如果参数的计算结果为nil。|(not A) = T.|
		
		
		
```
		
代码
(setq a 10)(setq b 20)(format t "~% A and B is ~a" (and a b))(format t "~% A or B is ~a" (or a b))(format t "~% not A is ~a" (not a))(terpri)(setq a nil)(setq b 5)(format t "~% A and B is ~a" (and a b))(format t "~% A or B is ~a" (or a b))(format t "~% not A is ~a" (not a))(terpri)(setq a nil)(setq b 0)(format t "~% A and B is ~a" (and a b))(format t "~% A or B is ~a" (or a b))(format t "~% not A is ~a" (not a))(terpri)(setq a 10)(setq b 0)(setq c 30)(setq d 40)(format t "~% Result of and operation on 10, 0, 30, 40 is ~a" (and a b c d))(format t "~% Result of and operation on 10, 0, 30, 40 is ~a" (or a b c d))(terpri)(setq a 10)(setq b 20)(setq c nil)(setq d 40)(format t "~% Result of and operation on 10, 20, nil, 40 is ~a" (and a b c d))(format t "~% Result of and operation on 10, 20, nil, 40 is ~a" (or a b c d))

打印结果
A and B is 20A or B is 10not A is NIL
A and B is NILA or B is 5not A is T
A and B is NILA or B is 0not A is T
		Result of and operation on 10, 0, 30, 40 is 40Result of and operation on 10, 0, 30, 40 is 10
		Result of and operation on 10, 20, nil, 40 is NILResult of and operation on 10, 20, nil, 40 is 10

```

		
- ### 对数(位运算)


	- 表(位运算符位工作并进行逐位操作。对于按位与，或，和XOR运算的真值表如下：)
		
		
- |p|q|p and q|p or q|p xor q|
	|:---:|:---:|:---:|:---:|:---:|
	|0|0|0|0|0|
	|0|1|0|1|1|
	|1|1|1|1|0|
	|1|0|0|1|1|
	
- 通过LISP支持位运算符列于下表中。假设变量A=60和变量B=13，则：

- |操作符|描述|Example|
	|:---:|:---:|:---:|
	|logand|这将返回位逻辑的参数和。如果没有给出参数，则结果为-1，这是该操作的标识。|(logand a b)) = 12|
	|logior|这将返回位逻辑包括它的参数或。如果没有给出参数，那么结果是零，这是该操作的标识。|(logior a b) = 61|
	|logxor|这将返回其参数的按位逻辑异或。如果没有给出参数，那么结果是零，这是该操作的标识。|(logxor a b) = 49|
	|lognor|这不返回的逐位它的参数。如果没有给出参数，则结果为-1，这是该操作的标识。|(lognor a b) = -62,|
	|logeqv|这将返回其参数的逐位逻辑相等（也称为异或非）。如果没有给出参数，则结果为-1，这是该操作的标识。|(logeqv a b) = -50|
	
```	
代码
(setq a 60)(setq b 13)(format t "~% BITWISE AND of a and b is ~a" (logand a b))(format t "~% BITWISE INCLUSIVE OR of a and b is ~a" (logior a b))(format t "~% BITWISE EXCLUSIVE OR of a and b is ~a" (logxor a b))(format t "~% A NOT B is ~a" (lognor a b))(format t "~% A EQUIVALANCE B is ~a" (logeqv a b))(terpri)(terpri)(setq a 10)(setq b 0)(setq c 30)(setq d 40) (format t "~% Result of bitwise and operation on 10, 0, 30, 40 is ~a" (logand a b c d))(format t "~% Result of bitwise or operation on 10, 0, 30, 40 is ~a" (logior a b c d))(format t "~% Result of bitwise xor operation on 10, 0, 30, 40 is ~a" (logxor a b c d))(format t "~% Result of bitwise eqivalance operation on 10, 0, 30, 40 is ~a" (logeqv a b c d))

打印结果
BITWISE AND of a and b is 12BITWISE INCLUSIVE OR of a and b is 61BITWISE EXCLUSIVE OR of a and b is 49A NOT B is -62A EQUIVALANCE B is -50
		Result of bitwise and operation on 10, 0, 30, 40 is 0Result of bitwise or operation on 10, 0, 30, 40 is 62Result of bitwise xor operation on 10, 0, 30, 40 is 60Result of bitwise eqivalance operation on 10, 0, 30, 40 is -61
```		

- ### 转义符
	- ()

- ### lisp计算一切(如果不想计算;前面加')

```
	1. 如:
	(write '(* 2 3))(write (* 2 3))
	
	2. log:
	(* 2 3)
	6
```
	
- ### 数据类型

	- 标量类型
		- 数字类型
		- 字符
		- 符号等
	- 数据结构
		- 列表
		- 向量
		- 比特向量
		- 字符串

- ### typep谓词用于发现一个对象是否属于一个特定的类型。



- ### type-of函数，返回给定对象的数据类型的类型。

```
(setq x 10)(setq y 34.567)(setq ch nil)(setq n 123.78)(setq bg 11.0e+4)(setq r 124/2)(print (type-of x))(print (type-of y))(print (type-of n))(print (type-of ch))(print (type-of bg))(print (type-of r))
	
	
打印结果:
(INTEGER 0 281474976710655) SINGLE-FLOAT SINGLE-FLOAT NULL SINGLE-FLOAT (INTEGER 0 281474976710655)
```

- ### 在LISP类型说明符


- 类型说明符是数据类型的系统定义的符号。

|array|fixnum|package|simple-string|
|:---:|:---:|:---:|:---:|
|atom|float|pathname|simple-vector|
|bignum|function|random-state|single-float|
|bit|hash-table|ratio|standard-char|
|bit-vector|integer|rational|stream|
|character|keyword|readtable|string|
|[common]|list|sequence|[string-char]|
|compiled-function|long-float|short-float	symbol|
|complex|nill|signed-byte|t|
|cons|null|simple-array|unsigned-byte|
|double-float|number|simple-bit-vector|vector|

> 除了这些系统定义的类型，可以创建自己的数据类型。当一个结构类型是使用defstruct函数定义，结构类型的名称将成为一个有效的类型符号

- ### 声明变量与取值

```
(setq x 10)(setq y 34.567)(setq ch nil)(setq n 123.78)(setq bg 11.0e+4)(setq r 124/2)(print x)(print y)(print n)(print ch)(print bg)(print r)


打印如下:
10 34.567 123.78 NIL 110000.0 62

```

- ### 宏定义defmacro

```
如: defmacro setTo10(num) (setq num 10)(print num)) (setq x 25) (print x) (setTo10 x)

打印如下:
25
10

```

### 全局变量defvar

```
如:(defvar x 234)
(write x)

打印结果:
234
```

- ### 变量声明-构建符号setq

```
如:
(setq x 10)(setq y 20)(format t "x = ~2d y = ~2d ~%" x y)(setq x 100)(setq y 200)(format t "x = ~2d y = ~2d" x y)

打印如下:
x = 10 y = 20
x = 100 y = 200
```


- ### 局部变量let

	- let:
		- 语法
			- (let ((var1  val1) (var2  val2).. (varn  valn))<s-expressions>)
		- 如:
			- (let ((x 'a)         (y 'b)         (z 'c))(format t "x = ~a y = ~a z = ~a" x y z))
		- 打印如下:
			- x = A y = B z = C
	- prog:
		- 如:
			- (prog ((x '(a b c))        (y '(1 2 3))        (z '(p q 10)))(format t "x = ~a y = ~a z = ~a" x y z))
		- 打印如下:
			- x = (A B C) y = (1 2 3) z = (P Q 10)



- ### 常量defconstant

```
如:
(defconstant PI 3.141592)(defun area-circle(rad)  (terpri)  (format t "Radius: ~5f" rad)  (format t "~%Area: ~10f" (* PI rad rad)))  (area-circle 10)
  
打印如下:
Radius: 10.0
Area:     314.1592



```


- ### 参考资料:

	- [http://www.yiibai.com/lisp/lisp_macros.html](http://www.yiibai.com/lisp/lisp_macros.html)
