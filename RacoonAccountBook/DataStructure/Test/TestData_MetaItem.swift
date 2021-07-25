import Foundation
import SwiftDate

// [测试数据]

let testMetaItem_1 = MetaItem(
    originalText: "做核酸花了八十",
    spentMoneyAt: "210213".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "做核酸检测",
    amount_float: 80.0)

let testMetaItem_2 = MetaItem(
    originalText: "自动售卖机买饮料花了四块五",
    spentMoneyAt: "210220".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "自动售卖机买饮料",
    amount_float: 4.5)

let testMetaItem_3 = MetaItem(
    originalText: "今天下午去水木书屋买电子导引的课本",
    spentMoneyAt: "210221".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "去水木清华买电子导引的课本",
    amount_float: 40.0)

let testMetaItem_4 = MetaItem(
    originalText: "宿舍买水票花了二百",
    spentMoneyAt: "210222".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "宿舍买水票",
    amount_float: 200.0)

let testMetaItem_5 = MetaItem(
    originalText: "买书三十五",
    spentMoneyAt: "210222".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "买书",
    amount_float: 35.0)

let testMetaItem_6 = MetaItem(
    originalText: "被篮球砸去校医院看",
    spentMoneyAt: "210223".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "被篮球砸去校医院看",
    amount_float: 20.0)

let testMetaItem_7 = MetaItem(
    originalText: "洗衣 四块",
    spentMoneyAt: "210224".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "洗衣",
    amount_float: 4.0)

let testMetaItem_8 = MetaItem(
    originalText: "饮料 四块五",
    spentMoneyAt: "210226".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "饮料",
    amount_float: 4.5)

let testMetaItem_9 = MetaItem(
    originalText: "跑脚本买了百度云三个月的服务器花了十八块钱",
    spentMoneyAt: "210226".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "跑脚本买了百度云三个月的服务器",
    amount_float: 18.0)

let testMetaItem_10 = MetaItem(
    originalText: "开学买课本花了一百五十四",
    spentMoneyAt: "210226".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "开学买课本",
    amount_float: 154.0)

let testMetaItem_11 = MetaItem(
    originalText: "超市买东西 五十一块四",
    spentMoneyAt: "210228".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "超市买东西",
    amount_float: 51.4)

let testMetaItem_12 = MetaItem(
    originalText: "跟实验室学姐见面打印成绩证明花了十块",
    spentMoneyAt: "210301".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "跟实验室学姐见面打印成绩证明",
    amount_float: 10.0)

let testMetaItem_13 = MetaItem(
    originalText: "淘宝买HEVC标准花了三十",
    spentMoneyAt: "210301".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "淘宝买HEVC标准",
    amount_float: 30.0)

let testMetaItem_14 = MetaItem(
    originalText: "零食 五块五",
    spentMoneyAt: "210301".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "零食",
    amount_float: 5.5)

let testMetaItem_15 = MetaItem(
    originalText: "零食 六块",
    spentMoneyAt: "210302".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "零食",
    amount_float: 6.0)

let testMetaItem_16 = MetaItem(
    originalText: "零食 五块",
    spentMoneyAt: "210302".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "零食",
    amount_float: 5.0)

let testMetaItem_17 = MetaItem(
    originalText: "饮料 十二",
    spentMoneyAt: "210303".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "饮料",
    amount_float: 12.0)

let testMetaItem_18 = MetaItem(
    originalText: "在图书馆犹豫好久买了二手的触控板 六百九十三",
    spentMoneyAt: "210306".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "二手的触控板",
    amount_float: 693.0)

let testMetaItem_19 = MetaItem(
    originalText: "给扬帆仙女们买盲盒花了四十",
    spentMoneyAt: "210306".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "给扬帆仙女们买盲盒",
    amount_float: 40.0)

let testMetaItem_20 = MetaItem(
    originalText: "班上女生节交了十五",
    spentMoneyAt: "210306".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "班上女生节",
    amount_float: 15.0)

let testMetaItem_21 = MetaItem(
    originalText: "洗衣 四块",
    spentMoneyAt: "210308".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "洗衣",
    amount_float: 4.0)

let testMetaItem_22 = MetaItem(
    originalText: "花一百三十八买了两件格子衬衫",
    spentMoneyAt: "210309".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "两件格子衬衫",
    amount_float: 138.0)

