#if DEV

import Foundation
import SwiftDate

// [测试数据]

let testMetaItem_1 = MetaItem(
    originalText: "做核酸花了八十",
    spentMoneyAt: "210213".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "做核酸检测",
    amount_float: 80.0,
    tags: ["返校", "新冠", "核酸检测"]
)

let testMetaItem_2 = MetaItem(
    originalText: "自动售卖机买饮料花了四块五",
    spentMoneyAt: "210220".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "自动售卖机买饮料",
    amount_float: 4.5,
    tags: ["饮料"]
)

let testMetaItem_3 = MetaItem(
    originalText: "今天下午去水木书屋买电子导引的课本",
    spentMoneyAt: "210221".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "去水木清华买电子导引的课本",
    amount_float: 40.0,
    tags: ["课本", "电子信息", "水木书屋"]
)

let testMetaItem_4 = MetaItem(
    originalText: "宿舍买水票花了二百",
    spentMoneyAt: "210222".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "宿舍买水票",
    amount_float: 200.0,
    tags: ["宿舍", "水票"],
    focus: "宿舍"
)

let testMetaItem_5 = MetaItem(
    originalText: "买书三十五",
    spentMoneyAt: "210222".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "买书",
    amount_float: 35.0,
    tags: ["书"]
)

let testMetaItem_6 = MetaItem(
    originalText: "被篮球砸去校医院看",
    spentMoneyAt: "210223".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "被篮球砸去校医院看",
    amount_float: 20.0,
    tags: ["体育课", "受伤", "校医院", "口腔", "冰袋"],
    story: MetaItem.Story(rating: 3,
                          emoji: "😢",
                          text: "呜呜呜 好疼 竟然被篮球砸。")
)

let testMetaItem_7 = MetaItem(
    originalText: "洗衣 四块",
    spentMoneyAt: "210224".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "洗衣",
    amount_float: 4.0,
    tags: ["洗衣"]
)

let testMetaItem_8 = MetaItem(
    originalText: "饮料 四块五",
    spentMoneyAt: "210226".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "饮料",
    amount_float: 4.5,
    tags: ["饮料"]
)

let testMetaItem_9 = MetaItem(
    originalText: "跑脚本买了百度云三个月的服务器花了十八块钱",
    spentMoneyAt: "210226".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "跑脚本买了百度云三个月的服务器",
    amount_float: 18.0,
    tags: ["实验室", "服务器", "百度云"],
    focus: "软件服务",
    story: MetaItem.Story(rating: 4,
                          emoji: "🤨",
                          text: "算是白嫖的吧 蛮便宜。手上有个服务器还是能方便一点。")
)

let testMetaItem_10 = MetaItem(
    originalText: "开学买课本花了一百五十四",
    spentMoneyAt: "210226".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "开学买课本",
    amount_float: 154.0,
    tags: ["课本"]
)

let testMetaItem_11 = MetaItem(
    originalText: "超市买东西 五十一块四",
    spentMoneyAt: "210228".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "超市买东西",
    amount_float: 51.4,
    tags: ["超市"]
)

let testMetaItem_12 = MetaItem(
    originalText: "跟实验室学姐见面打印成绩证明花了十块",
    spentMoneyAt: "210301".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "跟实验室学姐见面打印成绩证明",
    amount_float: 10.0,
    tags: ["成绩证明", "实验室"],
    story: MetaItem.Story(rating: 2,
                          emoji: "😞",
                          text: "从来没去打印过成绩，这次是需要才去打印的。")
)

let testMetaItem_13 = MetaItem(
    originalText: "淘宝买HEVC标准花了三十",
    spentMoneyAt: "210301".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "淘宝买HEVC标准",
    amount_float: 30.0,
    tags: ["标准", "淘宝", "HEVC"],
    story: MetaItem.Story(rating: 4,
                          emoji: "🤓",
                          text: "第一次买标准还考虑了标准到底是什么")
)

let testMetaItem_14 = MetaItem(
    originalText: "零食 五块五",
    spentMoneyAt: "210301".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "零食",
    amount_float: 5.5,
    tags: ["零食"]
)

let testMetaItem_15 = MetaItem(
    originalText: "零食 六块",
    spentMoneyAt: "210302".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "零食",
    amount_float: 6.0,
    tags: ["零食"]
)

let testMetaItem_16 = MetaItem(
    originalText: "零食 五块",
    spentMoneyAt: "210302".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "零食",
    amount_float: 5.0,
    tags: ["零食"]
)

let testMetaItem_17 = MetaItem(
    originalText: "饮料 十二",
    spentMoneyAt: "210303".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "饮料",
    amount_float: 12.0,
    tags: ["饮料"]
)

let testMetaItem_18 = MetaItem(
    originalText: "在图书馆犹豫好久买了二手的触控板 六百九十三",
    spentMoneyAt: "210306".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "二手的触控板",
    amount_float: 693.0,
    tags: ["触控板", "Apple", "Mac"],
    focus: "电子设备",
    story: MetaItem.Story(rating: 5,
                          emoji: "🥰",
                          text: "还是挺方便的，一直在用。话说二手的和官方的也差不了多少，不如当时直接在官网买，但能省一点也不是什么坏事，毕竟跟新的没什么差别。")
)

let testMetaItem_19 = MetaItem(
    originalText: "给扬帆仙女们买盲盒花了四十",
    spentMoneyAt: "210306".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "给扬帆仙女们买盲盒",
    amount_float: 40.0,
    tags: ["扬帆", "女生节", "盲盒"],
    forWho: ["扬帆女生"],
    story: MetaItem.Story(rating: 4,
                          emoji: "🥳",
                          text: "扬帆的最后一次活动，学长的策划还是蛮好的嘛")
)

let testMetaItem_20 = MetaItem(
    originalText: "班上女生节交了十五",
    spentMoneyAt: "210306".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "班上女生节",
    amount_float: 15.0,
    tags: ["女生节", "无97"],
    forWho: ["无97"]
)

let testMetaItem_21 = MetaItem(
    originalText: "洗衣 四块",
    spentMoneyAt: "210308".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "洗衣",
    amount_float: 4.0,
    tags: ["洗衣"]
)

let testMetaItem_22 = MetaItem(
    originalText: "花一百三十八买了两件格子衬衫",
    spentMoneyAt: "210309".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "两件格子衬衫",
    amount_float: 138.0,
    tags: ["格子衬衫"]
)

let testMetaItem_23 = MetaItem(
    originalText: "在楼下贩卖机买了鱼豆腐 十一块",
    spentMoneyAt: "210310".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "在楼下贩卖机买了鱼豆腐",
    amount_float: 11.0,
    tags: ["零食", "鱼豆腐"]
)

