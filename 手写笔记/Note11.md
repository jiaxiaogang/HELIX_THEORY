# GNOP

***

<!-- TOC depthFrom:1 depthTo:6 withLinks:1 updateOnSave:1 orderedList:0 -->

- [GNOP](#gnop)
	- [n11p1 最简](#n11p1-最简)
	- [n11p2 logic的结构化](#n11p2-logic的结构化)
	- [n11p3 性能优化](#n11p3-性能优化)
	- [Other](#other)

<!-- /TOC -->


## n11p1 最简
`CreateTime 2018.02.03`

| 前言 >> |
| --- |
| 本节,为找到未能最简化的设计,并进行改良; |

***

| 删AILine >> |
| --- |
| 去掉AILine,由AIPort来替代;`参考当天代码;` |

***

| 删AIChangeNode,AILogicNode >> |  |
| --- | --- |
| 命题: | 关于删除AIChangeNode,AILogicNode的思考 |
| 分析: | 时间产生了动,动产生了变化,产生了逻辑 |
| 核心起因: | 去掉AIChangeNode,变化由静态数据表示,不会是正确的方式; |
| 命题起因: | 1. change和logic并非最简设计; 2. 关于时间时序的知识表示未能完美解决 |
| 问题点: | 1. 不能因时序产生大量数据; 2. 不能因时序破坏原有网络结构 |
| 入口: | 从cmv的变化入手,changeNode确有必要,即真实的结构为:`定义->属性->值->变化` |
| 知识表示: | changeNode有时应体现在absNode上,作为changeNode存在,因为具象信息有明确值 |
| 注: | 先后,from表示先,to表示后; |
| 结果: | changeNode和logicNode删除失败,但需要改进 |


***

| logic的知识表示问题 >> |  |
| --- | --- |
| 命题: | logic需要横跨node;所以logic要么单独设计表示方式,但又不能脱离原有"归纳网络" |

| ![](assets/29_change和logic结构模型.png) |
| --- |



<br><br><br><br><br>


## n11p2 logic的结构化
`CreateTime 2018.02.04`

| logic >> |  |
| --- | --- |
| 介绍 | change因logic才有了意义,而logic依附于`归纳网络`中,所以有了各种复杂的问题解决能力 |
| 生成原则 | 与其它node类似,只有think想到的才会产生关联,而shadowThink弱,deepThink强关联 |



<br><br><br><br><br>


## n11p3 性能优化
`CreateTime 2018.02.04`

| 性能优化 >> |
| --- |
| 1. 按dataType分维存储(以`dataType`和`dataSource`和`值`为索引,快速定位到指定维) |



<br><br><br><br><br>


## Other

| toDoList >> |  |
| --- | --- |
| 1 | 对各种dataSource的记录;(将mvCharge和mvHunger信号处理后类型分开) |
| 2 | 对各种change,用潜意识流logic串起来; |
| 3 | 对导致cmv变化的change,进行类比缩小范围; |
| 4 | 对缩小范围的change用显意识流logic串起来; |
| 5 | 对全局检索进行优化:`分dataType,分dataSource,然后将归纳网络挂到下面` |
| 6 | 加上能量值,并且将`port强度`写完善,然后将`ports默认排序` |
| 7 | 测试一次thinking循环的性能 | 





<br><br><br><br><br>
