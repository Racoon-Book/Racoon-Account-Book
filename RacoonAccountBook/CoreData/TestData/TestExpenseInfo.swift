#if DEV

import Foundation
import SwiftDate

// [测试数据]

let testExpenseInfo_1 = ExpenseInfo(
    originalText: "做核酸花了八十",
    spentAt: "210213".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "做核酸检测",
    amount: 80.0,
    tags: ["返校", "新冠", "核酸检测"]
)

let testExpenseInfo_2 = ExpenseInfo(
    originalText: "自动售卖机买饮料花了四块五",
    spentAt: "210220".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "自动售卖机买饮料",
    amount: 4.5,
    tags: ["饮料"]
)

let testExpenseInfo_3 = ExpenseInfo(
    originalText: "今天下午去水木书屋买电子导引的课本",
    spentAt: "210221".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "去水木清华买电子导引的课本",
    amount: 40.0,
    tags: ["课本", "电子信息", "水木书屋"]
)

let testExpenseInfo_4 = ExpenseInfo(
    originalText: "宿舍买水票花了二百",
    spentAt: "210222".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "宿舍买水票",
    amount: 200.0,
    tags: ["宿舍", "水票"],
    focus: "宿舍"
)

let testExpenseInfo_5 = ExpenseInfo(
    originalText: "买书三十五",
    spentAt: "210222".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "买书",
    amount: 35.0,
    tags: ["书"]
)

let testExpenseInfo_6 = ExpenseInfo(
    originalText: "被篮球砸去校医院看",
    spentAt: "210223".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "被篮球砸去校医院看",
    amount: 20.0,
    tags: ["体育课", "受伤", "校医院", "口腔", "冰袋"],
    story: ExpenseInfo.Story(rating: 3,
                             emoji: "😢",
                             text: "呜呜呜 好疼 竟然被篮球砸。")
)

let testExpenseInfo_7 = ExpenseInfo(
    originalText: "洗衣 四块",
    spentAt: "210224".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "洗衣",
    amount: 4.0,
    tags: ["洗衣"]
)

let testExpenseInfo_8 = ExpenseInfo(
    originalText: "饮料 四块五",
    spentAt: "210226".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "饮料",
    amount: 4.5,
    tags: ["饮料"]
)

let testExpenseInfo_9 = ExpenseInfo(
    originalText: "跑脚本买了百度云三个月的服务器花了十八块钱",
    spentAt: "210226".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "跑脚本买了百度云三个月的服务器",
    amount: 18.0,
    tags: ["实验室", "服务器", "百度云"],
    focus: "软件服务",
    story: ExpenseInfo.Story(rating: 4,
                             emoji: "🤨",
                             text: "算是白嫖的吧 蛮便宜。手上有个服务器还是能方便一点。")
)

let testExpenseInfo_10 = ExpenseInfo(
    originalText: "开学买课本花了一百五十四",
    spentAt: "210226".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "开学买课本",
    amount: 154.0,
    tags: ["课本"]
)

let testExpenseInfo_11 = ExpenseInfo(
    originalText: "超市买东西 五十一块四",
    spentAt: "210228".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "超市买东西",
    amount: 51.4,
    tags: ["超市"]
)

let testExpenseInfo_12 = ExpenseInfo(
    originalText: "跟实验室学姐见面打印成绩证明花了十块",
    spentAt: "210301".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "跟实验室学姐见面打印成绩证明",
    amount: 10.0,
    tags: ["成绩证明", "实验室"],
    story: ExpenseInfo.Story(rating: 2,
                             emoji: "😞",
                             text: "从来没去打印过成绩，这次是需要才去打印的。")
)

let testExpenseInfo_13 = ExpenseInfo(
    originalText: "淘宝买HEVC标准花了三十",
    spentAt: "210301".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "淘宝买HEVC标准",
    amount: 30.0,
    tags: ["标准", "淘宝", "HEVC"],
    story: ExpenseInfo.Story(rating: 4,
                             emoji: "🤓",
                             text: "第一次买标准还考虑了标准到底是什么")
)

let testExpenseInfo_14 = ExpenseInfo(
    originalText: "零食 五块五",
    spentAt: "210301".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "零食",
    amount: 5.5,
    tags: ["零食"]
)

let testExpenseInfo_15 = ExpenseInfo(
    originalText: "零食 六块",
    spentAt: "210302".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "零食",
    amount: 6.0,
    tags: ["零食"]
)

let testExpenseInfo_16 = ExpenseInfo(
    originalText: "零食 五块",
    spentAt: "210302".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "零食",
    amount: 5.0,
    tags: ["零食"]
)

let testExpenseInfo_17 = ExpenseInfo(
    originalText: "饮料 十二",
    spentAt: "210303".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "饮料",
    amount: 12.0,
    tags: ["饮料"]
)

let testExpenseInfo_18 = ExpenseInfo(
    originalText: "在图书馆犹豫好久买了二手的触控板 六百九十三",
    spentAt: "210306".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "二手的触控板",
    amount: 693.0,
    tags: ["触控板", "Apple", "Mac"],
    focus: "电子设备",
    story: ExpenseInfo.Story(rating: 5,
                             emoji: "🥰",
                             text: "还是挺方便的，一直在用。话说二手的和官方的也差不了多少，不如当时直接在官网买，但能省一点也不是什么坏事，毕竟跟新的没什么差别。")
)

let testExpenseInfo_19 = ExpenseInfo(
    originalText: "给扬帆仙女们买盲盒花了四十",
    spentAt: "210306".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "给扬帆仙女们买盲盒",
    amount: 40.0,
    tags: ["扬帆", "女生节", "盲盒"],
    forWho: ["扬帆女生"],
    story: ExpenseInfo.Story(rating: 4,
                             emoji: "🥳",
                             text: "扬帆的最后一次活动，学长的策划还是蛮好的嘛")
)

let testExpenseInfo_20 = ExpenseInfo(
    originalText: "班上女生节交了十五",
    spentAt: "210306".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "班上女生节",
    amount: 15.0,
    tags: ["女生节", "无97"],
    forWho: ["无97"]
)

let testExpenseInfo_21 = ExpenseInfo(
    originalText: "洗衣 四块",
    spentAt: "210308".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "洗衣",
    amount: 4.0,
    tags: ["洗衣"]
)

let testExpenseInfo_22 = ExpenseInfo(
    originalText: "花一百三十八买了两件格子衬衫",
    spentAt: "210309".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "两件格子衬衫",
    amount: 138.0,
    tags: ["格子衬衫"]
)

let testExpenseInfo_23 = ExpenseInfo(
    originalText: "在楼下贩卖机买了鱼豆腐 十一块",
    spentAt: "210310".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "在楼下贩卖机买了鱼豆腐",
    amount: 11.0,
    tags: ["零食", "鱼豆腐"]
)