let testMetaItem_24 = MetaItem(
    originalText: "买饮料 六块",
    spentMoneyAt: "210311".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "买饮料",
    amount_float: 6.0,
    tags: ["饮料"]
)

let testMetaItem_25 = MetaItem(
    originalText: "买了16寸的电脑支架 一百一",
    spentMoneyAt: "210311".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "16寸的电脑支架",
    amount_float: 110.0,
    tags: ["电脑支架", "Mac"],
    focus: "电子设备",
    story: MetaItem.Story(rating: 4,
                          emoji: "☺️",
                          text: "之前的电脑支架坏掉了，所以买了个新的。最开始买的十三寸，回来觉得太小了换了个大的。非常方便带到图书馆哦")
)

let testMetaItem_26 = MetaItem(
    originalText: "买面包 七块",
    spentMoneyAt: "210312".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "买面包",
    amount_float: 7.0,
    tags: ["零食"]
)

let testMetaItem_27 = MetaItem(
    originalText: "咖啡 六块",
    spentMoneyAt: "210315".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "咖啡",
    amount_float: 6.0,
    tags: ["咖啡"]
)

let testMetaItem_28 = MetaItem(
    originalText: "饮料 五块",
    spentMoneyAt: "210316".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "饮料",
    amount_float: 5.0,
    tags: ["饮料"]
)

let testMetaItem_29 = MetaItem(
    originalText: "饮料 六块",
    spentMoneyAt: "210318".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "饮料",
    amount_float: 6.0,
    tags: ["饮料"]
)

let testMetaItem_30 = MetaItem(
    originalText: "花38买了超大号的垃圾袋",
    spentMoneyAt: "210318".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "超大号的垃圾袋",
    amount_float: 38.0,
    tags: ["垃圾袋", "宿舍"],
    focus: "宿舍",
    story: MetaItem.Story(rating: 4,
                          emoji: "🙂",
                          text: "宿舍垃圾堆的有点多，一下子收拾掉真好。但买的有点多了，慢慢用吧。")
)

let testMetaItem_31 = MetaItem(
    originalText: "洗衣 四块",
    spentMoneyAt: "210319".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "洗衣",
    amount_float: 4.0,
    tags: ["洗衣"]
)

let testMetaItem_32 = MetaItem(
    originalText: "饮料 四块五",
    spentMoneyAt: "210322".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "饮料",
    amount_float: 4.5,
    tags: ["饮料"]
)

let testMetaItem_33 = MetaItem(
    originalText: "宿舍买笤帚均摊8块",
    spentMoneyAt: "210325".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "宿舍买笤帚",
    amount_float: 8.0,
    tags: ["宿舍", "笤帚"],
    focus: "宿舍"
)

let testMetaItem_34 = MetaItem(
    originalText: "饮料 五块",
    spentMoneyAt: "210325".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "饮料",
    amount_float: 5.0,
    tags: ["饮料"]
)

let testMetaItem_35 = MetaItem(
    originalText: "吃的 十四",
    spentMoneyAt: "210325".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "零食",
    amount_float: 14.0,
    tags: ["零食"]
)

let testMetaItem_36 = MetaItem(
    originalText: "买水花了八块",
    spentMoneyAt: "210326".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "买水",
    amount_float: 8.0,
    tags: ["水"]
)

let testMetaItem_37 = MetaItem(
    originalText: "饭卡充值六百",
    spentMoneyAt: "210329".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "饭卡充值",
    amount_float: 600.0,
    tags: ["校园卡"]
)

let testMetaItem_38 = MetaItem(
    originalText: "报六级考费十七",
    spentMoneyAt: "210329".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "报六级考费",
    amount_float: 17.0,
    tags: ["六级"]
)

let testMetaItem_39 = MetaItem(
    originalText: "雀魂月卡三十六",
    spentMoneyAt: "210329".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "雀魂月卡",
    amount_float: 36.0,
    tags: ["雀魂", "月卡"],
    focus: "雀魂"
)

let testMetaItem_40 = MetaItem(
    originalText: "饮料四块五",
    spentMoneyAt: "210329".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "饮料",
    amount_float: 4.5,
    tags: ["饮料"]
)

let testMetaItem_41 = MetaItem(
    originalText: "饮料三块",
    spentMoneyAt: "210329".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "饮料",
    amount_float: 3.0,
    tags: ["饮料"]
)

let testMetaItem_42 = MetaItem(
    originalText: "忘带卡了 清芬快餐二十五块五",
    spentMoneyAt: "210329".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "清芬快餐",
    amount_float: 25.5,
    tags: ["清芬", "快餐"]
)

let testMetaItem_43 = MetaItem(
    originalText: "奶茶二十",
    spentMoneyAt: "210402".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "奶茶",
    amount_float: 20.0,
    tags: ["奶茶"]
)

let testMetaItem_44 = MetaItem(
    originalText: "清明节当天花七百买了个雀魂带saki的号",
    spentMoneyAt: "210402".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "雀魂带saki的号",
    amount_float: 700.0,
    tags: ["雀魂", "saki", "买号"],
    focus: "游戏",
    story: MetaItem.Story(rating: 5,
                          emoji: "😎",
                          text: "怎么说呢，刚刚接触日麻，看到了雀魂，超级想要saki，但限定活动已经过去了55。看到有卖号的，等了一段时间，这个号真的超级值哦，还送我了QQ小号，两个限定起码八百以上了，还有别的好多角色，还是雀圣的号。希望有了这个号雀力日进吧。")
)

let testMetaItem_45 = MetaItem(
    originalText: "饮料三块",
    spentMoneyAt: "210404".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "饮料",
    amount_float: 3.0,
    tags: ["饮料"]
)

let testMetaItem_46 = MetaItem(
    originalText: "雀魂月卡三十六块一",
    spentMoneyAt: "210404".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "雀魂月卡",
    amount_float: 36.1,
    tags: ["雀魂", "月卡"],
    focus: "游戏"
)

let testMetaItem_47 = MetaItem(
    originalText: "吃的五块",
    spentMoneyAt: "210404".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "零食",
    amount_float: 5.0,
    tags: ["零食"]
)

let testMetaItem_48 = MetaItem(
    originalText: "咖啡二十",
    spentMoneyAt: "210405".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "咖啡",
    amount_float: 20.0,
    tags: ["咖啡"],
    story: MetaItem.Story(rating: 1,
                          emoji: "🥲",
                          text: "美式咖啡 超级难喝…以后一定买带糖的")
)

let testMetaItem_49 = MetaItem(
    originalText: "买hima的音声画了六十二",
    spentMoneyAt: "210407".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "买hima的音声",
    amount_float: 62.0,
    tags: ["hima", "音声", "dlsite"],
    focus: "支持",
    forWho: ["hima"],
    story: MetaItem.Story(rating: 5,
                          emoji: "☺️",
                          text: "第一次在dlsite上买音声，体验超级好。hima出的怎么也要支持一下hh。数数的那个我直接无了")
)

