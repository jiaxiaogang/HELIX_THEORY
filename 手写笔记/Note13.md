# 宏微是相对的(思维方式)

> 早在note3时,已有关于后天思维方式(三维架构)的想法;
>
> 宏微,看似只有一层,其实界线便没有那么明确,与网络一样,是不限层的;
>
> 那么这一层:
> 1. 如何构建呢?
> 2. 如何融入cmv模型?
> 3. 如何被前额叶使用呢?
> 4. 如何与mv融合呢?
> 5. 如何与net融合呢?
> 6. 如何形成后天思维方式呢?
>
> note13主要面对这些问题而展开;


***

<!-- TOC depthFrom:1 depthTo:6 withLinks:1 updateOnSave:1 orderedList:0 -->

- [宏微是相对的(思维方式)](#宏微是相对的思维方式)
	- [n13p1 思考思维方式之相对宏微](#n13p1-思考思维方式之相对宏微)
	- [n13p2 cmvRule](#n13p2-cmvrule)
	- [n13p3 根枝干网络外观](#n13p3-根枝干网络外观)
	- [Other](#other)

<!-- /TOC -->



<br><br><br><br><br>


## n13p1 思考思维方式之相对宏微
`CreateTime 2018.06.06`

| 思维方式的重要性 >> |
| --- |
| 1. 思维方式是否只是cmv模型,在absNode间的宏观体现 |
| 2. 1种答:如果是则AGI智能体现远超人类,如果否则AGI与人类在同一量级 |
| 3. 2种答:在数据因果复杂度上,可同时分析的信息数是有限的;这个平衡点,制约着智能值; |

<br>

| 宏微界线 >> |
| --- |
| 1. 宏微的界线没有那么明确，每个节点的微信息组,都是微。 |
| 2. 宏微是相对的,(索引与node相对) |
| 3. 宏微是相对的,(类比单位为微，抽象区域为宏。) |

<br>

| 组与分 >> |
| --- |
| 1. 解决集合(组)的问题，而不仅是分。(foOrders为组，absNode为分) |

<br>

| 开发 >> |
| --- |
| 1. shortCache里加上absNode。 |
| 2. shortCache里加上思维log。 |

<br>

| ![](assets/51_相对宏微.png) |
| --- |
| 红线:宏信息中的`微信息组`,也作为`微信息`;以指针形式存在absIndex中, |
| 再由,absReference排序其引用强度; |


<br><br><br><br><br>


## n13p2 cmvRule
`CreateTime 2018.06.07`

| 示图 >> |
| --- |
| ![](assets/50_cmv模型改版.png) |
| `黑: foOrders` `棕: cmv` `灰: reference` `绿: absNode` |




<br><br><br><br><br>


## n13p3 根枝干网络外观
`CreateTime 2018.06.11`

| 前言 >> |
| --- |
| 1. 集合note12所实践的四序列,思考一下网络结构上有没有可优化简化的地方: |

<br>

| ![](assets/52_根枝干.png) |
| --- |
| 注: `i=index` `is=indexs` `abs=abstract` `fon=frontOrderNode` |

<br>

| 明日提示 >> |  |
| --- | --- |
| 1 | 关于cmvModel的:orders,foNode,cmvNode四者分开,还是哪些到一起? |
| 2 | 写mindValueRule |
| 3 | 写cmvNode的抽象 |
| 4 | omv应激反应输出。 |
| 5 |  |
| 6 | 把前因序列类比出的sames也改成时序的。(避免逻辑混乱) |
| 7 | 完善thinking中无mv的assData流程; |
| 8 | dataIn是流式输入;sames也是基于当前输入信号与shortCache已有信号,可进行组合检索的; |
| 9 | noMV的dataIn流程,在联想后,依然noMV,但联想的结果要入到shortCache里; |



<br><br><br><br><br>


## Other

| toDo >> | task | status |
| --- | --- | --- |
| 1 | 删除absNode下的refs_p, | T |
| 2 | 创建absReference | 复用indexReference |
| 3 | 测试absNode的index和reference; | T |
| 4 | 思考absPort和conPort的n对n关系; `太过复杂的关系,是否影响其它,或者造成性能问题` `如果要简化为1对n关系,那应该如何优化网络` `思: n对n关系,说明一个问题,就是要么多了关联,要么少了节点;` | 问题不存在,因为有cmvModel; |







<br><br><br><br><br>