let testExpenseInfo_24 = ExpenseInfo(
    originalText: "买饮料 六块",
    spentAt: "210311".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "买饮料",
    amount: 6.0,
    tags: ["饮料"]
)

let testExpenseInfo_25 = ExpenseInfo(
    originalText: "买了16寸的电脑支架 一百一",
    spentAt: "210311".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "16寸的电脑支架",
    amount: 110.0,
    tags: ["电脑支架", "Mac"],
    focus: "电子设备",
    story: ExpenseInfo.Story(rating: 4,
                             emoji: "☺️",
                             text: "之前的电脑支架坏掉了，所以买了个新的。最开始买的十三寸，回来觉得太小了换了个大的。非常方便带到图书馆哦")
)

let testExpenseInfo_26 = ExpenseInfo(
    originalText: "买面包 七块",
    spentAt: "210312".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "买面包",
    amount: 7.0,
    tags: ["零食"]
)

let testExpenseInfo_27 = ExpenseInfo(
    originalText: "咖啡 六块",
    spentAt: "210315".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "咖啡",
    amount: 6.0,
    tags: ["咖啡"]
)

let testExpenseInfo_28 = ExpenseInfo(
    originalText: "饮料 五块",
    spentAt: "210316".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "饮料",
    amount: 5.0,
    tags: ["饮料"]
)

let testExpenseInfo_29 = ExpenseInfo(
    originalText: "饮料 六块",
    spentAt: "210318".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "饮料",
    amount: 6.0,
    tags: ["饮料"]
)

let testExpenseInfo_30 = ExpenseInfo(
    originalText: "花38买了超大号的垃圾袋",
    spentAt: "210318".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "超大号的垃圾袋",
    amount: 38.0,
    tags: ["垃圾袋", "宿舍"],
    focus: "宿舍",
    story: ExpenseInfo.Story(rating: 4,
                             emoji: "🙂",
                             text: "宿舍垃圾堆的有点多，一下子收拾掉真好。但买的有点多了，慢慢用吧。")
)

let testExpenseInfo_31 = ExpenseInfo(
    originalText: "洗衣 四块",
    spentAt: "210319".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "洗衣",
    amount: 4.0,
    tags: ["洗衣"]
)

let testExpenseInfo_32 = ExpenseInfo(
    originalText: "饮料 四块五",
    spentAt: "210322".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "饮料",
    amount: 4.5,
    tags: ["饮料"]
)

let testExpenseInfo_33 = ExpenseInfo(
    originalText: "宿舍买笤帚均摊8块",
    spentAt: "210325".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "宿舍买笤帚",
    amount: 8.0,
    tags: ["宿舍", "笤帚"],
    focus: "宿舍"
)

let testExpenseInfo_34 = ExpenseInfo(
    originalText: "饮料 五块",
    spentAt: "210325".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "饮料",
    amount: 5.0,
    tags: ["饮料"]
)

let testExpenseInfo_35 = ExpenseInfo(
    originalText: "吃的 十四",
    spentAt: "210325".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "零食",
    amount: 14.0,
    tags: ["零食"]
)

let testExpenseInfo_36 = ExpenseInfo(
    originalText: "买水花了八块",
    spentAt: "210326".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "买水",
    amount: 8.0,
    tags: ["水"]
)

let testExpenseInfo_37 = ExpenseInfo(
    originalText: "饭卡充值六百",
    spentAt: "210329".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "饭卡充值",
    amount: 600.0,
    tags: ["校园卡"]
)

let testExpenseInfo_38 = ExpenseInfo(
    originalText: "报六级考费十七",
    spentAt: "210329".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "报六级考费",
    amount: 17.0,
    tags: ["六级"]
)

let testExpenseInfo_39 = ExpenseInfo(
    originalText: "雀魂月卡三十六",
    spentAt: "210329".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "雀魂月卡",
    amount: 36.0,
    tags: ["雀魂", "月卡"],
    focus: "雀魂"
)

let testExpenseInfo_40 = ExpenseInfo(
    originalText: "饮料四块五",
    spentAt: "210329".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "饮料",
    amount: 4.5,
    tags: ["饮料"]
)

let testExpenseInfo_41 = ExpenseInfo(
    originalText: "饮料三块",
    spentAt: "210329".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "饮料",
    amount: 3.0,
    tags: ["饮料"]
)

let testExpenseInfo_42 = ExpenseInfo(
    originalText: "忘带卡了 清芬快餐二十五块五",
    spentAt: "210329".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "清芬快餐",
    amount: 25.5,
    tags: ["清芬", "快餐"]
)

let testExpenseInfo_43 = ExpenseInfo(
    originalText: "奶茶二十",
    spentAt: "210402".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "奶茶",
    amount: 20.0,
    tags: ["奶茶"]
)

let testExpenseInfo_44 = ExpenseInfo(
    originalText: "清明节当天花七百买了个雀魂带saki的号",
    spentAt: "210402".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "雀魂带saki的号",
    amount: 700.0,
    tags: ["雀魂", "saki", "买号"],
    focus: "游戏",
    story: ExpenseInfo.Story(rating: 5,
                             emoji: "😎",
                             text: "怎么说呢，刚刚接触日麻，看到了雀魂，超级想要saki，但限定活动已经过去了55。看到有卖号的，等了一段时间，这个号真的超级值哦，还送我了QQ小号，两个限定起码八百以上了，还有别的好多角色，还是雀圣的号。希望有了这个号雀力日进吧。")
)

let testExpenseInfo_45 = ExpenseInfo(
    originalText: "饮料三块",
    spentAt: "210404".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "饮料",
    amount: 3.0,
    tags: ["饮料"]
)

let testExpenseInfo_46 = ExpenseInfo(
    originalText: "雀魂月卡三十六块一",
    spentAt: "210404".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "雀魂月卡",
    amount: 36.1,
    tags: ["雀魂", "月卡"],
    focus: "游戏"
)

let testExpenseInfo_47 = ExpenseInfo(
    originalText: "吃的五块",
    spentAt: "210404".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "零食",
    amount: 5.0,
    tags: ["零食"]
)

let testExpenseInfo_48 = ExpenseInfo(
    originalText: "咖啡二十",
    spentAt: "210405".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "咖啡",
    amount: 20.0,
    tags: ["咖啡"],
    story: ExpenseInfo.Story(rating: 1,
                             emoji: "🥲",
                             text: "美式咖啡 超级难喝…以后一定买带糖的")
)

let testExpenseInfo_49 = ExpenseInfo(
    originalText: "买hima的音声画了六十二",
    spentAt: "210407".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "买hima的音声",
    amount: 62.0,
    tags: ["hima", "音声", "dlsite"],
    focus: "支持",
    forWho: ["hima"],
    story: ExpenseInfo.Story(rating: 5,
                             emoji: "☺️",
                             text: "第一次在dlsite上买音声，体验超级好。hima出的怎么也要支持一下hh。数数的那个我直接无了")
)