let testMetaItem_50 = MetaItem(
    originalText: "饮料三块",
    spentMoneyAt: "210408".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "饮料",
    amount_float: 3.0,
    tags: ["饮料"]
)

let testMetaItem_51 = MetaItem(
    originalText: "饮料四块五",
    spentMoneyAt: "210409".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "饮料",
    amount_float: 4.5,
    tags: ["饮料"]
)

let testMetaItem_52 = MetaItem(
    originalText: "饮料五块",
    spentMoneyAt: "210411".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "饮料",
    amount_float: 5.0,
    tags: ["饮料"]
)

let testMetaItem_53 = MetaItem(
    originalText: "晚饭十七",
    spentMoneyAt: "210412".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "晚饭",
    amount_float: 17.0,
    tags: ["晚饭"]
)

let testMetaItem_54 = MetaItem(
    originalText: "给饭卡充了八百",
    spentMoneyAt: "210413".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "给饭卡充值",
    amount_float: 800.0,
    tags: ["校园卡"]
)

let testMetaItem_55 = MetaItem(
    originalText: "零食十块",
    spentMoneyAt: "210413".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "零食",
    amount_float: 10,
    tags: ["零食"]
)

let testMetaItem_56 = MetaItem(
    originalText: "洗衣四块",
    spentMoneyAt: "210413".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "洗衣",
    amount_float: 4.0,
    tags: ["洗衣"]
)

let testMetaItem_57 = MetaItem(
    originalText: "洗衣三块",
    spentMoneyAt: "210414".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "洗衣",
    amount_float: 3.0,
    tags: ["洗衣"]
)

let testMetaItem_58 = MetaItem(
    originalText: "饮料五块",
    spentMoneyAt: "210417".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "饮料",
    amount_float: 5.0,
    tags: ["饮料"]
)

let testMetaItem_59 = MetaItem(
    originalText: "饮料五块五",
    spentMoneyAt: "210418".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "饮料",
    amount_float: 5.5,
    tags: ["饮料"]
)

let testMetaItem_60 = MetaItem(
    originalText: "买空白的本子花了七十四",
    spentMoneyAt: "210420".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "空白的本子",
    amount_float: 74.0,
    tags: ["本子"],
    story: MetaItem.Story(rating: 4,
                          emoji: "😅",
                          text: "对草稿本的需求还是蛮大的。一次买了不少。希望能对学习有帮助。不过还是希望能有iPad 这样各方面都会方便一些。")
)

let testMetaItem_61 = MetaItem(
    originalText: "饮料五块",
    spentMoneyAt: "210420".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "饮料",
    amount_float: 5.0,
    tags: ["饮料"]
)

let testMetaItem_62 = MetaItem(
    originalText: "买了十五块的奶茶",
    spentMoneyAt: "210421".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "奶茶",
    amount_float: 15.0,
    tags: ["奶茶"]
)

let testMetaItem_63 = MetaItem(
    originalText: "饮料五块五",
    spentMoneyAt: "210425".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "饮料",
    amount_float: 5.5,
    tags: ["饮料"]
)

let testMetaItem_64 = MetaItem(
    originalText: "饮料六块",
    spentMoneyAt: "210427".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "饮料",
    amount_float: 6.0,
    tags: ["饮料"]
)

let testMetaItem_65 = MetaItem(
    originalText: "饮料五块",
    spentMoneyAt: "210427".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "饮料",
    amount_float: 5.0,
    tags: ["饮料"]
)

let testMetaItem_66 = MetaItem(
    originalText: "讨论买哈密瓜味的冰激凌花了十三",
    spentMoneyAt: "210427".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "哈密瓜味的冰激凌",
    amount_float: 13.0,
    tags: ["冰激凌"]
)

let testMetaItem_67 = MetaItem(
    originalText: "饮料五块",
    spentMoneyAt: "210428".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "饮料",
    amount_float: 5.0,
    tags: ["饮料"]
)

let testMetaItem_68 = MetaItem(
    originalText: "贩卖机买鱼豆腐十一",
    spentMoneyAt: "210501".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "鱼豆腐",
    amount_float: 11.0,
    tags: ["鱼豆腐", "零食"]
)

let testMetaItem_69 = MetaItem(
    originalText: "饮料三块五",
    spentMoneyAt: "210502".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "饮料",
    amount_float: 3.5,
    tags: ["饮料"]
)

let testMetaItem_70 = MetaItem(
    originalText: "洗衣四块",
    spentMoneyAt: "210502".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "洗衣",
    amount_float: 4.0,
    tags: ["洗衣"]
)

let testMetaItem_71 = MetaItem(
    originalText: "零食四块",
    spentMoneyAt: "210502".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "零食",
    amount_float: 4.0,
    tags: ["零食"]
)

let testMetaItem_72 = MetaItem(
    originalText: "冰激凌十六",
    spentMoneyAt: "210502".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "冰激凌",
    amount_float: 16.0,
    tags: ["冰激凌"]
)

let testMetaItem_73 = MetaItem(
    originalText: "饮料六块",
    spentMoneyAt: "210502".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "饮料",
    amount_float: 6.0,
    tags: ["饮料"]
)

let testMetaItem_74 = MetaItem(
    originalText: "充了二百元话费",
    spentMoneyAt: "210502".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "话费",
    amount_float: 200.0,
    tags: ["话费"]
)

let testMetaItem_75 = MetaItem(
    originalText: "去天津的往返车票 一百二",
    spentMoneyAt: "210502".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "去天津的往返车票",
    amount_float: 120.0,
    tags: ["天津", "海", "高铁"],
    focus: "旅游",
    story: MetaItem.Story(rating: 5,
                          emoji: "😃",
                          text: "去天津看海真的好棒！说实话 真没花多少钱，但体验是超级棒！")
)

let testMetaItem_76 = MetaItem(
    originalText: "天津市内交通 二十四",
    spentMoneyAt: "210502".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "天津市内交通",
    amount_float: 24.0,
    tags: ["天津", "海", "市内交通"],
    focus: "旅游"
)

let testMetaItem_77 = MetaItem(
    originalText: "零食十五",
    spentMoneyAt: "210505".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "零食",
    amount_float: 15.0,
    tags: ["零食"]
)

let testMetaItem_78 = MetaItem(
    originalText: "杯面六块",
    spentMoneyAt: "210507".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "杯面",
    amount_float: 6.0,
    tags: ["零食"]
)

let testMetaItem_79 = MetaItem(
    originalText: "午饭二十八块五",
    spentMoneyAt: "210510".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "午饭",
    amount_float: 28.5,
    tags: ["午饭"]
)