let testMetaItem_23 = MetaItem(
    originalText: "在楼下贩卖机买了鱼豆腐 十一块",
    spentMoneyAt: "210310".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "在楼下贩卖机买了鱼豆腐",
    amount_float: 11.0)

let testMetaItem_24 = MetaItem(
    originalText: "买饮料 六块",
    spentMoneyAt: "210311".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "买饮料",
    amount_float: 6.0)

let testMetaItem_25 = MetaItem(
    originalText: "买了16寸的电脑支架 一百一",
    spentMoneyAt: "210311".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "16寸的电脑支架",
    amount_float: 110.0)

let testMetaItem_26 = MetaItem(
    originalText: "买面包 七块",
    spentMoneyAt: "210312".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "买面包",
    amount_float: 7.0)

let testMetaItem_27 = MetaItem(
    originalText: "咖啡 六块",
    spentMoneyAt: "210315".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "咖啡",
    amount_float: 6.0)

let testMetaItem_28 = MetaItem(
    originalText: "饮料 五块",
    spentMoneyAt: "210316".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "饮料",
    amount_float: 5.0)

let testMetaItem_29 = MetaItem(
    originalText: "饮料 六块",
    spentMoneyAt: "210318".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "饮料",
    amount_float: 6.0)

let testMetaItem_30 = MetaItem(
    originalText: "花38买了超大号的垃圾袋",
    spentMoneyAt: "210318".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "超大号的垃圾袋",
    amount_float: 38.0)

let testMetaItem_31 = MetaItem(
    originalText: "洗衣 四块",
    spentMoneyAt: "210319".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "洗衣",
    amount_float: 4.0)

let testMetaItem_32 = MetaItem(
    originalText: "饮料 四块五",
    spentMoneyAt: "210322".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "饮料",
    amount_float: 4.5)

let testMetaItem_33 = MetaItem(
    originalText: "宿舍买笤帚均摊8块",
    spentMoneyAt: "210325".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "宿舍买笤帚",
    amount_float: 8.0)

let testMetaItem_34 = MetaItem(
    originalText: "饮料 五块",
    spentMoneyAt: "210325".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "饮料",
    amount_float: 5.0)

let testMetaItem_35 = MetaItem(
    originalText: "吃的 十四",
    spentMoneyAt: "210325".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "零食",
    amount_float: 14.0)

let testMetaItem_36 = MetaItem(
    originalText: "买水花了八块",
    spentMoneyAt: "210326".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "买水",
    amount_float: 8.0)

let testMetaItem_37 = MetaItem(
    originalText: "饭卡充值六百",
    spentMoneyAt: "210329".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "饭卡充值",
    amount_float: 600.0)

let testMetaItem_38 = MetaItem(
    originalText: "报六级考费十七",
    spentMoneyAt: "210329".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "报六级考费",
    amount_float: 17.0)

let testMetaItem_39 = MetaItem(
    originalText: "雀魂月卡三十六",
    spentMoneyAt: "210329".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "雀魂月卡",
    amount_float: 36.0)

let testMetaItem_40 = MetaItem(
    originalText: "饮料四块五",
    spentMoneyAt: "210329".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "饮料",
    amount_float: 4.5)

let testMetaItem_41 = MetaItem(
    originalText: "饮料三块",
    spentMoneyAt: "210329".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "饮料",
    amount_float: 3.0)

let testMetaItem_42 = MetaItem(
    originalText: "忘带卡了 清芬快餐二十五块五",
    spentMoneyAt: "210329".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "清芬快餐",
    amount_float: 25.5)

let testMetaItem_43 = MetaItem(
    originalText: "奶茶二十",
    spentMoneyAt: "210402".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "奶茶",
    amount_float: 20.0)

let testMetaItem_44 = MetaItem(
    originalText: "清明节当天花七百买了个雀魂带saki的号",
    spentMoneyAt: "210402".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "雀魂带saki的号",
    amount_float: 700.0)

let testMetaItem_45 = MetaItem(
    originalText: "饮料三块",
    spentMoneyAt: "210404".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "饮料",
    amount_float: 3.0)

let testMetaItem_46 = MetaItem(
    originalText: "雀魂月卡三十六块一",
    spentMoneyAt: "210404".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "雀魂月卡",
    amount_float: 36.1)