let testExpenseInfo_50 = ExpenseInfo(
    originalText: "饮料三块",
    spentAt: "210408".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "饮料",
    amount: 3.0,
    tags: ["饮料"]
)

let testExpenseInfo_51 = ExpenseInfo(
    originalText: "饮料四块五",
    spentAt: "210409".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "饮料",
    amount: 4.5,
    tags: ["饮料"]
)

let testExpenseInfo_52 = ExpenseInfo(
    originalText: "饮料五块",
    spentAt: "210411".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "饮料",
    amount: 5.0,
    tags: ["饮料"]
)

let testExpenseInfo_53 = ExpenseInfo(
    originalText: "晚饭十七",
    spentAt: "210412".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "晚饭",
    amount: 17.0,
    tags: ["晚饭"]
)

let testExpenseInfo_54 = ExpenseInfo(
    originalText: "给饭卡充了八百",
    spentAt: "210413".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "给饭卡充值",
    amount: 800.0,
    tags: ["校园卡"]
)

let testExpenseInfo_55 = ExpenseInfo(
    originalText: "零食十块",
    spentAt: "210413".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "零食",
    amount: 10,
    tags: ["零食"]
)

let testExpenseInfo_56 = ExpenseInfo(
    originalText: "洗衣四块",
    spentAt: "210413".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "洗衣",
    amount: 4.0,
    tags: ["洗衣"]
)

let testExpenseInfo_57 = ExpenseInfo(
    originalText: "洗衣三块",
    spentAt: "210414".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "洗衣",
    amount: 3.0,
    tags: ["洗衣"]
)

let testExpenseInfo_58 = ExpenseInfo(
    originalText: "饮料五块",
    spentAt: "210417".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "饮料",
    amount: 5.0,
    tags: ["饮料"]
)

let testExpenseInfo_59 = ExpenseInfo(
    originalText: "饮料五块五",
    spentAt: "210418".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "饮料",
    amount: 5.5,
    tags: ["饮料"]
)

let testExpenseInfo_60 = ExpenseInfo(
    originalText: "买空白的本子花了七十四",
    spentAt: "210420".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "空白的本子",
    amount: 74.0,
    tags: ["本子"],
    story: ExpenseInfo.Story(rating: 4,
                             emoji: "😅",
                             text: "对草稿本的需求还是蛮大的。一次买了不少。希望能对学习有帮助。不过还是希望能有iPad 这样各方面都会方便一些。")
)

let testExpenseInfo_61 = ExpenseInfo(
    originalText: "饮料五块",
    spentAt: "210420".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "饮料",
    amount: 5.0,
    tags: ["饮料"]
)

let testExpenseInfo_62 = ExpenseInfo(
    originalText: "买了十五块的奶茶",
    spentAt: "210421".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "奶茶",
    amount: 15.0,
    tags: ["奶茶"]
)

let testExpenseInfo_63 = ExpenseInfo(
    originalText: "饮料五块五",
    spentAt: "210425".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "饮料",
    amount: 5.5,
    tags: ["饮料"]
)

let testExpenseInfo_64 = ExpenseInfo(
    originalText: "饮料六块",
    spentAt: "210427".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "饮料",
    amount: 6.0,
    tags: ["饮料"]
)

let testExpenseInfo_65 = ExpenseInfo(
    originalText: "饮料五块",
    spentAt: "210427".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "饮料",
    amount: 5.0,
    tags: ["饮料"]
)

let testExpenseInfo_66 = ExpenseInfo(
    originalText: "讨论买哈密瓜味的冰激凌花了十三",
    spentAt: "210427".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "哈密瓜味的冰激凌",
    amount: 13.0,
    tags: ["冰激凌"]
)

let testExpenseInfo_67 = ExpenseInfo(
    originalText: "饮料五块",
    spentAt: "210428".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "饮料",
    amount: 5.0,
    tags: ["饮料"]
)

let testExpenseInfo_68 = ExpenseInfo(
    originalText: "贩卖机买鱼豆腐十一",
    spentAt: "210501".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "鱼豆腐",
    amount: 11.0,
    tags: ["鱼豆腐", "零食"]
)

let testExpenseInfo_69 = ExpenseInfo(
    originalText: "饮料三块五",
    spentAt: "210502".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "饮料",
    amount: 3.5,
    tags: ["饮料"]
)

let testExpenseInfo_70 = ExpenseInfo(
    originalText: "洗衣四块",
    spentAt: "210502".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "洗衣",
    amount: 4.0,
    tags: ["洗衣"]
)

let testExpenseInfo_71 = ExpenseInfo(
    originalText: "零食四块",
    spentAt: "210502".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "零食",
    amount: 4.0,
    tags: ["零食"]
)

let testExpenseInfo_72 = ExpenseInfo(
    originalText: "冰激凌十六",
    spentAt: "210502".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "冰激凌",
    amount: 16.0,
    tags: ["冰激凌"]
)

let testExpenseInfo_73 = ExpenseInfo(
    originalText: "饮料六块",
    spentAt: "210502".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "饮料",
    amount: 6.0,
    tags: ["饮料"]
)

let testExpenseInfo_74 = ExpenseInfo(
    originalText: "充了二百元话费",
    spentAt: "210502".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "话费",
    amount: 200.0,
    tags: ["话费"]
)

let testExpenseInfo_75 = ExpenseInfo(
    originalText: "去天津的往返车票 一百二",
    spentAt: "210502".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "去天津的往返车票",
    amount: 120.0,
    tags: ["天津", "海", "高铁"],
    focus: "旅游",
    story: ExpenseInfo.Story(rating: 5,
                             emoji: "😃",
                             text: "去天津看海真的好棒！说实话 真没花多少钱，但体验是超级棒！")
)

let testExpenseInfo_76 = ExpenseInfo(
    originalText: "天津市内交通 二十四",
    spentAt: "210502".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "天津市内交通",
    amount: 24.0,
    tags: ["天津", "海", "市内交通"],
    focus: "旅游"
)

let testExpenseInfo_77 = ExpenseInfo(
    originalText: "零食十五",
    spentAt: "210505".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "零食",
    amount: 15.0,
    tags: ["零食"]
)

let testExpenseInfo_78 = ExpenseInfo(
    originalText: "杯面六块",
    spentAt: "210507".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "杯面",
    amount: 6.0,
    tags: ["零食"]
)

let testExpenseInfo_79 = ExpenseInfo(
    originalText: "午饭二十八块五",
    spentAt: "210510".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "午饭",
    amount: 28.5,
    tags: ["午饭"]
)

let testExpenseInfo_80 = ExpenseInfo(
    originalText: "饮料五块",
    spentAt: "210414".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "饮料",
    amount: 5.0,
    tags: ["饮料"]
)