let testMetaItem_80 = MetaItem(
    originalText: "饮料五块",
    spentMoneyAt: "210414".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "饮料",
    amount_float: 5.0,
    tags: ["饮料"]
)

let testMetaItem_81 = MetaItem(
    originalText: "给たんたんめん充值花了十六",
    spentMoneyAt: "210516".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "给たんたんめん充值",
    amount_float: 16.0,
    tags: ["pixiv", "fanbox", "たんたんめん"],
    focus: "支持",
    forWho: ["たんたんめん"],
    story: MetaItem.Story(rating: 5,
                          emoji: "😆",
                          text: "注册了paypal，买fanbox。たんたんめん是我超喜欢的画师，感觉他画的画就特别灵动！拿到了一堆高清的图还有psd，自己学画画的时候也可以尝试参考。")
)

let testMetaItem_82 = MetaItem(
    originalText: "饮料五块五",
    spentMoneyAt: "210517".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "饮料",
    amount_float: 5.5,
    tags: ["饮料"]
)

let testMetaItem_83 = MetaItem(
    originalText: "洗衣四块",
    spentMoneyAt: "210519".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "洗衣",
    amount_float: 4.0,
    tags: ["洗衣"]
)

let testMetaItem_84 = MetaItem(
    originalText: "手环带子二十九",
    spentMoneyAt: "210520".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "手环带子",
    amount_float: 29.0,
    tags: ["小米手环"],
    focus: "电子设备",
    story: MetaItem.Story(rating: 1,
                          emoji: "😤",
                          text: "原来的那个手环真的不结实啊。新的也很贵")
)

let testMetaItem_85 = MetaItem(
    originalText: "饮料四块五",
    spentMoneyAt: "210521".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "饮料",
    amount_float: 4.5,
    tags: ["饮料"]
)

let testMetaItem_86 = MetaItem(
    originalText: "饮料五块",
    spentMoneyAt: "210522".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "饮料",
    amount_float: 5.0,
    tags: ["饮料"]
)

let testMetaItem_87 = MetaItem(
    originalText: "奶茶十四",
    spentMoneyAt: "210523".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "奶茶",
    amount_float: 14.0,
    tags: ["奶茶"]
)

let testMetaItem_88 = MetaItem(
    originalText: "零食十三",
    spentMoneyAt: "210525".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "零食",
    amount_float: 13.0,
    tags: ["零食"]
)

let testMetaItem_89 = MetaItem(
    originalText: "雀魂月卡三十五",
    spentMoneyAt: "210525".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "雀魂月卡",
    amount_float: 35.0,
    tags: ["雀魂", "月卡"],
    focus: "雀魂"
)

let testMetaItem_90 = MetaItem(
    originalText: "打印四毛",
    spentMoneyAt: "210525".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "打印",
    amount_float: 0.4,
    tags: ["打印"]
)

let testMetaItem_91 = MetaItem(
    originalText: "洗衣三块八",
    spentMoneyAt: "210526".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "洗衣",
    amount_float: 3.8,
    tags: ["洗衣"]
)

let testMetaItem_92 = MetaItem(
    originalText: "饮料三块",
    spentMoneyAt: "210526".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "饮料",
    amount_float: 3.0,
    tags: ["饮料"]
)

let testMetaItem_93 = MetaItem(
    originalText: "酸奶九块",
    spentMoneyAt: "210526".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "酸奶",
    amount_float: 9.0,
    tags: ["酸奶", "零食"]
)

let testMetaItem_94 = MetaItem(
    originalText: "把图片处理为高清花了三十五",
    spentMoneyAt: "210527".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "把图片处理为高清",
    amount_float: 35.0,
    tags: ["图片处理", "waifu"],
    focus: "软件服务",
    story: MetaItem.Story(rating: 4,
                          emoji: "🤓",
                          text: "一直对AI没什么兴趣的，直到发现了GitHub伤的waifu。原来机器学习还能做这个，真不错！把たんたんめん的图都放大了一遍，メンヘラちゃん的表情包也是。觉得能让我对图像处理产生兴趣这是最重要的")
)

let testMetaItem_95 = MetaItem(
    originalText: "给山哥买生日蛋糕花了七十",
    spentMoneyAt: "210528".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "给山哥买生日蛋糕",
    amount_float: 70.0,
    tags: ["山哥", "生日", "蛋糕"],
    forWho: ["山哥"],
    story: MetaItem.Story(rating: 4,
                          emoji: "🥳",
                          text: "自己还花了蛮多时间去策划的，山哥生快，希望新的一岁更加牛逼吧！")
)

let testMetaItem_96 = MetaItem(
    originalText: "饮料五块",
    spentMoneyAt: "210528".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "饮料",
    amount_float: 5.0,
    tags: ["饮料"]
)

let testMetaItem_97 = MetaItem(
    originalText: "饮料五元",
    spentMoneyAt: "210531".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "饮料",
    amount_float: 5.0,
    tags: ["饮料"]
)

let testMetaItem_98 = MetaItem(
    originalText: "午饭七块五",
    spentMoneyAt: "210531".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "午饭",
    amount_float: 7.5,
    tags: ["午饭"]
)

let testMetaItem_99 = MetaItem(
    originalText: "电费十块",
    spentMoneyAt: "210531".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "电费",
    amount_float: 10.0,
    tags: ["洗衣"]
)

let testMetaItem_100 = MetaItem(
    originalText: "洗衣四块",
    spentMoneyAt: "210601".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "洗衣",
    amount_float: 4.0,
    tags: ["洗衣"]
)

let testMetaItem_101 = MetaItem(
    originalText: "饮料四块五",
    spentMoneyAt: "210602".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "饮料",
    amount_float: 4.5,
    tags: ["饮料"]
)

let testMetaItem_102 = MetaItem(
    originalText: "饮料六块",
    spentMoneyAt: "210602".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "饮料",
    amount_float: 6.0,
    tags: ["饮料"]
)

let testMetaItem_103 = MetaItem(
    originalText: "饮料五块",
    spentMoneyAt: "210602".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "饮料",
    amount_float: 5.0,
    tags: ["饮料"]
)

let testMetaItem_104 = MetaItem(
    originalText: "饭卡充值 四百",
    spentMoneyAt: "210603".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "饭卡充值",
    amount_float: 400.0,
    tags: ["校园卡"]
)

let testMetaItem_105 = MetaItem(
    originalText: "零食十块",
    spentMoneyAt: "210604".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "零食",
    amount_float: 10.0,
    tags: ["零食"]
)

let testMetaItem_106 = MetaItem(
    originalText: "班费五十",
    spentMoneyAt: "210607".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "班费",
    amount_float: 50.0,
    tags: ["无97"]
)

