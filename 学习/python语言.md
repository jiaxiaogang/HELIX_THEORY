# python语言
***

- ### 安装:
	1. 直接到官网下载2.7安装;
	2. 在控制台运行python即可打开;
	3. 也可以通过abc.py文件;运行:python abc执行;

- ### 函数
	1. abs(-1)//运行绝对值函数
	2. f = abs//将f变量指向abs函数
	3. f(-1)//运行与abs(-1)相同

- ### 高阶函数
	- 概念:
		- 函数的参数为函数;
	- 如:

	```
	>>> def add(x,y,f):
	...  return f(x)+f(y)
	... 
	>>> add(-5,9,abs)
	14
	>>> 
	```

	- 如:(map函数)==>遍历操作allItem

	```
	>>> def format_name(s):
	...  return s[:1].upper()+s[1:].lower()
	... 
	>>> print map(format_name,['adam','LISA','barT'])
	['Adam', 'Lisa', 'Bart']
	>>> 
	
	```
	- 如:(reduce()函数)==>遍历操作allItem和上次结果;


	```
	def prod(x, y):
	    return x*y
	
	print reduce(prod, [2, 4, 5, 7, 12])
	```
	
	- 如:(filter()函数)

	```
	import math
	
	def is_sqr(x):
	    return math.sqrt(x)%1 == 0
	
	print filter(is_sqr, range(1, 101))
	```


	- 如:(sorted()函数)

	```
	def cmp_ignore_case(s1, s2):
	    return cmp(s1.lower(),s2.lower())//cmp用于比较
	
	print sorted(['bob', 'about', 'Zoo', 'Credit'], cmp_ignore_case)
	```
	
	
- ### 返回值为函数

```
def calc_prod(lst):
    def method(x,y):
        return x*y
        
    def method2():
        return reduce(method,lst)
        
    return method2

f = calc_prod([1, 2, 3, 4])
print f()

```


- ### 类 

	```
	class ClassName:

	def __init__(self,[...):
	def __del__(self,[...):

	```
	- 分类:
		- class OldStyle:

		```
			def __init__(self,name,desc):
				self.name = name
				self.desc = desc
		```
			
		- class NewStyle(object)://继承自object的类)

		```
			sex = 'male'
			def __init__(self,name,desc,age):
				self.name = name
				self._desc = desc
				self.__age = age
 		```
 		
 		```	
		if __name__ == '__main__':
			newS= NewStyle('jxg','cool',30)
		```







- ### 函数:


	- dir(对象)  
		- //打印对象属性
	- type(对象)
		- //打印对象类型
	- 对象.__dict__
		- //打印对象的__init__里的属性值;
	- isinstance(jxg,Person)
		- //返回是否某对象
	- max(xxxlist)
	- round(1.68,1)//精度截取
		- round(1.68,1) //1.7
		- round(1.68) //2
	- help()
		- help(round)//查看round函数帮助
	- len()//字符串长度
	- capitalize()
		- //str首字母大写
	- replace()
		- //str替换
	- bit_length()
		- //float
	- conjugate()
		- //float
	- index()
		- xxxlist.index("itemValue")//返回下标号
	- count()
		- //list
	- append()
		- xxxlist.append("newItem")//list加item

- ### 函数标记


	- @classmethod
	def get_hobby(cls):
		return cls.hobby
		
		- 调用:ClassName.get_hobby
		
	- @property
	def get_weight(self):
		return self.__weight
		
		- 调用:className.get_weight
	
	- def self_introduction(self):
		print 'name is %s' % (self.name)
		
		- 调用:className.get_weight()
		
		
- ### 继承:

```
class ClassBase(object):
	def __init__(self,name):
		self.name = name
		
	def method(self,arg):
		pass
		
		
class ClassSub(ClassBase):
	def __init__(self,name,language):
		super(ClassSub,self).__init__(name)
		self.language = language

	def method(self,arg):     //override父类方法
		super(B,self).method(arg)
		
```		
		
- ### Magic Method


	1. 比较运算符


	- |__cmp__(self,other)|比较|
		|:---:|:---:|
		|__eq__(self,other)|相等|      
		|__lt__(self,other)|小于|
		|__gt__(self,other)|大于|


	2. 数字运算符


	- |__add__(self,other)|加|
	|:---:|:---:|
	|__sub__(self,other)|减|
	|__mul__(self,other)|乘|
	|__div__(self,other)|除|


	3. 逻辑运算符


	- |__or__(self,other)|或|
	|:---:|:---:|
	|__and__(self,other)|并|


	4. 转换为字符串
		1. __str__
		2. __repr__
		3. __unicode__
	5. 展现对象的属性
		1. __dir__
	6. 设置对象属性
		1. __setattr__
			1. 代码:


			```
				def __setattr__(self,name,value):
					self.__dict__[name] = value
			```		
					
	7. 查询对象属性
		1. __getattr__(self,name):
		2. __getattribute__(self,name):
			1. 代码:

			```
				def __getattribute__(self,name):
					return super(ClassName,self).__getattribute__(name);

			```


	8. 删除对象属性:
		1. __delattr__(self,name):