let testExpenseInfo_81 = ExpenseInfo(
    originalText: "给たんたんめん充值花了十六",
    spentAt: "210516".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "给たんたんめん充值",
    amount: 16.0,
    tags: ["pixiv", "fanbox", "たんたんめん"],
    focus: "支持",
    forWho: ["たんたんめん"],
    story: ExpenseInfo.Story(rating: 5,
                             emoji: "😆",
                             text: "注册了paypal，买fanbox。たんたんめん是我超喜欢的画师，感觉他画的画就特别灵动！拿到了一堆高清的图还有psd，自己学画画的时候也可以尝试参考。")
)

let testExpenseInfo_82 = ExpenseInfo(
    originalText: "饮料五块五",
    spentAt: "210517".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "饮料",
    amount: 5.5,
    tags: ["饮料"]
)

let testExpenseInfo_83 = ExpenseInfo(
    originalText: "洗衣四块",
    spentAt: "210519".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "洗衣",
    amount: 4.0,
    tags: ["洗衣"]
)

let testExpenseInfo_84 = ExpenseInfo(
    originalText: "手环带子二十九",
    spentAt: "210520".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "手环带子",
    amount: 29.0,
    tags: ["小米手环"],
    focus: "电子设备",
    story: ExpenseInfo.Story(rating: 1,
                             emoji: "😤",
                             text: "原来的那个手环真的不结实啊。新的也很贵")
)

let testExpenseInfo_85 = ExpenseInfo(
    originalText: "饮料四块五",
    spentAt: "210521".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "饮料",
    amount: 4.5,
    tags: ["饮料"]
)

let testExpenseInfo_86 = ExpenseInfo(
    originalText: "饮料五块",
    spentAt: "210522".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "饮料",
    amount: 5.0,
    tags: ["饮料"]
)

let testExpenseInfo_87 = ExpenseInfo(
    originalText: "奶茶十四",
    spentAt: "210523".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "奶茶",
    amount: 14.0,
    tags: ["奶茶"]
)

let testExpenseInfo_88 = ExpenseInfo(
    originalText: "零食十三",
    spentAt: "210525".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "零食",
    amount: 13.0,
    tags: ["零食"]
)

let testExpenseInfo_89 = ExpenseInfo(
    originalText: "雀魂月卡三十五",
    spentAt: "210525".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "雀魂月卡",
    amount: 35.0,
    tags: ["雀魂", "月卡"],
    focus: "雀魂"
)

let testExpenseInfo_90 = ExpenseInfo(
    originalText: "打印四毛",
    spentAt: "210525".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "打印",
    amount: 0.4,
    tags: ["打印"]
)

let testExpenseInfo_91 = ExpenseInfo(
    originalText: "洗衣三块八",
    spentAt: "210526".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "洗衣",
    amount: 3.8,
    tags: ["洗衣"]
)

let testExpenseInfo_92 = ExpenseInfo(
    originalText: "饮料三块",
    spentAt: "210526".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "饮料",
    amount: 3.0,
    tags: ["饮料"]
)

let testExpenseInfo_93 = ExpenseInfo(
    originalText: "酸奶九块",
    spentAt: "210526".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "酸奶",
    amount: 9.0,
    tags: ["酸奶", "零食"]
)

let testExpenseInfo_94 = ExpenseInfo(
    originalText: "把图片处理为高清花了三十五",
    spentAt: "210527".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "把图片处理为高清",
    amount: 35.0,
    tags: ["图片处理", "waifu"],
    focus: "软件服务",
    story: ExpenseInfo.Story(rating: 4,
                             emoji: "🤓",
                             text: "一直对AI没什么兴趣的，直到发现了GitHub伤的waifu。原来机器学习还能做这个，真不错！把たんたんめん的图都放大了一遍，メンヘラちゃん的表情包也是。觉得能让我对图像处理产生兴趣这是最重要的")
)

let testExpenseInfo_95 = ExpenseInfo(
    originalText: "给山哥买生日蛋糕花了七十",
    spentAt: "210528".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "给山哥买生日蛋糕",
    amount: 70.0,
    tags: ["山哥", "生日", "蛋糕"],
    forWho: ["山哥"],
    story: ExpenseInfo.Story(rating: 4,
                             emoji: "🥳",
                             text: "自己还花了蛮多时间去策划的，山哥生快，希望新的一岁更加牛逼吧！")
)

let testExpenseInfo_96 = ExpenseInfo(
    originalText: "饮料五块",
    spentAt: "210528".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "饮料",
    amount: 5.0,
    tags: ["饮料"]
)

let testExpenseInfo_97 = ExpenseInfo(
    originalText: "饮料五元",
    spentAt: "210531".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "饮料",
    amount: 5.0,
    tags: ["饮料"]
)

let testExpenseInfo_98 = ExpenseInfo(
    originalText: "午饭七块五",
    spentAt: "210531".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "午饭",
    amount: 7.5,
    tags: ["午饭"]
)

let testExpenseInfo_99 = ExpenseInfo(
    originalText: "电费十块",
    spentAt: "210531".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "电费",
    amount: 10.0,
    tags: ["洗衣"]
)

let testExpenseInfo_100 = ExpenseInfo(
    originalText: "洗衣四块",
    spentAt: "210601".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "洗衣",
    amount: 4.0,
    tags: ["洗衣"]
)

let testExpenseInfo_101 = ExpenseInfo(
    originalText: "饮料四块五",
    spentAt: "210602".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "饮料",
    amount: 4.5,
    tags: ["饮料"]
)

let testExpenseInfo_102 = ExpenseInfo(
    originalText: "饮料六块",
    spentAt: "210602".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "饮料",
    amount: 6.0,
    tags: ["饮料"]
)

let testExpenseInfo_103 = ExpenseInfo(
    originalText: "饮料五块",
    spentAt: "210602".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "饮料",
    amount: 5.0,
    tags: ["饮料"]
)

let testExpenseInfo_104 = ExpenseInfo(
    originalText: "饭卡充值 四百",
    spentAt: "210603".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "饭卡充值",
    amount: 400.0,
    tags: ["校园卡"]
)

let testExpenseInfo_105 = ExpenseInfo(
    originalText: "零食十块",
    spentAt: "210604".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "零食",
    amount: 10.0,
    tags: ["零食"]
)

let testExpenseInfo_106 = ExpenseInfo(
    originalText: "班费五十",
    spentAt: "210607".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "班费",
    amount: 50.0,
    tags: ["无97"]
)

let testExpenseInfo_107 = ExpenseInfo(
    originalText: "饮料五块",
    spentAt: "210608".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "饮料",
    amount: 5.0,
    tags: ["饮料"]
)

let testExpenseInfo_108 = ExpenseInfo(
    originalText: "午饭花了七块",
    spentAt: "210609".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "午饭",
    amount: 7.0,
    tags: ["午饭"]
)