let testMetaItem_107 = MetaItem(
    originalText: "饮料五块",
    spentMoneyAt: "210608".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "饮料",
    amount_float: 5.0,
    tags: ["饮料"]
)

let testMetaItem_108 = MetaItem(
    originalText: "午饭花了七块",
    spentMoneyAt: "210609".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "午饭",
    amount_float: 7.0,
    tags: ["午饭"]
)

let testMetaItem_109 = MetaItem(
    originalText: "方便面六块",
    spentMoneyAt: "210610".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "方便面",
    amount_float: 6.0,
    tags: ["方便面"]
)

let testMetaItem_110 = MetaItem(
    originalText: "饮料六块",
    spentMoneyAt: "210611".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "饮料",
    amount_float: 6.0,
    tags: ["饮料"]
)

let testMetaItem_111 = MetaItem(
    originalText: "饮料六块",
    spentMoneyAt: "210612".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "饮料",
    amount_float: 6.0,
    tags: ["饮料"]
)

let testMetaItem_112 = MetaItem(
    originalText: "水木咖啡 奶茶十二",
    spentMoneyAt: "210612".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "水木咖啡 奶茶",
    amount_float: 12.0,
    tags: ["水木咖啡", "奶茶"],
    story: MetaItem.Story(rating: 3,
                          emoji: "🧐",
                          text: "讨论项目。学到了不少呢，感觉现在的项目还缺少很多东西。逐渐添加上吧")
)

let testMetaItem_113 = MetaItem(
    originalText: "零食四块",
    spentMoneyAt: "210615".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "零食",
    amount_float: 4.0,
    tags: ["零食"]
)

let testMetaItem_114 = MetaItem(
    originalText: "饮料七块",
    spentMoneyAt: "210616".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "饮料",
    amount_float: 7.0,
    tags: ["饮料"]
)

let testMetaItem_115 = MetaItem(
    originalText: "饮料四块五",
    spentMoneyAt: "210616".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "饮料",
    amount_float: 4.5,
    tags: ["饮料"]
)

let testMetaItem_116 = MetaItem(
    originalText: "洗衣四块",
    spentMoneyAt: "210617".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "饮料",
    amount_float: 4.0,
    tags: ["饮料"]
)

let testMetaItem_117 = MetaItem(
    originalText: "饮料六块",
    spentMoneyAt: "210617".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "饮料",
    amount_float: 6.0,
    tags: ["饮料"]
)

let testMetaItem_118 = MetaItem(
    originalText: "饮料六块",
    spentMoneyAt: "210617".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "饮料",
    amount_float: 6.0,
    tags: ["饮料"]
)

let testMetaItem_119 = MetaItem(
    originalText: "薯片六块",
    spentMoneyAt: "210617".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "薯片",
    amount_float: 6.0,
    tags: ["零食", "薯片"]
)

let testMetaItem_120 = MetaItem(
    originalText: "饮料六块",
    spentMoneyAt: "210618".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "饮料",
    amount_float: 6.0,
    tags: ["饮料"]
)

let testMetaItem_121 = MetaItem(
    originalText: "饮料六块",
    spentMoneyAt: "210619".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "饮料",
    amount_float: 5.0,
    tags: ["饮料"]
)

let testMetaItem_122 = MetaItem(
    originalText: "expressVPN十五个月六百六十三",
    spentMoneyAt: "210619".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "expressVPN十五个月",
    amount_float: 663.0,
    tags: ["VPN", "expressVPN"],
    focus: "软件服务",
    story: MetaItem.Story(rating: 4,
                          emoji: "🤨",
                          text: "好贵。但怎么说呢，自己每天都要用，有一个稳定的体验好的梯子还是蛮重要的。")
)

let testMetaItem_123 = MetaItem(
    originalText: "奶茶十八",
    spentMoneyAt: "210619".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "饮料",
    amount_float: 18.0,
    tags: ["饮料"]
)

let testMetaItem_124 = MetaItem(
    originalText: "买唯花的音声六十一",
    spentMoneyAt: "210619".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "唯花的音声",
    amount_float: 61.0,
    tags: ["唯花", "hima", "dlsite", "音声"],
    focus: "支持",
    forWho: ["hima"],
    story: MetaItem.Story(rating: 5,
                          emoji: "😌",
                          text: "呜呜呜 好清楚的声音！当天在B站看到有预览版就直接上DLsite买了")
)

let testMetaItem_125 = MetaItem(
    originalText: "饮料三块",
    spentMoneyAt: "210619".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "饮料",
    amount_float: 3.0,
    tags: ["饮料"]
)

let testMetaItem_126 = MetaItem(
    originalText: "打印两毛",
    spentMoneyAt: "210620".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "打印",
    amount_float: 0.2,
    tags: ["打印"]
)

let testMetaItem_127 = MetaItem(
    originalText: "饮料五块五",
    spentMoneyAt: "210620".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "饮料",
    amount_float: 5.5,
    tags: ["饮料"]
)

let testMetaItem_128 = MetaItem(
    originalText: "打印三块六",
    spentMoneyAt: "210621".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "打印",
    amount_float: 3.6,
    tags: ["打印"]
)

let testMetaItem_129 = MetaItem(
    originalText: "饮料三块",
    spentMoneyAt: "210621".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "饮料",
    amount_float: 3.0,
    tags: ["饮料"]
)

let testMetaItem_130 = MetaItem(
    originalText: "零食六块",
    spentMoneyAt: "210621".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "零食",
    amount_float: 6.0,
    tags: ["零食"]
)

let testMetaItem_131 = MetaItem(
    originalText: "清芬快餐二十一",
    spentMoneyAt: "210622".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "清芬快餐",
    amount_float: 21.0,
    tags: ["清芬", "快餐"]
)

let testMetaItem_132 = MetaItem(
    originalText: "饮料四块五",
    spentMoneyAt: "210622".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "饮料",
    amount_float: 4.5,
    tags: ["饮料"]
)

let testMetaItem_133 = MetaItem(
    originalText: "咖啡六块",
    spentMoneyAt: "210622".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "咖啡",
    amount_float: 6.0,
    tags: ["咖啡"],
    story: MetaItem.Story(rating: 1,
                          emoji: "😭",
                          text: "考信号与系统前买的咖啡，确实让我打起了精神，但喝的有点凉，而且考完试发现自己一直紧张，所以最后有点恶心")
)

let testMetaItem_134 = MetaItem(
    originalText: "洗衣四块",
    spentMoneyAt: "210623".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "洗衣",
    amount_float: 4.0,
    tags: ["洗衣"]
)