let testMetaItem_47 = MetaItem(
    originalText: "吃的五块",
    spentMoneyAt: "210404".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "零食",
    amount_float: 5.0)

let testMetaItem_48 = MetaItem(
    originalText: "咖啡二十",
    spentMoneyAt: "210405".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "咖啡",
    amount_float: 20.0)

let testMetaItem_49 = MetaItem(
    originalText: "买hima的音声画了六十二",
    spentMoneyAt: "210407".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "买hima的音声",
    amount_float: 62.0)

let testMetaItem_50 = MetaItem(
    originalText: "饮料三块",
    spentMoneyAt: "210408".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "饮料",
    amount_float: 3.0)

let testMetaItem_51 = MetaItem(
    originalText: "饮料四块五",
    spentMoneyAt: "210409".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "饮料",
    amount_float: 4.5)

let testMetaItem_52 = MetaItem(
    originalText: "饮料五块",
    spentMoneyAt: "210411".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "饮料",
    amount_float: 5.0)

let testMetaItem_53 = MetaItem(
    originalText: "晚饭十七",
    spentMoneyAt: "210412".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "晚饭",
    amount_float: 17.0)

let testMetaItem_54 = MetaItem(
    originalText: "给饭卡充了八百",
    spentMoneyAt: "210413".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "给饭卡充值",
    amount_float: 800.0)

let testMetaItem_55 = MetaItem(
    originalText: "零食十块",
    spentMoneyAt: "210413".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "零食",
    amount_float: 10)

let testMetaItem_56 = MetaItem(
    originalText: "洗衣四块",
    spentMoneyAt: "210413".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "洗衣",
    amount_float: 4.0)

let testMetaItem_57 = MetaItem(
    originalText: "洗衣三块",
    spentMoneyAt: "210414".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "洗衣",
    amount_float: 3.0)

let testMetaItem_58 = MetaItem(
    originalText: "饮料五块",
    spentMoneyAt: "210417".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "饮料",
    amount_float: 5.0)

let testMetaItem_59 = MetaItem(
    originalText: "饮料五块五",
    spentMoneyAt: "210418".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "饮料",
    amount_float: 5.5)

let testMetaItem_60 = MetaItem(
    originalText: "买空白的本子花了七十四",
    spentMoneyAt: "210420".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "空白的本子",
    amount_float: 74.0)

let testMetaItem_61 = MetaItem(
    originalText: "饮料五块",
    spentMoneyAt: "210420".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "饮料",
    amount_float: 5.0)

let testMetaItem_62 = MetaItem(
    originalText: "买了十五块的奶茶",
    spentMoneyAt: "210421".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "奶茶",
    amount_float: 15.0)

let testMetaItem_63 = MetaItem(
    originalText: "饮料五块五",
    spentMoneyAt: "210425".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "饮料",
    amount_float: 5.5)

let testMetaItem_64 = MetaItem(
    originalText: "饮料六块",
    spentMoneyAt: "210427".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "饮料",
    amount_float: 6.0)

let testMetaItem_65 = MetaItem(
    originalText: "饮料五块",
    spentMoneyAt: "210427".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "饮料",
    amount_float: 5.0)

let testMetaItem_66 = MetaItem(
    originalText: "讨论买哈密瓜味的冰激凌花了十三",
    spentMoneyAt: "210427".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "哈密瓜味的冰激凌",
    amount_float: 13.0)

let testMetaItem_67 = MetaItem(
    originalText: "饮料五块",
    spentMoneyAt: "210428".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "饮料",
    amount_float: 5.0)

let testMetaItem_68 = MetaItem(
    originalText: "贩卖机买鱼豆腐十一",
    spentMoneyAt: "210501".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "鱼豆腐",
    amount_float: 11.0)

let testMetaItem_69 = MetaItem(
    originalText: "饮料三块五",
    spentMoneyAt: "210502".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "饮料",
    amount_float: 3.5)

let testMetaItem_70 = MetaItem(
    originalText: "洗衣四块",
    spentMoneyAt: "210502".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "洗衣",
    amount_float: 4.0)

let testMetaItem_71 = MetaItem(
    originalText: "零食四块",
    spentMoneyAt: "210502".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "零食",
    amount_float: 4.0)