let testExpenseInfo_109 = ExpenseInfo(
    originalText: "方便面六块",
    spentAt: "210610".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "方便面",
    amount: 6.0,
    tags: ["方便面"]
)

let testExpenseInfo_110 = ExpenseInfo(
    originalText: "饮料六块",
    spentAt: "210611".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "饮料",
    amount: 6.0,
    tags: ["饮料"]
)

let testExpenseInfo_111 = ExpenseInfo(
    originalText: "饮料六块",
    spentAt: "210612".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "饮料",
    amount: 6.0,
    tags: ["饮料"]
)

let testExpenseInfo_112 = ExpenseInfo(
    originalText: "水木咖啡 奶茶十二",
    spentAt: "210612".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "水木咖啡 奶茶",
    amount: 12.0,
    tags: ["水木咖啡", "奶茶"],
    story: ExpenseInfo.Story(rating: 3,
                             emoji: "🧐",
                             text: "讨论项目。学到了不少呢，感觉现在的项目还缺少很多东西。逐渐添加上吧")
)

let testExpenseInfo_113 = ExpenseInfo(
    originalText: "零食四块",
    spentAt: "210615".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "零食",
    amount: 4.0,
    tags: ["零食"]
)

let testExpenseInfo_114 = ExpenseInfo(
    originalText: "饮料七块",
    spentAt: "210616".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "饮料",
    amount: 7.0,
    tags: ["饮料"]
)

let testExpenseInfo_115 = ExpenseInfo(
    originalText: "饮料四块五",
    spentAt: "210616".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "饮料",
    amount: 4.5,
    tags: ["饮料"]
)

let testExpenseInfo_116 = ExpenseInfo(
    originalText: "洗衣四块",
    spentAt: "210617".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "饮料",
    amount: 4.0,
    tags: ["饮料"]
)

let testExpenseInfo_117 = ExpenseInfo(
    originalText: "饮料六块",
    spentAt: "210617".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "饮料",
    amount: 6.0,
    tags: ["饮料"]
)

let testExpenseInfo_118 = ExpenseInfo(
    originalText: "饮料六块",
    spentAt: "210617".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "饮料",
    amount: 6.0,
    tags: ["饮料"]
)

let testExpenseInfo_119 = ExpenseInfo(
    originalText: "薯片六块",
    spentAt: "210617".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "薯片",
    amount: 6.0,
    tags: ["零食", "薯片"]
)

let testExpenseInfo_120 = ExpenseInfo(
    originalText: "饮料六块",
    spentAt: "210618".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "饮料",
    amount: 6.0,
    tags: ["饮料"]
)

let testExpenseInfo_121 = ExpenseInfo(
    originalText: "饮料六块",
    spentAt: "210619".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "饮料",
    amount: 5.0,
    tags: ["饮料"]
)

let testExpenseInfo_122 = ExpenseInfo(
    originalText: "expressVPN十五个月六百六十三",
    spentAt: "210619".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "expressVPN十五个月",
    amount: 663.0,
    tags: ["VPN", "expressVPN"],
    focus: "软件服务",
    story: ExpenseInfo.Story(rating: 4,
                             emoji: "🤨",
                             text: "好贵。但怎么说呢，自己每天都要用，有一个稳定的体验好的梯子还是蛮重要的。")
)

let testExpenseInfo_123 = ExpenseInfo(
    originalText: "奶茶十八",
    spentAt: "210619".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "饮料",
    amount: 18.0,
    tags: ["饮料"]
)

let testExpenseInfo_124 = ExpenseInfo(
    originalText: "买唯花的音声六十一",
    spentAt: "210619".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "唯花的音声",
    amount: 61.0,
    tags: ["唯花", "hima", "dlsite", "音声"],
    focus: "支持",
    forWho: ["hima"],
    story: ExpenseInfo.Story(rating: 5,
                             emoji: "😌",
                             text: "呜呜呜 好清楚的声音！当天在B站看到有预览版就直接上DLsite买了")
)

let testExpenseInfo_125 = ExpenseInfo(
    originalText: "饮料三块",
    spentAt: "210619".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "饮料",
    amount: 3.0,
    tags: ["饮料"]
)

let testExpenseInfo_126 = ExpenseInfo(
    originalText: "打印两毛",
    spentAt: "210620".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "打印",
    amount: 0.2,
    tags: ["打印"]
)

let testExpenseInfo_127 = ExpenseInfo(
    originalText: "饮料五块五",
    spentAt: "210620".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "饮料",
    amount: 5.5,
    tags: ["饮料"]
)

let testExpenseInfo_128 = ExpenseInfo(
    originalText: "打印三块六",
    spentAt: "210621".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "打印",
    amount: 3.6,
    tags: ["打印"]
)

let testExpenseInfo_129 = ExpenseInfo(
    originalText: "饮料三块",
    spentAt: "210621".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "饮料",
    amount: 3.0,
    tags: ["饮料"]
)

let testExpenseInfo_130 = ExpenseInfo(
    originalText: "零食六块",
    spentAt: "210621".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "零食",
    amount: 6.0,
    tags: ["零食"]
)

let testExpenseInfo_131 = ExpenseInfo(
    originalText: "清芬快餐二十一",
    spentAt: "210622".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "清芬快餐",
    amount: 21.0,
    tags: ["清芬", "快餐"]
)

let testExpenseInfo_132 = ExpenseInfo(
    originalText: "饮料四块五",
    spentAt: "210622".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "饮料",
    amount: 4.5,
    tags: ["饮料"]
)

let testExpenseInfo_133 = ExpenseInfo(
    originalText: "咖啡六块",
    spentAt: "210622".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "咖啡",
    amount: 6.0,
    tags: ["咖啡"],
    story: ExpenseInfo.Story(rating: 1,
                             emoji: "😭",
                             text: "考信号与系统前买的咖啡，确实让我打起了精神，但喝的有点凉，而且考完试发现自己一直紧张，所以最后有点恶心")
)

let testExpenseInfo_134 = ExpenseInfo(
    originalText: "洗衣四块",
    spentAt: "210623".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "洗衣",
    amount: 4.0,
    tags: ["洗衣"]
)

let testExpenseInfo_135 = ExpenseInfo(
    originalText: "超市买东西花了九十四块五",
    spentAt: "210623".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "超市买东西",
    amount: 94.5,
    tags: ["超市"]
)

let testExpenseInfo_136 = ExpenseInfo(
    originalText: "三大包湿巾三十五",
    spentAt: "210623".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "三大包湿巾",
    amount: 35.0,
    tags: ["湿巾"],
    focus: "宿舍",
    story: ExpenseInfo.Story(rating: 3,
                             emoji: "😌",
                             text: "终于有了湿巾，到手之后发现好好用啊！不过它是无香的，想要有香味的（买的时候没仔细看嗫）")
)