let testMetaItem_135 = MetaItem(
    originalText: "超市买东西花了九十四块五",
    spentMoneyAt: "210623".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "超市买东西",
    amount_float: 94.5,
    tags: ["超市"]
)

let testMetaItem_136 = MetaItem(
    originalText: "三大包湿巾三十五",
    spentMoneyAt: "210623".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "三大包湿巾",
    amount_float: 35.0,
    tags: ["湿巾"],
    focus: "宿舍",
    story: MetaItem.Story(rating: 3,
                          emoji: "😌",
                          text: "终于有了湿巾，到手之后发现好好用啊！不过它是无香的，想要有香味的（买的时候没仔细看嗫）")
)

let testMetaItem_137 = MetaItem(
    originalText: "帆布鞋六十九",
    spentMoneyAt: "210624".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "帆布鞋",
    amount_float: 69.0,
    tags: ["帆布鞋"]
)

let testMetaItem_138 = MetaItem(
    originalText: "买二十个衣架花了十五块三",
    spentMoneyAt: "210624".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "买二十个衣架",
    amount_float: 15.3,
    tags: ["衣架"],
    focus: "宿舍",
    story: MetaItem.Story(rating: 2,
                          emoji: "😠",
                          text: "质量好差，我没想到那么细。夏天挂挂衣服还好，但冬天衣服我感觉这个怕是撑不起来")
)

let testMetaItem_139 = MetaItem(
    originalText: "饮料三块",
    spentMoneyAt: "210624".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "饮料",
    amount_float: 3.0,
    tags: ["饮料"]
)

let testMetaItem_140 = MetaItem(
    originalText: "冰激凌十四",
    spentMoneyAt: "210625".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "冰激凌",
    amount_float: 14.0,
    tags: ["冰激凌"]
)

let testMetaItem_141 = MetaItem(
    originalText: "薯片七块",
    spentMoneyAt: "210625".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "薯片",
    amount_float: 7.0,
    tags: ["薯片", "零食"]
)

let testMetaItem_142 = MetaItem(
    originalText: "跳线两盒 十七块二",
    spentMoneyAt: "210625".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "跳线两盒",
    amount_float: 17.2,
    tags: ["跳线", "电设"],
    story: MetaItem.Story(rating: 3,
                          emoji: "🧐",
                          text: "电设实验用跳线还是方便一点 一次多买了一盒")
)

let testMetaItem_143 = MetaItem(
    originalText: "饮料五块",
    spentMoneyAt: "210625".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "饮料",
    amount_float: 5.0,
    tags: ["饮料"]
)

let testMetaItem_144 = MetaItem(
    originalText: "雀魂月卡三十五块七",
    spentMoneyAt: "210625".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "雀魂月卡",
    amount_float: 35.7,
    tags: ["雀魂", "月卡"],
    focus: "游戏",
    story: MetaItem.Story(rating: 2,
                          emoji: "🥲",
                          text: "说实话不怎么想充月卡……还是把精力放在提升雀力上吧")
)

let testMetaItem_145 = MetaItem(
    originalText: "床帘一百一十八",
    spentMoneyAt: "210626".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "床帘",
    amount_float: 118.0,
    tags: ["宿舍", "床帘"],
    focus: "宿舍",
    story: MetaItem.Story(rating: 5,
                          emoji: "😎",
                          text: "好棒的床帘！有了在宿舍自己的空间！虽然装的时候超级费力气，但装好之后第一个晚上就睡的特别舒服")
)

let testMetaItem_146 = MetaItem(
    originalText: "饮料七块五",
    spentMoneyAt: "210626".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "饮料",
    amount_float: 7.5,
    tags: ["饮料"]
)

let testMetaItem_147 = MetaItem(
    originalText: "洗衣三块",
    spentMoneyAt: "210626".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "洗衣",
    amount_float: 3.0,
    tags: ["洗衣"]
)

let testMetaItem_148 = MetaItem(
    originalText: "和高中同学聚点串吧 AA一百一十五",
    spentMoneyAt: "210626".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "和高中同学聚点串吧",
    amount_float: 115.0,
    tags: ["AA", "清新", "聚点串吧"],
    focus: "聚餐",
    story: MetaItem.Story(rating: 5,
                          emoji: "😎",
                          text: "好久没见到高中同学了啊！聊得很多话题，超级开心！lg虽然迟到了很久，但之后第二场也很愉快啊！")
)

let testMetaItem_149 = MetaItem(
    originalText: "宿舍电费三十",
    spentMoneyAt: "210627".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "宿舍电费",
    amount_float: 30.0,
    tags: ["宿舍", "电费"],
    focus: "宿舍"
)

let testMetaItem_150 = MetaItem(
    originalText: "和iOS Club的同学聚餐花了四十六",
    spentMoneyAt: "210627".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "和iOS Club的同学聚餐",
    amount_float: 46.0,
    tags: ["iOS", "Club", "玉树"],
    focus: "聚餐",
    story: MetaItem.Story(rating: 4,
                          emoji: "🧐",
                          text: "聚餐～虽然来的人不是很多，但认识了不少朋友！在社团继续加油吧！")
)

let testMetaItem_151 = MetaItem(
    originalText: "给B站双语音声up主充电花了六块",
    spentMoneyAt: "210628".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "B站双语音声up主充电",
    amount_float: 6.0,
    tags: ["B站", "充电", "音声"],
    focus: "支持"
)

let testMetaItem_152 = MetaItem(
    originalText: "尝试讯飞转写日语 两块四",
    spentMoneyAt: "210629".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "讯飞转写日语",
    amount_float: 2.4,
    tags: ["讯飞", "日语"],
    focus: "软件服务"
)

let testMetaItem_153 = MetaItem(
    originalText: "买零食五块",
    spentMoneyAt: "210701".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "零食",
    amount_float: 5.0,
    tags: ["零食"]
)

let testMetaItem_154 = MetaItem(
    originalText: "买水两块",
    spentMoneyAt: "210702".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "买水",
    amount_float: 2.0,
    tags: ["水"]
)

let testMetaItem_155 = MetaItem(
    originalText: "洗衣三块五",
    spentMoneyAt: "210702".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "洗衣",
    amount_float: 3.5,
    tags: ["洗衣"]
)

let testMetaItem_156 = MetaItem(
    originalText: "饮料五块",
    spentMoneyAt: "210707".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "饮料",
    amount_float: 5.0,
    tags: ["饮料"]
)

let testMetaItem_157 = MetaItem(
    originalText: "饮料三块",
    spentMoneyAt: "210708".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "饮料",
    amount_float: 3.0,
    tags: ["饮料"]
)

