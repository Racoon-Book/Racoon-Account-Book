#  TODO

## （已解决）关于数据金额的计算

可以每次读取然后进行求和；但是这样遍历一次性能太低了；我150条数据，光是点下面的Tab就能感觉到卡。

所以我想着还是将花销固定在2021年之后；因为可能需要用月来做单位；这样的话一年就要十二个——要不先支持到2030年？

这样的话 统计当周的花销，也只需要从当月和上月的花销中统计（或者就遍历一遍算了）

主页只显示当月的支出就可以了！