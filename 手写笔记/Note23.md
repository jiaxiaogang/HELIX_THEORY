# 九测(融合训练)

> 注:
> 1. 融合训练在八测中已经开始->本章继续;

> 名词解析:
> 1. toFC: 决策流程控制;
> 2. 实概念: 来自inModel中的概念;
> 3. 虚概念: 来自TO解决方案中的概念;
> 4. RFo: 无mv指向的fo;

***

<!-- TOC -->

- [九测(融合训练)](#九测融合训练)
  - [n23p01 九测-觅食防撞融合训练 (getInnerV3回测)](#n23p01-九测-觅食防撞融合训练-getinnerv3回测)
  - [n23p02 网络可视化迭代](#n23p02-网络可视化迭代)
  - [n23p03 getInnerHN拆分](#n23p03-getinnerhn拆分)
  - [n23p04 加强RFo抽具象关联](#n23p04-加强rfo抽具象关联)

<!-- /TOC -->

## n23p01 九测-觅食防撞融合训练 (getInnerV3回测)
`CreateTime 2021.04.11`

在上节中,对理性子任务做了迭代,本节再次对觅食和防撞融合训练,测试之;

| 23011 | 觅食训练最终步骤 (参考22035) |
| --- | --- |
| 1 | `直投,右下飞,直投`, `边直投边飞至右上`x N |
| 2 | `重启,右投,飞至坚果,马上饿`x3 `左投,飞至坚果,马上饿`x3 |
| 3 | `重启,右投,马上饿` (会原地空吃,发现不行再飞至坚果吃) `左投,马上饿`; |

| 23012 | 防撞训练步骤 (参考22161) |
| --- | --- |
| 1 | `直扔木棒`x8向=>习得`F18[A8(无距棒)]->{mv-}` |
| 2 | `偏扔木棒,边右飞边扔`xN=>习得不被撞的经验`Fx->{mv0}` |

| 23013 | getInnerV3()在HN时,传入maskFo为Alg类型错误的BUG `T` |
| --- | --- |
| 调试 | 经调试,错误出现在,当MC转PM进行GL修正失败后,递归回到_Hav找ATHav坚果 |
| 数据 | 此时输出短时结构从父到子为:cFo->cAlg->mAlg->mcValue; |
| 说明 | 即mcValue修正码的父级是实概念(matchAlg),而不是虚概念(curAlg); |
| 分析 | 解决方案的虚概念才需要ATHav,而inModel中的实概念是不需要ATHav的; |
| 治标 | 在传入到getInnerV3的参数做检查,base不是fo类型时,则取base.baseFo; |
| 治本 | toFC中value失败时,如base是replaceAlg跳过,对base.baseAlg做begin; |
| 结果 | 问题本质是`实Alg无需进行ATHav`,治标治本两方案全改掉后ok; |

| 23014 | 无GL距小经验的BUG |
| --- | --- |
| 示图 | ![](assets/439_九测无GL距小经验的BUG.png) |
| 说明 | 在23011第2步中,已经训练右飞变近,但在第3步时,还是未找到GL经验; |
| 调试 | ![](assets/441_23014BUG调试.png) |
|  | 说明:如图TIRFo失败,即当前场景都认识不清,何淡在getInnerV3中应用; |
| TODO | 1. 将TIRFo的结果中,不指向mv的放开 (并处理可能导致的副作用) `T`; |
|  | --> 但仅是放开normal部分,而不放开HNGL和虚mv的部分; |
|  | --> 将不指向mv的命名为matchRFos,原指向的改为matchPFos; |
| TODO | 2. 将TIRFo时,识别目标由matchAFo改为protoAlg (并处理副作用) `T`; |
|  | --> 因为:如图现在matchAFo.A113与inModel.matchAlgs是同层,结构操作乱; |
|  | --> 会导致判断全含时,A113特征不全导致失败; |
|  | --> 并且A113当前向抽象取的assIndexes也不全; |
| TODO | 3. 将TIRFo方法中的assIndexes,改为直接使用inModel.matchAlgs `T`; |
|  | --> 因为TIRAlg不限层,所以无论是matchAlgs或absPorts,都算支持多层; |
|  | --> 结果: 先不改,因为fromRethink时无matchAlgs,但absPorts更通用支持; |

| 23015 | 23014分析2改为protoFo后无法构建F14的问题 `T` |
| --- | --- |
| 简介 | 改为protoFo后,发现最初还没抽象时,仅相似的两个fo无法识别并外类比; |
| 问题 | 无法外类比`A`就无法抽象`B`,无法抽象就无法识别`C`(识别就是识别抽象); |
| 分析 | 以上ABC三模块形成死循环,所以必须在起初留下一个切入口来解决之; |
| 分析 | 改动前无问题,因为matchAFo在构建时没有mAlg就会用partAlg,算切入口; |
| 方案 | 将tirFo的fo参数改为:识别到matchAlg时才用protoFo,否则还用matchAFo; |

| 23016 | 23014分析1放开matchRFos后,应用总结 `T` |
| --- | --- |
| 1 | 原matchFos改为matchPFos后,原调用全不变默认为matchPFos; |
| 2 | 现matchRFos由以下几处调用: |
|  | a. analogyInner_Outside_V3()中联想assFo处改为用matchRFos; |
| TODO | 将有mv指向的fo.ds和无mv指向的fo.ds改为ATPercept和ATReason; |

| 23017 | 回测23014无GL经验BUG `T` |
| --- | --- |
| 日志 | ![](assets/442_回测23014无GL经验BUG.png) |
| 说明 | 如图,当前maskFo仅有protoFo:F203一条,看来并未取到matchFos; |
| 分析 | 1. 在TIRFo识别后,protoFo并非结束,所以并不会与matchFos抽具象关联 |
|  | 2. 现在getInnerV3中取absPorts是取不到matchFos的; |
| 方案 | 直接将protoFo所在的inModel.matchFos传入getInnerV3取GL经验; |
| 延伸 | HN时,没有inModel参数可传,并且似乎与GL时联想路径也不同 `转n23p03`; |
| 结果 | 按着方案,改代码后,依然无法获取GL经验,转23018; |

| 23018 | 取不到GL经验的BUG `转至n23p04` |
| --- | --- |
| 调试 | 调试发现,在内中外类比期就未对matchRFos形成嵌套GL,所以用时取不到; |
| 调试 | 1. 内类比是对protoFo,每次protoFo都不同,无法互相识别为matchRFos; |
|  | 2. 内中外类比是根据matchRFos来联想assFo,从而形成matchRFos的GL; |
|  | 3. 如上死循环,所以protoFo之间的嵌套GL,永远无法互相"内中外类比"; |
|  | 4. 所以matchRFos永远不会指向GL; |
| 分析 | 类似TIR_Fo时使用matchAFo,此处也可以做"激活期"; |
| 方案 | 将相似的protoFo,指向的GL作为assFo与abFo激活类比; |
|  | 注: 因此处partAlg并未做时序识别,故此处相似protoFo由matchRFos向具象取; |
|  | 问题: matchRFos向具象取不到,因为protoFo和matchRFos之间无关联; |
| 结果 | 其本质为matchRFos与protoFo之间无抽具象关联 `转至n23p04`; |

<br><br><br>

## n23p02 网络可视化迭代
`CreateTime 2021.04.11`

说明: 前段时间支持了dsPorts,所以本次将对嵌套迭代;

| 23021 | 嵌套迭代 |
| --- | --- |
| 1 | 将dsPorts支持为嵌套方式展示; |
| 2 | 将hngl支持为嵌套方式展示; |
| UI | ![](assets/440_网络可视化嵌套迭代原型图.png) |
| 说明 | UI:将嵌套支持为点击节点时,在周围展开显示,不同类型采用不同颜色; |

| 23022 | 快捷添加节点迭代 |
| --- | --- |
| 1 | 将addNode窗口的参数,改为指定格式的字符串拼接; |

<br><br><br>

## n23p03 getInnerHN拆分
`CreateTime 2021.04.16`

在getInnerV3迭代后,发现GL和HN的联想是不同路径的(参考23017),本节将针对HN的独立做笔记;

| 23031 | 示例说明:`获取HN经验`的`联想路径` |
| --- | --- |
| 比如 | P-解决方案,想吃桃,步骤如下: |
| 1 | getInnerHN取得: [超市,买得到桃],返给决策; |
| 2 | 又需要找到超市,再到getInnerHN取得:[出发点,去超市],返给决策; |
| 3 | 出发点在inModels中发现自己在家,找到具象时序:[家出发,去,X路A辉超市]; |
| 说明 | 由例可见,二者在联想路径的向性上完全相反; |
|  | 1. GL的路径向性为:下右向上左 (从时序向着抽象的概念的联想); |
|  | 2. HN的路径向性为:左上向右下 (从概念向着时序的具象的联想); |
| 代码 | 独立写getInnerHN方法,并传入cAlg来联想; |


<br><br><br>

## n23p04 加强RFo抽具象关联
`CreateTime 2021.04.21`

1. 在23018中,决策期取不到GL经验的问题,想通过类比期内中外类比解决;
2. 而内中外类比又找不到assFo,因为无"激活期",导致matchRFos的抽象无GL指向;
3. 本质为RFo抽具象太弱,本节重点针对此问题展开,加强RFo的抽具象关联;

| 23041 | 增强RFo抽具象关联-方案1-代码规划 `90%,选用` |
| --- | --- |
| 示图 | ![](assets/443_增强RFo抽具象关联示图.png) |
| TODO1 | **激活期** (初步建立RFo抽具象关联) `T` |
|  | 1. 在TIRFo后,对matchRFos和当前protoFo分别外类比抽象,以增强抽具象; |
| TODO2 | **内中外类比期** (内中外类比v4迭代-改进assFo联想方式) `T` |
|  | 2. 内中外类比先取absFo.assGLFo,将结果absGLFo嵌套在absFo下; |
|  | 3. 再后以absFo向具象取以往protoFo.assGLFo,将结果嵌套在absFo下; |
|  | 注: 关于嵌套在absFo下,参考反向反馈外类比代码 |

| 23042 | 增强RFo抽具象关联-方案2 `5%,不选用` |
| --- | --- |
| 说明 | 直接用protoFo指向matchRFo,然后在absPort中,指定matchIndex; |
| 问题 | 这样虽然看起来网络更简单,但操作复杂度更高; |
| 弃用 | 毕竟现在实现方式并不是并行过滤器,所以此方案在代码操作上麻烦,故弃用; |


<br><br><br>
