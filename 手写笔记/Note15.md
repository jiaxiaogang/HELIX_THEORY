# 小鸟生存演示 & 势


<!-- TOC depthFrom:1 depthTo:6 withLinks:1 updateOnSave:1 orderedList:0 -->

- [小鸟生存演示 & 势](#小鸟生存演示-势)
	- [n15p1 小鸟生存](#n15p1-小鸟生存)
	- [n15p2 小鸟生存演示的实践细节点](#n15p2-小鸟生存演示的实践细节点)
	- [n15p3 生存期场景搭建](#n15p3-生存期场景搭建)
	- [n15p4 成长期之进食](#n15p4-成长期之进食)
	- [n15p5 视觉算法](#n15p5-视觉算法)
	- [n15p6 二次开发2 (吃)](#n15p6-二次开发2-吃)
- [define EAT_REACTORID @"eatReactorId" //吸吮反射标识](#define-eatreactorid-eatreactorid-吸吮反射标识)
- [define EAT_RDS @"EAT_RDS" //吸吮反射标识](#define-eatrds-eatrds-吸吮反射标识)
	- [n15p7 二次开发3 (飞)](#n15p7-二次开发3-飞)
	- [ToDoList](#todolist)

<!-- /TOC -->


<br><br><br><br><br>


## n15p1 小鸟生存
`CreateTime 2018.10.22`


| “小鸟生存演示”的简要说明：>> |
| --- |
| 1. 有一位纽约大学的教授，他每天下班路过一条路。 |
| 2. 然后路边有一些坚果树，树长大了，开始结果子。 |
| 3. 有一天来了几只乌鸦。 |
| 4. 乌鸦把路边有破壳的坚果肉吃了。 |
| 5. 再有一次下班，他看到乌鸦停在十字路口的电线上，把坚果扔在路上。 |
| 6. 等红灯的时候，乌鸦就下来吃被汽车压破的坚果肉。 |
|  |
| > 这是一个真实的故事，小鸟表现出了认知、学习、思考、分析、联想、需求、决策与行动等等智能体现。同时这位教授说：目前AI七十年来，全球范围内所有的科学家学者等，无人能解此题。所以他写了一篇文章：呼吁大家，来搞一个乌鸦启示的演示程序，用真正的AGI角度来解决这个问题。 |

<br>

| 简介 >> |
| --- |
| 以小鸟生存为例,设计一个类似而适用于he的演示示例; |
| 体现出he完全自主的智能。感知、认知、推理、学习、和执行; |
| ![](assets/65_乌鸦图腾.png) |

<br>

| 拆解思考 >> |  | status |
| --- | --- | --- |
| 1 | 食物欲望 | true |
| 2 | 无法直接获取食物 |  |
| 3 | 观察可获取的间接方式 |  |
| 4 | 间接方式导致危险 |  |
| 5 | 对危险的恐惧及避开方式 |  |
| 6 | 难点在于,乌鸦仅有一条生命,一次机会 |  |
| 7 | 后天对于撞击的疼痛,产生恐惧 (与一定相对速度物体撞击的距离感知,产生恐惧mv) |  |
| 8 | 乌鸦对于撞击的预测 |  |

<br>

| 代码实现 >> |  |
| --- | --- |
| 1 | 以游戏的方式来达成智能演示 |
| 2 | 乌鸦学会移动自己 (速度min-max) |
| 3 | 乌鸦对游戏场景的信息输入 (伪视觉) |
| 4 | 对场景中移动物体的视觉算法处理 |



<br><br><br><br><br>


## n15p2 小鸟生存演示的实践细节点
`CreateTime 2018.11.08`

| 成长期步骤 >> |  |
| --- | --- |
| 1 | 学习进食 |
| 2 | 学习飞行 |
| 3 | 学习碰撞疼痛 |
| 4 | ... |

<br>

| 生存期 >> |  |
| --- | --- |
| 1 | 看到坚果 |
| 2 | 看到公路 |
| 3 | 看到车辆 |
| 4 | 看到信号灯 |
| 5 | 看到车辆的行驶停止 |
| 6 | 看到车辆碾压坚果 |

<br>

| 其它 >> |  |
| --- | --- |
| 1_注意 | he4o并不具备独立成熟的小脑网络,所以小鸟要尽量依赖思考,不要依赖行动 |
| 2_难点 | he4o在"mv基本模型"中,对于时间间隔的信息是不够的,是否添加上? (曾这么做过) |
| 3_难点 | speed信息的变化->对应mv疼痛的变化; 此时信息变化不再是单独的值,而是抽象成方向; |



<br><br><br><br><br>


## n15p3 生存期场景搭建
`CreateTime 2018.11.12`

| 示图 >> |
| --- |
| ![](assets/66_生存期场景A.png) |
| 1. 汽车从左向右行驶在道路上; |
| 2. 红灯停,绿灯行; |
| 3. 坚果树向下掉落带壳坚果; |
| 4. 掉到公路上的坚果,会被汽车压掉壳; |




<br><br><br><br><br>


## n15p4 成长期之进食
`CreateTime 2018.11.13`

|  |
| --- |
| 1. 设置投喂按钮,用户做为鸟妈妈投食; |
| 2. 小鸟在吃的时候看到坚果,并吃掉坚果; |

| 示图 >> |
| --- |
| ![](assets/66_成长期场景.png) |
| 1. 直投负责将食物直接喂食给小鸟; |
| 2. 乱投负责将食物投到指定位置; |
| 3. 小鸟在此场景内,需要学会进食、飞行、撞击的疼痛感。 |



<br><br><br><br><br>


## n15p5 视觉算法
`CreateTime 2018.11.13`

| 简介 >> |
| --- |
| 在本演示中,小鸟采用伪视觉 |
| 小鸟可以看到二维场景中的几个物体,如Car,Load,Food,Light |

<br>

| 视觉算法 >> |  |  | desc |
| --- | --- | --- | --- |
| 1 | 大小 | size |  |
| 2 | 颜色 | color |  |
| 3 | 形状(圆角) | radius |  |
| 4 | 相对位置 | origin | 视觉对象的位置,是相对小鸟而言的 |
| 5 | 相对速度 | speed | 视觉对象的速度,是相对小鸟而言的;速度由两桢位置算出 |


<br><br><br><br><br>


## n15p6 二次开发2 (吃)
`CreateTime 2018.11.16`

| 开发过程 (视觉) >> |  |  |
| --- | --- | --- |
| 1 | 为小鸟创建场景 |  |
| 2 | 为小鸟创建输出反射 | 如:飞行,吸吮反射 |
| 3 | 为小鸟创建信号输入 | 如:视觉等 |
| 4 | 扩展视觉算法 | size,color,radius,origin,speed等 |
| 5 | 扩展视觉算法结果模型 |  |
| 6 | 将算法结果生成模型,并传递给input |  |

<br>

| 开发过程 (学吃飞) >> |  |
| --- | --- |
| 1 | 以某条件触发先天反射,做出最简单的反应; (如吸吮,扇翅膀) |
| 2 | 将反射后,导致的结果信号传回给he; |
| 3 | he自己从中学会吃或飞的抽象; |
| 4 | he通过主动的方式来吃或飞; |

<br>

| QuestionTemplete 1 >> |  |
| --- | --- |
| 问题场景: | 在birdView下写了eat();并让growPage投喂后调用bird.eat(); |
| 问题描述: | 此处需要把吃掉的信号传达给he,否则he是无法理解吃的; |
| 问题分析: | 以代码调用的方式是错误的,此处虽然写了eat方法,但eat并不能代劳,eat这件事必须让he自己来做; |
| 解决思路: | 让he以吸吮反射的方式,去主动吃;并将out入网,以抽象出"吃"的节点; |
| 解决方式: |  |
|  | 1. 在eat()中以某种刺激来引发he的反射; |
|  | 2. 反射后开吃 (he主动调用eat()); |
|  | 3. eat()中, 销毁food,并将产生的mv传回给he; |
| 代码步骤: |  |
|  | 1. 定义一个reactorIdentifier反射标识 (作dS后辍,构建到网络中) |
|  | 2. 调用ReactorControl.commitReactor(),选择性传入runBlock |
|  | 3. 或使用output.delegate = self; (参考代码段A) |
|  | 4. 在回调中,判断reactorId,并做出相应肢体反应; |
| 代码步骤(重构后): |  |
|  | 1. 定义一个rds作为dataSource标识入网 (如下:EAT_RDS) |
|  | 2. 调用ReactorControl.commitReactor() |
|  | 3. 接收广播,并做出相应肢体反应; (参考代码段B) | |

```objective-c
//代码段A
#define EAT_REACTORID @"eatReactorId" //吸吮反射标识
[Output sharedInstance].delegate = self;

/**
 *  MARK:--------------------OutputDelegate--------------------
 */
-(void)output_Reactor:(NSString *)reactorId paramNum:(NSNumber *)paramNum{
    if ([EAT_REACTORID isEqualToString:reactorId]) {
			NSLog(@"反射执行");
		}
}
```

```objective-c
//代码段B
#define EAT_RDS @"EAT_RDS" //吸吮反射标识

//MARK:===============================================================
//MARK:                     < outputObserver >
//MARK:===============================================================
-(void) outputObserver:(NSNotification*)notification{
    if (notification) {
        //1. 取数据
        NSDictionary *obj = DICTOOK(notification.object);
        NSString *rds = STRTOOK([obj objectForKey:@"rds"]);
        NSNumber *paramNum = NUMTOOK([obj objectForKey:@"paramNum"]);

        //2. 吸吮反射
        if ([EAT_RDS isEqualToString:rds]) {
            [self eat:[paramNum floatValue]];
        }
    }
}
```



<br><br><br><br><br>


## n15p7 二次开发3 (飞)
`CreateTime 2018.11.27`

| 接上 >> | (n15p6二次开发2) |
| --- | --- |
| 1 | 小鸟可以根据`扇翅膀`反射,来学会主动飞行 |
| 2 | 以此可以解决小鸟的`移动`,`与坚果距离`,`与汽车相对速度`,`坚果搬运`等问题 |

<br>

| toDoList >> |  | status |
| --- | --- | --- |
| 1 | 测试小鸟可以根据`视觉`等信息来做,能吃到与否的原因分析;(`距离`或`坚果状态`) |  |

<br>

| 瞬时记忆优化 >> |  |
| --- | --- |
| Q1 | TC对algsModel的应对量 `小鸟视觉算法出量大的问题` |
|  | 1. 增加瞬时记忆序列长度,则性能下降; |
|  | 2. 减少瞬时记忆序列长度,则认知基础下降; |
| A1 | 在保证序列长度8的同时,增加信息处理的组; |
|  | 由mv为始,向前8个,发现有组,则组为1个长度 |
|  | 即7个+1组=8 `长度不变` |
|  | 以此类推,来推进认知的更广与更深 |
| 参考 | 代码段:以组替分; |

<br>

```c
//以组替分 >>
//因algsArr.lengeh > 8;
//所以,需要对algsArr中的元素,进行实时的联想,并将已抽象的微信息取回,来以组替分;
//TODOTMR: (2,5) 以组替分
//1. convert2Pointer; (已经ok)
//2. checkConvertAbsPointer; (节约瞬时记忆占用长度,同时为认知升级提供部分支撑)
//3. assData; (对dataIn_AssociativeData()方法进行拆分重构;先不搞)
//4. assMv; (对dataIn_AssociativeData()方法进行拆分重构;先不搞)
//5. ThinkingUtils.analogyOrdersA()方法,扩展对"微信息"信息本身的类比,而非只是pointer;
```


<br><br><br><br><br>


## ToDoList

|  | todo | status |
| --- | --- | --- |
| 1 | output的输出函数统一重构 (改为2个(主动输出 & 反射输出)) | T |
| 2 | Output使用多参数或后辍时,函数定义非常不灵活;(methodName+后辍) | T |
| 3 | 去掉output的block和delegate,改用广播方式; | T |
| 4 | reactorIdentifier作为rds(reactorDataSource)传递 | T |





<br><br><br><br><br><br><br><br><br><br><br>