let testMetaItem_72 = MetaItem(
    originalText: "冰激凌十六",
    spentMoneyAt: "210502".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "冰激凌",
    amount_float: 16.0)

let testMetaItem_73 = MetaItem(
    originalText: "饮料六块",
    spentMoneyAt: "210502".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "饮料",
    amount_float: 6.0)

let testMetaItem_74 = MetaItem(
    originalText: "充了二百元话费",
    spentMoneyAt: "210502".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "话费",
    amount_float: 200.0)

let testMetaItem_75 = MetaItem(
    originalText: "去天津的往返车票 一百二",
    spentMoneyAt: "210502".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "去天津的往返车票",
    amount_float: 120.0)

let testMetaItem_76 = MetaItem(
    originalText: "天津市内交通 二十四",
    spentMoneyAt: "210502".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "天津市内交通",
    amount_float: 24.0)

let testMetaItem_77 = MetaItem(
    originalText: "零食十五",
    spentMoneyAt: "210505".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "零食",
    amount_float: 15.0)

let testMetaItem_78 = MetaItem(
    originalText: "杯面六块",
    spentMoneyAt: "210507".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "杯面",
    amount_float: 6.0)

let testMetaItem_79 = MetaItem(
    originalText: "午饭二十八块五",
    spentMoneyAt: "210510".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "午饭",
    amount_float: 28.5)

let testMetaItem_80 = MetaItem(
    originalText: "饮料五块",
    spentMoneyAt: "210414".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "饮料",
    amount_float: 5.0)

let testMetaItem_81 = MetaItem(
    originalText: "给たんたんめん充值花了十六",
    spentMoneyAt: "210516".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "给たんたんめん充值",
    amount_float: 16.0)

let testMetaItem_82 = MetaItem(
    originalText: "饮料五块五",
    spentMoneyAt: "210517".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "饮料",
    amount_float: 5.5)

let testMetaItem_83 = MetaItem(
    originalText: "洗衣四块",
    spentMoneyAt: "210519".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "洗衣",
    amount_float: 4.0)

let testMetaItem_84 = MetaItem(
    originalText: "手环带子二十九",
    spentMoneyAt: "210520".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "手环带子",
    amount_float: 29.0)

let testMetaItem_85 = MetaItem(
    originalText: "饮料四块五",
    spentMoneyAt: "210521".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "饮料",
    amount_float: 4.5)

let testMetaItem_86 = MetaItem(
    originalText: "饮料五块",
    spentMoneyAt: "210522".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "饮料",
    amount_float: 5.0)

let testMetaItem_87 = MetaItem(
    originalText: "奶茶十四",
    spentMoneyAt: "210523".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "奶茶",
    amount_float: 14.0)

let testMetaItem_88 = MetaItem(
    originalText: "零食十三",
    spentMoneyAt: "210525".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "零食",
    amount_float: 13.0)

let testMetaItem_89 = MetaItem(
    originalText: "雀魂月卡三十五",
    spentMoneyAt: "210525".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "雀魂月卡",
    amount_float: 35.0)

let testMetaItem_90 = MetaItem(
    originalText: "打印四毛",
    spentMoneyAt: "210525".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "打印",
    amount_float: 0.4)

let testMetaItem_91 = MetaItem(
    originalText: "洗衣三块八",
    spentMoneyAt: "210526".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "洗衣",
    amount_float: 3.8)

let testMetaItem_92 = MetaItem(
    originalText: "饮料三块",
    spentMoneyAt: "210526".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "饮料",
    amount_float: 3.0)

let testMetaItem_93 = MetaItem(
    originalText: "酸奶九块",
    spentMoneyAt: "210526".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "酸奶",
    amount_float: 9.0)

let testMetaItem_94 = MetaItem(
    originalText: "把图片处理为高清花了三十五",
    spentMoneyAt: "210527".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "把图片处理为高清",
    amount_float: 35.0)

let testMetaItem_95 = MetaItem(
    originalText: "给山哥买生日蛋糕花了七十",
    spentMoneyAt: "210528".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "给山哥买生日蛋糕",
    amount_float: 70.0)

let testMetaItem_96 = MetaItem(
    originalText: "饮料五块",
    spentMoneyAt: "210528".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "饮料",
    amount_float: 5.0)