let testExpenseInfo_137 = ExpenseInfo(
    originalText: "帆布鞋六十九",
    spentAt: "210624".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "帆布鞋",
    amount: 69.0,
    tags: ["帆布鞋"]
)

let testExpenseInfo_138 = ExpenseInfo(
    originalText: "买二十个衣架花了十五块三",
    spentAt: "210624".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "买二十个衣架",
    amount: 15.3,
    tags: ["衣架"],
    focus: "宿舍",
    story: ExpenseInfo.Story(rating: 2,
                             emoji: "😠",
                             text: "质量好差，我没想到那么细。夏天挂挂衣服还好，但冬天衣服我感觉这个怕是撑不起来")
)

let testExpenseInfo_139 = ExpenseInfo(
    originalText: "饮料三块",
    spentAt: "210624".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "饮料",
    amount: 3.0,
    tags: ["饮料"]
)

let testExpenseInfo_140 = ExpenseInfo(
    originalText: "冰激凌十四",
    spentAt: "210625".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "冰激凌",
    amount: 14.0,
    tags: ["冰激凌"]
)

let testExpenseInfo_141 = ExpenseInfo(
    originalText: "薯片七块",
    spentAt: "210625".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "薯片",
    amount: 7.0,
    tags: ["薯片", "零食"]
)

let testExpenseInfo_142 = ExpenseInfo(
    originalText: "跳线两盒 十七块二",
    spentAt: "210625".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "跳线两盒",
    amount: 17.2,
    tags: ["跳线", "电设"],
    story: ExpenseInfo.Story(rating: 3,
                             emoji: "🧐",
                             text: "电设实验用跳线还是方便一点 一次多买了一盒")
)

let testExpenseInfo_143 = ExpenseInfo(
    originalText: "饮料五块",
    spentAt: "210625".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "饮料",
    amount: 5.0,
    tags: ["饮料"]
)

let testExpenseInfo_144 = ExpenseInfo(
    originalText: "雀魂月卡三十五块七",
    spentAt: "210625".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "雀魂月卡",
    amount: 35.7,
    tags: ["雀魂", "月卡"],
    focus: "游戏",
    story: ExpenseInfo.Story(rating: 2,
                             emoji: "🥲",
                             text: "说实话不怎么想充月卡……还是把精力放在提升雀力上吧")
)

let testExpenseInfo_145 = ExpenseInfo(
    originalText: "床帘一百一十八",
    spentAt: "210626".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "床帘",
    amount: 118.0,
    tags: ["宿舍", "床帘"],
    focus: "宿舍",
    story: ExpenseInfo.Story(rating: 5,
                             emoji: "😎",
                             text: "好棒的床帘！有了在宿舍自己的空间！虽然装的时候超级费力气，但装好之后第一个晚上就睡的特别舒服")
)

let testExpenseInfo_146 = ExpenseInfo(
    originalText: "饮料七块五",
    spentAt: "210626".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "饮料",
    amount: 7.5,
    tags: ["饮料"]
)

let testExpenseInfo_147 = ExpenseInfo(
    originalText: "洗衣三块",
    spentAt: "210626".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "洗衣",
    amount: 3.0,
    tags: ["洗衣"]
)

let testExpenseInfo_148 = ExpenseInfo(
    originalText: "和高中同学聚点串吧 AA一百一十五",
    spentAt: "210626".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "和高中同学聚点串吧",
    amount: 115.0,
    tags: ["AA", "清新", "聚点串吧"],
    focus: "聚餐",
    story: ExpenseInfo.Story(rating: 5,
                             emoji: "😎",
                             text: "好久没见到高中同学了啊！聊得很多话题，超级开心！lg虽然迟到了很久，但之后第二场也很愉快啊！")
)

let testExpenseInfo_149 = ExpenseInfo(
    originalText: "宿舍电费三十",
    spentAt: "210627".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "宿舍电费",
    amount: 30.0,
    tags: ["宿舍", "电费"],
    focus: "宿舍"
)

let testExpenseInfo_150 = ExpenseInfo(
    originalText: "和iOS Club的同学聚餐花了四十六",
    spentAt: "210627".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "和iOS Club的同学聚餐",
    amount: 46.0,
    tags: ["iOS", "Club", "玉树"],
    focus: "聚餐",
    story: ExpenseInfo.Story(rating: 4,
                             emoji: "🧐",
                             text: "聚餐～虽然来的人不是很多，但认识了不少朋友！在社团继续加油吧！")
)

let testExpenseInfo_151 = ExpenseInfo(
    originalText: "给B站双语音声up主充电花了六块",
    spentAt: "210628".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "B站双语音声up主充电",
    amount: 6.0,
    tags: ["B站", "充电", "音声"],
    focus: "支持"
)

let testExpenseInfo_152 = ExpenseInfo(
    originalText: "尝试讯飞转写日语 两块四",
    spentAt: "210629".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "讯飞转写日语",
    amount: 2.4,
    tags: ["讯飞", "日语"],
    focus: "软件服务"
)

let testExpenseInfo_153 = ExpenseInfo(
    originalText: "买零食五块",
    spentAt: "210701".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "零食",
    amount: 5.0,
    tags: ["零食"]
)

let testExpenseInfo_154 = ExpenseInfo(
    originalText: "买水两块",
    spentAt: "210702".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "买水",
    amount: 2.0,
    tags: ["水"]
)

let testExpenseInfo_155 = ExpenseInfo(
    originalText: "洗衣三块五",
    spentAt: "210702".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "洗衣",
    amount: 3.5,
    tags: ["洗衣"]
)

let testExpenseInfo_156 = ExpenseInfo(
    originalText: "饮料五块",
    spentAt: "210707".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "饮料",
    amount: 5.0,
    tags: ["饮料"]
)

let testExpenseInfo_157 = ExpenseInfo(
    originalText: "饮料三块",
    spentAt: "210708".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "饮料",
    amount: 3.0,
    tags: ["饮料"]
)

let testExpenseInfo_158 = ExpenseInfo(
    originalText: "买了百度云半年的服务器用来做课程演示 花了74",
    spentAt: "210708".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "百度云半年服务器",
    amount: 74.0,
    tags: ["Linux", "服务器", "百度云"],
    focus: "软件服务",
    story: ExpenseInfo.Story(rating: 4,
                             emoji: "🤓",
                             text: "买来用吧，感觉手上没一台服务器做事情还是不方便。")
)

let testExpenseInfo_159 = ExpenseInfo(
    originalText: "买饮料花了五块五",
    spentAt: "210709".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "饮料",
    amount: 5.5,
    tags: ["饮料"]
)

let testExpenseInfo_160 = ExpenseInfo(
    originalText: "买饮料花了四块七",
    spentAt: "210711".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "饮料",
    amount: 4.7,
    tags: ["饮料"]
)

let testExpenseInfo_161 = ExpenseInfo(
    originalText: "充二百元话费",
    spentAt: "210712".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "话费",
    amount: 200.0,
    tags: ["话费"]
)