let testMetaItem_158 = MetaItem(
    originalText: "买了百度云半年的服务器用来做课程演示 花了74",
    spentMoneyAt: "210708".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "百度云半年服务器",
    amount_float: 74.0,
    tags: ["Linux", "服务器", "百度云"],
    focus: "软件服务",
    story: MetaItem.Story(rating: 4,
                          emoji: "🤓",
                          text: "买来用吧，感觉手上没一台服务器做事情还是不方便。")
)

let testMetaItem_159 = MetaItem(
    originalText: "买饮料花了五块五",
    spentMoneyAt: "210709".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "饮料",
    amount_float: 5.5,
    tags: ["饮料"]
)

let testMetaItem_160 = MetaItem(
    originalText: "买饮料花了四块七",
    spentMoneyAt: "210711".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "饮料",
    amount_float: 4.7,
    tags: ["饮料"]
)

let testMetaItem_161 = MetaItem(
    originalText: "充二百元话费",
    spentMoneyAt: "210712".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "话费",
    amount_float: 200.0,
    tags: ["话费"]
)

let testMetaItem_162 = MetaItem(
    originalText: "iPad Pro",
    spentMoneyAt: "210716".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "买iPad",
    amount_float: 6600.0,
    tags: ["iPadPro", "教育优惠"],
    focus: "电子设备",
    story: MetaItem.Story(rating: 5,
                          emoji: "🥰",
                          text: "终于拿到了iPad Pro！感谢父母～到手之后发现确实可以做很多事情哈，效率++")
)

let testMetaItem_163 = MetaItem(
    originalText: "Apple Pencil教育优惠895",
    spentMoneyAt: "210716".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "Pencil",
    amount_float: 895.0,
    tags: ["教育优惠", "ApplePencil"],
    focus: "电子设备"
)

let testMetaItem_164 = MetaItem(
    originalText: "AirPods Pro教育优惠753",
    spentMoneyAt: "210716".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "AirPods Pro",
    amount_float: 753.0,
    tags: ["教育优惠", "耳机", "AirPodsPro"],
    focus: "电子设备",
    story: MetaItem.Story(rating: 4,
                          emoji: "😂",
                          text: "还行吧，但感觉问题也不少")
)

let testMetaItem_165 = MetaItem(
    originalText: "洗衣三块",
    spentMoneyAt: "210716".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "洗衣",
    amount_float: 3.0,
    tags: ["洗衣"]
)

let testMetaItem_166 = MetaItem(
    originalText: "iPad Pro双面夹90",
    spentMoneyAt: "210716".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "保护壳",
    amount_float: 90.0,
    tags: ["iPadPro", "配件"],
    focus: "电子设备"
)

let testMetaItem_167 = MetaItem(
    originalText: "夜宵十一块五",
    spentMoneyAt: "210717".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "夜宵",
    amount_float: 11.5,
    tags: ["夜宵"]
)

let testMetaItem_168 = MetaItem(
    originalText: "充话费100",
    spentMoneyAt: "210718".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "充话费",
    amount_float: 100.0,
    tags: ["话费"]
)

let testMetaItem_169 = MetaItem(
    originalText: "和舍友出去吃火锅花了43.5",
    spentMoneyAt: "210719".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "吃火锅",
    amount_float: 43.5,
    tags: ["火锅", "聚餐"],
    focus: "聚餐"
)

let testMetaItem_170 = MetaItem(
    originalText: "洗衣三块",
    spentMoneyAt: "210719".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "洗衣",
    amount_float: 3.0,
    tags: ["洗衣"]
)

let testMetaItem_171 = MetaItem(
    originalText: "打印材料两块五",
    spentMoneyAt: "210720".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "打印",
    amount_float: 2.5,
    tags: ["打印"]
)

let testMetaItem_172 = MetaItem(
    originalText: "充饭卡花了四百",
    spentMoneyAt: "210721".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "充饭卡",
    amount_float: 400.0,
    tags: ["饭卡"]
)

let testMetaItem_173 = MetaItem(
    originalText: "买Notability花了六十",
    spentMoneyAt: "210721".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "Notability",
    amount_float: 60.0,
    tags: ["iPadOS软件", "Notability"],
    focus: "软件服务",
    story: MetaItem.Story(rating: 4,
                          emoji: "🧐",
                          text: "感觉一般般 功能不是那么多，有的操作并不是很顺手。而且很多主题都要另外付费ummm")
)

let testMetaItem_174 = MetaItem(
    originalText: "买Procreate花了六十八",
    spentMoneyAt: "210721".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "Procreate",
    amount_float: 68.0,
    tags: ["iPadOS软件", "Procreate"],
    focus: "软件服务",
    story: MetaItem.Story(rating: 5,
                          emoji: "😆",
                          text: "好棒！加油画画吧！现在还在尝试着描别的画师的草稿，先把pencil拿稳吧ww")
)

let testMetaItem_175 = MetaItem(
    originalText: "买饮料五块",
    spentMoneyAt: "210723".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "饮料",
    amount_float: 5.0,
    tags: ["饮料"]
)

let testMetaItem_176 = MetaItem(
    originalText: "买饮料五块",
    spentMoneyAt: "210725".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "饮料",
    amount_float: 5.0,
    tags: ["饮料"]
)

let testMetaItem_177 = MetaItem(
    originalText: "回家火车票 425",
    spentMoneyAt: "210725".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "火车票",
    amount_float: 425.5,
    tags: ["火车票"]
)

let testMetaItem_178 = MetaItem(
    originalText: "桃李地下聚餐42",
    spentMoneyAt: "210726".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "桃李地下",
    amount_float: 42.0,
    tags: ["聚餐"],
    focus: "聚餐"
)

let testMetaItem_179 = MetaItem(
    originalText: "洗衣花了三块八",
    spentMoneyAt: "210727".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "洗衣",
    amount_float: 3.8,
    tags: ["洗衣"]
)

let testMetaItem_180 = MetaItem(
    originalText: "楼下买吃的花了二十",
    spentMoneyAt: "210731".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "楼下吃的",
    amount_float: 20.0,
    tags: ["零食"]
)

let testMetaItem_181 = MetaItem(
    originalText: "超市买东西花了八十二块七",
    spentMoneyAt: "210801".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "超市买东西",
    amount_float: 82.7,
    tags: ["超市", "奶"]
)

let testMetaItem_182 = MetaItem(
    originalText: "一份面皮三块五",
    spentMoneyAt: "210801".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "面皮",
    amount_float: 3.5,
    tags: ["面皮"]
)

let testMetaItem_183 = MetaItem(
    originalText: "买打气筒给自行车充气花了二十八块五",
    spentMoneyAt: "210803".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "打气筒",
    amount_float: 28.5,
    tags: ["打气筒", "自行车"]
)

let testMetaItem_184 = MetaItem(
    originalText: "买礼品卡花了二十",
    spentMoneyAt: "210804".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "中国app store礼品卡",
    amount_float: 20.0,
    tags: ["礼品卡"]
)