let testMetaItem_97 = MetaItem(
    originalText: "饮料五元",
    spentMoneyAt: "210531".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "饮料",
    amount_float: 5.0)

let testMetaItem_98 = MetaItem(
    originalText: "午饭七块五",
    spentMoneyAt: "210531".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "午饭",
    amount_float: 7.5)

let testMetaItem_99 = MetaItem(
    originalText: "电费十块",
    spentMoneyAt: "210531".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "电费",
    amount_float: 10.0)

let testMetaItem_100 = MetaItem(
    originalText: "洗衣四块",
    spentMoneyAt: "210601".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "洗衣",
    amount_float: 4.0)

let testMetaItem_101 = MetaItem(
    originalText: "饮料四块五",
    spentMoneyAt: "210602".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "饮料",
    amount_float: 4.5)

let testMetaItem_102 = MetaItem(
    originalText: "饮料六块",
    spentMoneyAt: "210602".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "饮料",
    amount_float: 6.0)

let testMetaItem_103 = MetaItem(
    originalText: "饮料五块",
    spentMoneyAt: "210602".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "饮料",
    amount_float: 5.0)

let testMetaItem_104 = MetaItem(
    originalText: "饭卡充值 四百",
    spentMoneyAt: "210603".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "饭卡充值",
    amount_float: 400.0)

let testMetaItem_105 = MetaItem(
    originalText: "零食十块",
    spentMoneyAt: "210604".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "零食",
    amount_float: 10.0)

let testMetaItem_106 = MetaItem(
    originalText: "班费五十",
    spentMoneyAt: "210607".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "班费",
    amount_float: 50.0)

let testMetaItem_107 = MetaItem(
    originalText: "饮料五块",
    spentMoneyAt: "210608".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "饮料",
    amount_float: 5.0)

let testMetaItem_108 = MetaItem(
    originalText: "午饭花了七块",
    spentMoneyAt: "210609".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "午饭",
    amount_float: 7.0)

let testMetaItem_109 = MetaItem(
    originalText: "方便面六块",
    spentMoneyAt: "210610".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "方便面",
    amount_float: 6.0)

let testMetaItem_110 = MetaItem(
    originalText: "饮料六块",
    spentMoneyAt: "210611".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "饮料",
    amount_float: 6.0)

let testMetaItem_111 = MetaItem(
    originalText: "饮料六块",
    spentMoneyAt: "210612".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "饮料",
    amount_float: 6.0)

let testMetaItem_112 = MetaItem(
    originalText: "水木咖啡 奶茶十二",
    spentMoneyAt: "210612".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "水木咖啡 奶茶",
    amount_float: 12.0)

let testMetaItem_113 = MetaItem(
    originalText: "零食四块",
    spentMoneyAt: "210615".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "零食",
    amount_float: 4.0)

let testMetaItem_114 = MetaItem(
    originalText: "饮料七块",
    spentMoneyAt: "210616".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "饮料",
    amount_float: 7.0)

let testMetaItem_115 = MetaItem(
    originalText: "饮料四块五",
    spentMoneyAt: "210616".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "饮料",
    amount_float: 4.5)

let testMetaItem_116 = MetaItem(
    originalText: "洗衣四块",
    spentMoneyAt: "210617".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "饮料",
    amount_float: 4.0)

let testMetaItem_117 = MetaItem(
    originalText: "饮料六块",
    spentMoneyAt: "210617".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "饮料",
    amount_float: 6.0)

let testMetaItem_118 = MetaItem(
    originalText: "饮料六块",
    spentMoneyAt: "210617".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "饮料",
    amount_float: 6.0)

let testMetaItem_119 = MetaItem(
    originalText: "薯片六块",
    spentMoneyAt: "210617".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "薯片",
    amount_float: 6.0)

let testMetaItem_120 = MetaItem(
    originalText: "饮料六块",
    spentMoneyAt: "210618".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "饮料",
    amount_float: 6.0)

let testMetaItem_121 = MetaItem(
    originalText: "饮料六块",
    spentMoneyAt: "210619".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "饮料",
    amount_float: 5.0)

let testMetaItem_122 = MetaItem(
    originalText: "expressVPN十五个月六百六十三",
    spentMoneyAt: "210619".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "expressVPN十五个月",
    amount_float: 663.0)

