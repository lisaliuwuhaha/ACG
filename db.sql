SET NAMES UTF8;
#删除(丢弃)数据库,如果数据库存在
DROP DATABASE IF EXISTS ACG;
#创建数据库 并且设置服务器端使用的编码
CREATE DATABASE ACG CHARSET=UTF8;
#1:进入库中
USE ACG;
#2:创建信息表
CREATE TABLE show_info(
 id    INT PRIMARY KEY AUTO_INCREMENT, 
 pricep DECIMAL(6,2),
 pricen DECIMAL(6,2),
 title VARCHAR(128),
 ctime VARCHAR(128),
 addr  VARCHAR(128),
 img_url VARCHAR(255),
 content VARCHAR(1000),
 point INT,
 watch INT,
 comment INT
);
#now() 当前数据库时间 年月日时分秒
INSERT INTO show_info VALUES(null,40,45,'2018青空学园祭4.0冬日特典',
'2018年11月03日 09:00-2018年11月04日 18:00','湖南省长沙市红星国际会展中心','http://127.0.0.1:3000/img/1/1.jpg','Hello，这里是青空学园祭~
曾经来过或者参加过的老伙计，或是想参加的新同伴，本次青空学园祭于11月3-4日在湖南·长沙红星国际会展中心举办！我们的相比以前，更加的成熟、更加的完善。我们会有更多的游戏摊位、更加完美的室内布景摄影区。
除此之外，我们还有激情舞台游戏对抗！全新游戏冒险者工会！
更新迭代的愤怒的小鸟、充满粉红色泡泡的恋之异次元....更多的内容等待你的发现！
沿袭往届的游玩盖章活动，游玩集章还能赢得神秘大奖！
而且！我们的电玩避难所可能会迟到，但从不会缺席！电玩将会是无尽的快乐~
我们全新的舞台对抗活动 “红蓝合战”，两方共30支队伍互相对抗，表演节目涵盖翻唱、宅舞、团舞，现场投票由你们出手，谁赢谁负由你来定！
我们首次开放自由行活动，coser、lo娘、摄影、主播均可以申请，快来戳我们的负责人，成为自由行的一员吧！
青空学园祭4.0冬日特典 湖南长沙 11月3-4日 红星国际会展中心
青空与你的冬夏之约 等你来而实现！',1,2,3);
INSERT INTO show_info VALUES(null,100,300,'2018上海WePlay游戏文化展',
'2018年11月03日 09:00-2018年11月04日 17:30','上海市普陀区上海跨国采购会展中心1层与2层','http://127.0.0.1:3000/img/2/1.jpg','超海量游戏的现场展示试玩
　　跨越 PC 和主机游戏、跨越移动和 VR/AR, 以及桌游和街机游戏，WePlay 是一个包罗万象的游戏文化展，海量的新鲜游戏体验与试玩，带给你最纯粹的游戏展体验。

与游戏顶尖制作人的亲密接触
　　在 2017 WePlay 游戏文化展的现场，我们请来了众多游戏圈顶尖的制作人，比如《尼尔》2B小姐姐之父横尾太郎、《恶魔城》系列制作人五十岚孝司、《寂静岭》游戏和电影制作人山冈晃，玩家不仅可以在现场听这些制作人分享心声，在 Talk Show 环节提问答疑，还有机会现场索取签名近距离和大神接触。',3,2,1);
  INSERT INTO show_info VALUES(null,40,45,'2018第三届XiMi动漫游戏·秋日祭',
'2018年11月03日 09:00-2018年11月04日 17:00','广东省东莞市东城区捷力羽毛球馆','http://127.0.0.1:3000/img/3/1.jpg','不同于以往的是，第三届XiMi动漫游戏展
坐标东莞东城区捷力羽毛球馆
坐标东莞东城区捷力羽毛球馆
坐标东莞东城区捷力羽毛球馆
重要的事情请说三遍！！！
现在~小伙伴们最期待的自由行（本届自由行没有名额限制）、梦之歌唱、星之宅舞、女装大赛、男装大赛报名火热进行中！快来参加哦~',3,2,1);
  INSERT INTO show_info VALUES(null,40,45,'2018成都蜗牛动的漫福利基',
'2018年11月03日 09:30-2018年11月04日 17:00','四川省成都市梵木创艺区8号馆','http://127.0.0.1:3000/img/4/1.jpg','打破陈旧的漫展局限，全新ACG活动，希望给喜欢ACG的成都小伙伴们带来全新的聚会体验！我们，一起热爱，一起玩！仅2.33！2.33！2.33！更多详情欢迎请来秋秋裙：9800970。

时间：11月3-4日，

地点：梵木创艺区8号馆！不知小伙伴们觉得以下哪张海报好看？',3,2,1);

#新闻
CREATE TABLE info(
  id INT PRIMARY KEY AUTO_INCREMENT,
  title VARCHAR(128),
  content VARCHAR(2000),
  img_url VARCHAR(255)
);
INSERT INTO info VALUES(null,'高水准 超震撼！斗鱼音乐盛典彩排爆点不断，今晚正式开唱！','期待已久的斗鱼音乐盛典今晚终于要火力开唱了！有粉丝网友已按捺不住兴奋的心情，今天早早就到了北京国家网球中心场外。期待今晚的盛典早点开场，好欣赏到一众主播“换一种方式打开音乐”的魅力！
 粉丝如此迫切，明星主播们又怎会让自己的粉丝们失望呢？昨天的彩排现场，已经暗含了今晚表演的火爆惊喜！冯提莫、阿冷、周二珂、小缘、纳豆、小苏菲等斗鱼当红主播们，纷纷突破自我，融合多种元素带来全新表演，深度诠释“换一种方式打开音乐”！
   拥有清新蜜嗓的冯提莫突破以往的舞台表演局限，从化妆间直接开唱，优美的身姿带着歌声缓缓走到舞台上，现场背景通过哥特式唯美效果带领观众走进“佛系少女”的世界！从彩排来看，气质清幽的阿冷今晚将成为百变小魔女，一时变身惹人怜爱的名伶，与京剧演员搭配演绎个人古风歌曲，大秀热舞，在四种不同的曲风之间自如切换，展现个人深厚唱功与多变形象！甜美少女二珂则大胆挑战舞台表演，用歌声述说故事，亲自上演一段甜蜜而又让人悲伤的恋爱故事，唱演结合，将观众带领到甜蜜又悲伤的恋爱世界！
   小缘的清甜高音一直备受粉丝们的青睐，而此次盛典上小缘不仅一连串演唱多种风格歌曲，更会在最后一曲《无心》中展现个人超高技巧的“缘式高音”，将震撼全场！发着高烧彩排的豆子也是相当敬业，用一首《当你》开场，身为二次元萌妹代表，小小的躯体里面却蕴含了无尽的能量，一曲《不同凡响》彻底颠覆了一般水友对她的认知，即使是彩排时重感冒歌曲高音也非常稳，是时候换一种方式打开斗鱼的二次元萌妹了！
   身材火辣的小苏菲也将带来性感火辣的韩式热舞，彩排现场流露出的照片已让各位尖叫不已，今晚定将为粉丝们大派福利！
 除了一众流量主播外，斗鱼平台的其他话题主播如人美歌甜的770、音乐区才子卖血哥、实力唱将不同凡响也使出看家本领。不同凡响的双人反串合唱，卖血哥的新歌《小黑鱼》等都将会带给现场观众全新的观赏体验。
   惊喜不断的同时，斗鱼音乐盛典也为观众们准备好了一个完美的音乐舞台！此次音乐盛典不仅在编导、舞台效果和设计都达到业内一线水准，而且音响设备、灯光效果硬件等都采用最先进的技术，力求为现场观众呈现一场最顶级听视觉盛宴！
彩排现场尚且如此高潮迭起，今晚的现场更是引人期待，今天下午5:30活动现场开唱的同时，斗鱼直播房间号6也会进行同步直播，明星大咖，当红实力主播齐聚完美舞台，一场万众瞩目的音乐盛宴即将上演！你可别错过了，今晚打开斗鱼，登录直播间6，全程直播惊喜表演等你看！','http://127.0.0.1:3000/img/i1/1.jpg');
INSERT INTO info VALUES(null,'你想听的歌都在这，今年最燃斗鱼音乐盛典蓄势待发！','最近，一众斗鱼主播在微博上纷纷发布了要与大家相约北京的消息，引来众多粉丝的热烈回应。据悉，他们是在为2018最令人期待的音乐盛事而积极筹备。11月23日17:30，斗鱼将携手冯提莫、阿冷、周二珂、小缘、纳豆nado、小苏菲等人气主播，唱响北京国家网球中心。届时，大牌明星罗志祥、胡彦斌、潘玮柏、CTO男团也将悉数登场，带领观众换一种方式打开音乐。目前，斗鱼官方频频发布相关动态，预示斗鱼音乐盛典蓄势待发，精彩在即！
   官方倒计时海报出炉，音乐盛典开幕在即
日前，斗鱼直播平台正式发布倒计时海报。海报以冲击力极强的画面引发广泛关注，更被众多知名大号转发以示对斗鱼音乐盛典的期待。同时，这也强势宣告斗鱼音乐盛典已进入紧张的倒计时阶段，精彩绝伦的盛典舞台即将开场。
你想听的歌都在这，今年最燃斗鱼音乐盛典蓄势待发！
   在令人兴奋的音乐盛典倒计时开启之际，斗鱼为2018斗鱼音乐盛典精心制作极具创意的动画视频，带领大家换一种方式打开生活，甚至是音乐，从而发现更多精彩。另外，斗鱼还强势发布有趣好玩的“听歌猜脸“ H5游戏，以及“学猫叫”、“摇滚爸爸教唱儿歌”等搞怪音乐短片，旨在提前让观众感受 “换一种方式打开音乐”的有趣之处，激发全民狂欢玩转音乐的热情。
   随着斗鱼音乐盛典的临近，罗志祥、胡彦斌、潘玮柏和男团CTO更助力斗鱼，拍摄斗鱼音乐盛典宣传视频，呼吁粉丝一起来玩。同时，他们也在百忙中为即将在斗鱼音乐盛典表演的曲目秘密练习。近日发文庆祝自己出道25周年的罗志祥，不仅将载歌载舞演绎《够了》、《闹翻天》等舞曲，还会演唱经典情歌《恋爱达人》。嘻哈天王潘玮柏和“编曲大魔王”胡彦斌将突破自我，演绎全新说唱和编曲风格，为斗鱼音乐盛典的观众热力开show！',null);
INSERT INTO info VALUES(null,'“Date with you”小南光司见面会2018 in HongKong','还记得那位跑遍北上广三地、今年还跟大家过白色情人节的“吸血鬼王子”吗？
——“Date with you”小南光司见面会2018 in HongKong——安排上了！小南光司与你的圣诞约会！
94年出生的小南一开始是ELO、popteen的杂志模特，年纪轻轻就已经是个全能手！
参演了《别让我走》《我来接您了》《精灵守护者》第三季等电视剧。他还参演了多部舞台剧，其中最为大家熟悉的莫过于《偶像梦幻祭》中饰演的朔间零，还有《棱镜少男 KING OF PRISM》《克雷斯☆剪刀》等舞台剧都能看到他的身影。明年1、2月他也将参演舞台剧《逆转裁判》《文豪与炼金术师》，演艺事业可以说是蒸蒸日上！',null);
INSERT INTO info VALUES(null,'“腾讯企鹅杯cosplay大赛圆满落幕，送上一场视觉盛宴','经过个3月的激烈角逐，腾讯企鹅杯cosplay大赛圆满落下帷幕，感谢各位参赛coser对我们活动的支持，也感谢各位评委不辞劳苦的为大家评分。
在本次大赛中有10名选手在决赛中脱颖而出，恭喜在本次大赛中获奖的小伙伴，下面我们来简单的欣赏他们优秀的作品吧~
冠军作品：《镇魔曲》夜樱
coser ：青青子
夜樱，《镇魔曲》游戏中最风情万种的弓手。
夜樱上阵对敌的武器是她手中的桃花扇、腰间的油纸伞以及穿花彩蝶、水墨灵鹤等优雅美好的事物，这也是她的独特之处，利用这些事物，夜樱的战斗效果华丽优美、赏心悦目。
静下来的夜樱也是同样的温婉可人呢。','http://127.0.0.1:3000/img/i4/1.jpg');



#创建评论
CREATE TABLE show_comment(
  id  INT PRIMARY KEY AUTO_INCREMENT,
  content VARCHAR(140),
  ctime   DATETIME,
  user_name VARCHAR(50),
  cno  INT,
  nid  INT
);

INSERT INTO show_comment VALUES(null,'ha ha1',now(),'邪狂以枫',3,1);
INSERT INTO show_comment VALUES(null,'ha ha2',now(),'天才汪',3,1);
INSERT INTO show_comment VALUES(null,'ha ha3',now(),'甜甜圈',3,1);
INSERT INTO show_comment VALUES(null,'hi1',now(),'小鸡仔',3,2);
INSERT INTO show_comment VALUES(null,'hello1',now(),'小瓶盖',3,3);
INSERT INTO show_comment VALUES(null,'你好1',now(),'媛猿',3,4);

#展会详细信息
CREATE TABLE show_detail(
  id INT PRIMARY KEY AUTO_INCREMENT,
  nid INT,
  img_url VARCHAR(255)  
);
INSERT INTO show_detail VALUES(null,1,'http://127.0.0.1:3000/img/1/1.jpg');
INSERT INTO show_detail VALUES(null,1,'http://127.0.0.1:3000/img/1/2.jpg');
INSERT INTO show_detail VALUES(null,1,'http://127.0.0.1:3000/img/1/3.jpg');
INSERT INTO show_detail VALUES(null,1,'http://127.0.0.1:3000/img/1/4.jpg');
INSERT INTO show_detail VALUES(null,2,'http://127.0.0.1:3000/img/2/1.jpg');
INSERT INTO show_detail VALUES(null,3,'http://127.0.0.1:3000/img/3/1.jpg');
INSERT INTO show_detail VALUES(null,3,'http://127.0.0.1:3000/img/3/2.jpg');
INSERT INTO show_detail VALUES(null,4,'http://127.0.0.1:3000/img/4/1.jpg');
INSERT INTO show_detail VALUES(null,4,'http://127.0.0.1:3000/img/4/2.jpg');