let testExpenseInfo_162 = ExpenseInfo(
    originalText: "iPad Pro",
    spentAt: "210716".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "买iPad",
    amount: 6600.0,
    tags: ["iPadPro", "教育优惠"],
    focus: "电子设备",
    story: ExpenseInfo.Story(rating: 5,
                             emoji: "🥰",
                             text: "终于拿到了iPad Pro！感谢父母～到手之后发现确实可以做很多事情哈，效率++")
)

let testExpenseInfo_163 = ExpenseInfo(
    originalText: "Apple Pencil教育优惠895",
    spentAt: "210716".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "Pencil",
    amount: 895.0,
    tags: ["教育优惠", "ApplePencil"],
    focus: "电子设备"
)

let testExpenseInfo_164 = ExpenseInfo(
    originalText: "AirPods Pro教育优惠753",
    spentAt: "210716".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "AirPods Pro",
    amount: 753.0,
    tags: ["教育优惠", "耳机", "AirPodsPro"],
    focus: "电子设备",
    story: ExpenseInfo.Story(rating: 4,
                             emoji: "😂",
                             text: "还行吧，但感觉问题也不少")
)

let testExpenseInfo_165 = ExpenseInfo(
    originalText: "洗衣三块",
    spentAt: "210716".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "洗衣",
    amount: 3.0,
    tags: ["洗衣"]
)

let testExpenseInfo_166 = ExpenseInfo(
    originalText: "iPad Pro双面夹90",
    spentAt: "210716".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "保护壳",
    amount: 90.0,
    tags: ["iPadPro", "配件"],
    focus: "电子设备"
)

let testExpenseInfo_167 = ExpenseInfo(
    originalText: "夜宵十一块五",
    spentAt: "210717".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "夜宵",
    amount: 11.5,
    tags: ["夜宵"]
)

let testExpenseInfo_168 = ExpenseInfo(
    originalText: "充话费100",
    spentAt: "210718".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "充话费",
    amount: 100.0,
    tags: ["话费"]
)

let testExpenseInfo_169 = ExpenseInfo(
    originalText: "和舍友出去吃火锅花了43.5",
    spentAt: "210719".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "吃火锅",
    amount: 43.5,
    tags: ["火锅", "聚餐"],
    focus: "聚餐"
)

let testExpenseInfo_170 = ExpenseInfo(
    originalText: "洗衣三块",
    spentAt: "210719".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "洗衣",
    amount: 3.0,
    tags: ["洗衣"]
)

let testExpenseInfo_171 = ExpenseInfo(
    originalText: "打印材料两块五",
    spentAt: "210720".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "打印",
    amount: 2.5,
    tags: ["打印"]
)

let testExpenseInfo_172 = ExpenseInfo(
    originalText: "充饭卡花了四百",
    spentAt: "210721".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "充饭卡",
    amount: 400.0,
    tags: ["饭卡"]
)

let testExpenseInfo_173 = ExpenseInfo(
    originalText: "买Notability花了六十",
    spentAt: "210721".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "Notability",
    amount: 60.0,
    tags: ["iPadOS软件", "Notability"],
    focus: "软件服务",
    story: ExpenseInfo.Story(rating: 4,
                             emoji: "🧐",
                             text: "感觉一般般 功能不是那么多，有的操作并不是很顺手。而且很多主题都要另外付费ummm")
)

let testExpenseInfo_174 = ExpenseInfo(
    originalText: "买Procreate花了六十八",
    spentAt: "210721".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "Procreate",
    amount: 68.0,
    tags: ["iPadOS软件", "Procreate"],
    focus: "软件服务",
    story: ExpenseInfo.Story(rating: 5,
                             emoji: "😆",
                             text: "好棒！加油画画吧！现在还在尝试着描别的画师的草稿，先把pencil拿稳吧ww")
)

let testExpenseInfo_175 = ExpenseInfo(
    originalText: "买饮料五块",
    spentAt: "210723".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "饮料",
    amount: 5.0,
    tags: ["饮料"]
)

let testExpenseInfo_176 = ExpenseInfo(
    originalText: "买饮料五块",
    spentAt: "210725".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "饮料",
    amount: 5.0,
    tags: ["饮料"]
)

let testExpenseInfo_177 = ExpenseInfo(
    originalText: "回家火车票 425",
    spentAt: "210725".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "火车票",
    amount: 425.5,
    tags: ["火车票"]
)

let testExpenseInfo_178 = ExpenseInfo(
    originalText: "桃李地下聚餐42",
    spentAt: "210726".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "桃李地下",
    amount: 42.0,
    tags: ["聚餐"],
    focus: "聚餐"
)

let testExpenseInfo_179 = ExpenseInfo(
    originalText: "洗衣花了三块八",
    spentAt: "210727".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "洗衣",
    amount: 3.8,
    tags: ["洗衣"]
)

let testExpenseInfo_180 = ExpenseInfo(
    originalText: "楼下买吃的花了二十",
    spentAt: "210731".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "楼下吃的",
    amount: 20.0,
    tags: ["零食"]
)

let testExpenseInfo_181 = ExpenseInfo(
    originalText: "超市买东西花了八十二块七",
    spentAt: "210801".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "超市买东西",
    amount: 82.7,
    tags: ["超市", "奶"]
)

let testExpenseInfo_182 = ExpenseInfo(
    originalText: "一份面皮三块五",
    spentAt: "210801".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "面皮",
    amount: 3.5,
    tags: ["面皮"]
)

let testExpenseInfo_183 = ExpenseInfo(
    originalText: "买打气筒给自行车充气花了二十八块五",
    spentAt: "210803".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "打气筒",
    amount: 28.5,
    tags: ["打气筒", "自行车"]
)

let testExpenseInfo_184 = ExpenseInfo(
    originalText: "买礼品卡花了二十",
    spentAt: "210804".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "中国app store礼品卡",
    amount: 20.0,
    tags: ["礼品卡"]
)

let testExpenseInfo_185 = ExpenseInfo(
    originalText: "淘宝礼品卡代充花了七十",
    spentAt: "210804".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "美区app store礼品卡",
    amount: 70.0,
    tags: ["礼品卡"],
    focus: "游戏"
)

let testExpenseInfo_186 = ExpenseInfo(
    originalText: "买Office套件花了八块",
    spentAt: "210901".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "office",
    amount: 8.0,
    tags: ["Microsoft", "Office"],
    focus: "软件服务",
    story: ExpenseInfo.Story(rating: 5,
                             emoji: "🧐",
                             text: "学校给的Office不知道怎么就装不上，某宝买了一个非常好用！iPad上也下载好了，而且还是自己改密码的那种；虽然不知道哪天就跑路了，但是先用着吧")
)