let testMetaItem_123 = MetaItem(
    originalText: "奶茶十八",
    spentMoneyAt: "210619".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "饮料",
    amount_float: 18.0)

let testMetaItem_124 = MetaItem(
    originalText: "买唯花的音声六十一",
    spentMoneyAt: "210619".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "唯花的音声",
    amount_float: 61.0)

let testMetaItem_125 = MetaItem(
    originalText: "饮料三块",
    spentMoneyAt: "210619".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "饮料",
    amount_float: 3.0)

let testMetaItem_126 = MetaItem(
    originalText: "打印两毛",
    spentMoneyAt: "210620".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "打印",
    amount_float: 0.2)

let testMetaItem_127 = MetaItem(
    originalText: "饮料五块五",
    spentMoneyAt: "210620".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "饮料",
    amount_float: 5.5)

let testMetaItem_128 = MetaItem(
    originalText: "打印三块六",
    spentMoneyAt: "210621".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "打印",
    amount_float: 3.6)

let testMetaItem_129 = MetaItem(
    originalText: "饮料三块",
    spentMoneyAt: "210621".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "饮料",
    amount_float: 3.0)

let testMetaItem_130 = MetaItem(
    originalText: "零食六块",
    spentMoneyAt: "210621".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "零食",
    amount_float: 6.0)

let testMetaItem_131 = MetaItem(
    originalText: "清芬快餐二十一",
    spentMoneyAt: "210622".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "清芬快餐",
    amount_float: 21.0)

let testMetaItem_132 = MetaItem(
    originalText: "饮料四块五",
    spentMoneyAt: "210622".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "饮料",
    amount_float: 4.5)

let testMetaItem_133 = MetaItem(
    originalText: "咖啡六块",
    spentMoneyAt: "210622".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "咖啡",
    amount_float: 6.0)

let testMetaItem_134 = MetaItem(
    originalText: "洗衣四块",
    spentMoneyAt: "210623".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "洗衣",
    amount_float: 4.0)

let testMetaItem_135 = MetaItem(
    originalText: "超市买东西花了九十四块五",
    spentMoneyAt: "210623".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "超市买东西",
    amount_float: 94.5)

let testMetaItem_136 = MetaItem(
    originalText: "三大包湿巾三十五",
    spentMoneyAt: "210623".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "三大包湿巾",
    amount_float: 35.0)

let testMetaItem_137 = MetaItem(
    originalText: "帆布鞋六十九",
    spentMoneyAt: "210624".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "帆布鞋",
    amount_float: 69.0)

let testMetaItem_138 = MetaItem(
    originalText: "买二十个衣架花了十五块三",
    spentMoneyAt: "210624".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "买二十个衣架",
    amount_float: 15.3)

let testMetaItem_139 = MetaItem(
    originalText: "饮料三块",
    spentMoneyAt: "210624".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "饮料",
    amount_float: 3.0)

let testMetaItem_140 = MetaItem(
    originalText: "冰激凌十四",
    spentMoneyAt: "210625".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "冰激凌",
    amount_float: 14.0)

let testMetaItem_141 = MetaItem(
    originalText: "薯片七块",
    spentMoneyAt: "210625".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "薯片",
    amount_float: 7.0)

let testMetaItem_142 = MetaItem(
    originalText: "跳线两盒 十七块二",
    spentMoneyAt: "210625".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "跳线两盒",
    amount_float: 17.2)

let testMetaItem_143 = MetaItem(
    originalText: "饮料五块",
    spentMoneyAt: "210625".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "饮料",
    amount_float: 5.0)

let testMetaItem_144 = MetaItem(
    originalText: "雀魂月卡三十五块七",
    spentMoneyAt: "210625".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "雀魂月卡",
    amount_float: 35.7)

let testMetaItem_145 = MetaItem(
    originalText: "床帘一百一十八",
    spentMoneyAt: "210626".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "床帘",
    amount_float: 118.0)

let testMetaItem_146 = MetaItem(
    originalText: "饮料七块五",
    spentMoneyAt: "210626".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "饮料",
    amount_float: 7.5)

let testMetaItem_147 = MetaItem(
    originalText: "洗衣三块",
    spentMoneyAt: "210626".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "洗衣",
    amount_float: 3.0)