let testMetaItem_185 = MetaItem(
    originalText: "淘宝礼品卡代充花了七十",
    spentMoneyAt: "210804".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "美区app store礼品卡",
    amount_float: 70.0,
    tags: ["礼品卡"],
    focus: "游戏"
)

let testMetaItem_186 = MetaItem(
    originalText: "买Office套件花了八块",
    spentMoneyAt: "210804".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "office",
    amount_float: 8.0,
    tags: ["Microsoft", "Office"],
    focus: "软件服务",
    story: MetaItem.Story(rating: 5,
                          emoji: "🧐",
                          text: "学校给的Office不知道怎么就装不上，某宝买了一个非常好用！iPad上也下载好了，而且还是自己改密码的那种；虽然不知道哪天就跑路了，但是先用着吧")
)

let testMetaItem_187 = MetaItem(
    originalText: "去钓鱼台花了20",
    spentMoneyAt: "210807".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "钓鱼台",
    amount_float: 20.0,
    tags: ["旅游"],
    story: MetaItem.Story(rating: 5,
                          emoji: "😆",
                          text: "超级不错！虽然景区不大，但里面的水库惊艳到我了，看到了彩虹色的水雾！太棒了")
)

let testMetaItem_188 = MetaItem(
    originalText: "九成宫门票四十",
    spentMoneyAt: "210808".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "九成宫",
    amount_float: 40.0,
    tags: ["旅游"]
)

let testMetaItem_189 = MetaItem(
    originalText: "买DLSite点数",
    spentMoneyAt: "210808".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "dlsite1000点数",
    amount_float: 60.0,
    tags: ["音声", "DLSite"],
    focus: "软件服务",
    story: MetaItem.Story(rating: 5,
                          emoji: "🥰",
                          text: "又遇到了一个超级棒的音声！直接去买了")
)

let testMetaItem_190 = MetaItem(
    originalText: "买湿巾花了三十八块八",
    spentMoneyAt: "210811".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "湿巾",
    amount_float: 38.8,
    tags: ["湿巾", "餐桌"]
)

let testMetaItem_191 = MetaItem(
    originalText: "买macOS开发书花了八十一",
    spentMoneyAt: "210811".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "macOS开发书",
    amount_float: 81.0,
    tags: ["AppKit", "macOS", "Xcode"],
    focus: "软件服务"
)

let testMetaItems: [MetaItem] = [testMetaItem_1, testMetaItem_2, testMetaItem_3, testMetaItem_4, testMetaItem_5, testMetaItem_6, testMetaItem_7, testMetaItem_8, testMetaItem_9, testMetaItem_10, testMetaItem_11, testMetaItem_12, testMetaItem_13, testMetaItem_14, testMetaItem_15, testMetaItem_16, testMetaItem_17, testMetaItem_18, testMetaItem_19, testMetaItem_20, testMetaItem_21, testMetaItem_22, testMetaItem_23, testMetaItem_24, testMetaItem_25, testMetaItem_26, testMetaItem_27, testMetaItem_28, testMetaItem_29, testMetaItem_30, testMetaItem_31, testMetaItem_32, testMetaItem_33, testMetaItem_34, testMetaItem_35, testMetaItem_36, testMetaItem_37, testMetaItem_38, testMetaItem_39, testMetaItem_40, testMetaItem_41, testMetaItem_42, testMetaItem_43, testMetaItem_44, testMetaItem_45, testMetaItem_46, testMetaItem_47, testMetaItem_48, testMetaItem_49, testMetaItem_50, testMetaItem_51, testMetaItem_52, testMetaItem_53, testMetaItem_54, testMetaItem_55, testMetaItem_56, testMetaItem_57, testMetaItem_58, testMetaItem_59, testMetaItem_60, testMetaItem_61, testMetaItem_62, testMetaItem_63, testMetaItem_64, testMetaItem_65, testMetaItem_66, testMetaItem_67, testMetaItem_68, testMetaItem_69, testMetaItem_70, testMetaItem_71, testMetaItem_72, testMetaItem_73, testMetaItem_74, testMetaItem_75, testMetaItem_76, testMetaItem_77, testMetaItem_78, testMetaItem_79, testMetaItem_80, testMetaItem_81, testMetaItem_82, testMetaItem_83, testMetaItem_84, testMetaItem_85, testMetaItem_86, testMetaItem_87, testMetaItem_88, testMetaItem_89, testMetaItem_90, testMetaItem_91, testMetaItem_92, testMetaItem_93, testMetaItem_94, testMetaItem_95, testMetaItem_96, testMetaItem_97, testMetaItem_98, testMetaItem_99, testMetaItem_100, testMetaItem_101, testMetaItem_102, testMetaItem_103, testMetaItem_104, testMetaItem_105, testMetaItem_106, testMetaItem_107, testMetaItem_108, testMetaItem_109, testMetaItem_110, testMetaItem_111, testMetaItem_112, testMetaItem_113, testMetaItem_114, testMetaItem_115, testMetaItem_116, testMetaItem_117, testMetaItem_118, testMetaItem_119, testMetaItem_120, testMetaItem_121, testMetaItem_122, testMetaItem_123, testMetaItem_124, testMetaItem_125, testMetaItem_126, testMetaItem_127, testMetaItem_128, testMetaItem_129, testMetaItem_130, testMetaItem_131, testMetaItem_132, testMetaItem_133, testMetaItem_134, testMetaItem_135, testMetaItem_136, testMetaItem_137, testMetaItem_138, testMetaItem_139, testMetaItem_140, testMetaItem_141, testMetaItem_142, testMetaItem_143, testMetaItem_144, testMetaItem_145, testMetaItem_146, testMetaItem_147, testMetaItem_148, testMetaItem_149, testMetaItem_150, testMetaItem_151, testMetaItem_152, testMetaItem_153, testMetaItem_154, testMetaItem_155, testMetaItem_156, testMetaItem_157, testMetaItem_158, testMetaItem_159, testMetaItem_160, testMetaItem_161, testMetaItem_162, testMetaItem_163, testMetaItem_164, testMetaItem_165, testMetaItem_166, testMetaItem_167, testMetaItem_168, testMetaItem_169, testMetaItem_170, testMetaItem_171, testMetaItem_172, testMetaItem_173, testMetaItem_174, testMetaItem_175, testMetaItem_176, testMetaItem_177, testMetaItem_178, testMetaItem_179, testMetaItem_180, testMetaItem_181, testMetaItem_182, testMetaItem_183, testMetaItem_184, testMetaItem_185, testMetaItem_186, testMetaItem_187, testMetaItem_188, testMetaItem_189, testMetaItem_190, testMetaItem_191]

#endif