- ### numpy(同类型item)


	1. 安装:


		```
		pip3 iinstall numpy//python3.4以上版本
		sudo easy_install numpy//python3.4以下方式(mac)
		```
		
	2. 使用:

		```
		import numpy as np
		np_height = np.array([1,2,3])
		np_weight= np.array([3,4,5])
		bmi = np_weight / np_height ** 2
		```
		
		1. bmi + bmi //对每个item逐个相加
		2. bmi[0]//取第1个元素
		3. bmi > 23//对比每个item>23返回bool数组;
		4. bmi[bmi > 23]//取出bmi中item>23的并取出来;

	3. 二维numpy数组
		1. np_2d = np.array([[11,12,13],[21,22,23]])//创建
		2. np_2d.shape//打出(2,3) //shape属性
		3. //取值
			1. np_2d[0][2]
			2. np_2d[0,2]
			3. np_2d[:,1:3]//取出所有行的1到小于3列的item;
			4. np_2d[1,:]//取出第2个数组;
	4. numpy常用函数
		- np.mean(np_city[:,0])//取所有行第1列取平均值
		- np.median(np_city[:,0])//取所有行第1列取中位数
		- np.corrcoef(np_city[:,0],np_city[:,1])//相关性
		- np.std(np_city[:,0])//标准差
		- np.sum(.......
		- np.sort(.......
		- height = np.round(np.random.normal(1.75,0.20,5000),2)//随机生成5000条
		- np_city = np.column_stack((height,weight))//内连接成二维数组

- ### matplotlib数据可视化


	1. 引入

		> import matplotlib.pyplot as plt//子包
		
	2. 使用
		- 线图

		```
		x = [1,2,3,4]
		y = [1.5,2.3,5.3,1.8]
		plt.plot(x,y)
		plt.show()
		```

		- 散点图
			```
			x = [1,2,3,4]
			y = [1.5,2.3,5.3,1.8]
			plt.scatter(x,y)
			plt.show()
			```
	
		- 直方图

			```
			values = [0,0.6,1.4,1.6,2.2,2.5]
			plt.hist(values,bins = 3)
			plt.show()
			```
		
		- 区域图

			```
			plt.fill_between(x,y,0,color='green')//线下方填充了颜色
			```


	3. 轴标签

		```
		x = [1,2,3,4]
		y = [1.5,2.3,5.3,1.8]
		plt.plot(x,y)
		plt.xlabel('x轴')
		plt.ylabel('y轴')
		plt.title('标题')
		plt.yticks([0,2,4,6,8,10])//刻度
		plt.yticks([0,2,4,6,8,10],['0亿','2亿','4亿','6亿','8亿','10亿'])//刻度单位
		plt.show()
		```


	4. 新加数据

		```
		x = [1,2] + x
		y = [7,8.3] + y
		```

- ### 安装科学计算包
	- sudo easy_install numpy
	- sudo easy_install pip
	- sudo pip install -U nltk
	- sudo pip install -U nutk
	- sudo pip install -U nlyk
	- sudo pip install -U nltk
	- sudo pip install -U numpy
	- sudo pip install -U scipy
	- sudo pip install -U matplotlib
	
	
```	
if z % 2 == 0:
	print('aaaa')
elif z % 3 == 0:
	print('bbbb')
else:
	print('cccc')
```
	
	
- ### pandas
	- dataframe表
	- 支持csv文件导入
	- 代码:
		```
		import pandas as pd
		brics = pd.read_csv("path/to/brice.csv")
		#brics = pd.read_csv("path/to/brice.csv",index_col = 0)//指定主键
		```

	- 读列
		- brics["country"]//取country列
		- brics.country//取country列
	- 添加列
		- brics["new_column"] = [True,True,True,False]//添加列
		- brics["speed"] = brics["lenght"] / brics["time"] * 1000//添加速度/km列
	- 读行
		- brics.loc["LOWVALUE"]
	- 读某元素
		- brics.loc["LOWVALUE","country"]
		- brics["country"].loc["LOWVALUE"]
		- brics.loc["LOWVALUE"]["country"]


- ### Scikit-learn机器学习包

- ### import包
	- import numpy
	- import numpy as np
	- from numpy import array
		- array([1,2,3])//只引入array时不用写numpy.array;