let testMetaItem_148 = MetaItem(
    originalText: "和高中同学聚点串吧 AA一百一十五",
    spentMoneyAt: "210626".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "和高中同学聚点串吧",
    amount_float: 115.0)

let testMetaItem_149 = MetaItem(
    originalText: "宿舍电费三十",
    spentMoneyAt: "210627".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "宿舍电费",
    amount_float: 30.0)

let testMetaItem_150 = MetaItem(
    originalText: "和iOS Club的同学聚餐花了四十六",
    spentMoneyAt: "210627".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "和iOS Club的同学聚餐",
    amount_float: 46.0)

let testMetaItem_151 = MetaItem(
    originalText: "买饮料 三块",
    spentMoneyAt: "210627".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "饮料",
    amount_float: 3.0)

let testMetaItem_152 = MetaItem(
    originalText: "",
    spentMoneyAt: "210628".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "B站双语音声up主充电",
    amount_float: 6.0)

let testMetaItem_153 = MetaItem(
    originalText: "",
    spentMoneyAt: "210629".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "讯飞转写日语",
    amount_float: 2.4)

let testMetaItem_154 = MetaItem(
    originalText: "",
    spentMoneyAt: "210701".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "零食",
    amount_float: 5.0)

let testMetaItem_155 = MetaItem(
    originalText: "",
    spentMoneyAt: "210702".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "买水",
    amount_float: 2.0)

let testMetaItem_156 = MetaItem(
    originalText: "",
    spentMoneyAt: "210702".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "洗衣",
    amount_float: 3.5)

let testMetaItem_157 = MetaItem(
    originalText: "",
    spentMoneyAt: "210707".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "饮料",
    amount_float: 5.0)

let testMetaItem_158 = MetaItem(
    originalText: "",
    spentMoneyAt: "210707".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "买文具",
    amount_float: 6.0)

let testMetaItem_159 = MetaItem(
    originalText: "",
    spentMoneyAt: "210708".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "饮料",
    amount_float: 3.0)

let testMetaItem_160 = MetaItem(
    originalText: "",
    spentMoneyAt: "210708".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "百度云半年服务器",
    amount_float: 74.0)

let testMetaItem_161 = MetaItem(
    originalText: "",
    spentMoneyAt: "210709".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "饮料",
    amount_float: 5.5)

let testMetaItem_162 = MetaItem(
    originalText: "",
    spentMoneyAt: "210711".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "饮料",
    amount_float: 4.7)

let testMetaItem_163 = MetaItem(
    originalText: "",
    spentMoneyAt: "210712".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "话费s",
    amount_float: 200.0,
    story: testStory_4
)

let testMetaItem_164 = MetaItem(
    originalText: "",
    spentMoneyAt: "210716".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "iPad Pro",
    amount_float: 6600.0)

let testMetaItem_165 = MetaItem(
    originalText: "",
    spentMoneyAt: "210716".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "Pencil s",
    amount_float: 895.0,
    story: testStory_5
)

let testMetaItem_166 = MetaItem(
    originalText: "",
    spentMoneyAt: "210716".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "AirPods Pro s",
    amount_float: 753.0,
    story: testStory_7
)

let testMetaItem_167 = MetaItem(
    originalText: "",
    spentMoneyAt: "210716".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "洗衣s",
    amount_float: 3.0,
    story: testStory_3
)

let testMetaItem_168 = MetaItem(
    originalText: "",
    spentMoneyAt: "210716".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "保护壳",
    amount_float: 90.0)

let testMetaItem_169 = MetaItem(
    originalText: "",
    spentMoneyAt: "210717".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "夜宵s",
    amount_float: 11.5,
    story: testStory_2
)

let testMetaItem_170 = MetaItem(
    originalText: "",
    spentMoneyAt: "210718".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "充话费s",
    amount_float: 100.0,
    story: testStory_1
)

let testStory_1 = MetaItem.Story(
    rating: 3,
    text: "有text和rating的一个story"
)

let testStory_2 = MetaItem.Story(
    text: "只有text的story"
)

let testStory_3 = MetaItem.Story(
    emoji: "🥺",
    text: "有text和emoji的一个story"
)