let testExpenseInfo_187 = ExpenseInfo(
    originalText: "去钓鱼台花了20",
    spentAt: "210902".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "钓鱼台",
    amount: 20.0,
    tags: ["旅游"],
    story: ExpenseInfo.Story(rating: 4,
                             emoji: "😆",
                             text: "超级不错！虽然景区不大，但里面的水库惊艳到我了，看到了彩虹色的水雾！太棒了")
)

let testExpenseInfo_188 = ExpenseInfo(
    originalText: "九成宫门票四十",
    spentAt: "210903".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "九成宫",
    amount: 40.0,
    tags: ["旅游"]
)

let testExpenseInfo_189 = ExpenseInfo(
    originalText: "买DLSite点数",
    spentAt: "210903".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "dlsite1000点数",
    amount: 60.0,
    tags: ["音声", "DLSite"],
    focus: "软件服务",
    story: ExpenseInfo.Story(rating: 5,
                             emoji: "🥰",
                             text: "又遇到了一个超级棒的音声！直接去买了")
)

let testExpenseInfo_190 = ExpenseInfo(
    originalText: "买湿巾花了三十八块八",
    spentAt: "210904".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "湿巾",
    amount: 38.8,
    tags: ["湿巾", "餐桌"]
)

let testExpenseInfo_191 = ExpenseInfo(
    originalText: "买macOS开发书花了八十一",
    spentAt: "210909".toDate("yyMMdd", region: regionChina) ?? DateInRegion(region: regionChina),
    event: "macOS开发书",
    amount: 81.0,
    tags: ["AppKit", "macOS", "Xcode"],
    focus: "软件服务"
)

let testExpenseInfos: [ExpenseInfo] = [testExpenseInfo_1, testExpenseInfo_2, testExpenseInfo_3, testExpenseInfo_4, testExpenseInfo_5, testExpenseInfo_6, testExpenseInfo_7, testExpenseInfo_8, testExpenseInfo_9, testExpenseInfo_10, testExpenseInfo_11, testExpenseInfo_12, testExpenseInfo_13, testExpenseInfo_14, testExpenseInfo_15, testExpenseInfo_16, testExpenseInfo_17, testExpenseInfo_18, testExpenseInfo_19, testExpenseInfo_20, testExpenseInfo_21, testExpenseInfo_22, testExpenseInfo_23, testExpenseInfo_24, testExpenseInfo_25, testExpenseInfo_26, testExpenseInfo_27, testExpenseInfo_28, testExpenseInfo_29, testExpenseInfo_30, testExpenseInfo_31, testExpenseInfo_32, testExpenseInfo_33, testExpenseInfo_34, testExpenseInfo_35, testExpenseInfo_36, testExpenseInfo_37, testExpenseInfo_38, testExpenseInfo_39, testExpenseInfo_40, testExpenseInfo_41, testExpenseInfo_42, testExpenseInfo_43, testExpenseInfo_44, testExpenseInfo_45, testExpenseInfo_46, testExpenseInfo_47, testExpenseInfo_48, testExpenseInfo_49, testExpenseInfo_50, testExpenseInfo_51, testExpenseInfo_52, testExpenseInfo_53, testExpenseInfo_54, testExpenseInfo_55, testExpenseInfo_56, testExpenseInfo_57, testExpenseInfo_58, testExpenseInfo_59, testExpenseInfo_60, testExpenseInfo_61, testExpenseInfo_62, testExpenseInfo_63, testExpenseInfo_64, testExpenseInfo_65, testExpenseInfo_66, testExpenseInfo_67, testExpenseInfo_68, testExpenseInfo_69, testExpenseInfo_70, testExpenseInfo_71, testExpenseInfo_72, testExpenseInfo_73, testExpenseInfo_74, testExpenseInfo_75, testExpenseInfo_76, testExpenseInfo_77, testExpenseInfo_78, testExpenseInfo_79, testExpenseInfo_80, testExpenseInfo_81, testExpenseInfo_82, testExpenseInfo_83, testExpenseInfo_84, testExpenseInfo_85, testExpenseInfo_86, testExpenseInfo_87, testExpenseInfo_88, testExpenseInfo_89, testExpenseInfo_90, testExpenseInfo_91, testExpenseInfo_92, testExpenseInfo_93, testExpenseInfo_94, testExpenseInfo_95, testExpenseInfo_96, testExpenseInfo_97, testExpenseInfo_98, testExpenseInfo_99, testExpenseInfo_100, testExpenseInfo_101, testExpenseInfo_102, testExpenseInfo_103, testExpenseInfo_104, testExpenseInfo_105, testExpenseInfo_106, testExpenseInfo_107, testExpenseInfo_108, testExpenseInfo_109, testExpenseInfo_110, testExpenseInfo_111, testExpenseInfo_112, testExpenseInfo_113, testExpenseInfo_114, testExpenseInfo_115, testExpenseInfo_116, testExpenseInfo_117, testExpenseInfo_118, testExpenseInfo_119, testExpenseInfo_120, testExpenseInfo_121, testExpenseInfo_122, testExpenseInfo_123, testExpenseInfo_124, testExpenseInfo_125, testExpenseInfo_126, testExpenseInfo_127, testExpenseInfo_128, testExpenseInfo_129, testExpenseInfo_130, testExpenseInfo_131, testExpenseInfo_132, testExpenseInfo_133, testExpenseInfo_134, testExpenseInfo_135, testExpenseInfo_136, testExpenseInfo_137, testExpenseInfo_138, testExpenseInfo_139, testExpenseInfo_140, testExpenseInfo_141, testExpenseInfo_142, testExpenseInfo_143, testExpenseInfo_144, testExpenseInfo_145, testExpenseInfo_146, testExpenseInfo_147, testExpenseInfo_148, testExpenseInfo_149, testExpenseInfo_150, testExpenseInfo_151, testExpenseInfo_152, testExpenseInfo_153, testExpenseInfo_154, testExpenseInfo_155, testExpenseInfo_156, testExpenseInfo_157, testExpenseInfo_158, testExpenseInfo_159, testExpenseInfo_160, testExpenseInfo_161, testExpenseInfo_162, testExpenseInfo_163, testExpenseInfo_164, testExpenseInfo_165, testExpenseInfo_166, testExpenseInfo_167, testExpenseInfo_168, testExpenseInfo_169, testExpenseInfo_170, testExpenseInfo_171, testExpenseInfo_172, testExpenseInfo_173, testExpenseInfo_174, testExpenseInfo_175, testExpenseInfo_176, testExpenseInfo_177, testExpenseInfo_178, testExpenseInfo_179, testExpenseInfo_180, testExpenseInfo_181, testExpenseInfo_182, testExpenseInfo_183, testExpenseInfo_184, testExpenseInfo_185, testExpenseInfo_186, testExpenseInfo_187, testExpenseInfo_188, testExpenseInfo_189, testExpenseInfo_190, testExpenseInfo_191]

#endif