let testStory_4 = MetaItem.Story(
    rating: 4,
    emoji: "👀",
    text: "有text、rating和emoji的一个story"
)

let testStory_5 = MetaItem.Story(
    rating: 2,
    emoji: "🤔"
)

let testStory_6 = MetaItem.Story(
    rating: 5
)

let testStory_7 = MetaItem.Story(
    emoji: "🤔"
)

let testMetaItems: [MetaItem] = [testMetaItem_1, testMetaItem_2, testMetaItem_3, testMetaItem_4, testMetaItem_5, testMetaItem_6, testMetaItem_7, testMetaItem_8, testMetaItem_9, testMetaItem_10, testMetaItem_11, testMetaItem_12, testMetaItem_13, testMetaItem_14, testMetaItem_15, testMetaItem_16, testMetaItem_17, testMetaItem_18, testMetaItem_19, testMetaItem_20, testMetaItem_21, testMetaItem_22, testMetaItem_23, testMetaItem_24, testMetaItem_25, testMetaItem_26, testMetaItem_27, testMetaItem_28, testMetaItem_29, testMetaItem_30, testMetaItem_31, testMetaItem_32, testMetaItem_33, testMetaItem_34, testMetaItem_35, testMetaItem_36, testMetaItem_37, testMetaItem_38, testMetaItem_39, testMetaItem_40, testMetaItem_41, testMetaItem_42, testMetaItem_43, testMetaItem_44, testMetaItem_45, testMetaItem_46, testMetaItem_47, testMetaItem_48, testMetaItem_49, testMetaItem_50, testMetaItem_51, testMetaItem_52, testMetaItem_53, testMetaItem_54, testMetaItem_55, testMetaItem_56, testMetaItem_57, testMetaItem_58, testMetaItem_59, testMetaItem_60, testMetaItem_61, testMetaItem_62, testMetaItem_63, testMetaItem_64, testMetaItem_65, testMetaItem_66, testMetaItem_67, testMetaItem_68, testMetaItem_69, testMetaItem_70, testMetaItem_71, testMetaItem_72, testMetaItem_73, testMetaItem_74, testMetaItem_75, testMetaItem_76, testMetaItem_77, testMetaItem_78, testMetaItem_79, testMetaItem_80, testMetaItem_81, testMetaItem_82, testMetaItem_83, testMetaItem_84, testMetaItem_85, testMetaItem_86, testMetaItem_87, testMetaItem_88, testMetaItem_89, testMetaItem_90, testMetaItem_91, testMetaItem_92, testMetaItem_93, testMetaItem_94, testMetaItem_95, testMetaItem_96, testMetaItem_97, testMetaItem_98, testMetaItem_99, testMetaItem_100, testMetaItem_101, testMetaItem_102, testMetaItem_103, testMetaItem_104, testMetaItem_105, testMetaItem_106, testMetaItem_107, testMetaItem_108, testMetaItem_109, testMetaItem_110, testMetaItem_111, testMetaItem_112, testMetaItem_113, testMetaItem_114, testMetaItem_115, testMetaItem_116, testMetaItem_117, testMetaItem_118, testMetaItem_119, testMetaItem_120, testMetaItem_121, testMetaItem_122, testMetaItem_123, testMetaItem_124, testMetaItem_125, testMetaItem_126, testMetaItem_127, testMetaItem_128, testMetaItem_129, testMetaItem_130, testMetaItem_131, testMetaItem_132, testMetaItem_133, testMetaItem_134, testMetaItem_135, testMetaItem_136, testMetaItem_137, testMetaItem_138, testMetaItem_139, testMetaItem_140, testMetaItem_141, testMetaItem_142, testMetaItem_143, testMetaItem_144, testMetaItem_145, testMetaItem_146, testMetaItem_147, testMetaItem_148, testMetaItem_149, testMetaItem_150, testMetaItem_151, testMetaItem_152, testMetaItem_153, testMetaItem_154, testMetaItem_155, testMetaItem_156, testMetaItem_157, testMetaItem_158, testMetaItem_159, testMetaItem_160, testMetaItem_161, testMetaItem_162, testMetaItem_163, testMetaItem_164, testMetaItem_165, testMetaItem_166, testMetaItem_167, testMetaItem_168, testMetaItem_169, testMetaItem_170]
