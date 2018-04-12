SET NAMES UTF8;
DROP DATABASE IF EXISTS softh;
CREATE DATABASE softh CHARSET=UTF8;
USE softh;

/**用户信息**/
CREATE TABLE sh_user(
  uid INT PRIMARY KEY AUTO_INCREMENT,
  uname VARCHAR(32),
  upwd VARCHAR(32),
  email VARCHAR(64),
  phone VARCHAR(16),

  avatar VARCHAR(128),        #头像图片路径
  user_name VARCHAR(32),      #用户名，如王小明
  gender enum('0','1')                  #性别  0-女  1-男
);

/**购物车条目**/
CREATE TABLE sh_shoppingcart_item(
  iid INT PRIMARY KEY AUTO_INCREMENT,
  uid INT,          #用户编号
  lid INT,          #商品编号
  count INT,        #购买数量
  spec VARCHAR(32),  #商品的具体规格
  sm VARCHAR(128),    #小图片
  is_checked enum('0','1') #是否已勾选，确定购买
);

/**商品所属类别表**/
CREATE TABLE sh_family(
  fid INT PRIMARY KEY AUTO_INCREMENT,
  fname VARCHAR(32),
  poster VARCHAR(128)         #海报图
);
/*婴童->婴童床品 1-41*/
/*婴童->婴童服饰 42-49*/
/*女士->女士服装服饰 50-66*/
/*女士->美容用品 67-74*/
/*女士->孕产用品 75-79*/
/*家居->厨房用品 80-81*/
/*家居->床上用品 82-86*/
/*家居->护理用品 87-98*/
/*家居->收纳用品 99-100*/
/*家居->卫浴用品 101-111*/
/*男士->男士服装服饰 112-127*/
/*男士->男士卫生用品 128*/

/**商品列表**/
CREATE TABLE sh_product(
  lid INT PRIMARY KEY AUTO_INCREMENT,
  fid INT NOT NULL DEFAULT 0,                       #所属类别编号
  style VARCHAR(64) NOT NULL DEFAULT '',            #具体分类
  pic VARCHAR(128) NOT NULL DEFAULT '',             #海报图
  title VARCHAR(128) NOT NULL DEFAULT '',           #主标题
  subtitle VARCHAR(128) NOT NULL DEFAULT '',        #副标题
  promise VARCHAR(128) NOT NULL DEFAULT '',          #优惠信息
  price DECIMAL(10,2) NOT NULL DEFAULT 99999,       #价格

  spec VARCHAR(64) NOT NULL DEFAULT '',             #颜色
  size1 VARCHAR(64) NOT NULL DEFAULT '',            #尺寸
  inventory INT NOT NULL DEFAULT 0,                 #库存
  href VARCHAR(128) NOT NULL DEFAULT 'index.html', #地址
  #details VARCHAR(1024),                           #产品详细说明

  shelf_time DATETIME,                               #上架时间
  view_count INT NOT NULL DEFAULT 0,                #浏览量
  sales     INT NOT NULL DEFAULT 0,                 #销量
  is_onsale enum('0','1')  NULL DEFAULT '0' ,       #是否促销
  expire enum('0','1')  NOT NULL DEFAULT '0'       #是否失效
);

/**商品图片**/
CREATE TABLE sh_product_pic(
  pid INT PRIMARY KEY AUTO_INCREMENT,
  lid INT,                      #商品编号
  cid INT,                      #颜色分类
  sm VARCHAR(128),              #小图片路径
  md VARCHAR(128),              #中图片路径
  lg VARCHAR(128)               #大图片路径
);
/**商品详情图**/
CREATE TABLE sh_product_details_pic(
  did INT PRIMARY KEY AUTO_INCREMENT,
  lid INT,                      #商品编号
  pic VARCHAR(1024)             #详情图路径
);


/****首页轮播****/
CREATE TABLE sh_index_carousel(
  cid INT PRIMARY KEY AUTO_INCREMENT,
  img VARCHAR(128),
  title VARCHAR(64),
  href VARCHAR(128)
);
/*******数据导入*******/

/**用户信息**/
INSERT INTO sh_user VALUES (NULL, 'dingding', md5('123456'), 'ding@qq.com', '13511011000', 'img/alt.png', '丁春秋', '0');
INSERT INTO sh_user VALUES (NULL, 'Lobove', md5('123456'), 'Lobove@qq.com', '17623655590', 'img/alt.png', '井柏然', '1');
INSERT INTO sh_user VALUES (NULL, 'xuanxuan', md5('123456'), 'xuan@qq.com', '13569358930', 'img/alt.png', '张晓璇', '0');

/**购物车条目**/
INSERT INTO sh_shoppingcart_item VALUES (NULL, 2, 1, 1, '蓝底白云','img/product/baby/1/sm1.jpg','0');

/**首页轮播**/
INSERT INTO sh_index_carousel VALUES
(NULL, 'img/index/lunbo1.jpg','宝贝保暖计划','baby.html'),
(NULL, 'img/index/lunbo2.jpg','全棉运动+','sports.html'),
(NULL, 'img/index/lunbo3.jpg','霍思燕联名合作款','siyan.html'),
(NULL, 'img/index/lunbo4.jpg','全棉社区','community.html'),
(NULL, 'img/index/lunbo5.jpg','',''),
(NULL, 'img/index/lunbo6.jpg','','');


/**商品所属类别表**/
INSERT INTO sh_family VALUES
(NULL,'婴童','img/product/kids.jpg'),
(NULL,'女士','img/product/women.jpg'),
(NULL,'家居','img/product/home.jpg'),
(NULL,'男士','img/product/men.jpg');

/**商品信息**/
/*婴童->婴童床品*/
INSERT INTO sh_product VALUES(NULL,1,'婴童床品','img/product/baby/1.jpg','春夏婴幼儿纱布睡袋58x38（蓝底白云）袋装，1件/袋','100%棉纱布睡袋，柔软透气，预防宝宝因踢被子而着凉，带来舒适睡眠体验。','',168,'蓝底白云','',1000,'product-details.html?lid=1',now(),0,1,'1','0');
INSERT INTO sh_product VALUES(NULL,1,'婴童床品','img/product/baby/2.jpg','蓝白格小熊婴幼儿纱布定型枕 20x26cm','优质精梳棉纱布 肤触柔软 更吸湿透气','',98,'蓝白格，粉白格','',1000,'product-details.html?lid=2',now(),0,1,'1','0');
INSERT INTO sh_product VALUES(NULL,1,'婴童床品','img/product/baby/3.jpg','春夏小树+绿底白点儿童纱布空调被子 135x120cm','六层纱布设计，触感柔软，舒爽透气，环保活性印染，安全健康','',398,'春夏小树，蓝棉朵星云，黄贝壳马戏团','',1000,'product-details.html?lid=3',now(),0,1,'1','0');
INSERT INTO sh_product VALUES(NULL,1,'婴童床品','img/product/baby/4.jpg','春婴儿造型睡袋(厚）71x41cm， 1件装','高支纱纱布面料，轻柔细腻；海星造型与宝宝睡姿吻合；开口式袖口与脚口，方便活动。','',368,'天蓝色，蔷薇粉','',1000,'product-details.html?lid=4',now(),0,1,'1','0');
INSERT INTO sh_product VALUES(NULL,1,'婴童床品','img/product/baby/5.jpg','春夏婴幼儿纱布薄背心睡袋48x80（狮子）袋装，1件/袋','100%棉纱布睡袋，柔软透气，预防宝宝因踢被子而着凉，带来舒适睡眠体验。','',198,'狮子','',1000,'product-details.html?lid=5',now(),0,1,'1','0');
INSERT INTO sh_product VALUES(NULL,1,'婴童床品','img/product/baby/6.jpg','婴儿纱布夹纯棉多功能抱被85x45cm， 1条装','优质纱布面料，中间100%棉填充，亲肤保暖；侧身至脚口双头长拉链，可灵活调整开合位置。','',338,'星际呦呦，粉色小熊','',1000,'product-details.html?lid=6',now(),0,1,'1','0');
INSERT INTO sh_product VALUES(NULL,1,'婴童床品','img/product/baby/7.jpg','春夏高支纱婴幼儿纱布抱被80x80（天蓝）袋装，1件/袋','100%棉高支纱纱布抱被，轻柔细腻，优越的透气性，舒适不闷热，还可当小被子使用。','',288,'天蓝','',1000,'product-details.html?lid=7',now(),0,1,'1','0');
INSERT INTO sh_product VALUES(NULL,1,'婴童床品','img/product/baby/8.jpg','春夏婴幼儿纱布薄背心睡袋48x80（蓝棉朵）袋装，1件/袋','吸湿性好，方便穿脱，还可打开当小夏凉被用','',198,'蓝棉朵，粉棉朵','',1000,'product-details.html?lid=8',now(),0,1,'1','0');
INSERT INTO sh_product VALUES(NULL,1,'婴童床品','img/product/baby/9.jpg','婴儿针织夹涤棉多功能抱被85x45cm， 1条装','全棉针织面料，中间加厚保暖；侧身至脚口双头长拉链，方便开合，展开后可作小被子使用。','【限时活动】幸福暖冬 温暖好棉限时50%OFF起【满赠】幸福暖冬 活动页商品单笔买满328送收纳袋一个，单笔买满598送手口湿巾一袋（单笔订单仅赠一份）',338,'星际闪亮蓝，森林大河马','',1000,'product-details.html?lid=9',now(),0,1,'1','0');
INSERT INTO sh_product VALUES(NULL,1,'婴童床品','img/product/baby/10.jpg','婴儿纱布夹棉侧开睡袋70x55cm， 1条装','双层纱布面料，中间100%棉填充，亲肤保暖；袖子可拆卸，伸展更自由。','【限时活动】幸福暖冬 温暖好棉限时50%OFF起<br>【满赠】幸福暖冬 活动页商品单笔买满328送收纳袋一个，单笔买满598送手口湿巾一袋（单笔订单仅赠一份）',398,'森林乐章','',1000,'product-details.html?lid=10',now(),0,1,'1','0');
INSERT INTO sh_product VALUES(NULL,1,'婴童床品','img/product/baby/11.jpg','春夏婴幼儿纱布薄抱被80x80（帆船泳圈）袋装，1件/袋','双层纱布，吸湿透气，柔软细腻','',198,'帆船泳圈，蓝棉朵','',1000,'product-details.html?lid=11',now(),0,1,'1','0');
INSERT INTO sh_product VALUES(NULL,1,'婴童床品','img/product/baby/12.jpg','春夏儿童纱布另配枕套方枕30x50（帆船小鱼+蓝底星星）袋装，1套/袋','100%棉纱布面料，舒适透气；天然木棉枕芯，给头颈良好支撑，配以替换枕套，方便换洗。','',238,'帆船小鱼+蓝底星星，派对兔子+彩虹，蓝底白云+狮子','',1000,'product-details.html?lid=12',now(),0,1,'1','0');
INSERT INTO sh_product VALUES(NULL,1,'婴童床品','img/product/baby/13.jpg','粉色雪花婴儿多用枕33x23cm， 1件装','100%棉纱布面料，亲肤柔软，吸湿透气，一枕多用，可作为宝宝定型枕、睡枕、哺乳枕等。','',138,'浅蓝三角,粉色雪花','33x23cm',1000,'product-details.html?lid=13',now(),0,1,'1','0');
INSERT INTO sh_product VALUES(NULL,1,'婴童服饰','img/product/baby/14.jpg','婴儿纱布夹纯棉连体服(蓝)， 1件/装','双层纱布面料，中间100%棉填充，舒适保暖；领口罗纹设计，富有弹性，穿着更贴身。','【限时活动】圣诞快乐 舒适的礼物50%OFF起 【满赠】圣诞礼物买满188送购物袋一个，满298送湿巾1包，满588送棉柔巾8包（单笔订单仅赠一份）',202.8,'蓝水滴','59/44，66/44，73/44，80/44',1000,'product-details.html?lid=14',now(),0,200,'1','0');
INSERT INTO sh_product VALUES(NULL,1,'婴童服饰','img/product/baby/15.jpg','婴儿纱布夹纯棉连体服(粉)， 1件/装','双层纱布面料，中间100%棉填充，舒适保暖；领口罗纹设计，富有弹性，穿着更贴身。','【限时活动】圣诞快乐 舒适的礼物50%OFF起 【满赠】圣诞礼物买满188送购物袋一个，满298送湿巾1包，满588送棉柔巾8包（单笔订单仅赠一份）',169,'粉底白树','59/44，66/44，73/44，80/44',1000,'product-details.html?lid=15',now(),0,199,'1','0');
INSERT INTO sh_product VALUES(NULL,1,'婴童服饰','img/product/baby/16.jpg','男童纱布剪花衬衫120/56， 1件/袋','优质精梳棉，罗纹编织肌理，弹性好且富有质感；开衫款式，方便穿脱。','【限时活动】圣诞快乐 舒适的礼物50%OFF起 【满赠】圣诞礼物买满188送购物袋一个，满298送湿巾1包，满588送棉柔巾8包（单笔订单仅赠一份）',178.8,'蓝底火箭剪花','110/56，120/56，130/60',1000,'product-details.html?lid=16',now(),0,198,'1','0');
INSERT INTO sh_product VALUES(NULL,1,'婴童服饰','img/product/baby1/5.jpg','秋冬浅粉天然彩棉针织婴幼儿手套脚套，1套装','秋冬浅粉天然彩棉针织婴幼儿手套脚套，1套装','',78,'浅粉','',1000,'product-details.html?lid=46',now(),0,197,'1','0');
INSERT INTO sh_product VALUES(NULL,1,'婴童服饰','img/product/baby/18.jpg','幼儿男款卡通棉线开衫100/52， 1件/装','优质精梳棉，柔软舒适；简单针法加以提花图案点缀，经典百搭。','【限时活动】圣诞快乐 舒适的礼物50%OFF起 【满赠】圣诞礼物买满188送购物袋一个，满298送湿巾1包，满588送棉柔巾8包（单笔订单仅赠一份）',160.8,'河水蓝','80/48，90/52，100/52',1000,'product-details.html?lid=18',now(),0,196,'1','0');
INSERT INTO sh_product VALUES(NULL,1,'婴童服饰','img/product/baby/19.jpg','女童四层纱布长裤120/53， 1件装','棉四层纱布制成，轻盈柔软且保暖效果好，尤为适合外出穿着。四层纱布制成的长裤温暖、柔软。 【每个ID限购10件】','【限时活动】圣诞快乐 舒适的礼物50%OFF起 【满赠】圣诞礼物买满188送购物袋一个，满298送湿巾1包，满588送棉柔巾8包（单笔订单仅赠一份）',99,'浅花灰','110/53，120/53，130/56',1000,'product-details.html?lid=19',now(),0,195,'1','0');
INSERT INTO sh_product VALUES(NULL,1,'婴童床品','img/product/baby/20.jpg','春夏儿童纱布空调被135x120（帆船小鱼+蓝底星星）袋装，1件/袋','100%棉六层纱布空调被，柔软舒适，透气不闷热，让宝宝享受高质量睡眠。','',398,'帆船小鱼+蓝底星星，派对兔子+彩虹，蓝底白云+狮子，红黄蓝帆船+蓝白波浪，派对呦呦+蛋糕','',1000,'product-details.html?lid=20',now(),0,1,'1','0');
INSERT INTO sh_product VALUES(NULL,1,'婴童床品','img/product/baby/21.jpg','婴儿针织夹涤棉抱被90x90cm， 1条装','针织面料，中间加厚保暖，触肤面无印染，给宝宝舒适体验。','',160,'亮蓝间条','90x90cm',1000,'product-details.html?lid=21',now(),0,1,'1','0');
INSERT INTO sh_product VALUES(NULL,1,'婴童床品','img/product/baby/22.jpg','婴儿定型枕熊掌22x27cm， 1件装','双层纱布面料，亲肤柔软，吸湿透气；可水洗，洗涤后不易变形。','',118,'天蓝色，珍珠粉','20x27cm',1000,'product-details.html?lid=22',now(),0,1,'1','0');
INSERT INTO sh_product VALUES(NULL,1,'婴童床品','img/product/baby/23.jpg','春夏熊兔松鼠儿童纱布空调被135x120cm,1件/袋','纯棉6层水洗被 加倍柔软 保温透气','',398,'熊兔松鼠','',1000,'product-details.html?lid=23',now(),0,1,'1','0');
INSERT INTO sh_product VALUES(NULL,1,'婴童床品','img/product/baby/24.jpg','幼儿纱布床品7件套件（带被芯）幼儿床适用， 1套装','透气-优质纱布面料， 舒适透气， 让宝宝享受高质量睡眠。','',1568,'粉绿格+粉竖条','婴儿床适用',1000,'product-details.html?lid=24',now(),0,1,'1','0');
INSERT INTO sh_product VALUES(NULL,1,'婴童床品','img/product/baby/25.jpg','春夏婴幼儿纱布熊耳定型枕20x26（海星贝壳）袋装，1个/袋','100%棉纱布，亲肤柔软，吸湿透气，在炎炎夏日亦可舒适睡眠，可做枕头或宝宝玩具使用。','',98,'海星贝壳，樱桃','',1000,'product-details.html?lid=25',now(),0,1,'1','0');
INSERT INTO sh_product VALUES(NULL,1,'婴童床品','img/product/baby/26.jpg','春夏婴幼儿纱布抱被80x80（蓝象）袋装，1件/袋','10采用优质棉 亲肤柔软 环保印染 使用更安心','',238,'蓝象，蓝底白云','',1000,'product-details.html?lid=26',now(),0,1,'1','0');
INSERT INTO sh_product VALUES(NULL,1,'婴童床品','img/product/baby/27.jpg','春夏纱布木棉枕芯30x50cm,40s双层纱布+无纺布+130g木棉，1件装','春夏纱布木棉枕芯','',98,'米白色','',1000,'product-details.html?lid=27',now(),0,1,'0','0');
INSERT INTO sh_product VALUES(NULL,1,'婴童床品','img/product/baby/28.jpg','春夏儿童纱布1.2米床品四件套（男孩款）+赠品，5件装','儿童床品套件','',998,'蓝白手绘波浪','适合1.2米床',1000,'product-details.html?lid=28',now(),0,1,'0','0');
INSERT INTO sh_product VALUES(NULL,1,'婴童床品','img/product/baby/29.jpg','春夏儿童纱布1.2米床品四件套（女孩款）+赠品，5件装','儿童床品套件','',998,'派对兔子+派对彩虹','适合1.2米床',1000,'product-details.html?lid=29',now(),0,1,'0','0');
INSERT INTO sh_product VALUES(NULL,1,'婴童床品','img/product/baby/30.jpg','儿童纱布被套150x200cm， 1件装','纱布面料，轻盈柔软，舒适透气，带来轻松愉悦的睡眠体验。','【限时活动】幸福暖冬 温暖好棉限时50%OFF起【满赠】幸福暖冬 活动页商品单笔买满328送收纳袋一个，单笔买满598送手口湿巾一袋（单笔订单仅赠一份）',376.6,'呆萌大熊','150x200cm',1000,'product-details.html?lid=30',now(),0,1,'0','0');
INSERT INTO sh_product VALUES(NULL,1,'婴童床品','img/product/baby/31.jpg','幼儿纱布方枕30x50cm， 1套','优质纱布面料，100%天然木棉枕芯，触感更柔软，舒适透气；2个枕套更换使用，洁净方便。','',238,'蓝黄格，粉绿格，蓝底火箭，森林大萌友','30x50cm',1000,'product-details.html?lid=31',now(),0,1,'0','0');
INSERT INTO sh_product VALUES(NULL,1,'婴童床品','img/product/baby/32.jpg','婴儿纱布被套100x120cm， 1件装','纱布面料，轻盈柔软，舒适透气；口鼻附近不印染，细节呵护更显贴心。','',268,'森林乐章','100x120cm',1000,'product-details.html?lid=32',now(),0,1,'0','0');
INSERT INTO sh_product VALUES(NULL,1,'婴童床品','img/product/baby/33.jpg','儿童纱布床品7件套（带被芯）儿童床适用， 7件装','透气 优质纱布面料， 舒适透气， 让宝宝享受高质量睡眠。','',1968,'森林大乐园+糖果粉','儿童床适用',1000,'product-details.html?lid=33',now(),0,1,'0','0');
INSERT INTO sh_product VALUES(NULL,1,'婴童床品','img/product/baby/34.jpg','幼儿纱布床品7件套（带被芯）幼儿床适用， 7件装','透气 优质纱布面料， 舒适透气， 让宝宝享受高质量睡眠。','',1097.6,'蓝黄格+蓝竖条','幼儿床适用',1000,'product-details.html?lid=34',now(),0,1,'1','0');
INSERT INTO sh_product VALUES(NULL,1,'婴童床品','img/product/baby/35.jpg','婴儿针织夹涤棉抱被90x90cm， 1条装','针织面料，中间加厚保暖，触肤面无印染，给宝宝舒适体验。','',268,'蓝底流星+森林熊猫','90x90cm',1000,'product-details.html?lid=35',now(),0,1,'0','0');
INSERT INTO sh_product VALUES(NULL,1,'婴童床品','img/product/baby/36.jpg','婴儿针织夹涤棉抱被90x90cm， 1条装','天然彩棉针织面料，不印染更安全；中间加厚保暖，方便洗涤；魔术贴安全且经久耐用','',160.8,'彩棉棕','90x90cm',1000,'product-details.html?lid=36',now(),0,1,'1','0');
INSERT INTO sh_product VALUES(NULL,1,'婴童床品','img/product/baby/37.jpg','婴儿针织侧开睡袋·厚款70x55cm， 1条装','全棉针织面料，侧开拉链可灵活调整开合位置，方便穿脱；袖子可拆卸，伸展更自由。','【限时活动】幸福暖冬 温暖好棉限时50%OFF起【满赠】幸福暖冬 活动页商品单笔买满328送收纳袋一个，单笔买满598送手口湿巾一袋（单笔订单仅赠一份）',238.8,'星际闪亮蓝，森林大河马','70x55cm',1000,'product-details.html?lid=37',now(),0,1,'1','0');
INSERT INTO sh_product VALUES(NULL,1,'婴童床品','img/product/baby/38.jpg','婴儿针织侧开睡袋·厚款70x55cm， 1条装','全棉针织面料，侧开拉链可灵活调整开合位置，方便穿脱；袖子可拆卸，伸展更自由。','【限时活动】幸福暖冬 温暖好棉限时50%OFF起【满赠】幸福暖冬 活动页商品单笔买满328送收纳袋一个，单笔买满598送手口湿巾一袋（单笔订单仅赠一份）',238.8,'星际闪亮蓝，森林大河马','70x55cm',1000,'product-details.html?lid=38',now(),0,1,'1','0');
INSERT INTO sh_product VALUES(NULL,1,'婴童床品','img/product/baby/39.jpg','婴儿包裹式睡袋(厚）80x48cm， 1件装','高支纱纱布面料，轻柔细腻；包裹式款型给宝宝更多安全感；无袖设计，保证适宜的睡眠温度','【限时活动】幸福暖冬 温暖好棉限时50%OFF起【满赠】幸福暖冬 活动页商品单笔买满328送收纳袋一个，单笔买满598送手口湿巾一袋（单笔订单仅赠一份）',238.8,'天蓝色，蔷薇粉','80x48cm',1000,'product-details.html?lid=39',now(),0,1,'1','0');
INSERT INTO sh_product VALUES(NULL,1,'婴童床品','img/product/baby/40.jpg','17春夏婴幼儿针织夹棉抱被90x90cm(小树狮子)袋装,1件/袋','100%优质精梳棉面料，柔软舒适；中间夹薄棉，适合春季使用；小兔造型，活泼可爱。','',268,'小树狮子，胡萝卜兔子','',1000,'product-details.html?lid=40',now(),0,1,'1','0');
INSERT INTO sh_product VALUES(NULL,1,'婴童床品','img/product/baby/41.jpg','婴儿针织夹涤棉抱被90x90cm， 1条装','天然彩棉针织面料，不印染更安全；中间加厚保暖，方便洗涤；魔术贴安全且经久耐用。','【限时活动】幸福暖冬 温暖好棉限时50%OFF起【满赠】幸福暖冬 活动页商品单笔买满328送收纳袋一个，单笔买满598送手口湿巾一袋（单笔订单仅赠一份）',160.8,'彩棉棕','90x90cm',1000,'product-details.html?lid=41',now(),0,1,'1','0');


/*婴童->婴童服饰 42-49*/
INSERT INTO sh_product VALUES(NULL,1,'婴童服饰','img/product/baby1/1.jpg','素色珠地纹男童中筒休闲袜（紫蓝+深蓝）16~18cm，14g/双，2双装','100%优质精梳棉，吸汗透气，不易起毛球','',38,'紫蓝+深蓝，深黄+紫蓝','16~18cm，18~20cm，20~22cm，22~24cm',1000,'product-details.html?lid=42',now(),0,1,'1','0');
INSERT INTO sh_product VALUES(NULL,1,'婴童服饰','img/product/baby1/2.jpg','女童长筒休闲袜16~18cm， 1双装','优质精梳棉添加弹性纤维，伸展自由不紧绷；可自由卷边调节袜筒长度，满足不同搭配需求','',28,'浅粉色','16~18cm，18~20cm，20~22cm，22~24cm',1000,'product-details.html?lid=43',now(),0,1,'1','0');
INSERT INTO sh_product VALUES(NULL,1,'婴童服饰','img/product/baby1/3.jpg','婴儿外毛圈袜7.5cm， 2双/盒','优质精梳棉添加弹性纤维，伸展自由不紧绷；可自由卷边调节袜筒长度，满足不同搭配需求','',58,'驼色+白色','7.5cm',1000,'product-details.html?lid=44',now(),0,1,'1','0');
INSERT INTO sh_product VALUES(NULL,1,'婴童服饰','img/product/baby1/4.jpg','春夏婴幼儿平纹袜7.5（小鱼+盾牌）袋装，2双/袋','春夏婴幼儿平纹袜','',38,'小鱼+盾牌','7.5cm，9.5cm，11cm，13cm，15cm',1000,'product-details.html?lid=45',now(),0,1,'1','0');
INSERT INTO sh_product VALUES(NULL,1,'婴童服饰','img/product/baby1/5.jpg','秋冬浅粉天然彩棉针织婴幼儿手套脚套，1套装','秋冬浅粉天然彩棉针织婴幼儿手套脚套，1套装','',78,'浅粉','',1000,'product-details.html?lid=46',now(),0,1,'1','0');
INSERT INTO sh_product VALUES(NULL,1,'婴童服饰','img/product/baby1/6.jpg','素色高低罗口女童中筒休闲袜（黄色+红色）18g/16~18cm，2双装','优质精梳棉，吸汗透气；高低罗口设计，活泼可爱，时尚百搭。','',38,'浅粉','16~18cm，18~20cm，20~22cm，22~24cm',1000,'product-details.html?lid=47',now(),0,1,'1','0');
INSERT INTO sh_product VALUES(NULL,1,'婴童服饰','img/product/baby1/7.jpg','春夏新生儿针织手套脚套(蓝白条纹+蓝色波点)袋装,1套/袋','春夏新生儿针织手套脚套','',78,'蓝白条纹+蓝色波点','',1000,'product-details.html?lid=48',now(),0,1,'1','0');
INSERT INTO sh_product VALUES(NULL,1,'婴童服饰','img/product/baby1/8.jpg','春夏婴幼儿纱布遮阳帽48-50（蓝绿格）袋装，1个/袋','100%棉纱布帽，柔软舒适，吸汗透气，遮阳或保暖皆适宜','',108,'蓝绿格，藏青牛津纺','48-50，50-52',1000,'product-details.html?lid=49',now(),0,1,'1','0');
/*婴童->婴童护理*/
/*婴童->婴童卫浴*/

/*女士->女士服装服饰 50-66*/
INSERT INTO sh_product VALUES(NULL,2,'女士服装服饰','img/product/women/1.jpg','女士小立领衬衫160/84A， 1件/装','高支纱双层纱布面料，质地柔软细腻，舒适透气；文艺气质的小立领设计，简约利落。','',398,'浅蓝色','M，L，XL，XXL',1000,'product-details.html?lid=50',now(),0,200,'1','0');
INSERT INTO sh_product VALUES(NULL,2,'女士服装服饰','img/product/women/2.jpg','女士V领套头无缝棉线衣160/84A， 1件/装','无缝一体成型的套头衫，采用三维工艺制作，袖部与大身线条流畅，穿着舒适，时尚百搭。','',338,'纯白色，豆沙色，白花灰','M，L，XL，XXL',1000,'product-details.html?lid=51',now(),0,1,'1','0');
INSERT INTO sh_product VALUES(NULL,2,'女士服装服饰','img/product/women/3.jpg','春夏女士(孕产兼用)纱布无袖连衣裙155（灰色竖条）袋装，1件/袋','领部折裥搭配撞色纽扣，富有时尚感','',368,'蓝牛津纺，牛仔竖条，深蓝牛津纺，灰色竖条','155/64A，160/68A，165/72A，170/76A，175/80A',1000,'product-details.html?lid=52',now(),0,1,'1','0');
INSERT INTO sh_product VALUES(NULL,2,'女士服装服饰','img/product/women/4.jpg','女士双面套头上衣（孕妇可穿）160/84A， 1件/装','精选优质长绒棉，柔软出众，舒适保暖；偏H版型与正反面两穿设计，适合多种体型。','',428,'浅花灰','M，L，XL，XXL',1000,'product-details.html?lid=53',now(),0,1,'1','0');
INSERT INTO sh_product VALUES(NULL,2,'女士服装服饰','img/product/women/5.jpg','春夏女士（男士兼用）单层色织纱布围巾/均码（红格）袋装，1件/袋','亲肤舒适，轻盈飘逸，蓝格风格，男女士均可使用','',268,'蓝格，红格','',1000,'product-details.html?lid=54',now(),0,1,'1','0');
INSERT INTO sh_product VALUES(NULL,2,'女士服装服饰','img/product/women/6.jpg','女士针织休闲西装160/84A， 1件/装','优质打基布面料，厚度适中，挺括有型；收腰剪裁搭配简洁一粒扣，尽显干练。【每个ID限购10件】','',334,'浅灰，深蓝','M，L，XL，XXL',1000,'product-details.html?lid=55',now(),0,190,'1','0');
INSERT INTO sh_product VALUES(NULL,2,'女士服装服饰','img/product/women/7.jpg','女士人字纹长袖衬衫160/84A， 1件/装','具有人字纹肌理效果的双层纱布面料，美观舒适；基本休闲款，可外穿可内搭。【每个ID限购10件】','【限时活动】圣诞快乐 舒适的礼物50%OFF起【满赠】圣诞礼物买满188送购物袋一个，满298送湿巾1包，满588送棉柔巾8包（单笔订单仅赠一份）',184,'白色，卡其色','M，L，XL，XXL',1000,'product-details.html?lid=56',now(),0,1,'1','0');
INSERT INTO sh_product VALUES(NULL,2,'女士服装服饰','img/product/women/8.jpg','孕产针织V领抹胸式七分袖插垫上衣160/85 袋装，1件/袋','插垫可免穿文胸，亲肤舒适，哺乳窗设计，适合孕期、哺乳期穿着','',298,'粉色，蓝色','160/85，165/90，170/95',1000,'product-details.html?lid=57',now(),0,1,'1','0');
INSERT INTO sh_product VALUES(NULL,2,'女士服装服饰','img/product/women/9.jpg','女士针织厚型圆领长袖保暖衫160/85， 1件装','精梳棉加厚面料，保暖透气；袖口加宽收紧设计，防风且穿着稳定。','',268,'彩棉棕，酒红色','M，L，XL，XXL',1000,'product-details.html?lid=58',now(),0,1,'1','0');
INSERT INTO sh_product VALUES(NULL,2,'女士服装服饰','img/product/women/10.jpg','女士针织两面拼接外套160/84A， 1件/装','针织面料，柔软舒适；正反面拼接设计，休闲大方。【每个ID限购10件】','【限时活动】圣诞快乐 舒适的礼物50%OFF起【满赠】圣诞礼物买满188送购物袋一个，满298送湿巾1包，满588送棉柔巾8包（单笔订单仅赠一份）',249,'白色，蓝灰色','M，L，XL，XXL',1000,'product-details.html?lid=59',now(),0,199,'1','0');
INSERT INTO sh_product VALUES(NULL,2,'女士服装服饰','img/product/women/11.jpg','女士针织厚型圆领长袖秋冬打底衫160/85， 1件装','针精梳棉加厚面料，保暖透气；袖口加宽收紧设计，防风且穿着稳定。','',268,'白色，深花灰','M，L，XL，XXL',1000,'product-details.html?lid=60',now(),0,198,'1','0');
INSERT INTO sh_product VALUES(NULL,2,'女士服装服饰','img/product/women/12.jpg','女士针织薄型中腰秋冬打底裤160/90， 1件装','精选高支长绒棉，柔软出众；腹部双层设计，温暖呵护；连裆版型，贴身打底更舒适。','',218,'白色，浅灰紫，黑色','M，L，XL，XXL',1000,'product-details.html?lid=61',now(),0,1,'1','0');
INSERT INTO sh_product VALUES(NULL,2,'女士服装服饰','img/product/women/13.jpg','女士四层纱布色织长袖家居服套装上衣：160/84A，裤子：160/68A， 1套/装','精四层纱布面料，蓬松柔软且保暖效果好；经典款型，可满足各类穿搭需求。','',418,'蓝绿格子','M，L，XL，XXL',1000,'product-details.html?lid=62',now(),0,197,'1','0');
INSERT INTO sh_product VALUES(NULL,2,'女士服装服饰','img/product/women/14.jpg','女士紧腿铅笔裤160/68A， 1件/装','优质针织面料，弹性丰富，舒适不束缚；前片压线设计，穿着修身显瘦。 【每个ID限购10件】','',119,'浅灰，深蓝','M，L，XL，XXL',1000,'product-details.html?lid=63',now(),0,1,'1','0');
INSERT INTO sh_product VALUES(NULL,2,'女士服装服饰','img/product/women/15.jpg','春夏纯棉女士素色水洗纱布家居套装（粉红色）160/84A,1套装','100%棉水洗纱布，蓬松柔软，吸水性好且透气不闷热；分体设计，居家穿着轻松方便','',638,'粉红色','160/84A，170/92A',1000,'product-details.html?lid=64',now(),0,196,'1','0');
INSERT INTO sh_product VALUES(NULL,2,'女士服装服饰','img/product/women/16.jpg','女士纱布圆领绣花长袖家居服套装','四层纱布面料，蓬松柔软且保暖效果好；棉线绣花点缀，更显时尚大方。','',460,'粉色，蓝色','M，L，XL，XXL',1000,'product-details.html?lid=65',now(),0,1,'195','0');
INSERT INTO sh_product VALUES(NULL,2,'女士服装服饰','img/product/women/17.jpg','蓝红竖条女士双层色织纱布小立领长袖家居服套装','双层精梳纱布，柔软舒适；简约小立领与色织竖条，在视觉上拉长身体比例，穿着更显线条。','',568,'蓝红竖条','M，L，XL，XXL',1000,'product-details.html?lid=66',now(),0,193,'1','0');

/*女士->美容用品 67-73*/
INSERT INTO sh_product VALUES(NULL,2,'美容用品','img/product/women1/1.jpg','袋装卸妆平纹无纺布湿巾,平纹无纺布 10片/袋 6袋','女士袋装卸妆湿巾','【满减】VIP2级以上会员福利 单笔订单买满300元减100元，买满600元减200元',88.8,'无','',1000,'product-details.html?lid=67',now(),0,1,'1','0');
INSERT INTO sh_product VALUES(NULL,2,'美容用品','img/product/women1/2.jpg','DIY面膜 20片/袋','100%棉，天然舒适不刺激，吸收性好，有效引导精华液注入肌肤','',36,'无','',1000,'product-details.html?lid=68',now(),0,1,'1','0');
INSERT INTO sh_product VALUES(NULL,2,'美容用品','img/product/women1/3.jpg','袋装脱脂不漂白化妆棉，水刺棉110g/5.5x6.5cm，170片/袋','脱脂不漂白化妆棉','',29.8,'无','',1000,'product-details.html?lid=69',now(),0,1,'1','0');
INSERT INTO sh_product VALUES(NULL,2,'美容用品','img/product/women1/4.jpg','织语压缩面膜颗粒 15粒/袋','压缩面膜颗粒','',22.5,'无','',1000,'product-details.html?lid=70',now(),0,1,'1','0');
INSERT INTO sh_product VALUES(NULL,2,'美容用品','img/product/women1/5.jpg','白睡莲花保湿睡眠面膜 8片/盒*2盒','让肌肤喝饱水 天然保湿舒缓肌肤 尽显澄澈美肌肤','',136,'水嫩保湿','',1000,'product-details.html?lid=71',now(),0,1,'1','0');
INSERT INTO sh_product VALUES(NULL,2,'美容用品','img/product/women1/6.jpg','女士洁面36目网眼棉柔巾50g 80片/盒','专为女士设计，立体网纹款，干湿两用，加厚加柔，彻底清洁，洁净不残留','',36.8,'无','',1000,'product-details.html?lid=72',now(),0,1,'1','0');
INSERT INTO sh_product VALUES(NULL,2,'美容用品','img/product/women1/7.jpg','三生三世IP款化妆棉，平纹无纺布50g，60x70mm， 360片/盒','亲肤舒适','',41.8,'无','',1000,'product-details.html?lid=73',now(),0,1,'1','0');
INSERT INTO sh_product VALUES(NULL,2,'美容用品','img/product/women1/8.jpg','女性专用化妆棉签 圆尖两头 100支/筒','专业美妆棉签 双头多用','',16.8,'无','',1000,'product-details.html?lid=74',now(),0,1,'1','0');

/*女士->孕产用品 75-79*/
INSERT INTO sh_product VALUES(NULL,2,'孕产用品','img/product/women2/1.jpg','春夏孕产梭织低腰交叉式短裤155（灰色）袋装，1件/袋','孕妇休闲短裤','',268,'灰色','155，160，165，170，175',1000,'product-details.html?lid=75',now(),0,1,'1','0');
INSERT INTO sh_product VALUES(NULL,2,'孕产用品','img/product/women2/2.jpg','产后纱布收腹卷 1200x15cm 1卷/袋','质地柔软 吸湿透气 舒爽不闷捂 收紧腹部','',118,'白色','',1000,'product-details.html?lid=76',now(),0,1,'1','0');
INSERT INTO sh_product VALUES(NULL,2,'孕产用品','img/product/women2/3.jpg','孕妇针织翻领长袖家居服上衣（厚款） 1件/装','双面针织面料，质地柔软且厚度适中；色织条纹搭配前中碎褶设计，可满足多种体型需求。','',428,'灰白条纹','',1000,'product-details.html?lid=77',now(),0,1,'1','0');
INSERT INTO sh_product VALUES(NULL,2,'孕产用品','img/product/women2/4.jpg','产妇纱布圆领长袖家居服上衣：165/88A，1件/装','双层纱布面料，柔软舒适；哺乳窗设计，方便哺乳；腰部系带松紧可调，产前产后均可穿着。【每个ID限购10件】','',214,'灰粉色，蓝色格子','L，XL',1000,'product-details.html?lid=78',now(),0,1,'1','0');
INSERT INTO sh_product VALUES(NULL,2,'孕产用品','img/product/women2/5.jpg','织语表层蝶型灭菌防溢乳垫 60片/袋','EO灭菌处理，安全放心；柔软舒适，避免摩擦不适；干爽速吸又透气，哺乳期必备','',79.8,'无','',1000,'product-details.html?lid=79',now(),0,200,'1','0');

/*家居->厨房用品 80-81*/
INSERT INTO sh_product VALUES(NULL,3,'厨房用品','img/product/home/1.jpg','纯棉抗菌纱布洗碗布40/30x20，30x30-8P蓝提带外露6cm，5片袋','100%棉纱布','',23.8,'无','',1000,'product-details.html?lid=80',now(),0,1,'1','0');
INSERT INTO sh_product VALUES(NULL,3,'厨房用品','img/product/home/2.jpg','厨房棉柔巾卷,平纹无纺布60g，300x200mm, 90片/卷,2卷/袋','高效去污，吸水性强','【满减】VIP2级以上会员福利 单笔订单买满300元减100元，买满600元减200元',88,'无','',1000,'product-details.html?lid=81',now(),0,200,'1','0');

/*家居->床上用品 82-86*/
INSERT INTO sh_product VALUES(NULL,3,'床上用品','img/product/home1/1.jpg','印花纯棉纱布空调被1700g/180x200cm,1件装','双层纱布面料，舒适透气；水刺棉花层采用绗缝工艺，不易板结，水洗后使用更蓬松柔软。','',718,'浅妃红刺绣花','',500,'product-details.html?lid=82',now(),0,1,'1','0');
INSERT INTO sh_product VALUES(NULL,3,'床上用品','img/product/home1/2.jpg','色织格子纯棉纱布空调被（蓝绿色）1200g/145x200cm,1件装','双层纱布面料，舒适透气；水刺棉花层采用绗缝工艺，不易板结，水洗后使用更蓬松柔软。','',638,'蓝绿色','',1000,'product-details.html?lid=83',now(),0,1,'1','0');
INSERT INTO sh_product VALUES(NULL,3,'床上用品','img/product/home1/3.jpg','织语素色无捻纱布被（米白）140x200cm,1件/袋','采用无捻棉纱织成的纱布被，亲肤柔软，透气不闷热，舒适的使用感，带来高质量睡眠体验。','',768,'米白','',1000,'product-details.html?lid=84',now(),0,1,'1','0');
INSERT INTO sh_product VALUES(NULL,3,'床上用品','img/product/home1/4.jpg','绣花抱枕45x45cm，1件装','优质梭织面料，舒适有型；偏宽松版型与九分长度设计，可修饰腿型，休闲百搭。','',198,'白色','',1000,'product-details.html?lid=85',now(),0,1,'1','0');
INSERT INTO sh_product VALUES(NULL,3,'床上用品','img/product/home1/5.jpg','纱布棉被芯，净重3kg/200x230cm,1.5m床,1件装','纱布棉被芯','',968,'素色-原棉','200x230cm',1000,'product-details.html?lid=86',now(),0,1,'1','0');

/*家居->护理用品 87-98*/
INSERT INTO sh_product VALUES(NULL,3,'护理用品','img/product/home2/1.jpg','Hello Kitty版粉色袋装纯棉柔巾卷 35片/卷*10卷','100%棉，亲肤舒适；粉色Hello Kitty版袋装，便携易带','',98,'无','',1000,'product-details.html?lid=87',now(),0,1,'1','0');
INSERT INTO sh_product VALUES(NULL,3,'护理用品','img/product/home2/2.jpg','KT版粉色手帕装纯棉柔巾，平纹无纺布40g，210mm*210mm, 10片/包，8包/袋','萌趣粉色手帕包装，外出携带高颜值，易清洁更舒适','',29.8,'无','',1000,'product-details.html?lid=88',now(),0,1,'1','0');
INSERT INTO sh_product VALUES(NULL,3,'护理用品','img/product/home2/3.jpg','酒精消毒棉片 50片/盒 6盒','医用酒精添加 安全又放心 独立密封包装 即用即拆','',192,'无','',1000,'product-details.html?lid=89',now(),0,1,'1','0');
INSERT INTO sh_product VALUES(NULL,3,'护理用品','img/product/home2/4.jpg','袋装日用湿巾，平纹无纺布40g/15x20cm，20片/袋','100%棉，无酒精，温和不刺激','',8.8,'无','',1000,'product-details.html?lid=90',now(),0,1,'1','0');
INSERT INTO sh_product VALUES(NULL,3,'护理用品','img/product/home2/5.jpg','Hello Kitty版绿色袋装纯棉柔巾卷 35片/卷*20卷','100%天然棉','',196,'无','',1000,'product-details.html?lid=91',now(),0,1,'1','0');
INSERT INTO sh_product VALUES(NULL,3,'护理用品','img/product/home2/6.jpg','纱布手帕25x25cm， 1件装','精梳棉纱布制成，亲肤柔软，轻巧便携，可满足清洁擦拭、捂口鼻、隔热等多种用途。','',28,'小鸟刺猬，波点小熊，灰色云星，橘黄雪花','25x25cm',1000,'product-details.html?lid=92',now(),0,1,'1','0');
INSERT INTO sh_product VALUES(NULL,3,'护理用品','img/product/home2/7.jpg','婴幼儿专用物理降温退热贴 2片/盒','发烧应急 安全退热 快速降温','',14.9,'无','',1000,'product-details.html?lid=93',now(),0,1,'1','0');
INSERT INTO sh_product VALUES(NULL,3,'护理用品','img/product/home2/8.jpg','盒装蒸汽灭菌纯水清洁纯棉湿巾 25片/盒','100%美棉，添加RO精制纯化水，高温高压蒸汽灭菌处理','',25,'无','',1000,'product-details.html?lid=94',now(),0,1,'1','0');
INSERT INTO sh_product VALUES(NULL,3,'护理用品','img/product/home2/9.jpg','女士纱布+针织眼罩均码， 1套/装','纱布面透气美观，安睡中让眼部充分呼吸不闷气，安享睡眠','',68,'粉底花朵，蓝色，灰底花朵，粉底森林花朵，白底森林花朵，红色竖条，灰底竖条，蓝红竖条，卡其色，灰粉色，粉色','',1000,'product-details.html?lid=95',now(),0,1,'1','0');
INSERT INTO sh_product VALUES(NULL,3,'护理用品','img/product/home2/10.jpg','PM2.5纱布口罩18x9cm， 1件装','100%棉纱布可调节式耳挂有效阻隔PM2.5颗粒','',48,'蓝色格子，藏青素色，浅绿色，紫蓝色','',1000,'product-details.html?lid=96',now(),0,1,'1','0');
INSERT INTO sh_product VALUES(NULL,3,'护理用品','img/product/home2/11.jpg','Hello Kitty版抽拉式日用纯棉柔巾 80片/盒','100%棉，清新淡雅的抽拉设计，干湿两用，触感柔软，满足肌肤各种清洁需求','',24.8,'无','',1000,'product-details.html?lid=97',now(),0,1,'1','0');
INSERT INTO sh_product VALUES(NULL,3,'护理用品','img/product/home2/12.jpg','盒装居家日用清洁纯棉柔巾 100抽/盒 10盒','100%棉，清新淡雅的抽拉设计，干湿两用，触感柔软，满足肌肤各种清洁需求','',160,'无','',1000,'product-details.html?lid=98',now(),0,1,'1','0');

/*家居->收纳用品 99-100*/
INSERT INTO sh_product VALUES(NULL,3,'收纳用品','img/product/home3/1.jpg','有纺收纳袋30x39cm， 1件装','采用马丁布缝制而成，结实耐用；系带束口设计，方便收储小件物品及外出携带使用。','',48,'秋香绿，桔红','30x39cm',1000,'product-details.html?lid=99',now(),0,1,'1','0');
INSERT INTO sh_product VALUES(NULL,3,'收纳用品','img/product/home3/2.jpg','桃花版三生三世拉链收纳袋-113*13CM， 1件装','收纳袋','',28,'桃花版','',1000,'product-details.html?lid=100',now(),0,1,'1','0');

/*家居->卫浴用品 101-111*/
INSERT INTO sh_product VALUES(NULL,3,'卫浴用品','img/product/home4/1.jpg','织语素色毛圈浴巾（粉红色）418g/70x140cm,1条装','素色毛圈浴巾','',68,'粉红色','',1000,'product-details.html?lid=101',now(),0,1,'1','0');
INSERT INTO sh_product VALUES(NULL,3,'卫浴用品','img/product/home4/2.jpg','紫色千鸟格纱布华芙格浴巾70x140cm， 1件/装','平织纱布与华夫格双面织造工艺，加倍提升柔软度与吸水性，轻盈舒适，干湿用均适合','',98,'紫色千鸟格','70x140cm',1000,'product-details.html?lid=102',now(),0,1,'1','0');
INSERT INTO sh_product VALUES(NULL,3,'卫浴用品','img/product/home4/3.jpg','粉红混色毛圈浴巾70x140cm， 1件/装','采用两种颜色的纱线混合织造，呈现出段染效果；新型中空纱，更蓬松柔软，吸水迅速且易晾干','',88,'粉红','70x140cm',1000,'product-details.html?lid=103',now(),0,1,'1','0');
INSERT INTO sh_product VALUES(NULL,3,'卫浴用品','img/product/home4/4.jpg','提花纱布毛圈浴巾385g/70x140cm,1条装','纱布与毛圈双面织造工艺，轻盈柔软，亲肤舒适，满足不同洗浴体验。','',128,'灰蓝小树','70x140cm',1000,'product-details.html?lid=104',now(),0,1,'1','0');
INSERT INTO sh_product VALUES(NULL,3,'卫浴用品','img/product/home4/5.jpg','双面毛圈提花浴巾70x140cm， 1件/装','中空纱织成的双面毛圈，轻而蓬松，吸水量大且易晾干，长时间使用也能保持柔软触感。','',198,'双蓝拼色，紫杏拼色','70x140cm',1000,'product-details.html?lid=105',now(),0,1,'1','0');
INSERT INTO sh_product VALUES(NULL,3,'卫浴用品','img/product/home4/6.jpg','袋装织语六层水洗纱布面巾34x76cm,2条装','100%棉水洗纱布，蓬松柔软，便携装方便易带。','',128,'绿色小叶+湖蓝色，粉红+杏色','34x76cm',1000,'product-details.html?lid=106',now(),0,1,'1','0');
INSERT INTO sh_product VALUES(NULL,3,'卫浴用品','img/product/home4/7.jpg','纱布浴巾70x140cm， 1件/装','半无捻纱布面料，自然蓬松，透气舒适，给予肌肤轻柔呵护。','',118,'桔黄梦幻几何，蓝绿梦幻几何','',1000,'product-details.html?lid=107',now(),0,1,'1','0');
INSERT INTO sh_product VALUES(NULL,3,'卫浴用品','img/product/home4/8.jpg','洗纱布方巾34x35CM， 1件装','六层纱布经水洗工艺处理，呈现自然褶皱，蓬松柔软，使用舒适。','',58,'粉色银杏叶','',1000,'product-details.html?lid=108',now(),0,1,'1','0');
INSERT INTO sh_product VALUES(NULL,3,'卫浴用品','img/product/home4/9.jpg','儿童纱布毛圈面巾25x50cm， 1件/装','纱布与毛圈双面织造工艺，细腻柔软，吸水迅速，给予肌肤舒爽感受。','',48,'浅蓝海狮，浅黄海狮','25x50cm',1000,'product-details.html?lid=109',now(),0,1,'1','0');
INSERT INTO sh_product VALUES(NULL,3,'卫浴用品','img/product/home4/10.jpg','袋装提花毛圈小面巾(蓝色斜纹+粉色斜纹)70g/30x50cm,2条装','毛圈加柔处理，亲肤舒适，缓解疲惫。','',88,'蓝色条纹+粉色条纹','30x50cm',1000,'product-details.html?lid=110',now(),0,1,'1','0');
INSERT INTO sh_product VALUES(NULL,3,'卫浴用品','img/product/home4/11.jpg','袋装印花毛圈小面巾(蓝色花影+粉色花影)62g/28x50cm,2条装','优质精梳棉，亲肤的享受；小包装设计，日常差旅均适宜','',108,'蓝色花影+粉色花影','28x50cm',1000,'product-details.html?lid=111',now(),0,1,'1','0');

/*男士->男士服装服饰 112-127*/
INSERT INTO sh_product VALUES(NULL,4,'男士服装服饰 ','img/product/men/1.jpg','春夏男士针织短袖POLO衫165 袋装，1件/袋','优质网眼珠地面料，柔软舒适；多色间条配以合体剪裁，各年龄层均可穿着。','',298,'彩色间条，藏青灰间条','S，M，L，XL，XXL',1000,'product-details.html?lid=112',now(),0,1,'1','0');
INSERT INTO sh_product VALUES(NULL,4,'男士服装服饰 ','img/product/men/2.jpg','男士短筒休闲袜薄款26~28cm， 2双装','优质棉与弹性好的莱卡混织而成，伸展自由不紧绷；纯手工对目袜尖，细腻平整，穿着更舒适。','',48,'绿色+黑色，紫蓝+深蓝','26~28cm',1000,'product-details.html?lid=113',now(),0,1,'1','0');
INSERT INTO sh_product VALUES(NULL,4,'男士服装服饰 ','img/product/men/3.jpg','男士V领背心棉线上衣， 1件/装','优质长绒棉，柔软出众；多种针法运用，时尚而富有变化，局部罗纹面料，穿着舒适不易变形。 【每个ID限购10件】','',184,'石竹色，中花灰色，宝蓝色','M，L，XL，XXL',1000,'product-details.html?lid=114',now(),0,1,'1','0');
INSERT INTO sh_product VALUES(NULL,4,'男士服装服饰 ','img/product/men/4.jpg','男士针织薄型中腰保暖裤， 1件装','精选高支长绒棉，柔软出众；脚口加宽收紧设计，防风且穿着稳定。','',218,'黑色','M，L，XL，XXL',1000,'product-details.html?lid=115',now(),0,1,'1','0');
INSERT INTO sh_product VALUES(NULL,4,'男士服装服饰 ','img/product/men/5.jpg','男士针织薄型U领长袖秋冬打底衫， 1件装','精选高支长绒棉，柔软出众；袖口加宽收紧设计，防风且穿着稳定，适合隐形打底。','',218,'雾蓝色','M，L，XL，XXL',1000,'product-details.html?lid=116',now(),0,1,'1','0');
INSERT INTO sh_product VALUES(NULL,4,'男士服装服饰 ','img/product/men/6.jpg','男士四层纱布色织长袖家居服套装， 1套/装','四层纱布面料，蓬松柔软且保暖效果好；经典款型，可满足各类穿搭需求。','',698,'蓝黄格子，黑色格子','M，L，XL，XXL',1000,'product-details.html?lid=117',now(),0,1,'1','0');
INSERT INTO sh_product VALUES(NULL,4,'男士服装服饰 ','img/product/men/7.jpg','男士斜纹磨毛休闲裤， 1件/装','优质斜纹磨毛面料，舒适透气；V小平腰头设计，收腰效果好；腰部橡筋可调节，穿着不紧绷。 【每个ID限购10件】','',284,'浅灰色，卡其色，藏青色','M，L，XL，XXL',1000,'product-details.html?lid=118',now(),0,1,'1','0');
INSERT INTO sh_product VALUES(NULL,4,'男士服装服饰 ','img/product/men/8.jpg','男士色织格衬衫， 1件/装','优质梭织色织格面料，富有质感；休闲版型，穿着舒适百搭。 【每个ID限购10件】','【限时活动】圣诞快乐 舒适的礼物50%OFF起【满赠】圣诞礼物买满188送购物袋一个，满298送湿巾1包，满588送棉柔巾8包（单笔订单仅赠一份）',249,'灰色格，蓝色格','M，L，XL，XXL',1000,'product-details.html?lid=119',now(),0,1,'1','0');
INSERT INTO sh_product VALUES(NULL,4,'男士服装服饰 ','img/product/men/9.jpg','男士开衫棉线上衣， 1件/装','优质长绒棉，柔软出众；多种针法运用，时尚而富有变化，局部罗纹面料，穿着舒适不易变形。 【每个ID限购10件】','【限时活动】圣诞快乐 舒适的礼物50%OFF起【满赠】圣诞礼物买满188送购物袋一个，满298送湿巾1包，满588送棉柔巾8包（单笔订单仅赠一份）',214,'石竹色','M，L，XL，XXL',1000,'product-details.html?lid=120',now(),0,1,'1','0');
INSERT INTO sh_product VALUES(NULL,4,'男士服装服饰 ','img/product/men/10.jpg','男士千鸟格纱布衬衫， 1件/装','双层纱布面料，柔软舒适；千鸟格图案及袖口、衣领内层不同面料的拼接设计，休闲百搭。','',468,'红色','M，L，XL，XXL',1000,'product-details.html?lid=121',now(),0,1,'1','0');
INSERT INTO sh_product VALUES(NULL,4,'男士服装服饰 ','img/product/men/11.jpg','春夏男士全棉帆布休闲包/均码（灰色）袋装，1件/袋','加厚帆布，结实耐用，大容量设计，可放电脑等随身物品；手提或肩挎两用，商务休闲均可。','',338,'灰色','',1000,'product-details.html?lid=122',now(),0,1,'1','0');
INSERT INTO sh_product VALUES(NULL,4,'男士服装服饰 ','img/product/men/12.jpg','男士围巾180cmx31cm， 1件/装','优质长绒棉制成，柔软出众；丰富的肌理效果，美观且富有立体质感，可轻松搭配各类服饰。','',268,'中花灰色，驼色花灰色','180cmx31cm',1000,'product-details.html?lid=123',now(),0,1,'1','0');
INSERT INTO sh_product VALUES(NULL,4,'男士服装服饰 ','img/product/men/13.jpg','男士双层绉布+针织布收褶领长袖家居服套装， 1套/装','绉布与针织两种面料相互组合，松软舒适；时尚小圆领搭配领部褶皱设计，美观且活动方便。','',698,'灰色绉布','M，L，XL，XXL',1000,'product-details.html?lid=124',now(),0,1,'1','0');
INSERT INTO sh_product VALUES(NULL,4,'男士服装服饰 ','img/product/men/14.jpg','男士抓绒开衫卫衣， 1件/装','抓绒面料，柔软舒适，保暖效果好；高领连帽设计，温暖防风。','',498,'花灰色，藏青色','M，L，XL，XXL',1000,'product-details.html?lid=125',now(),0,1,'1','0');
INSERT INTO sh_product VALUES(NULL,4,'男士服装服饰 ','img/product/men/15.jpg','男士针织中厚V领长袖保暖套装， 1套装','优质长绒棉面料，柔软出众，保暖透气；立体裁剪，穿着更为舒适合体。','',368,'浅花灰，深花灰，红色','M，L，XL，XXL',1000,'product-details.html?lid=126',now(),0,1,'1','0');
INSERT INTO sh_product VALUES(NULL,4,'男士服装服饰 ','img/product/men/16.jpg','男士短筒休闲袜薄款26~28cm， 1双装','优质棉与弹性好的莱卡混织而成，伸展自由不紧绷；手工对目袜尖，细腻平整，穿着更舒适。','',28,'蓝白花纱','26~28cm',1000,'product-details.html?lid=127',now(),0,1,'1','0');

/*男士->男士卫生用品 128*/
INSERT INTO sh_product VALUES(NULL,4,'男士卫生用品 ','img/product/men1/1.jpg','男士洁面36目网眼加厚纯棉柔巾60g 80片/盒','专为男士脸部肌肤清洁设计，100%棉，60克加厚柔软，不怕胡茬带出絮','',39.8,'男款','',1000,'product-details.html?lid=128',now(),0,1,'1','0');


/****大中小图*****/
/*婴童->婴童床品*/
INSERT INTO sh_product_pic VALUES(NULL,1,1,'img/product/baby/1/sm1.jpg','img/product/baby/1/md1.jpg','img/product/baby/1/lg1.jpg'),
(NULL,1,1,'img/product/baby/1/sm2.jpg','img/product/baby/1/md2.jpg','img/product/baby/1/lg2.jpg'),
(NULL,1,1,'img/product/baby/1/sm3.jpg','img/product/baby/1/md3.jpg','img/product/baby/1/lg3.jpg'),
(NULL,1,1,'img/product/baby/1/sm4.jpg','img/product/baby/1/md4.jpg','img/product/baby/1/lg4.jpg'),
(NULL,1,1,'img/product/baby/1/sm5.jpg','img/product/baby/1/md5.jpg','img/product/baby/1/lg5.jpg'),
(NULL,2,1,'img/product/baby/2/sm1.jpg','img/product/baby/2/md1.jpg','img/product/baby/2/lg1.jpg'),
(NULL,2,1,'img/product/baby/2/sm2.jpg','img/product/baby/2/md2.jpg','img/product/baby/2/lg12.jpg'),
(NULL,2,1,'img/product/baby/2/sm3.jpg','img/product/baby/2/md3.jpg','img/product/baby/2/lg3.jpg'),
(NULL,2,1,'img/product/baby/2/sm4.jpg','img/product/baby/2/md4.jpg','img/product/baby/2/lg4.jpg'),
(NULL,2,1,'img/product/baby/2/sm5.jpg','img/product/baby/2/md5.jpg','img/product/baby/2/lg5.jpg'),
(NULL,2,2,'img/product/baby/2/sm6.jpg','img/product/baby/2/md6.jpg','img/product/baby/2/lg6.jpg'),
(NULL,2,2,'img/product/baby/2/sm7.jpg','img/product/baby/2/md7.jpg','img/product/baby/2/lg7.jpg'),
(NULL,2,2,'img/product/baby/2/sm8.jpg','img/product/baby/2/md8.jpg','img/product/baby/2/lg8.jpg'),
(NULL,2,2,'img/product/baby/2/sm9.jpg','img/product/baby/2/md9.jpg','img/product/baby/2/lg9.jpg'),
(NULL,2,2,'img/product/baby/2/sm10.jpg','img/product/baby/2/md10.jpg','img/product/baby/2/lg10.jpg'),
(NULL,3,1,'img/product/baby/3/sm1.jpg','img/product/baby/3/md1.jpg','img/product/baby/3/lg1.jpg'),
(NULL,3,1,'img/product/baby/3/sm2.jpg','img/product/baby/3/md2.jpg','img/product/baby/3/lg2.jpg'),
(NULL,3,1,'img/product/baby/3/sm3.jpg','img/product/baby/3/md3.jpg','img/product/baby/3/lg3.jpg'),
(NULL,3,1,'img/product/baby/3/sm4.jpg','img/product/baby/3/md4.jpg','img/product/baby/3/lg4.jpg'),
(NULL,3,1,'img/product/baby/3/sm5.jpg','img/product/baby/3/md5.jpg','img/product/baby/3/lg5.jpg'),
(NULL,3,2,'img/product/baby/3/sm6.jpg','img/product/baby/3/md6.jpg','img/product/baby/3/lg6.jpg'),
(NULL,3,2,'img/product/baby/3/sm7.jpg','img/product/baby/3/md7.jpg','img/product/baby/3/lg7.jpg'),
(NULL,3,2,'img/product/baby/3/sm8.jpg','img/product/baby/3/md8.jpg','img/product/baby/3/lg8.jpg'),
(NULL,3,2,'img/product/baby/3/sm9.jpg','img/product/baby/3/md9.jpg','img/product/baby/3/lg9.jpg'),
(NULL,3,2,'img/product/baby/3/sm10.jpg','img/product/baby/3/md10.jpg','img/product/baby/3/lg10.jpg'),
(NULL,3,3,'img/product/baby/3/sm11.jpg','img/product/baby/3/md11.jpg','img/product/baby/3/lg11.jpg'),
(NULL,3,3,'img/product/baby/3/sm12.jpg','img/product/baby/3/md12.jpg','img/product/baby/3/lg12.jpg'),
(NULL,3,3,'img/product/baby/3/sm13.jpg','img/product/baby/3/md13.jpg','img/product/baby/3/lg13.jpg'),
(NULL,3,3,'img/product/baby/3/sm14.jpg','img/product/baby/3/md14.jpg','img/product/baby/3/lg14.jpg'),
(NULL,3,3,'img/product/baby/3/sm15.jpg','img/product/baby/3/md15.jpg','img/product/baby/3/lg15.jpg'),
(NULL,4,1,'img/product/baby/4/sm1.jpg','img/product/baby/4/md1.jpg','img/product/baby/4/lg1.jpg'),
(NULL,4,1,'img/product/baby/4/sm2.jpg','img/product/baby/4/md2.jpg','img/product/baby/4/lg2.jpg'),
(NULL,4,1,'img/product/baby/4/sm3.jpg','img/product/baby/4/md3.jpg','img/product/baby/4/lg3.jpg'),
(NULL,4,1,'img/product/baby/4/sm4.jpg','img/product/baby/4/md4.jpg','img/product/baby/4/lg4.jpg'),
(NULL,4,1,'img/product/baby/4/sm5.jpg','img/product/baby/4/md5.jpg','img/product/baby/4/lg5.jpg'),
(NULL,4,2,'img/product/baby/4/sm6.jpg','img/product/baby/4/md6.jpg','img/product/baby/4/lg6.jpg'),
(NULL,4,2,'img/product/baby/4/sm7.jpg','img/product/baby/4/md7.jpg','img/product/baby/4/lg7.jpg'),
(NULL,4,2,'img/product/baby/4/sm8.jpg','img/product/baby/4/md8.jpg','img/product/baby/4/lg8.jpg'),
(NULL,4,2,'img/product/baby/4/sm9.jpg','img/product/baby/4/md9.jpg','img/product/baby/4/lg9.jpg'),
(NULL,4,2,'img/product/baby/4/sm10.jpg','img/product/baby/4/md10.jpg','img/product/baby/4/lg10.jpg'),
(NULL,5,1,'img/product/baby/5/sm1.jpg','img/product/baby/5/md1.jpg','img/product/baby/5/lg1.jpg'),
(NULL,5,1,'img/product/baby/5/sm2.jpg','img/product/baby/5/md2.jpg','img/product/baby/5/lg2.jpg'),
(NULL,5,1,'img/product/baby/5/sm3.jpg','img/product/baby/5/md3.jpg','img/product/baby/5/lg3.jpg'),
(NULL,5,1,'img/product/baby/5/sm4.jpg','img/product/baby/5/md4.jpg','img/product/baby/5/lg4.jpg'),
(NULL,5,1,'img/product/baby/5/sm5.jpg','img/product/baby/5/md5.jpg','img/product/baby/5/lg5.jpg'),
(NULL,6,1,'img/product/baby/6/sm1.jpg','img/product/baby/6/md1.jpg','img/product/baby/5/lg1.jpg'),
(NULL,6,1,'img/product/baby/6/sm2.jpg','img/product/baby/6/md2.jpg','img/product/baby/5/lg2.jpg'),
(NULL,6,1,'img/product/baby/6/sm3.jpg','img/product/baby/6/md3.jpg','img/product/baby/5/lg3.jpg'),
(NULL,6,1,'img/product/baby/6/sm4.jpg','img/product/baby/6/md4.jpg','img/product/baby/6/lg4.jpg'),
(NULL,6,1,'img/product/baby/6/sm5.jpg','img/product/baby/6/md5.jpg','img/product/baby/6/lg5.jpg'),
(NULL,6,2,'img/product/baby/6/sm6.jpg','img/product/baby/6/md6.jpg','img/product/baby/6/lg6.jpg'),
(NULL,6,2,'img/product/baby/6/sm7.jpg','img/product/baby/6/md7.jpg','img/product/baby/6/lg7.jpg'),
(NULL,6,2,'img/product/baby/6/sm8.jpg','img/product/baby/6/md8.jpg','img/product/baby/6/lg8.jpg'),
(NULL,6,2,'img/product/baby/6/sm9.jpg','img/product/baby/6/md9.jpg','img/product/baby/6/lg9.jpg'),
(NULL,6,2,'img/product/baby/6/sm10.jpg','img/product/baby/6/md10.jpg','img/product/baby/6/lg10.jpg'),
(NULL,7,1,'img/product/baby/7/sm1.jpg','img/product/baby/7/md1.jpg','img/product/baby/7/lg1.jpg'),
(NULL,7,1,'img/product/baby/7/sm2.jpg','img/product/baby/7/md2.jpg','img/product/baby/7/lg2.jpg'),
(NULL,7,1,'img/product/baby/7/sm3.jpg','img/product/baby/7/md3.jpg','img/product/baby/7/lg3.jpg'),
(NULL,7,1,'img/product/baby/7/sm4.jpg','img/product/baby/7/md4.jpg','img/product/baby/7/lg4.jpg'),
(NULL,7,1,'img/product/baby/7/sm5.jpg','img/product/baby/7/md5.jpg','img/product/baby/7/lg5.jpg'),
(NULL,8,1,'img/product/baby/8/sm1.jpg','img/product/baby/8/md1.jpg','img/product/baby/8/lg1.jpg'),
(NULL,8,1,'img/product/baby/8/sm2.jpg','img/product/baby/8/md2.jpg','img/product/baby/8/lg2.jpg'),
(NULL,8,1,'img/product/baby/8/sm3.jpg','img/product/baby/8/md3.jpg','img/product/baby/8/lg3.jpg'),
(NULL,8,1,'img/product/baby/8/sm4.jpg','img/product/baby/8/md4.jpg','img/product/baby/8/lg4.jpg'),
(NULL,8,1,'img/product/baby/8/sm5.jpg','img/product/baby/8/md5.jpg','img/product/baby/8/lg5.jpg'),
(NULL,8,2,'img/product/baby/8/sm6.jpg','img/product/baby/8/md6.jpg','img/product/baby/8/lg6.jpg'),
(NULL,8,2,'img/product/baby/8/sm7.jpg','img/product/baby/8/md7.jpg','img/product/baby/8/lg7.jpg'),
(NULL,8,2,'img/product/baby/8/sm8.jpg','img/product/baby/8/md8.jpg','img/product/baby/8/lg8.jpg'),
(NULL,8,2,'img/product/baby/8/sm9.jpg','img/product/baby/8/md9.jpg','img/product/baby/8/lg9.jpg'),
(NULL,8,2,'img/product/baby/8/sm10.jpg','img/product/baby/8/md10.jpg','img/product/baby/8/lg10.jpg'),
(NULL,9,1,'img/product/baby/9/sm1.jpg','img/product/baby/9/md1.jpg','img/product/baby/9/lg1.jpg'),
(NULL,9,1,'img/product/baby/9/sm2.jpg','img/product/baby/9/md2.jpg','img/product/baby/9/lg2.jpg'),
(NULL,9,1,'img/product/baby/9/sm3.jpg','img/product/baby/9/md3.jpg','img/product/baby/9/lg3.jpg'),
(NULL,9,1,'img/product/baby/9/sm4.jpg','img/product/baby/9/md4.jpg','img/product/baby/9/lg4.jpg'),
(NULL,9,1,'img/product/baby/9/sm5.jpg','img/product/baby/9/md5.jpg','img/product/baby/9/lg5.jpg'),
(NULL,9,2,'img/product/baby/9/sm6.jpg','img/product/baby/9/md6.jpg','img/product/baby/9/lg6.jpg'),
(NULL,9,2,'img/product/baby/9/sm7.jpg','img/product/baby/9/md7.jpg','img/product/baby/9/lg7.jpg'),
(NULL,9,2,'img/product/baby/9/sm8.jpg','img/product/baby/9/md8.jpg','img/product/baby/9/lg8.jpg'),
(NULL,9,2,'img/product/baby/9/sm9.jpg','img/product/baby/9/md9.jpg','img/product/baby/9/lg9.jpg'),
(NULL,9,2,'img/product/baby/9/sm10.jpg','img/product/baby/9/md10.jpg','img/product/baby/9/lg10.jpg'),
(NULL,10,1,'img/product/baby/10/sm1.jpg','img/product/baby/10/md1.jpg','img/product/baby/10/lg1.jpg'),
(NULL,10,1,'img/product/baby/10/sm2.jpg','img/product/baby/10/md2.jpg','img/product/baby/10/lg2.jpg'),
(NULL,10,1,'img/product/baby/10/sm3.jpg','img/product/baby/10/md3.jpg','img/product/baby/10/lg3.jpg'),
(NULL,10,1,'img/product/baby/10/sm4.jpg','img/product/baby/10/md4.jpg','img/product/baby/10/lg4.jpg'),
(NULL,10,1,'img/product/baby/10/sm5.jpg','img/product/baby/10/md5.jpg','img/product/baby/10/lg5.jpg'),
(NULL,11,1,'img/product/baby/11/sm1.jpg','img/product/baby/11/md1.jpg','img/product/baby/11/lg1.jpg'),
(NULL,11,1,'img/product/baby/11/sm2.jpg','img/product/baby/11/md2.jpg','img/product/baby/11/lg2.jpg'),
(NULL,11,1,'img/product/baby/11/sm3.jpg','img/product/baby/11/md3.jpg','img/product/baby/11/lg3.jpg'),
(NULL,11,1,'img/product/baby/11/sm4.jpg','img/product/baby/11/md4.jpg','img/product/baby/11/lg4.jpg'),
(NULL,11,1,'img/product/baby/11/sm5.jpg','img/product/baby/11/md5.jpg','img/product/baby/11/lg5.jpg'),
(NULL,11,2,'img/product/baby/11/sm6.jpg','img/product/baby/11/md6.jpg','img/product/baby/11/lg6.jpg'),
(NULL,11,2,'img/product/baby/11/sm7.jpg','img/product/baby/11/md7.jpg','img/product/baby/11/lg7.jpg'),
(NULL,11,2,'img/product/baby/11/sm8.jpg','img/product/baby/11/md8.jpg','img/product/baby/11/lg8.jpg'),
(NULL,11,2,'img/product/baby/11/sm9.jpg','img/product/baby/11/md9.jpg','img/product/baby/11/lg9.jpg'),
(NULL,11,2,'img/product/baby/11/sm10.jpg','img/product/baby/11/md10.jpg','img/product/baby/11/lg10.jpg'),
(NULL,12,1,'img/product/baby/12/sm1.jpg','img/product/baby/12/md1.jpg','img/product/baby/12/lg1.jpg'),
(NULL,12,1,'img/product/baby/12/sm2.jpg','img/product/baby/12/md2.jpg','img/product/baby/12/lg2.jpg'),
(NULL,12,1,'img/product/baby/12/sm3.jpg','img/product/baby/12/md3.jpg','img/product/baby/12/lg3.jpg'),
(NULL,12,1,'img/product/baby/12/sm4.jpg','img/product/baby/12/md4.jpg','img/product/baby/12/lg4.jpg'),
(NULL,12,1,'img/product/baby/12/sm5.jpg','img/product/baby/12/md5.jpg','img/product/baby/12/lg5.jpg'),
(NULL,12,2,'img/product/baby/12/sm6.jpg','img/product/baby/12/md6.jpg','img/product/baby/12/lg6.jpg'),
(NULL,12,2,'img/product/baby/12/sm7.jpg','img/product/baby/12/md7.jpg','img/product/baby/12/lg7.jpg'),
(NULL,12,2,'img/product/baby/12/sm8.jpg','img/product/baby/12/md8.jpg','img/product/baby/12/lg8.jpg'),
(NULL,12,2,'img/product/baby/12/sm9.jpg','img/product/baby/12/md9.jpg','img/product/baby/12/lg9.jpg'),
(NULL,12,2,'img/product/baby/12/sm10.jpg','img/product/baby/12/md10.jpg','img/product/baby/12/lg10.jpg'),
(NULL,12,3,'img/product/baby/12/sm11.jpg','img/product/baby/12/md11.jpg','img/product/baby/12/lg11.jpg'),
(NULL,12,3,'img/product/baby/12/sm12.jpg','img/product/baby/12/md12.jpg','img/product/baby/12/lg12.jpg'),
(NULL,12,3,'img/product/baby/12/sm13.jpg','img/product/baby/12/md13.jpg','img/product/baby/12/lg13.jpg'),
(NULL,12,3,'img/product/baby/12/sm14.jpg','img/product/baby/12/md14.jpg','img/product/baby/12/lg14.jpg'),
(NULL,12,3,'img/product/baby/12/sm15.jpg','img/product/baby/12/md15.jpg','img/product/baby/12/lg15.jpg'),
(NULL,13,1,'img/product/baby/13/sm1.jpg','img/product/baby/13/md1.jpg','img/product/baby/13/lg1.jpg'),
(NULL,13,1,'img/product/baby/13/sm2.jpg','img/product/baby/13/md2.jpg','img/product/baby/13/lg2.jpg'),
(NULL,13,1,'img/product/baby/13/sm3.jpg','img/product/baby/13/md3.jpg','img/product/baby/13/lg3.jpg'),
(NULL,13,1,'img/product/baby/13/sm4.jpg','img/product/baby/13/md4.jpg','img/product/baby/13/lg4.jpg'),
(NULL,13,1,'img/product/baby/13/sm5.jpg','img/product/baby/13/md5.jpg','img/product/baby/13/lg5.jpg'),
(NULL,13,2,'img/product/baby/13/sm6.jpg','img/product/baby/13/md6.jpg','img/product/baby/13/lg6.jpg'),
(NULL,13,2,'img/product/baby/13/sm7.jpg','img/product/baby/13/md7.jpg','img/product/baby/13/lg7.jpg'),
(NULL,13,2,'img/product/baby/13/sm8.jpg','img/product/baby/13/md8.jpg','img/product/baby/13/lg8.jpg'),
(NULL,13,2,'img/product/baby/13/sm9.jpg','img/product/baby/13/md9.jpg','img/product/baby/13/lg9.jpg'),
(NULL,13,2,'img/product/baby/13/sm10.jpg','img/product/baby/13/md10.jpg','img/product/baby/13/lg10.jpg'),
(NULL,14,1,'img/product/baby/14/sm1.jpg','img/product/baby/14/md1.jpg','img/product/baby/14/lg1.jpg'),
(NULL,14,1,'img/product/baby/14/sm2.jpg','img/product/baby/14/md2.jpg','img/product/baby/14/lg2.jpg'),
(NULL,14,1,'img/product/baby/14/sm3.jpg','img/product/baby/14/md3.jpg','img/product/baby/14/lg3.jpg'),
(NULL,14,1,'img/product/baby/14/sm4.jpg','img/product/baby/14/md4.jpg','img/product/baby/14/lg4.jpg'),
(NULL,14,1,'img/product/baby/14/sm5.jpg','img/product/baby/14/md5.jpg','img/product/baby/14/lg5.jpg'),
(NULL,15,1,'img/product/baby/15/sm1.jpg','img/product/baby/15/md1.jpg','img/product/baby/15/lg1.jpg'),
(NULL,15,1,'img/product/baby/15/sm2.jpg','img/product/baby/15/md2.jpg','img/product/baby/15/lg2.jpg'),
(NULL,15,1,'img/product/baby/15/sm3.jpg','img/product/baby/15/md3.jpg','img/product/baby/15/lg3.jpg'),
(NULL,15,1,'img/product/baby/15/sm4.jpg','img/product/baby/15/md4.jpg','img/product/baby/15/lg4.jpg'),
(NULL,15,1,'img/product/baby/15/sm5.jpg','img/product/baby/15/md5.jpg','img/product/baby/15/lg5.jpg'),
(NULL,16,1,'img/product/baby/16/sm1.jpg','img/product/baby/16/md1.jpg','img/product/baby/16/lg1.jpg'),
(NULL,16,1,'img/product/baby/16/sm2.jpg','img/product/baby/16/md2.jpg','img/product/baby/16/lg2.jpg'),
(NULL,16,1,'img/product/baby/16/sm3.jpg','img/product/baby/16/md3.jpg','img/product/baby/16/lg3.jpg'),
(NULL,16,1,'img/product/baby/16/sm4.jpg','img/product/baby/16/md4.jpg','img/product/baby/16/lg4.jpg'),
(NULL,16,1,'img/product/baby/16/sm5.jpg','img/product/baby/16/md5.jpg','img/product/baby/16/lg5.jpg'),
(NULL,17,1,'img/product/baby1/5/sm1.jpg','img/product/baby1/5/md1.jpg','img/product/baby1/5/lg1.jpg'),
(NULL,17,1,'img/product/baby1/5/sm2.jpg','img/product/baby1/5/md2.jpg','img/product/baby1/5/lg2.jpg'),
(NULL,17,1,'img/product/baby1/5/sm3.jpg','img/product/baby1/5/md3.jpg','img/product/baby1/5/lg3.jpg'),
(NULL,17,1,'img/product/baby1/5/sm4.jpg','img/product/baby1/5/md4.jpg','img/product/baby1/5/lg4.jpg'),
(NULL,17,1,'img/product/baby1/5/sm5.jpg','img/product/baby1/5/md5.jpg','img/product/baby1/5/lg5.jpg'),
(NULL,18,1,'img/product/baby/18/sm1.jpg','img/product/baby/18/md1.jpg','img/product/baby/18/lg1.jpg'),
(NULL,18,1,'img/product/baby/18/sm2.jpg','img/product/baby/18/md2.jpg','img/product/baby/18/lg2.jpg'),
(NULL,18,1,'img/product/baby/18/sm3.jpg','img/product/baby/18/md3.jpg','img/product/baby/18/lg3.jpg'),
(NULL,18,1,'img/product/baby/18/sm4.jpg','img/product/baby/18/md4.jpg','img/product/baby/18/lg4.jpg'),
(NULL,18,1,'img/product/baby/18/sm5.jpg','img/product/baby/18/md5.jpg','img/product/baby/18/lg5.jpg'),
(NULL,19,1,'img/product/baby/19/sm1.jpg','img/product/baby/19/md1.jpg','img/product/baby/19/lg1.jpg'),
(NULL,19,1,'img/product/baby/19/sm2.jpg','img/product/baby/19/md2.jpg','img/product/baby/19/lg2.jpg'),
(NULL,19,1,'img/product/baby/19/sm3.jpg','img/product/baby/19/md3.jpg','img/product/baby/19/lg3.jpg'),
(NULL,19,1,'img/product/baby/19/sm4.jpg','img/product/baby/19/md4.jpg','img/product/baby/19/lg4.jpg'),
(NULL,19,1,'img/product/baby/19/sm5.jpg','img/product/baby/19/md5.jpg','img/product/baby/19/lg5.jpg'),
(NULL,37,1,'img/product/baby/37/sm1.jpg','img/product/baby/37/md1.jpg','img/product/baby/37/lg1.jpg'),
(NULL,37,1,'img/product/baby/37/sm2.jpg','img/product/baby/37/md2.jpg','img/product/baby/37/lg2.jpg'),
(NULL,37,1,'img/product/baby/37/sm3.jpg','img/product/baby/37/md3.jpg','img/product/baby/37/lg3.jpg'),
(NULL,37,1,'img/product/baby/37/sm4.jpg','img/product/baby/37/md4.jpg','img/product/baby/37/lg4.jpg'),
(NULL,37,1,'img/product/baby/37/sm5.jpg','img/product/baby/37/md5.jpg','img/product/baby/37/lg5.jpg'),
(NULL,41,1,'img/product/baby/41/sm1.jpg','img/product/baby/41/md1.jpg','img/product/baby/41/lg1.jpg'),
(NULL,41,1,'img/product/baby/41/sm2.jpg','img/product/baby/41/md2.jpg','img/product/baby/41/lg2.jpg'),
(NULL,41,1,'img/product/baby/41/sm3.jpg','img/product/baby/41/md3.jpg','img/product/baby/41/lg3.jpg'),
(NULL,41,1,'img/product/baby/41/sm4.jpg','img/product/baby/41/md4.jpg','img/product/baby/41/lg4.jpg'),
(NULL,41,1,'img/product/baby/41/sm5.jpg','img/product/baby/41/md5.jpg','img/product/baby/41/lg5.jpg'),

/*婴童->婴童服饰 42-49*/
(NULL,42,1,'img/product/baby1/1/sm1.jpg','img/product/baby1/1/md1.jpg','img/product/baby1/1/lg1.jpg'),
(NULL,42,1,'img/product/baby1/1/sm2.jpg','img/product/baby1/1/md2.jpg','img/product/baby1/1/lg2.jpg'),
(NULL,42,1,'img/product/baby1/1/sm3.jpg','img/product/baby1/1/md3.jpg','img/product/baby1/1/lg3.jpg'),
(NULL,42,1,'img/product/baby1/1/sm4.jpg','img/product/baby1/1/md4.jpg','img/product/baby1/1/lg4.jpg'),
(NULL,42,1,'img/product/baby1/1/sm5.jpg','img/product/baby1/1/md5.jpg','img/product/baby1/1/lg5.jpg'),
(NULL,42,2,'img/product/baby1/1/sm6.jpg','img/product/baby1/1/md6.jpg','img/product/baby1/1/lg6.jpg'),
(NULL,42,2,'img/product/baby1/1/sm7.jpg','img/product/baby1/1/md7.jpg','img/product/baby1/1/lg7.jpg'),
(NULL,42,2,'img/product/baby1/1/sm8.jpg','img/product/baby1/1/md8.jpg','img/product/baby1/1/lg8.jpg'),
(NULL,42,2,'img/product/baby1/1/sm9.jpg','img/product/baby1/1/md9.jpg','img/product/baby1/1/lg9.jpg'),
(NULL,42,2,'img/product/baby1/1/sm10.jpg','img/product/baby1/1/md10.jpg','img/product/baby1/1/lg10.jpg'),
(NULL,43,1,'img/product/baby1/2/sm1.jpg','img/product/baby1/2/md1.jpg','img/product/baby1/2/lg1.jpg'),
(NULL,43,1,'img/product/baby1/2/sm2.jpg','img/product/baby1/2/md2.jpg','img/product/baby1/2/lg2.jpg'),
(NULL,43,1,'img/product/baby1/2/sm3.jpg','img/product/baby1/2/md3.jpg','img/product/baby1/2/lg3.jpg'),
(NULL,43,1,'img/product/baby1/2/sm4.jpg','img/product/baby1/2/md4.jpg','img/product/baby1/2/lg4.jpg'),
(NULL,43,1,'img/product/baby1/2/sm5.jpg','img/product/baby1/2/md5.jpg','img/product/baby1/2/lg5.jpg'),
(NULL,44,1,'img/product/baby1/3/sm1.jpg','img/product/baby1/3/md1.jpg','img/product/baby1/3/lg1.jpg'),
(NULL,44,1,'img/product/baby1/3/sm2.jpg','img/product/baby1/3/md2.jpg','img/product/baby1/3/lg2.jpg'),
(NULL,44,1,'img/product/baby1/3/sm3.jpg','img/product/baby1/3/md3.jpg','img/product/baby1/3/lg3.jpg'),
(NULL,44,1,'img/product/baby1/3/sm4.jpg','img/product/baby1/3/md4.jpg','img/product/baby1/3/lg4.jpg'),
(NULL,44,1,'img/product/baby1/3/sm5.jpg','img/product/baby1/3/md5.jpg','img/product/baby1/3/lg5.jpg'),
(NULL,45,1,'img/product/baby1/4/sm1.jpg','img/product/baby1/4/md1.jpg','img/product/baby1/4/lg1.jpg'),
(NULL,45,1,'img/product/baby1/4/sm2.jpg','img/product/baby1/4/md2.jpg','img/product/baby1/4/lg2.jpg'),
(NULL,45,1,'img/product/baby1/4/sm3.jpg','img/product/baby1/4/md3.jpg','img/product/baby1/4/lg3.jpg'),
(NULL,45,1,'img/product/baby1/4/sm4.jpg','img/product/baby1/4/md4.jpg','img/product/baby1/4/lg4.jpg'),
(NULL,45,1,'img/product/baby1/4/sm5.jpg','img/product/baby1/4/md5.jpg','img/product/baby1/4/lg5.jpg'),
(NULL,46,1,'img/product/baby1/5/sm1.jpg','img/product/baby1/5/md1.jpg','img/product/baby1/5/lg1.jpg'),
(NULL,46,1,'img/product/baby1/5/sm2.jpg','img/product/baby1/5/md2.jpg','img/product/baby1/5/lg2.jpg'),
(NULL,46,1,'img/product/baby1/5/sm3.jpg','img/product/baby1/5/md3.jpg','img/product/baby1/5/lg3.jpg'),
(NULL,46,1,'img/product/baby1/5/sm4.jpg','img/product/baby1/5/md4.jpg','img/product/baby1/5/lg4.jpg'),
(NULL,46,1,'img/product/baby1/5/sm5.jpg','img/product/baby1/5/md5.jpg','img/product/baby1/5/lg5.jpg'),
(NULL,47,1,'img/product/baby1/6/sm1.jpg','img/product/baby1/6/md1.jpg','img/product/baby1/6/lg1.jpg'),
(NULL,47,1,'img/product/baby1/6/sm2.jpg','img/product/baby1/6/md2.jpg','img/product/baby1/6/lg2.jpg'),
(NULL,47,1,'img/product/baby1/6/sm3.jpg','img/product/baby1/6/md3.jpg','img/product/baby1/6/lg3.jpg'),
(NULL,47,1,'img/product/baby1/6/sm4.jpg','img/product/baby1/6/md4.jpg','img/product/baby1/6/lg4.jpg'),
(NULL,47,1,'img/product/baby1/6/sm5.jpg','img/product/baby1/6/md5.jpg','img/product/baby1/6/lg5.jpg'),
(NULL,48,1,'img/product/baby1/7/sm1.jpg','img/product/baby1/7/md1.jpg','img/product/baby1/7/lg1.jpg'),
(NULL,48,1,'img/product/baby1/7/sm2.jpg','img/product/baby1/7/md2.jpg','img/product/baby1/7/lg2.jpg'),
(NULL,48,1,'img/product/baby1/7/sm3.jpg','img/product/baby1/7/md3.jpg','img/product/baby1/7/lg3.jpg'),
(NULL,48,1,'img/product/baby1/7/sm4.jpg','img/product/baby1/7/md4.jpg','img/product/baby1/7/lg4.jpg'),
(NULL,48,1,'img/product/baby1/7/sm5.jpg','img/product/baby1/7/md5.jpg','img/product/baby1/7/lg5.jpg'),
(NULL,49,1,'img/product/baby1/8/sm1.jpg','img/product/baby1/8/md1.jpg','img/product/baby1/8/lg1.jpg'),
(NULL,49,1,'img/product/baby1/8/sm2.jpg','img/product/baby1/8/md2.jpg','img/product/baby1/8/lg2.jpg'),
(NULL,49,1,'img/product/baby1/8/sm3.jpg','img/product/baby1/8/md3.jpg','img/product/baby1/8/lg3.jpg'),
(NULL,49,1,'img/product/baby1/8/sm4.jpg','img/product/baby1/8/md4.jpg','img/product/baby1/8/lg4.jpg'),
(NULL,49,1,'img/product/baby1/8/sm5.jpg','img/product/baby1/8/md5.jpg','img/product/baby1/8/lg5.jpg'),
(NULL,49,2,'img/product/baby1/8/sm6.jpg','img/product/baby1/8/md6.jpg','img/product/baby1/8/lg6.jpg'),
(NULL,49,2,'img/product/baby1/8/sm7.jpg','img/product/baby1/8/md7.jpg','img/product/baby1/8/lg7.jpg'),
(NULL,49,2,'img/product/baby1/8/sm8.jpg','img/product/baby1/8/md8.jpg','img/product/baby1/8/lg8.jpg'),
(NULL,49,2,'img/product/baby1/8/sm9.jpg','img/product/baby1/8/md9.jpg','img/product/baby1/8/lg9.jpg'),
(NULL,49,2,'img/product/baby1/8/sm10.jpg','img/product/baby1/8/md10.jpg','img/product/baby1/8/lg10.jpg'),
/*婴童->婴童护理*/
/*婴童->婴童卫浴*/

/*女士->女士服装服饰 50-66*/
(NULL,50,1,'img/product/women/1/sm1.jpg','img/product/women/1/md1.jpg','img/product/women/1/lg1.jpg'),
(NULL,50,1,'img/product/women/1/sm2.jpg','img/product/women/1/md2.jpg','img/product/women/1/lg2.jpg'),
(NULL,50,1,'img/product/women/1/sm3.jpg','img/product/women/1/md3.jpg','img/product/women/1/lg3.jpg'),
(NULL,50,1,'img/product/women/1/sm4.jpg','img/product/women/1/md4.jpg','img/product/women/1/lg4.jpg'),
(NULL,50,1,'img/product/women/1/sm5.jpg','img/product/women/1/md5.jpg','img/product/women/1/lg5.jpg'),
(NULL,51,1,'img/product/women/2/sm1.jpg','img/product/women/2/md1.jpg','img/product/women/2/lg1.jpg'),
(NULL,51,1,'img/product/women/2/sm2.jpg','img/product/women/2/md2.jpg','img/product/women/2/lg2.jpg'),
(NULL,51,1,'img/product/women/2/sm3.jpg','img/product/women/2/md3.jpg','img/product/women/2/lg3.jpg'),
(NULL,51,1,'img/product/women/2/sm4.jpg','img/product/women/2/md4.jpg','img/product/women/2/lg4.jpg'),
(NULL,51,1,'img/product/women/2/sm5.jpg','img/product/women/2/md5.jpg','img/product/women/2/lg5.jpg'),
(NULL,51,2,'img/product/women/2/sm6.jpg','img/product/women/2/md6.jpg','img/product/women/2/lg6.jpg'),
(NULL,51,2,'img/product/women/2/sm7.jpg','img/product/women/2/md7.jpg','img/product/women/2/lg8.jpg'),
(NULL,51,2,'img/product/women/2/sm8.jpg','img/product/women/2/md8.jpg','img/product/women/2/lg8.jpg'),
(NULL,51,2,'img/product/women/2/sm9.jpg','img/product/women/2/md9.jpg','img/product/women/2/lg4.jpg'),
(NULL,51,2,'img/product/women/2/sm10.jpg','img/product/women/2/md10.jpg','img/product/women/2/lg10.jpg'),
(NULL,51,3,'img/product/women/2/sm11.jpg','img/product/women/2/md11.jpg','img/product/women/2/lg11.jpg'),
(NULL,51,3,'img/product/women/2/sm12.jpg','img/product/women/2/md12.jpg','img/product/women/2/lg12.jpg'),
(NULL,51,3,'img/product/women/2/sm13.jpg','img/product/women/2/md13.jpg','img/product/women/2/lg13.jpg'),
(NULL,51,3,'img/product/women/2/sm14.jpg','img/product/women/2/md14.jpg','img/product/women/2/lg14.jpg'),
(NULL,51,3,'img/product/women/2/sm15.jpg','img/product/women/2/md15.jpg','img/product/women/2/lg15.jpg'),
(NULL,52,1,'img/product/women/3/sm1.jpg','img/product/women/3/md1.jpg','img/product/women/3/lg1.jpg'),
(NULL,52,1,'img/product/women/3/sm2.jpg','img/product/women/3/md2.jpg','img/product/women/3/lg2.jpg'),
(NULL,52,1,'img/product/women/3/sm3.jpg','img/product/women/3/md3.jpg','img/product/women/3/lg3.jpg'),
(NULL,52,1,'img/product/women/3/sm4.jpg','img/product/women/3/md4.jpg','img/product/women/3/lg4.jpg'),
(NULL,52,1,'img/product/women/3/sm5.jpg','img/product/women/3/md5.jpg','img/product/women/3/lg5.jpg'),
(NULL,52,2,'img/product/women/3/sm6.jpg','img/product/women/3/md6.jpg','img/product/women/3/lg6.jpg'),
(NULL,52,2,'img/product/women/3/sm7.jpg','img/product/women/3/md7.jpg','img/product/women/3/lg7.jpg'),
(NULL,52,2,'img/product/women/3/sm8.jpg','img/product/women/3/md8.jpg','img/product/women/3/lg8.jpg'),
(NULL,52,2,'img/product/women/3/sm9.jpg','img/product/women/3/md9.jpg','img/product/women/3/lg9.jpg'),
(NULL,52,2,'img/product/women/3/sm10.jpg','img/product/women/3/md10.jpg','img/product/women/3/lg10.jpg'),
(NULL,52,3,'img/product/women/3/sm11.jpg','img/product/women/3/md111.jpg','img/product/women/3/lg11.jpg'),
(NULL,52,3,'img/product/women/3/sm12.jpg','img/product/women/3/md12.jpg','img/product/women/3/lg12.jpg'),
(NULL,52,3,'img/product/women/3/sm13.jpg','img/product/women/3/md13.jpg','img/product/women/3/lg13.jpg'),
(NULL,52,3,'img/product/women/3/sm14.jpg','img/product/women/3/md14.jpg','img/product/women/3/lg14.jpg'),
(NULL,52,3,'img/product/women/3/sm15.jpg','img/product/women/3/md15.jpg','img/product/women/3/lg15.jpg'),
(NULL,52,4,'img/product/women/3/sm16.jpg','img/product/women/3/md116.jpg','img/product/women/3/lg16.jpg'),
(NULL,52,4,'img/product/women/3/sm17.jpg','img/product/women/3/md17.jpg','img/product/women/3/lg17.jpg'),
(NULL,52,4,'img/product/women/3/sm18.jpg','img/product/women/3/md18.jpg','img/product/women/3/lg18.jpg'),
(NULL,52,4,'img/product/women/3/sm19.jpg','img/product/women/3/md19.jpg','img/product/women/3/lg19.jpg'),
(NULL,52,4,'img/product/women/3/sm20.jpg','img/product/women/3/md20.jpg','img/product/women/3/lg20.jpg'),
(NULL,53,1,'img/product/women/4/sm1.jpg','img/product/women/4/md16.jpg','img/product/women/4/lg1.jpg'),
(NULL,53,1,'img/product/women/4/sm2.jpg','img/product/women/4/md2.jpg','img/product/women/4/lg2.jpg'),
(NULL,53,1,'img/product/women/4/sm3.jpg','img/product/women/4/md3.jpg','img/product/women/4/lg3.jpg'),
(NULL,53,1,'img/product/women/4/sm4.jpg','img/product/women/4/md4.jpg','img/product/women/4/lg4.jpg'),
(NULL,53,1,'img/product/women/4/sm5.jpg','img/product/women/4/md5.jpg','img/product/women/4/lg5.jpg'),
(NULL,53,2,'img/product/women/4/sm6.jpg','img/product/women/4/md6.jpg','img/product/women/4/lg6.jpg'),
(NULL,53,2,'img/product/women/4/sm7.jpg','img/product/women/4/md7.jpg','img/product/women/4/lg7.jpg'),
(NULL,53,2,'img/product/women/4/sm8.jpg','img/product/women/4/md8.jpg','img/product/women/4/lg8.jpg'),
(NULL,53,2,'img/product/women/4/sm9.jpg','img/product/women/4/md9.jpg','img/product/women/4/lg9.jpg'),
(NULL,53,2,'img/product/women/4/sm10.jpg','img/product/women/4/md10.jpg','img/product/women/4/lg10.jpg'),
(NULL,54,1,'img/product/women/5/sm1.jpg','img/product/women/5/md16.jpg','img/product/women/5/lg1.jpg'),
(NULL,54,1,'img/product/women/5/sm2.jpg','img/product/women/5/md2.jpg','img/product/women/5/lg2.jpg'),
(NULL,54,1,'img/product/women/5/sm3.jpg','img/product/women/5/md3.jpg','img/product/women/5/lg3.jpg'),
(NULL,54,1,'img/product/women/5/sm4.jpg','img/product/women/5/md4.jpg','img/product/women/5/lg4.jpg'),
(NULL,54,1,'img/product/women/5/sm5.jpg','img/product/women/5/md5.jpg','img/product/women/5/lg5.jpg'),
(NULL,54,2,'img/product/women/5/sm6.jpg','img/product/women/5/md6.jpg','img/product/women/5/lg6.jpg'),
(NULL,54,2,'img/product/women/5/sm7.jpg','img/product/women/5/md7.jpg','img/product/women/5/lg7.jpg'),
(NULL,54,2,'img/product/women/5/sm8.jpg','img/product/women/5/md8.jpg','img/product/women/5/lg8.jpg'),
(NULL,54,2,'img/product/women/5/sm9.jpg','img/product/women/5/md9.jpg','img/product/women/5/lg9.jpg'),
(NULL,54,2,'img/product/women/5/sm10.jpg','img/product/women/5/md10.jpg','img/product/women/5/lg10.jpg'),
(NULL,55,1,'img/product/women/6/sm1.jpg','img/product/women/6/md1.jpg','img/product/women/6/lg1.jpg'),
(NULL,55,1,'img/product/women/6/sm2.jpg','img/product/women/6/md2.jpg','img/product/women/6/lg2.jpg'),
(NULL,55,1,'img/product/women/6/sm3.jpg','img/product/women/6/md3.jpg','img/product/women/6/lg3.jpg'),
(NULL,55,1,'img/product/women/6/sm4.jpg','img/product/women/6/md4.jpg','img/product/women/6/lg4.jpg'),
(NULL,55,1,'img/product/women/6/sm5.jpg','img/product/women/6/md5.jpg','img/product/women/6/lg5.jpg'),
(NULL,55,2,'img/product/women/6/sm6.jpg','img/product/women/6/md6.jpg','img/product/women/6/lg6.jpg'),
(NULL,55,2,'img/product/women/6/sm7.jpg','img/product/women/6/md7.jpg','img/product/women/6/lg7.jpg'),
(NULL,55,2,'img/product/women/6/sm8.jpg','img/product/women/6/md8.jpg','img/product/women/6/lg8.jpg'),
(NULL,55,2,'img/product/women/6/sm9.jpg','img/product/women/6/md9.jpg','img/product/women/6/lg9.jpg'),
(NULL,55,2,'img/product/women/6/sm10.jpg','img/product/women/6/md10.jpg','img/product/women/6/lg10.jpg'),
(NULL,56,1,'img/product/women/7/sm1.jpg','img/product/women/7/md16.jpg','img/product/women/7/lg1.jpg'),
(NULL,56,1,'img/product/women/7/sm2.jpg','img/product/women/7/md2.jpg','img/product/women/7/lg2.jpg'),
(NULL,56,1,'img/product/women/7/sm3.jpg','img/product/women/7/md3.jpg','img/product/women/7/lg3.jpg'),
(NULL,56,1,'img/product/women/7/sm4.jpg','img/product/women/7/md4.jpg','img/product/women/7/lg4.jpg'),
(NULL,56,1,'img/product/women/7/sm5.jpg','img/product/women/7/md5.jpg','img/product/women/7/lg5.jpg'),
(NULL,56,2,'img/product/women/7/sm6.jpg','img/product/women/7/md6.jpg','img/product/women/7/lg6.jpg'),
(NULL,56,2,'img/product/women/7/sm7.jpg','img/product/women/7/md7.jpg','img/product/women/7/lg7.jpg'),
(NULL,56,2,'img/product/women/7/sm8.jpg','img/product/women/7/md8.jpg','img/product/women/7/lg8.jpg'),
(NULL,56,2,'img/product/women/7/sm9.jpg','img/product/women/7/md9.jpg','img/product/women/7/lg9.jpg'),
(NULL,56,2,'img/product/women/7/sm10.jpg','img/product/women/7/md10.jpg','img/product/women/7/lg10.jpg'),
(NULL,57,1,'img/product/women/8/sm1.jpg','img/product/women/8/md16.jpg','img/product/women/8/lg1.jpg'),
(NULL,57,1,'img/product/women/8/sm2.jpg','img/product/women/8/md2.jpg','img/product/women/8/lg2.jpg'),
(NULL,57,1,'img/product/women/8/sm3.jpg','img/product/women/8/md3.jpg','img/product/women/8/lg3.jpg'),
(NULL,57,1,'img/product/women/8/sm4.jpg','img/product/women/8/md4.jpg','img/product/women/8/lg4.jpg'),
(NULL,57,1,'img/product/women/8/sm5.jpg','img/product/women/8/md5.jpg','img/product/women/8/lg5.jpg'),
(NULL,57,2,'img/product/women/8/sm6.jpg','img/product/women/8/md6.jpg','img/product/women/8/lg6.jpg'),
(NULL,57,2,'img/product/women/8/sm7.jpg','img/product/women/8/md7.jpg','img/product/women/8/lg7.jpg'),
(NULL,57,2,'img/product/women/8/sm8.jpg','img/product/women/8/md8.jpg','img/product/women/8/lg8.jpg'),
(NULL,57,2,'img/product/women/8/sm9.jpg','img/product/women/8/md9.jpg','img/product/women/8/lg9.jpg'),
(NULL,57,2,'img/product/women/8/sm10.jpg','img/product/women/8/md10.jpg','img/product/women/8/lg10.jpg'),
(NULL,58,1,'img/product/women/9/sm1.jpg','img/product/women/9/md16.jpg','img/product/women/9/lg1.jpg'),
(NULL,58,1,'img/product/women/9/sm2.jpg','img/product/women/9/md2.jpg','img/product/women/9/lg2.jpg'),
(NULL,58,1,'img/product/women/9/sm3.jpg','img/product/women/9/md3.jpg','img/product/women/9/lg3.jpg'),
(NULL,58,1,'img/product/women/9/sm4.jpg','img/product/women/9/md4.jpg','img/product/women/9/lg4.jpg'),
(NULL,58,1,'img/product/women/9/sm5.jpg','img/product/women/9/md5.jpg','img/product/women/9/lg5.jpg'),
(NULL,58,2,'img/product/women/9/sm6.jpg','img/product/women/9/md6.jpg','img/product/women/9/lg6.jpg'),
(NULL,58,2,'img/product/women/9/sm7.jpg','img/product/women/9/md7.jpg','img/product/women/9/lg7.jpg'),
(NULL,58,2,'img/product/women/9/sm8.jpg','img/product/women/9/md8.jpg','img/product/women/9/lg8.jpg'),
(NULL,58,2,'img/product/women/9/sm9.jpg','img/product/women/9/md9.jpg','img/product/women/9/lg9.jpg'),
(NULL,58,2,'img/product/women/9/sm10.jpg','img/product/women/9/md10.jpg','img/product/women/9/lg10.jpg'),
(NULL,59,1,'img/product/women/10/sm1.jpg','img/product/women/10/md16.jpg','img/product/women/10/lg1.jpg'),
(NULL,59,1,'img/product/women/10/sm2.jpg','img/product/women/10/md2.jpg','img/product/women/10/lg2.jpg'),
(NULL,59,1,'img/product/women/10/sm3.jpg','img/product/women/10/md3.jpg','img/product/women/10/lg3.jpg'),
(NULL,59,1,'img/product/women/10/sm4.jpg','img/product/women/10/md4.jpg','img/product/women/10/lg4.jpg'),
(NULL,59,1,'img/product/women/10/sm5.jpg','img/product/women/10/md5.jpg','img/product/women/10/lg5.jpg'),
(NULL,59,2,'img/product/women/10/sm6.jpg','img/product/women/10/md6.jpg','img/product/women/10/lg6.jpg'),
(NULL,59,2,'img/product/women/10/sm7.jpg','img/product/women/10/md7.jpg','img/product/women/10/lg7.jpg'),
(NULL,59,2,'img/product/women/10/sm8.jpg','img/product/women/10/md8.jpg','img/product/women/10/lg8.jpg'),
(NULL,59,2,'img/product/women/10/sm9.jpg','img/product/women/10/md9.jpg','img/product/women/10/lg9.jpg'),
(NULL,59,2,'img/product/women/10/sm10.jpg','img/product/women/10/md10.jpg','img/product/women/10/lg10.jpg'),
(NULL,60,1,'img/product/women/11/sm1.jpg','img/product/women/11/md16.jpg','img/product/women/11/lg1.jpg'),
(NULL,60,1,'img/product/women/11/sm2.jpg','img/product/women/11/md2.jpg','img/product/women/11/lg2.jpg'),
(NULL,60,1,'img/product/women/11/sm3.jpg','img/product/women/11/md3.jpg','img/product/women/11/lg3.jpg'),
(NULL,60,1,'img/product/women/11/sm4.jpg','img/product/women/11/md4.jpg','img/product/women/11/lg4.jpg'),
(NULL,60,1,'img/product/women/11/sm5.jpg','img/product/women/11/md5.jpg','img/product/women/11/lg5.jpg'),
(NULL,60,2,'img/product/women/11/sm6.jpg','img/product/women/11/md6.jpg','img/product/women/11/lg6.jpg'),
(NULL,60,2,'img/product/women/11/sm7.jpg','img/product/women/11/md7.jpg','img/product/women/11/lg7.jpg'),
(NULL,60,2,'img/product/women/11/sm8.jpg','img/product/women/11/md8.jpg','img/product/women/11/lg8.jpg'),
(NULL,60,2,'img/product/women/11/sm9.jpg','img/product/women/11/md9.jpg','img/product/women/11/lg9.jpg'),
(NULL,60,2,'img/product/women/11/sm10.jpg','img/product/women/11/md10.jpg','img/product/women/11/lg10.jpg'),
(NULL,61,1,'img/product/women/12/sm1.jpg','img/product/women/12/md1.jpg','img/product/women/12/lg1.jpg'),
(NULL,61,1,'img/product/women/12/sm2.jpg','img/product/women/12/md2.jpg','img/product/women/12/lg2.jpg'),
(NULL,61,1,'img/product/women/12/sm3.jpg','img/product/women/12/md3.jpg','img/product/women/12/lg3.jpg'),
(NULL,61,1,'img/product/women/12/sm4.jpg','img/product/women/12/md4.jpg','img/product/women/12/lg4.jpg'),
(NULL,61,1,'img/product/women/12/sm5.jpg','img/product/women/12/md5.jpg','img/product/women/12/lg5.jpg'),
(NULL,61,2,'img/product/women/12/sm6.jpg','img/product/women/12/md6.jpg','img/product/women/12/lg6.jpg'),
(NULL,61,2,'img/product/women/12/sm7.jpg','img/product/women/12/md7.jpg','img/product/women/12/lg7.jpg'),
(NULL,61,2,'img/product/women/12/sm8.jpg','img/product/women/12/md8.jpg','img/product/women/12/lg8.jpg'),
(NULL,61,2,'img/product/women/12/sm9.jpg','img/product/women/12/md9.jpg','img/product/women/12/lg9.jpg'),
(NULL,61,2,'img/product/women/12/sm10.jpg','img/product/women/12/md10.jpg','img/product/women/12/lg10.jpg'),
(NULL,61,3,'img/product/women/12/sm11.jpg','img/product/women/12/md111.jpg','img/product/women/12/lg11.jpg'),
(NULL,61,3,'img/product/women/12/sm12.jpg','img/product/women/12/md12.jpg','img/product/women/12/lg12.jpg'),
(NULL,61,3,'img/product/women/12/sm13.jpg','img/product/women/12/md13.jpg','img/product/women/12/lg13.jpg'),
(NULL,61,3,'img/product/women/12/sm14.jpg','img/product/women/12/md14.jpg','img/product/women/12/lg14.jpg'),
(NULL,61,3,'img/product/women/12/sm15.jpg','img/product/women/12/md15.jpg','img/product/women/12/lg15.jpg'),
(NULL,62,1,'img/product/women/13/sm1.jpg','img/product/women/13/md1.jpg','img/product/women/13/lg1.jpg'),
(NULL,62,1,'img/product/women/13/sm2.jpg','img/product/women/13/md2.jpg','img/product/women/13/lg2.jpg'),
(NULL,62,1,'img/product/women/13/sm3.jpg','img/product/women/13/md3.jpg','img/product/women/13/lg3.jpg'),
(NULL,62,1,'img/product/women/13/sm4.jpg','img/product/women/13/md4.jpg','img/product/women/13/lg4.jpg'),
(NULL,62,1,'img/product/women/13/sm5.jpg','img/product/women/13/md5.jpg','img/product/women/13/lg5.jpg'),
(NULL,63,1,'img/product/women/14/sm1.jpg','img/product/women/14/md1.jpg','img/product/women/14/lg1.jpg'),
(NULL,63,1,'img/product/women/14/sm2.jpg','img/product/women/14/md2.jpg','img/product/women/14/lg2.jpg'),
(NULL,63,1,'img/product/women/14/sm3.jpg','img/product/women/14/md3.jpg','img/product/women/14/lg3.jpg'),
(NULL,63,1,'img/product/women/14/sm4.jpg','img/product/women/14/md4.jpg','img/product/women/14/lg4.jpg'),
(NULL,63,1,'img/product/women/14/sm5.jpg','img/product/women/14/md5.jpg','img/product/women/14/lg5.jpg'),
(NULL,63,2,'img/product/women/14/sm6.jpg','img/product/women/14/md6.jpg','img/product/women/14/lg6.jpg'),
(NULL,63,2,'img/product/women/14/sm7.jpg','img/product/women/14/md7.jpg','img/product/women/14/lg7.jpg'),
(NULL,63,2,'img/product/women/14/sm8.jpg','img/product/women/14/md8.jpg','img/product/women/14/lg8.jpg'),
(NULL,63,2,'img/product/women/14/sm9.jpg','img/product/women/14/md9.jpg','img/product/women/14/lg9.jpg'),
(NULL,63,2,'img/product/women/14/sm10.jpg','img/product/women/14/md10.jpg','img/product/women/14/lg10.jpg'),
(NULL,64,1,'img/product/women/15/sm1.jpg','img/product/women/15/md1.jpg','img/product/women/15/lg1.jpg'),
(NULL,64,1,'img/product/women/15/sm2.jpg','img/product/women/15/md2.jpg','img/product/women/15/lg2.jpg'),
(NULL,64,1,'img/product/women/15/sm3.jpg','img/product/women/15/md3.jpg','img/product/women/15/lg3.jpg'),
(NULL,64,1,'img/product/women/15/sm4.jpg','img/product/women/15/md4.jpg','img/product/women/15/lg4.jpg'),
(NULL,64,1,'img/product/women/15/sm5.jpg','img/product/women/15/md5.jpg','img/product/women/15/lg5.jpg'),
(NULL,65,1,'img/product/women/16/sm1.jpg','img/product/women/16/md1.jpg','img/product/women/16/lg1.jpg'),
(NULL,65,1,'img/product/women/16/sm2.jpg','img/product/women/16/md2.jpg','img/product/women/16/lg2.jpg'),
(NULL,65,1,'img/product/women/16/sm3.jpg','img/product/women/16/md3.jpg','img/product/women/16/lg3.jpg'),
(NULL,65,1,'img/product/women/16/sm4.jpg','img/product/women/16/md4.jpg','img/product/women/16/lg4.jpg'),
(NULL,65,1,'img/product/women/16/sm5.jpg','img/product/women/16/md5.jpg','img/product/women/16/lg5.jpg'),
(NULL,65,2,'img/product/women/16/sm6.jpg','img/product/women/16/md6.jpg','img/product/women/16/lg6.jpg'),
(NULL,65,2,'img/product/women/16/sm7.jpg','img/product/women/16/md7.jpg','img/product/women/16/lg7.jpg'),
(NULL,65,2,'img/product/women/16/sm8.jpg','img/product/women/16/md8.jpg','img/product/women/16/lg8.jpg'),
(NULL,65,2,'img/product/women/16/sm9.jpg','img/product/women/16/md9.jpg','img/product/women/16/lg9.jpg'),
(NULL,65,2,'img/product/women/16/sm10.jpg','img/product/women/16/md10.jpg','img/product/women/16/lg10.jpg'),
(NULL,66,1,'img/product/women/17/sm1.jpg','img/product/women/17/md1.jpg','img/product/women/17/lg1.jpg'),
(NULL,66,1,'img/product/women/17/sm2.jpg','img/product/women/17/md2.jpg','img/product/women/17/lg2.jpg'),
(NULL,66,1,'img/product/women/17/sm3.jpg','img/product/women/17/md3.jpg','img/product/women/17/lg3.jpg'),
(NULL,66,1,'img/product/women/17/sm4.jpg','img/product/women/17/md4.jpg','img/product/women/17/lg4.jpg'),
(NULL,66,1,'img/product/women/17/sm5.jpg','img/product/women/17/md5.jpg','img/product/women/17/lg5.jpg'),
/*女士->美容用品 67-74*/
(NULL,67,1,'img/product/women1/1/sm1.jpg','img/product/women1/1/md1.jpg','img/product/women1/1/lg1.jpg'),
(NULL,67,1,'img/product/women1/1/sm2.jpg','img/product/women1/1/md2.jpg','img/product/women1/1/lg2.jpg'),
(NULL,67,1,'img/product/women1/1/sm3.jpg','img/product/women1/1/md3.jpg','img/product/women1/1/lg3.jpg'),
(NULL,67,1,'img/product/women1/1/sm4.jpg','img/product/women1/1/md4.jpg','img/product/women1/1/lg4.jpg'),
(NULL,67,1,'img/product/women1/1/sm5.jpg','img/product/women1/1/md5.jpg','img/product/women1/1/lg5.jpg'),
(NULL,68,1,'img/product/women1/2/sm1.jpg','img/product/women1/2/md1.jpg','img/product/women1/2/lg1.jpg'),
(NULL,68,1,'img/product/women1/2/sm2.jpg','img/product/women1/2/md2.jpg','img/product/women1/2/lg2.jpg'),
(NULL,68,1,'img/product/women1/2/sm3.jpg','img/product/women1/2/md3.jpg','img/product/women1/2/lg3.jpg'),
(NULL,68,1,'img/product/women1/2/sm4.jpg','img/product/women1/2/md4.jpg','img/product/women1/2/lg4.jpg'),
(NULL,68,1,'img/product/women1/2/sm5.jpg','img/product/women1/2/md5.jpg','img/product/women1/2/lg5.jpg'),
(NULL,69,1,'img/product/women1/3/sm1.jpg','img/product/women1/3/md1.jpg','img/product/women1/3/lg1.jpg'),
(NULL,69,1,'img/product/women1/3/sm2.jpg','img/product/women1/3/md2.jpg','img/product/women1/3/lg2.jpg'),
(NULL,69,1,'img/product/women1/3/sm3.jpg','img/product/women1/3/md3.jpg','img/product/women1/3/lg3.jpg'),
(NULL,69,1,'img/product/women1/3/sm4.jpg','img/product/women1/3/md4.jpg','img/product/women1/3/lg4.jpg'),
(NULL,69,1,'img/product/women1/3/sm5.jpg','img/product/women1/3/md5.jpg','img/product/women1/3/lg5.jpg'),
(NULL,70,1,'img/product/women1/4/sm1.jpg','img/product/women1/4/md1.jpg','img/product/women1/4/lg1.jpg'),
(NULL,70,1,'img/product/women1/4/sm2.jpg','img/product/women1/4/md2.jpg','img/product/women1/4/lg2.jpg'),
(NULL,70,1,'img/product/women1/4/sm3.jpg','img/product/women1/4/md3.jpg','img/product/women1/4/lg3.jpg'),
(NULL,70,1,'img/product/women1/4/sm4.jpg','img/product/women1/4/md4.jpg','img/product/women1/4/lg4.jpg'),
(NULL,70,1,'img/product/women1/4/sm5.jpg','img/product/women1/4/md5.jpg','img/product/women1/4/lg5.jpg'),
(NULL,71,1,'img/product/women1/5/sm1.jpg','img/product/women1/5/md1.jpg','img/product/women1/5/lg1.jpg'),
(NULL,71,1,'img/product/women1/5/sm2.jpg','img/product/women1/5/md2.jpg','img/product/women1/5/lg2.jpg'),
(NULL,71,1,'img/product/women1/5/sm3.jpg','img/product/women1/5/md3.jpg','img/product/women1/5/lg3.jpg'),
(NULL,71,1,'img/product/women1/5/sm4.jpg','img/product/women1/5/md4.jpg','img/product/women1/5/lg4.jpg'),
(NULL,71,1,'img/product/women1/5/sm5.jpg','img/product/women1/5/md5.jpg','img/product/women1/5/lg5.jpg'),
(NULL,72,1,'img/product/women1/6/sm1.jpg','img/product/women1/6/md1.jpg','img/product/women1/6/lg1.jpg'),
(NULL,72,1,'img/product/women1/6/sm2.jpg','img/product/women1/6/md2.jpg','img/product/women1/6/lg2.jpg'),
(NULL,72,1,'img/product/women1/6/sm3.jpg','img/product/women1/6/md3.jpg','img/product/women1/6/lg3.jpg'),
(NULL,72,1,'img/product/women1/6/sm4.jpg','img/product/women1/6/md4.jpg','img/product/women1/6/lg4.jpg'),
(NULL,73,1,'img/product/women1/7/sm1.jpg','img/product/women1/7/md1.jpg','img/product/women1/7/lg1.jpg'),
(NULL,73,1,'img/product/women1/7/sm2.jpg','img/product/women1/7/md2.jpg','img/product/women1/7/lg2.jpg'),
(NULL,73,1,'img/product/women1/7/sm3.jpg','img/product/women1/7/md3.jpg','img/product/women1/7/lg3.jpg'),
(NULL,73,1,'img/product/women1/7/sm4.jpg','img/product/women1/7/md4.jpg','img/product/women1/7/lg4.jpg'),
(NULL,73,1,'img/product/women1/7/sm5.jpg','img/product/women1/7/md5.jpg','img/product/women1/7/lg5.jpg'),
(NULL,74,1,'img/product/women1/8/sm1.jpg','img/product/women1/8/md1.jpg','img/product/women1/8/lg1.jpg'),
(NULL,74,1,'img/product/women1/8/sm2.jpg','img/product/women1/8/md2.jpg','img/product/women1/8/lg2.jpg'),
(NULL,74,1,'img/product/women1/8/sm3.jpg','img/product/women1/8/md3.jpg','img/product/women1/8/lg3.jpg'),
(NULL,74,1,'img/product/women1/8/sm4.jpg','img/product/women1/8/md4.jpg','img/product/women1/8/lg4.jpg'),
(NULL,74,1,'img/product/women1/8/sm5.jpg','img/product/women1/8/md5.jpg','img/product/women1/8/lg5.jpg'),

/*女士->孕产用品 75-79*/
(NULL,75,1,'img/product/women2/1/sm1.jpg','img/product/women2/1/md1.jpg','img/product/women2/1/lg1.jpg'),
(NULL,75,1,'img/product/women2/1/sm2.jpg','img/product/women2/1/md2.jpg','img/product/women2/1/lg2.jpg'),
(NULL,75,1,'img/product/women2/1/sm3.jpg','img/product/women2/1/md3.jpg','img/product/women2/1/lg3.jpg'),
(NULL,75,1,'img/product/women2/1/sm4.jpg','img/product/women2/1/md4.jpg','img/product/women2/1/lg4.jpg'),
(NULL,75,1,'img/product/women2/1/sm5.jpg','img/product/women2/1/md5.jpg','img/product/women2/1/lg5.jpg'),
(NULL,76,1,'img/product/women2/2/sm1.jpg','img/product/women2/2/md1.jpg','img/product/women2/2/lg1.jpg'),
(NULL,76,1,'img/product/women2/2/sm2.jpg','img/product/women2/2/md2.jpg','img/product/women2/2/lg2.jpg'),
(NULL,76,1,'img/product/women2/2/sm3.jpg','img/product/women2/2/md3.jpg','img/product/women2/2/lg3.jpg'),
(NULL,76,1,'img/product/women2/2/sm4.jpg','img/product/women2/2/md4.jpg','img/product/women2/2/lg4.jpg'),
(NULL,76,1,'img/product/women2/2/sm5.jpg','img/product/women2/2/md5.jpg','img/product/women2/2/lg5.jpg'),
(NULL,77,1,'img/product/women2/3/sm1.jpg','img/product/women2/3/md1.jpg','img/product/women2/3/lg1.jpg'),
(NULL,77,1,'img/product/women2/3/sm2.jpg','img/product/women2/3/md2.jpg','img/product/women2/3/lg2.jpg'),
(NULL,77,1,'img/product/women2/3/sm3.jpg','img/product/women2/3/md3.jpg','img/product/women2/3/lg3.jpg'),
(NULL,77,1,'img/product/women2/3/sm4.jpg','img/product/women2/3/md4.jpg','img/product/women2/3/lg4.jpg'),
(NULL,77,1,'img/product/women2/3/sm5.jpg','img/product/women2/3/md5.jpg','img/product/women2/3/lg5.jpg'),
(NULL,78,1,'img/product/women2/4/sm1.jpg','img/product/women2/4/md1.jpg','img/product/women2/4/lg1.jpg'),
(NULL,78,1,'img/product/women2/4/sm2.jpg','img/product/women2/4/md2.jpg','img/product/women2/4/lg2.jpg'),
(NULL,78,1,'img/product/women2/4/sm3.jpg','img/product/women2/4/md3.jpg','img/product/women2/4/lg3.jpg'),
(NULL,78,1,'img/product/women2/4/sm4.jpg','img/product/women2/4/md4.jpg','img/product/women2/4/lg4.jpg'),
(NULL,78,1,'img/product/women2/4/sm5.jpg','img/product/women2/4/md5.jpg','img/product/women2/4/lg5.jpg'),
(NULL,79,1,'img/product/women2/5/sm1.jpg','img/product/women2/5/md1.jpg','img/product/women2/5/lg1.jpg'),
(NULL,79,1,'img/product/women2/5/sm2.jpg','img/product/women2/5/md2.jpg','img/product/women2/5/lg2.jpg'),
(NULL,79,1,'img/product/women2/5/sm3.jpg','img/product/women2/5/md3.jpg','img/product/women2/5/lg3.jpg'),
(NULL,79,1,'img/product/women2/5/sm4.jpg','img/product/women2/5/md4.jpg','img/product/women2/5/lg4.jpg'),
(NULL,79,1,'img/product/women2/5/sm5.jpg','img/product/women2/5/md5.jpg','img/product/women2/5/lg5.jpg'),
/*家居->厨房用品 80-81*/
(NULL,80,1,'img/product/home/1/sm1.jpg','img/product/home/1/md1.jpg','img/product/home/1/lg1.jpg'),
(NULL,80,1,'img/product/home/1/sm2.jpg','img/product/home/1/md2.jpg','img/product/home/1/lg2.jpg'),
(NULL,80,1,'img/product/home/1/sm3.jpg','img/product/home/1/md3.jpg','img/product/home/1/lg3.jpg'),
(NULL,80,1,'img/product/home/1/sm4.jpg','img/product/home/1/md4.jpg','img/product/home/1/lg4.jpg'),
(NULL,80,1,'img/product/home/1/sm5.jpg','img/product/home/1/md5.jpg','img/product/home/1/lg5.jpg'),
(NULL,81,1,'img/product/home/2/sm1.jpg','img/product/home/2/md1.jpg','img/product/home/2/lg1.jpg'),
(NULL,81,1,'img/product/home/2/sm2.jpg','img/product/home/2/md2.jpg','img/product/home/2/lg2.jpg'),
(NULL,81,1,'img/product/home/2/sm3.jpg','img/product/home/2/md3.jpg','img/product/home/2/lg3.jpg'),
(NULL,81,1,'img/product/home/2/sm4.jpg','img/product/home/2/md4.jpg','img/product/home/2/lg4.jpg'),
(NULL,81,1,'img/product/home/2/sm5.jpg','img/product/home/2/md5.jpg','img/product/home/2/lg5.jpg'),
/*家居->床上用品 82-86*/
(NULL,82,1,'img/product/home1/1/sm1.jpg','img/product/home1/1/md1.jpg','img/product/home1/1/lg1.jpg'),
(NULL,82,1,'img/product/home1/1/sm2.jpg','img/product/home1/1/md2.jpg','img/product/home1/1/lg2.jpg'),
(NULL,82,1,'img/product/home1/1/sm3.jpg','img/product/home1/1/md3.jpg','img/product/home1/1/lg3.jpg'),
(NULL,82,1,'img/product/home1/1/sm4.jpg','img/product/home1/1/md4.jpg','img/product/home1/1/lg4.jpg'),
(NULL,82,1,'img/product/home1/1/sm5.jpg','img/product/home1/1/md5.jpg','img/product/home1/1/lg5.jpg'),
(NULL,82,2,'img/product/home1/1/sm6.jpg','img/product/home/1/md6.jpg','img/product/home/1/lg6.jpg'),
(NULL,82,2,'img/product/home1/1/sm7.jpg','img/product/home/1/md7.jpg','img/product/home/1/lg7.jpg'),
(NULL,82,2,'img/product/home1/1/sm8.jpg','img/product/home/1/md8.jpg','img/product/home/1/lg8.jpg'),
(NULL,82,2,'img/product/home1/1/sm9.jpg','img/product/home/1/md9.jpg','img/product/home/1/lg9.jpg'),
(NULL,82,2,'img/product/home1/1/sm10.jpg','img/product/home/1/md10.jpg','img/product/home/1/lg10.jpg'),
(NULL,83,1,'img/product/home1/2/sm1.jpg','img/product/home1/2/md1.jpg','img/product/home1/2/lg1.jpg'),
(NULL,83,1,'img/product/home1/2/sm2.jpg','img/product/home1/2/md2.jpg','img/product/home1/2/lg2.jpg'),
(NULL,83,1,'img/product/home1/2/sm3.jpg','img/product/home1/2/md3.jpg','img/product/home1/2/lg3.jpg'),
(NULL,83,1,'img/product/home1/2/sm4.jpg','img/product/home1/2/md4.jpg','img/product/home1/2/lg4.jpg'),
(NULL,83,1,'img/product/home1/2/sm5.jpg','img/product/home1/2/md5.jpg','img/product/home1/2/lg5.jpg'),
(NULL,84,1,'img/product/home1/3/sm1.jpg','img/product/home1/3/md1.jpg','img/product/home1/3/lg1.jpg'),
(NULL,84,1,'img/product/home1/3/sm2.jpg','img/product/home1/3/md2.jpg','img/product/home1/3/lg2.jpg'),
(NULL,84,1,'img/product/home1/3/sm3.jpg','img/product/home1/3/md3.jpg','img/product/home1/3/lg3.jpg'),
(NULL,84,1,'img/product/home1/3/sm4.jpg','img/product/home1/3/md4.jpg','img/product/home1/3/lg4.jpg'),
(NULL,84,1,'img/product/home1/3/sm5.jpg','img/product/home1/3/md5.jpg','img/product/home1/3/lg5.jpg'),
(NULL,85,1,'img/product/home1/4/sm1.jpg','img/product/home1/4/md1.jpg','img/product/home1/4/lg1.jpg'),
(NULL,85,1,'img/product/home1/4/sm2.jpg','img/product/home1/4/md2.jpg','img/product/home1/4/lg2.jpg'),
(NULL,85,1,'img/product/home1/4/sm3.jpg','img/product/home1/4/md3.jpg','img/product/home1/4/lg3.jpg'),
(NULL,85,1,'img/product/home1/4/sm4.jpg','img/product/home1/4/md4.jpg','img/product/home1/4/lg4.jpg'),
(NULL,85,1,'img/product/home1/4/sm5.jpg','img/product/home1/4/md5.jpg','img/product/home1/4/lg5.jpg'),
(NULL,86,1,'img/product/home1/5/sm1.jpg','img/product/home1/5/md1.jpg','img/product/home1/5/lg1.jpg'),
(NULL,86,1,'img/product/home1/5/sm2.jpg','img/product/home1/5/md2.jpg','img/product/home1/5/lg2.jpg'),
(NULL,86,1,'img/product/home1/5/sm3.jpg','img/product/home1/5/md3.jpg','img/product/home1/5/lg3.jpg'),
(NULL,86,1,'img/product/home1/5/sm4.jpg','img/product/home1/5/md4.jpg','img/product/home1/5/lg4.jpg'),
(NULL,86,1,'img/product/home1/5/sm5.jpg','img/product/home1/5/md5.jpg','img/product/home1/5/lg5.jpg'),

/*家居->护理用品 87-98*/
(NULL,87,1,'img/product/home2/1/sm1.jpg','img/product/home2/1/md1.jpg','img/product/home2/1/lg1.jpg'),
(NULL,87,1,'img/product/home2/1/sm2.jpg','img/product/home2/1/md2.jpg','img/product/home2/1/lg2.jpg'),
(NULL,87,1,'img/product/home2/1/sm3.jpg','img/product/home2/1/md3.jpg','img/product/home2/1/lg3.jpg'),
(NULL,87,1,'img/product/home2/1/sm4.jpg','img/product/home2/1/md4.jpg','img/product/home2/1/lg4.jpg'),
(NULL,87,1,'img/product/home2/1/sm5.jpg','img/product/home2/1/md5.jpg','img/product/home2/1/lg5.jpg'),
(NULL,88,1,'img/product/home2/2/sm1.jpg','img/product/home2/2/md1.jpg','img/product/home2/2/lg1.jpg'),
(NULL,88,1,'img/product/home2/2/sm2.jpg','img/product/home2/2/md2.jpg','img/product/home2/2/lg2.jpg'),
(NULL,88,1,'img/product/home2/2/sm3.jpg','img/product/home2/2/md3.jpg','img/product/home2/2/lg3.jpg'),
(NULL,88,1,'img/product/home2/2/sm4.jpg','img/product/home2/2/md4.jpg','img/product/home2/2/lg4.jpg'),
(NULL,88,1,'img/product/home2/2/sm5.jpg','img/product/home2/2/md5.jpg','img/product/home2/2/lg5.jpg'),
(NULL,89,1,'img/product/home2/3/sm1.jpg','img/product/home2/3/md1.jpg','img/product/home2/3/lg1.jpg'),
(NULL,89,1,'img/product/home2/3/sm2.jpg','img/product/home2/3/md2.jpg','img/product/home2/3/lg2.jpg'),
(NULL,89,1,'img/product/home2/3/sm3.jpg','img/product/home2/3/md3.jpg','img/product/home2/3/lg3.jpg'),
(NULL,89,1,'img/product/home2/3/sm4.jpg','img/product/home2/3/md4.jpg','img/product/home2/3/lg4.jpg'),
(NULL,89,1,'img/product/home2/3/sm5.jpg','img/product/home2/3/md5.jpg','img/product/home2/3/lg5.jpg'),
(NULL,90,1,'img/product/home2/4/sm1.jpg','img/product/home2/4/md1.jpg','img/product/home2/4/lg1.jpg'),
(NULL,90,1,'img/product/home2/4/sm2.jpg','img/product/home2/4/md2.jpg','img/product/home2/4/lg2.jpg'),
(NULL,90,1,'img/product/home2/4/sm3.jpg','img/product/home2/4/md3.jpg','img/product/home2/4/lg3.jpg'),
(NULL,90,1,'img/product/home2/4/sm4.jpg','img/product/home2/4/md4.jpg','img/product/home2/4/lg4.jpg'),
(NULL,90,1,'img/product/home2/4/sm5.jpg','img/product/home2/4/md5.jpg','img/product/home2/4/lg5.jpg'),
(NULL,91,1,'img/product/home2/5/sm1.jpg','img/product/home2/5/md1.jpg','img/product/home2/5/lg1.jpg'),
(NULL,91,1,'img/product/home2/5/sm2.jpg','img/product/home2/5/md2.jpg','img/product/home2/5/lg2.jpg'),
(NULL,91,1,'img/product/home2/5/sm3.jpg','img/product/home2/5/md3.jpg','img/product/home2/5/lg3.jpg'),
(NULL,91,1,'img/product/home2/5/sm4.jpg','img/product/home2/5/md4.jpg','img/product/home2/5/lg4.jpg'),
(NULL,91,1,'img/product/home2/5/sm5.jpg','img/product/home2/5/md5.jpg','img/product/home2/5/lg5.jpg'),
(NULL,92,1,'img/product/home2/6/sm1.jpg','img/product/home2/6/md1.jpg','img/product/home2/6/lg1.jpg'),
(NULL,92,1,'img/product/home2/6/sm2.jpg','img/product/home2/6/md2.jpg','img/product/home2/6/lg2.jpg'),
(NULL,92,1,'img/product/home2/6/sm3.jpg','img/product/home2/6/md3.jpg','img/product/home2/6/lg3.jpg'),
(NULL,92,1,'img/product/home2/6/sm4.jpg','img/product/home2/6/md4.jpg','img/product/home2/6/lg4.jpg'),
(NULL,92,1,'img/product/home2/6/sm5.jpg','img/product/home2/6/md5.jpg','img/product/home2/6/lg5.jpg'),
(NULL,93,1,'img/product/home2/7/sm1.jpg','img/product/home2/7/md1.jpg','img/product/home2/7/lg1.jpg'),
(NULL,93,1,'img/product/home2/7/sm2.jpg','img/product/home2/7/md2.jpg','img/product/home2/7/lg2.jpg'),
(NULL,93,1,'img/product/home2/7/sm3.jpg','img/product/home2/7/md3.jpg','img/product/home2/7/lg3.jpg'),
(NULL,93,1,'img/product/home2/7/sm4.jpg','img/product/home2/7/md4.jpg','img/product/home2/7/lg4.jpg'),
(NULL,93,1,'img/product/home2/7/sm5.jpg','img/product/home2/7/md5.jpg','img/product/home2/7/lg5.jpg'),
(NULL,94,1,'img/product/home2/8/sm1.jpg','img/product/home2/8/md1.jpg','img/product/home2/8/lg1.jpg'),
(NULL,94,1,'img/product/home2/8/sm2.jpg','img/product/home2/8/md2.jpg','img/product/home2/8/lg2.jpg'),
(NULL,94,1,'img/product/home2/8/sm3.jpg','img/product/home2/8/md3.jpg','img/product/home2/8/lg3.jpg'),
(NULL,94,1,'img/product/home2/8/sm4.jpg','img/product/home2/8/md4.jpg','img/product/home2/8/lg4.jpg'),
(NULL,94,1,'img/product/home2/8/sm5.jpg','img/product/home2/8/md5.jpg','img/product/home2/8/lg5.jpg'),
(NULL,95,1,'img/product/home2/9/sm1.jpg','img/product/home2/9/md1.jpg','img/product/home2/9/lg1.jpg'),
(NULL,95,1,'img/product/home2/9/sm2.jpg','img/product/home2/9/md2.jpg','img/product/home2/9/lg2.jpg'),
(NULL,95,1,'img/product/home2/9/sm3.jpg','img/product/home2/9/md3.jpg','img/product/home2/9/lg3.jpg'),
(NULL,95,1,'img/product/home2/9/sm4.jpg','img/product/home2/9/md4.jpg','img/product/home2/9/lg4.jpg'),
(NULL,95,1,'img/product/home2/9/sm5.jpg','img/product/home2/9/md5.jpg','img/product/home2/9/lg5.jpg'),
(NULL,95,2,'img/product/home2/9/sm6.jpg','img/product/home2/9/md6.jpg','img/product/home2/9/lg6.jpg'),
(NULL,95,2,'img/product/home2/9/sm7.jpg','img/product/home2/9/md7.jpg','img/product/home2/9/lg7.jpg'),
(NULL,95,2,'img/product/home2/9/sm8.jpg','img/product/home2/9/md8.jpg','img/product/home2/9/lg8.jpg'),
(NULL,95,2,'img/product/home2/9/sm9.jpg','img/product/home2/9/md9.jpg','img/product/home2/9/lg9.jpg'),
(NULL,95,2,'img/product/home2/9/sm10.jpg','img/product/home2/9/md10.jpg','img/product/home2/9/lg10.jpg'),
(NULL,96,1,'img/product/home2/10/sm1.jpg','img/product/home2/10/md1.jpg','img/product/home2/10/lg1.jpg'),
(NULL,96,1,'img/product/home2/10/sm2.jpg','img/product/home2/10/md2.jpg','img/product/home2/10/lg2.jpg'),
(NULL,96,1,'img/product/home2/10/sm3.jpg','img/product/home2/10/md3.jpg','img/product/home2/10/lg3.jpg'),
(NULL,96,1,'img/product/home2/10/sm4.jpg','img/product/home2/10/md4.jpg','img/product/home2/10/lg4.jpg'),
(NULL,96,1,'img/product/home2/10/sm5.jpg','img/product/home2/10/md5.jpg','img/product/home2/10/lg5.jpg'),
(NULL,96,2,'img/product/home2/10/sm6.jpg','img/product/home2/10/md6.jpg','img/product/home2/10/lg6.jpg'),
(NULL,96,2,'img/product/home2/10/sm7.jpg','img/product/home2/10/md7.jpg','img/product/home2/10/lg7.jpg'),
(NULL,96,2,'img/product/home2/10/sm8.jpg','img/product/home2/10/md8.jpg','img/product/home2/10/lg8.jpg'),
(NULL,96,2,'img/product/home2/10/sm9.jpg','img/product/home2/10/md9.jpg','img/product/home2/10/lg9.jpg'),
(NULL,96,2,'img/product/home2/10/sm10.jpg','img/product/home2/10/md10.jpg','img/product/home2/10/lg10.jpg'),
(NULL,96,3,'img/product/home2/10/sm11.jpg','img/product/home2/10/md111.jpg','img/product/home2/10/lg11.jpg'),
(NULL,96,3,'img/product/home2/10/sm12.jpg','img/product/home2/10/md12.jpg','img/product/home2/10/lg12.jpg'),
(NULL,96,3,'img/product/home2/10/sm13.jpg','img/product/home2/10/md13.jpg','img/product/home2/10/lg13.jpg'),
(NULL,96,3,'img/product/home2/10/sm14.jpg','img/product/home2/10/md14.jpg','img/product/home2/10/lg14.jpg'),
(NULL,96,3,'img/product/home2/10/sm15.jpg','img/product/home2/10/md15.jpg','img/product/home2/10/lg15.jpg'),
(NULL,96,4,'img/product/home2/10/sm16.jpg','img/product/home2/10/md116.jpg','img/product/home2/10/lg16.jpg'),
(NULL,96,4,'img/product/home2/10/sm17.jpg','img/product/home2/10/md17.jpg','img/product/home2/10/lg17.jpg'),
(NULL,96,4,'img/product/home2/10/sm18.jpg','img/product/home2/10/md18.jpg','img/product/home2/10/lg18.jpg'),
(NULL,96,4,'img/product/home2/10/sm19.jpg','img/product/home2/10/md19.jpg','img/product/home2/10/lg19.jpg'),
(NULL,96,4,'img/product/home2/10/sm20.jpg','img/product/home2/10/md20.jpg','img/product/home2/10/lg20.jpg'),
(NULL,97,1,'img/product/home2/11/sm1.jpg','img/product/home2/11/md1.jpg','img/product/home2/11/lg1.jpg'),
(NULL,97,1,'img/product/home2/11/sm2.jpg','img/product/home2/11/md2.jpg','img/product/home2/11/lg2.jpg'),
(NULL,97,1,'img/product/home2/11/sm3.jpg','img/product/home2/11/md3.jpg','img/product/home2/11/lg3.jpg'),
(NULL,97,1,'img/product/home2/11/sm4.jpg','img/product/home2/11/md4.jpg','img/product/home2/11/lg4.jpg'),
(NULL,97,1,'img/product/home2/11/sm5.jpg','img/product/home2/11/md5.jpg','img/product/home2/11/lg5.jpg'),
(NULL,98,1,'img/product/home2/12/sm1.jpg','img/product/home2/12/md1.jpg','img/product/home2/12/lg1.jpg'),
(NULL,98,1,'img/product/home2/12/sm2.jpg','img/product/home2/12/md2.jpg','img/product/home2/12/lg2.jpg'),
(NULL,98,1,'img/product/home2/12/sm3.jpg','img/product/home2/12/md3.jpg','img/product/home2/12/lg3.jpg'),
(NULL,98,1,'img/product/home2/12/sm4.jpg','img/product/home2/12/md4.jpg','img/product/home2/12/lg4.jpg'),
(NULL,98,1,'img/product/home2/12/sm5.jpg','img/product/home2/12/md5.jpg','img/product/home2/12/lg5.jpg'),
/*家居->收纳用品 99-99*/
(NULL,99,1,'img/product/home3/1/sm1.jpg','img/product/home3/1/md1.jpg','img/product/home3/1/lg1.jpg'),
(NULL,99,1,'img/product/home3/1/sm2.jpg','img/product/home3/1/md2.jpg','img/product/home3/1/lg2.jpg'),
(NULL,99,1,'img/product/home3/1/sm3.jpg','img/product/home3/1/md3.jpg','img/product/home3/1/lg3.jpg'),
(NULL,99,1,'img/product/home3/1/sm4.jpg','img/product/home3/1/md4.jpg','img/product/home3/1/lg4.jpg'),
(NULL,99,1,'img/product/home3/1/sm5.jpg','img/product/home3/1/md5.jpg','img/product/home3/1/lg5.jpg'),
(NULL,99,2,'img/product/home3/1/sm6.jpg','img/product/home3/1/md6.jpg','img/product/home3/1/lg6.jpg'),
(NULL,99,2,'img/product/home3/1/sm7.jpg','img/product/home3/1/md7.jpg','img/product/home3/1/lg7.jpg'),
(NULL,99,2,'img/product/home3/1/sm8.jpg','img/product/home3/1/md8.jpg','img/product/home3/1/lg8.jpg'),
(NULL,99,2,'img/product/home3/1/sm9.jpg','img/product/home3/1/md9.jpg','img/product/home3/1/lg9.jpg'),
(NULL,99,2,'img/product/home3/1/sm10.jpg','img/product/home3/1/md10.jpg','img/product/home3/1/lg10.jpg'),
(NULL,100,1,'img/product/home3/2/sm1.jpg','img/product/home3/2/md1.jpg','img/product/home3/2/lg1.jpg'),
(NULL,100,1,'img/product/home3/2/sm2.jpg','img/product/home3/2/md2.jpg','img/product/home3/2/lg2.jpg'),
(NULL,100,1,'img/product/home3/2/sm3.jpg','img/product/home3/2/md3.jpg','img/product/home3/2/lg3.jpg'),
(NULL,100,1,'img/product/home3/2/sm4.jpg','img/product/home3/2/md4.jpg','img/product/home3/2/lg4.jpg'),
(NULL,100,1,'img/product/home3/2/sm5.jpg','img/product/home3/2/md5.jpg','img/product/home3/2/lg5.jpg'),
/*家居->卫浴用品 101-111*/
(NULL,101,1,'img/product/home4/1/sm1.jpg','img/product/home4/1/md1.jpg','img/product/home4/1/lg1.jpg'),
(NULL,101,1,'img/product/home4/1/sm2.jpg','img/product/home4/1/md2.jpg','img/product/home4/1/lg2.jpg'),
(NULL,101,1,'img/product/home4/1/sm3.jpg','img/product/home4/1/md3.jpg','img/product/home4/1/lg3.jpg'),
(NULL,101,1,'img/product/home4/1/sm4.jpg','img/product/home4/1/md4.jpg','img/product/home4/1/lg4.jpg'),
(NULL,101,1,'img/product/home4/1/sm5.jpg','img/product/home4/1/md5.jpg','img/product/home4/1/lg5.jpg'),
(NULL,102,1,'img/product/home4/2/sm1.jpg','img/product/home4/2/md1.jpg','img/product/home4/2/lg1.jpg'),
(NULL,102,1,'img/product/home4/2/sm2.jpg','img/product/home4/2/md2.jpg','img/product/home4/2/lg2.jpg'),
(NULL,102,1,'img/product/home4/2/sm3.jpg','img/product/home4/2/md3.jpg','img/product/home4/2/lg3.jpg'),
(NULL,102,1,'img/product/home4/2/sm4.jpg','img/product/home4/2/md4.jpg','img/product/home4/2/lg4.jpg'),
(NULL,102,1,'img/product/home4/2/sm5.jpg','img/product/home4/2/md5.jpg','img/product/home4/2/lg5.jpg'),
(NULL,103,1,'img/product/home4/3/sm1.jpg','img/product/home4/3/md1.jpg','img/product/home4/3/lg1.jpg'),
(NULL,103,1,'img/product/home4/3/sm2.jpg','img/product/home4/3/md2.jpg','img/product/home4/3/lg2.jpg'),
(NULL,103,1,'img/product/home4/3/sm3.jpg','img/product/home4/3/md3.jpg','img/product/home4/3/lg3.jpg'),
(NULL,103,1,'img/product/home4/3/sm4.jpg','img/product/home4/3/md4.jpg','img/product/home4/3/lg4.jpg'),
(NULL,103,1,'img/product/home4/3/sm5.jpg','img/product/home4/3/md5.jpg','img/product/home4/3/lg5.jpg'),
(NULL,104,1,'img/product/home4/4/sm1.jpg','img/product/home4/4/md1.jpg','img/product/home4/4/lg1.jpg'),
(NULL,104,1,'img/product/home4/4/sm2.jpg','img/product/home4/4/md2.jpg','img/product/home4/4/lg2.jpg'),
(NULL,104,1,'img/product/home4/4/sm3.jpg','img/product/home4/4/md3.jpg','img/product/home4/4/lg3.jpg'),
(NULL,104,1,'img/product/home4/4/sm4.jpg','img/product/home4/4/md4.jpg','img/product/home4/4/lg4.jpg'),
(NULL,104,1,'img/product/home4/4/sm5.jpg','img/product/home4/4/md5.jpg','img/product/home4/4/lg5.jpg'),
(NULL,105,1,'img/product/home4/5/sm1.jpg','img/product/home4/5/md1.jpg','img/product/home4/5/lg1.jpg'),
(NULL,105,1,'img/product/home4/5/sm2.jpg','img/product/home4/5/md2.jpg','img/product/home4/5/lg2.jpg'),
(NULL,105,1,'img/product/home4/5/sm3.jpg','img/product/home4/5/md3.jpg','img/product/home4/5/lg3.jpg'),
(NULL,105,1,'img/product/home4/5/sm4.jpg','img/product/home4/5/md4.jpg','img/product/home4/5/lg4.jpg'),
(NULL,105,1,'img/product/home4/5/sm5.jpg','img/product/home4/5/md5.jpg','img/product/home4/5/lg5.jpg'),
(NULL,106,1,'img/product/home4/6/sm1.jpg','img/product/home4/6/md1.jpg','img/product/home4/6/lg1.jpg'),
(NULL,106,1,'img/product/home4/6/sm2.jpg','img/product/home4/6/md2.jpg','img/product/home4/6/lg2.jpg'),
(NULL,106,1,'img/product/home4/6/sm3.jpg','img/product/home4/6/md3.jpg','img/product/home4/6/lg3.jpg'),
(NULL,106,1,'img/product/home4/6/sm4.jpg','img/product/home4/6/md4.jpg','img/product/home4/6/lg4.jpg'),
(NULL,106,1,'img/product/home4/6/sm5.jpg','img/product/home4/6/md5.jpg','img/product/home4/6/lg5.jpg'),
(NULL,107,1,'img/product/home4/7/sm1.jpg','img/product/home4/7/md1.jpg','img/product/home4/7/lg1.jpg'),
(NULL,107,1,'img/product/home4/7/sm2.jpg','img/product/home4/7/md2.jpg','img/product/home4/7/lg2.jpg'),
(NULL,107,1,'img/product/home4/7/sm3.jpg','img/product/home4/7/md3.jpg','img/product/home4/7/lg3.jpg'),
(NULL,107,1,'img/product/home4/7/sm4.jpg','img/product/home4/7/md4.jpg','img/product/home4/7/lg4.jpg'),
(NULL,107,1,'img/product/home4/7/sm5.jpg','img/product/home4/7/md5.jpg','img/product/home4/7/lg5.jpg'),
(NULL,108,1,'img/product/home4/8/sm1.jpg','img/product/home4/8/md1.jpg','img/product/home4/8/lg1.jpg'),
(NULL,108,1,'img/product/home4/8/sm2.jpg','img/product/home4/8/md2.jpg','img/product/home4/8/lg2.jpg'),
(NULL,108,1,'img/product/home4/8/sm3.jpg','img/product/home4/8/md3.jpg','img/product/home4/8/lg3.jpg'),
(NULL,108,1,'img/product/home4/8/sm4.jpg','img/product/home4/8/md4.jpg','img/product/home4/8/lg4.jpg'),
(NULL,108,1,'img/product/home4/8/sm5.jpg','img/product/home4/8/md5.jpg','img/product/home4/8/lg5.jpg'),
(NULL,109,1,'img/product/home4/9/sm1.jpg','img/product/home4/9/md1.jpg','img/product/home4/9/lg1.jpg'),
(NULL,109,1,'img/product/home4/9/sm2.jpg','img/product/home4/9/md2.jpg','img/product/home4/9/lg2.jpg'),
(NULL,109,1,'img/product/home4/9/sm3.jpg','img/product/home4/9/md3.jpg','img/product/home4/9/lg3.jpg'),
(NULL,109,1,'img/product/home4/9/sm4.jpg','img/product/home4/9/md4.jpg','img/product/home4/9/lg4.jpg'),
(NULL,109,1,'img/product/home4/9/sm5.jpg','img/product/home4/9/md5.jpg','img/product/home4/9/lg5.jpg'),
(NULL,109,1,'img/product/home4/9/sm6.jpg','img/product/home4/9/md6.jpg','img/product/home4/9/lg6.jpg'),
(NULL,109,1,'img/product/home4/9/sm7.jpg','img/product/home4/9/md7.jpg','img/product/home4/9/lg7.jpg'),
(NULL,109,1,'img/product/home4/9/sm8.jpg','img/product/home4/9/md8.jpg','img/product/home4/9/lg8.jpg'),
(NULL,109,1,'img/product/home4/9/sm9.jpg','img/product/home4/9/md9.jpg','img/product/home4/9/lg9.jpg'),
(NULL,109,1,'img/product/home4/9/sm10.jpg','img/product/home4/9/md10.jpg','img/product/home4/9/lg10.jpg'),
(NULL,110,1,'img/product/home4/10/sm1.jpg','img/product/home4/10/md1.jpg','img/product/home4/10/lg1.jpg'),
(NULL,110,1,'img/product/home4/10/sm2.jpg','img/product/home4/10/md2.jpg','img/product/home4/10/lg2.jpg'),
(NULL,110,1,'img/product/home4/10/sm3.jpg','img/product/home4/10/md3.jpg','img/product/home4/10/lg3.jpg'),
(NULL,110,1,'img/product/home4/10/sm4.jpg','img/product/home4/10/md4.jpg','img/product/home4/10/lg4.jpg'),
(NULL,110,1,'img/product/home4/10/sm5.jpg','img/product/home4/10/md5.jpg','img/product/home4/10/lg5.jpg'),
(NULL,111,1,'img/product/home4/11/sm1.jpg','img/product/home4/11/md1.jpg','img/product/home4/11/lg1.jpg'),
(NULL,111,1,'img/product/home4/11/sm2.jpg','img/product/home4/11/md2.jpg','img/product/home4/11/lg2.jpg'),
(NULL,111,1,'img/product/home4/11/sm3.jpg','img/product/home4/11/md3.jpg','img/product/home4/11/lg3.jpg'),
(NULL,111,1,'img/product/home4/11/sm4.jpg','img/product/home4/11/md4.jpg','img/product/home4/11/lg4.jpg'),
(NULL,111,1,'img/product/home4/11/sm5.jpg','img/product/home4/11/md5.jpg','img/product/home4/11/lg5.jpg'),
/*男士->男士服装服饰 112-127*/
(NULL,112,1,'img/product/men/1/sm1.jpg','img/product/men/1/md1.jpg','img/product/men/1/lg1.jpg'),
(NULL,112,1,'img/product/men/1/sm2.jpg','img/product/men/1/md2.jpg','img/product/men/1/lg2.jpg'),
(NULL,112,1,'img/product/men/1/sm3.jpg','img/product/men/1/md3.jpg','img/product/men/1/lg3.jpg'),
(NULL,112,1,'img/product/men/1/sm4.jpg','img/product/men/1/md4.jpg','img/product/men/1/lg4.jpg'),
(NULL,112,1,'img/product/men/1/sm5.jpg','img/product/men/1/md5.jpg','img/product/men/1/lg5.jpg'),
(NULL,112,1,'img/product/men/1/sm6.jpg','img/product/men/1/md6.jpg','img/product/men/1/lg6.jpg'),
(NULL,112,1,'img/product/men/1/sm7.jpg','img/product/men/1/md7.jpg','img/product/men/1/lg7.jpg'),
(NULL,112,1,'img/product/men/1/sm8.jpg','img/product/men/1/md8.jpg','img/product/men/1/lg8.jpg'),
(NULL,112,1,'img/product/men/1/sm9.jpg','img/product/men/1/md9.jpg','img/product/men/1/lg9.jpg'),
(NULL,112,1,'img/product/men/1/sm10.jpg','img/product/men/1/md10.jpg','img/product/men/1/lg10.jpg'),
(NULL,113,1,'img/product/men/2/sm1.jpg','img/product/men/2/md1.jpg','img/product/men/2/lg1.jpg'),
(NULL,113,1,'img/product/men/2/sm2.jpg','img/product/men/2/md2.jpg','img/product/men/2/lg2.jpg'),
(NULL,113,1,'img/product/men/2/sm3.jpg','img/product/men/2/md3.jpg','img/product/men/2/lg3.jpg'),
(NULL,113,1,'img/product/men/2/sm4.jpg','img/product/men/2/md4.jpg','img/product/men/2/lg4.jpg'),
(NULL,113,1,'img/product/men/2/sm5.jpg','img/product/men/2/md5.jpg','img/product/men/2/lg5.jpg'),
(NULL,114,1,'img/product/men/3/sm1.jpg','img/product/men/3/md1.jpg','img/product/men/3/lg1.jpg'),
(NULL,114,1,'img/product/men/3/sm2.jpg','img/product/men/3/md2.jpg','img/product/men/3/lg2.jpg'),
(NULL,114,1,'img/product/men/3/sm3.jpg','img/product/men/3/md3.jpg','img/product/men/3/lg3.jpg'),
(NULL,114,1,'img/product/men/3/sm4.jpg','img/product/men/3/md4.jpg','img/product/men/3/lg4.jpg'),
(NULL,114,1,'img/product/men/3/sm5.jpg','img/product/men/3/md5.jpg','img/product/men/3/lg5.jpg'),
(NULL,115,1,'img/product/men/4/sm1.jpg','img/product/men/4/md1.jpg','img/product/men/4/lg1.jpg'),
(NULL,115,1,'img/product/men/4/sm2.jpg','img/product/men/4/md2.jpg','img/product/men/4/lg2.jpg'),
(NULL,115,1,'img/product/men/4/sm3.jpg','img/product/men/4/md3.jpg','img/product/men/4/lg3.jpg'),
(NULL,115,1,'img/product/men/4/sm4.jpg','img/product/men/4/md4.jpg','img/product/men/4/lg4.jpg'),
(NULL,115,1,'img/product/men/4/sm5.jpg','img/product/men/4/md5.jpg','img/product/men/4/lg5.jpg'),
(NULL,116,1,'img/product/men/5/sm1.jpg','img/product/men/5/md1.jpg','img/product/men/5/lg1.jpg'),
(NULL,116,1,'img/product/men/5/sm2.jpg','img/product/men/5/md2.jpg','img/product/men/5/lg2.jpg'),
(NULL,116,1,'img/product/men/5/sm3.jpg','img/product/men/5/md3.jpg','img/product/men/5/lg3.jpg'),
(NULL,116,1,'img/product/men/5/sm4.jpg','img/product/men/5/md4.jpg','img/product/men/5/lg4.jpg'),
(NULL,116,1,'img/product/men/5/sm5.jpg','img/product/men/5/md5.jpg','img/product/men/5/lg5.jpg'),
(NULL,117,1,'img/product/men/6/sm1.jpg','img/product/men/6/md1.jpg','img/product/men/6/lg1.jpg'),
(NULL,117,1,'img/product/men/6/sm2.jpg','img/product/men/6/md2.jpg','img/product/men/6/lg2.jpg'),
(NULL,117,1,'img/product/men/6/sm3.jpg','img/product/men/6/md3.jpg','img/product/men/6/lg3.jpg'),
(NULL,117,1,'img/product/men/6/sm4.jpg','img/product/men/6/md4.jpg','img/product/men/6/lg4.jpg'),
(NULL,117,1,'img/product/men/6/sm5.jpg','img/product/men/6/md5.jpg','img/product/men/6/lg5.jpg'),
(NULL,117,2,'img/product/men/6/sm6.jpg','img/product/men/6/md6.jpg','img/product/men/6/lg6.jpg'),
(NULL,117,2,'img/product/men/6/sm7.jpg','img/product/men/6/md7.jpg','img/product/men/6/lg7.jpg'),
(NULL,117,2,'img/product/men/6/sm8.jpg','img/product/men/6/md8.jpg','img/product/men/6/lg8.jpg'),
(NULL,117,2,'img/product/men/6/sm9.jpg','img/product/men/6/md9.jpg','img/product/men/6/lg9.jpg'),
(NULL,117,2,'img/product/men/6/sm10.jpg','img/product/men/6/md10.jpg','img/product/men/6/lg10.jpg'),
(NULL,118,1,'img/product/men/7/sm1.jpg','img/product/men/7/md1.jpg','img/product/men/7/lg1.jpg'),
(NULL,118,1,'img/product/men/7/sm2.jpg','img/product/men/7/md2.jpg','img/product/men/7/lg2.jpg'),
(NULL,118,1,'img/product/men/7/sm3.jpg','img/product/men/7/md3.jpg','img/product/men/7/lg3.jpg'),
(NULL,118,1,'img/product/men/7/sm4.jpg','img/product/men/7/md4.jpg','img/product/men/7/lg4.jpg'),
(NULL,118,1,'img/product/men/7/sm5.jpg','img/product/men/7/md5.jpg','img/product/men/7/lg5.jpg'),
(NULL,119,1,'img/product/men/8/sm1.jpg','img/product/men/8/md1.jpg','img/product/men/8/lg1.jpg'),
(NULL,119,1,'img/product/men/8/sm2.jpg','img/product/men/8/md2.jpg','img/product/men/8/lg2.jpg'),
(NULL,119,1,'img/product/men/8/sm3.jpg','img/product/men/8/md3.jpg','img/product/men/8/lg3.jpg'),
(NULL,119,1,'img/product/men/8/sm4.jpg','img/product/men/8/md4.jpg','img/product/men/8/lg4.jpg'),
(NULL,119,1,'img/product/men/8/sm5.jpg','img/product/men/8/md5.jpg','img/product/men/8/lg5.jpg'),
(NULL,119,2,'img/product/men/8/sm6.jpg','img/product/men/8/md6.jpg','img/product/men/8/lg6.jpg'),
(NULL,119,2,'img/product/men/8/sm7.jpg','img/product/men/8/md7.jpg','img/product/men/8/lg7.jpg'),
(NULL,119,2,'img/product/men/8/sm8.jpg','img/product/men/8/md8.jpg','img/product/men/8/lg8.jpg'),
(NULL,119,2,'img/product/men/8/sm9.jpg','img/product/men/8/md9.jpg','img/product/men/8/lg9.jpg'),
(NULL,119,2,'img/product/men/8/sm10.jpg','img/product/men/8/md10.jpg','img/product/men/8/lg10.jpg'),
(NULL,120,1,'img/product/men/9/sm1.jpg','img/product/men/9/md1.jpg','img/product/men/9/lg1.jpg'),
(NULL,120,1,'img/product/men/9/sm2.jpg','img/product/men/9/md2.jpg','img/product/men/9/lg2.jpg'),
(NULL,120,1,'img/product/men/9/sm3.jpg','img/product/men/9/md3.jpg','img/product/men/9/lg3.jpg'),
(NULL,120,1,'img/product/men/9/sm4.jpg','img/product/men/9/md4.jpg','img/product/men/9/lg4.jpg'),
(NULL,120,1,'img/product/men/9/sm5.jpg','img/product/men/9/md5.jpg','img/product/men/9/lg5.jpg'),
(NULL,121,1,'img/product/men/10/sm1.jpg','img/product/men/10/md1.jpg','img/product/men/10/lg1.jpg'),
(NULL,121,1,'img/product/men/10/sm2.jpg','img/product/men/10/md2.jpg','img/product/men/10/lg2.jpg'),
(NULL,121,1,'img/product/men/10/sm3.jpg','img/product/men/10/md3.jpg','img/product/men/10/lg3.jpg'),
(NULL,121,1,'img/product/men/10/sm4.jpg','img/product/men/10/md4.jpg','img/product/men/10/lg4.jpg'),
(NULL,121,1,'img/product/men/10/sm5.jpg','img/product/men/10/md5.jpg','img/product/men/10/lg5.jpg'),
(NULL,122,1,'img/product/men/11/sm1.jpg','img/product/men/11/md1.jpg','img/product/men/11/lg1.jpg'),
(NULL,122,1,'img/product/men/11/sm2.jpg','img/product/men/11/md2.jpg','img/product/men/11/lg2.jpg'),
(NULL,122,1,'img/product/men/11/sm3.jpg','img/product/men/11/md3.jpg','img/product/men/11/lg3.jpg'),
(NULL,122,1,'img/product/men/11/sm4.jpg','img/product/men/11/md4.jpg','img/product/men/11/lg4.jpg'),
(NULL,122,1,'img/product/men/11/sm5.jpg','img/product/men/11/md5.jpg','img/product/men/11/lg5.jpg'),
(NULL,123,1,'img/product/men/12/sm1.jpg','img/product/men/12/md1.jpg','img/product/men/12/lg1.jpg'),
(NULL,123,1,'img/product/men/12/sm2.jpg','img/product/men/12/md2.jpg','img/product/men/12/lg2.jpg'),
(NULL,123,1,'img/product/men/12/sm3.jpg','img/product/men/12/md3.jpg','img/product/men/12/lg3.jpg'),
(NULL,123,1,'img/product/men/12/sm4.jpg','img/product/men/12/md4.jpg','img/product/men/12/lg4.jpg'),
(NULL,123,1,'img/product/men/12/sm5.jpg','img/product/men/12/md5.jpg','img/product/men/12/lg5.jpg'),
(NULL,124,1,'img/product/men/13/sm1.jpg','img/product/men/13/md1.jpg','img/product/men/13/lg1.jpg'),
(NULL,124,1,'img/product/men/13/sm2.jpg','img/product/men/13/md2.jpg','img/product/men/13/lg2.jpg'),
(NULL,124,1,'img/product/men/13/sm3.jpg','img/product/men/13/md3.jpg','img/product/men/13/lg3.jpg'),
(NULL,124,1,'img/product/men/13/sm4.jpg','img/product/men/13/md4.jpg','img/product/men/13/lg4.jpg'),
(NULL,124,1,'img/product/men/13/sm5.jpg','img/product/men/13/md5.jpg','img/product/men/13/lg5.jpg'),
(NULL,125,1,'img/product/men/14/sm1.jpg','img/product/men/14/md1.jpg','img/product/men/14/lg1.jpg'),
(NULL,125,1,'img/product/men/14/sm2.jpg','img/product/men/14/md2.jpg','img/product/men/14/lg2.jpg'),
(NULL,125,1,'img/product/men/14/sm3.jpg','img/product/men/14/md3.jpg','img/product/men/14/lg3.jpg'),
(NULL,125,1,'img/product/men/14/sm4.jpg','img/product/men/14/md4.jpg','img/product/men/14/lg4.jpg'),
(NULL,125,1,'img/product/men/14/sm5.jpg','img/product/men/14/md5.jpg','img/product/men/14/lg5.jpg'),
(NULL,125,2,'img/product/men/14/sm6.jpg','img/product/men/14/md6.jpg','img/product/men/14/lg6.jpg'),
(NULL,125,2,'img/product/men/14/sm7.jpg','img/product/men/14/md7.jpg','img/product/men/14/lg7.jpg'),
(NULL,125,2,'img/product/men/14/sm8.jpg','img/product/men/14/md8.jpg','img/product/men/14/lg8.jpg'),
(NULL,125,2,'img/product/men/14/sm9.jpg','img/product/men/14/md9.jpg','img/product/men/14/lg9.jpg'),
(NULL,125,2,'img/product/men/14/sm10.jpg','img/product/men/14/md10.jpg','img/product/men/14/lg10.jpg'),
(NULL,126,1,'img/product/men/15/sm1.jpg','img/product/men/15/md1.jpg','img/product/men/15/lg1.jpg'),
(NULL,126,1,'img/product/men/15/sm2.jpg','img/product/men/15/md2.jpg','img/product/men/15/lg2.jpg'),
(NULL,126,1,'img/product/men/15/sm3.jpg','img/product/men/15/md3.jpg','img/product/men/15/lg3.jpg'),
(NULL,126,1,'img/product/men/15/sm4.jpg','img/product/men/15/md4.jpg','img/product/men/15/lg4.jpg'),
(NULL,126,1,'img/product/men/15/sm5.jpg','img/product/men/15/md5.jpg','img/product/men/15/lg5.jpg'),
(NULL,127,1,'img/product/men/16/sm1.jpg','img/product/men/16/md1.jpg','img/product/men/16/lg1.jpg'),
(NULL,127,1,'img/product/men/16/sm2.jpg','img/product/men/16/md2.jpg','img/product/men/16/lg2.jpg'),
(NULL,127,1,'img/product/men/16/sm3.jpg','img/product/men/16/md3.jpg','img/product/men/16/lg3.jpg'),
(NULL,127,1,'img/product/men/16/sm4.jpg','img/product/men/16/md4.jpg','img/product/men/16/lg4.jpg'),
(NULL,127,1,'img/product/men/16/sm5.jpg','img/product/men/16/md5.jpg','img/product/men/16/lg5.jpg'),

/*男士->男士卫生用品 128*/
(NULL,128,1,'img/product/men1/1/sm1.jpg','img/product/men1/1/md1.jpg','img/product/men1/1/lg1.jpg'),
(NULL,128,1,'img/product/men1/1/sm2.jpg','img/product/men1/1/md2.jpg','img/product/men1/1/lg2.jpg'),
(NULL,128,1,'img/product/men1/1/sm3.jpg','img/product/men1/1/md3.jpg','img/product/men1/1/lg3.jpg'),
(NULL,128,1,'img/product/men1/1/sm4.jpg','img/product/men1/1/md4.jpg','img/product/men1/1/lg4.jpg'),
(NULL,128,1,'img/product/men1/1/sm5.jpg','img/product/men1/1/md5.jpg','img/product/men1/1/lg5.jpg');


/**商品详情图**/
/*婴童->婴童床品*/
INSERT INTO sh_product_details_pic VALUES(NULL,1,'img/product/baby/1/1.jpg，img/product/baby/1/2.jpg，img/product/baby/1/3.jpg，img/product/baby/1/4.jpg，img/product/baby/1/5.jpg，img/product/baby/1/6.jpg，img/product/baby/1/7.jpg，img/product/baby/1/8.jpg，img/product/baby/1/9.jpg，img/product/baby/1/10.jpg，img/product/baby/1/11.jpg，img/product/baby/1/12.jpg'),
(NULL,2,'img/product/baby/2/1.jpg，img/product/baby/2/2.jpg，img/product/baby/2/3.jpg，img/product/baby/2/4.jpg，img/product/baby/2/5.jpg，img/product/baby/2/6.jpg，img/product/baby/2/7.jpg，img/product/baby/2/8.jpg，img/product/baby/2/9.jpg'),
(NULL,3,'img/product/baby/3/1.jpg，img/product/baby/3/2.jpg，img/product/baby/3/3.jpg，img/product/baby/3/4.jpg，img/product/baby/3/5.jpg，img/product/baby/3/6.jpg，img/product/baby/3/7.jpg，img/product/baby/3/8.jpg，img/product/baby/3/9.jpg，img/product/baby/3/10.jpg，img/product/baby/3/11.jpg，img/product/baby/3/12.jpg'),
(NULL,4,'img/product/baby/4/1.jpg，img/product/baby/4/2.jpg，img/product/baby/4/3.jpg，img/product/baby/4/4.jpg，img/product/baby/4/5.jpg，img/product/baby/4/6.jpg，img/product/baby/4/7.jpg，img/product/baby/4/8.jpg，img/product/baby/4/9.jpg，img/product/baby/4/10.jpg'),
(NULL,5,'img/product/baby/5/1.jpg，img/product/baby/5/2.jpg，img/product/baby/5/3.jpg，img/product/baby/5/4.jpg，img/product/baby/5/5.jpg，img/product/baby/5/6.jpg，img/product/baby/5/7.jpg，img/product/baby/5/8.jpg'),
(NULL,6,'img/product/baby/6/1.jpg，img/product/baby/6/2.jpg，img/product/baby/6/3.jpg，img/product/baby/6/4.jpg，img/product/baby/6/5.jpg，img/product/baby/6/6.jpg，img/product/baby/6/7.jpg，img/product/baby/6/8.jpg，img/product/baby/6/9.jpg，img/product/baby/6/10.jpg，img/product/baby/6/11.jpg'),
(NULL,7,'img/product/baby/7/1.jpg，img/product/baby/7/2.jpg，img/product/baby/7/3.jpg，img/product/baby/7/4.jpg，img/product/baby/7/5.jpg，img/product/baby/7/6.jpg，img/product/baby/7/7.jpg，img/product/baby/7/8.jpg，img/product/baby/7/9.jpg，img/product/baby/7/10.jpg'),
(NULL,8,'img/product/baby/8/1.jpg，img/product/baby/8/2.jpg，img/product/baby/8/3.jpg，img/product/baby/8/4.jpg，img/product/baby/8/5.jpg，img/product/baby/8/6.jpg，img/product/baby/8/7.jpg，img/product/baby/8/8.jpg，img/product/baby/8/9.jpg'),
(NULL,9,'img/product/baby/9/1.jpg，img/product/baby/9/2.jpg，img/product/baby/9/3.jpg，img/product/baby/9/4.jpg，img/product/baby/9/5.jpg，img/product/baby/9/6.jpg，img/product/baby/9/7.jpg，img/product/baby/9/8.jpg，img/product/baby/9/9.jpg，img/product/baby/9/10.jpg，img/product/baby/9/11.jpg'),
(NULL,10,'img/product/baby/10/1.jpg，img/product/baby/10/2.jpg，img/product/baby/10/3.jpg，img/product/baby/10/4.jpg'),
(NULL,11,'img/product/baby/11/1.jpg，img/product/baby/11/2.jpg，img/product/baby/11/3.jpg，img/product/baby/11/4.jpg，img/product/baby/11/5.jpg，img/product/baby/11/6.jpg，img/product/baby/11/7.jpg，img/product/baby/11/8.jpg，img/product/baby/11/9.jpg，img/product/baby/11/10.jpg'),
(NULL,12,'img/product/baby/12/1.jpg，img/product/baby/12/2.jpg，img/product/baby/12/3.jpg，img/product/baby/12/4.jpg，img/product/baby/12/5.jpg，img/product/baby/12/6.jpg，img/product/baby/12/7.jpg，img/product/baby/12/8.jpg，img/product/baby/12/9.jpg，img/product/baby/12/10.jpg，img/product/baby/12/11.jpg'),
(NULL,13,'img/product/baby/13/1.jpg，img/product/baby/13/2.jpg，img/product/baby/13/3.jpg，img/product/baby/13/4.jpg，img/product/baby/13/5.jpg，img/product/baby/13/6.jpg，img/product/baby/13/7.jpg，img/product/baby/13/8.jpg，img/product/baby/13/9.jpg，img/product/baby/13/10.jpg'),
(NULL,14,'img/product/baby/14/1.jpg，img/product/baby/14/2.jpg，img/product/baby/14/3.jpg，img/product/baby/14/4.jpg，img/product/baby/14/5.jpg，img/product/baby/14/6.jpg，img/product/baby/14/7.jpg，img/product/baby/14/8.jpg'),
(NULL,15,'img/product/baby/15/1.jpg，img/product/baby/15/2.jpg，img/product/baby/15/3.jpg，img/product/baby/15/4.jpg，img/product/baby/15/5.jpg，img/product/baby/15/6.jpg，img/product/baby/15/7.jpg，img/product/baby/15/8.jpg，img/product/baby/15/9.jpg，img/product/baby/15/10.jpg'),
(NULL,16,'img/product/baby/16/1.jpg，img/product/baby/16/2.jpg，img/product/baby/16/3.jpg，img/product/baby/16/4.jpg，img/product/baby/16/5.jpg，img/product/baby/16/6.jpg，img/product/baby/16/7.jpg，img/product/baby/16/8.jpg，img/product/baby/16/9.jpg，img/product/baby/16/10.jpg，img/product/baby/16/11.jpg，img/product/baby/16/12.jpg'),
(NULL,17,'img/product/baby1/5/1.jpg，img/product/baby1/5/2.jpg，img/product/baby1/5/3.jpg，img/product/baby1/5/4.jpg'),
(NULL,18,'img/product/baby/18/1.jpg，img/product/baby/18/2.jpg，img/product/baby/18/3.jpg，img/product/baby/18/4.jpg，img/product/baby/18/5.jpg，img/product/baby/18/6.jpg，img/product/baby/18/7.jpg，img/product/baby/18/8.jpg，img/product/baby/18/9.jpg'),
(NULL,19,'img/product/baby/19/1.jpg，img/product/baby/19/2.jpg，img/product/baby/19/3.jpg，img/product/baby/19/4.jpg，img/product/baby/19/5.jpg，img/product/baby/19/6.jpg，img/product/baby/19/7.jpg，img/product/baby/19/8.jpg，img/product/baby/19/9.jpg'),
/*婴童->婴童服饰 42-49*/
(NULL,42,'img/product/baby1/1/1.jpg，img/product/baby1/1/2.jpg，img/product/baby1/1/3.jpg，img/product/baby1/1/4.jpg，img/product/baby1/1/5.jpg，img/product/baby1/1/6.jpg，img/product/baby1/1/7.jpg，img/product/baby1/1/8.jpg，img/product/baby1/1/9.jpg，img/product/baby1/1/10.jpg'),
(NULL,43,'img/product/baby1/2/1.jpg，img/product/baby1/2/2.jpg，img/product/baby1/2/3.jpg，img/product/baby1/2/4.jpg，img/product/baby1/2/5.jpg，img/product/baby1/2/6.jpg'),
(NULL,44,'img/product/baby1/3/1.jpg，img/product/baby1/3/2.jpg'),
(NULL,45,'img/product/baby1/4/1.jpg，img/product/baby1/4/2.jpg，img/product/baby1/4/3.jpg，img/product/baby1/4/4.jpg，img/product/baby1/4/5.jpg，img/product/baby1/4/6.jpg，img/product/baby1/4/7.jpg，img/product/baby1/4/8.jpg'),
(NULL,46,'img/product/baby1/5/1.jpg，img/product/baby1/5/2.jpg，img/product/baby1/5/3.jpg，img/product/baby1/5/4.jpg'),
(NULL,47,'img/product/baby1/6/1.jpg，img/product/baby1/6/2.jpg，img/product/baby1/6/3.jpg，img/product/baby1/6/4.jpg，img/product/baby1/6/5.jpg，img/product/baby1/6/6.jpg，img/product/baby1/6/7.jpg，img/product/baby1/6/8.jpg，img/product/baby1/6/9.jpg，img/product/baby1/6/10.jpg'),
(NULL,48,'img/product/baby1/7/1.jpg，img/product/baby1/7/2.jpg，img/product/baby1/7/3.jpg，img/product/baby1/7/4.jpg，img/product/baby1/7/5.jpg，img/product/baby1/7/6.jpg，img/product/baby1/7/7.jpg'),
(NULL,49,'img/product/baby1/8/1.jpg，img/product/baby1/8/2.jpg，img/product/baby1/8/3.jpg，img/product/baby1/8/4.jpg，img/product/baby1/8/5.jpg，img/product/baby1/8/6.jpg，img/product/baby1/8/7.jpg'),

/*女士->女士服装服饰 50-66*/
(NULL,50,'img/product/women/1/1.jpg，img/product/women/1/2.jpg，img/product/women/1/3.jpg，img/product/women/1/4.jpg，img/product/women/1/5.jpg，img/product/women/1/6.jpg，img/product/women/1/7.jpg，img/product/women/1/8.jpg'),
(NULL,51,'img/product/women/2/1.jpg，img/product/women/2/2.jpg，img/product/women/2/3.jpg，img/product/women/2/4.jpg，img/product/women/2/5.jpg，img/product/women/2/6.jpg，img/product/women/2/7.jpg，img/product/women/2/8.jpg，img/product/women/2/9.jpg，img/product/women/2/10.jpg，img/product/women/2/11.jpg，img/product/women/2/12.jpg，img/product/women/2/13.jpg，img/product/women/2/14.jpg'),
(NULL,52,'img/product/women/3/1.jpg，img/product/women/3/2.jpg，img/product/women/3/3.jpg，img/product/women/3/4.jpg，img/product/women/3/5.jpg，img/product/women/3/6.jpg，img/product/women/3/7.jpg，img/product/women/3/8.jpg，img/product/women/3/9.jpg，img/product/women/3/10.jpg，img/product/women/3/11.jpg，img/product/women/3/12.jpg，img/product/women/3/13.jpg，img/product/women/3/14.jpg，img/product/women/13/15.jpg，img/product/women/13/16.jpg，img/product/women/13/17.jpg，img/product/women/13/18.jpg，img/product/women/13/19.jpg'),
(NULL,53,'img/product/women/4/1.jpg，img/product/women/4/2.jpg，img/product/women/4/3.jpg，img/product/women/4/4.jpg，img/product/women/4/5.jpg，img/product/women/4/6.jpg'),
(NULL,54,'img/product/women/5/1.jpg，img/product/women/5/2.jpg，img/product/women/5/3.jpg，img/product/women/5/4.jpg，img/product/women/5/5.jpg，img/product/women/5/6.jpg，img/product/women/5/7.jpg'),
(NULL,55,'img/product/women/6/1.jpg，img/product/women/6/2.jpg，img/product/women/6/3.jpg，img/product/women/6/4.jpg，img/product/women/6/5.jpg，img/product/women/6/6.jpg，img/product/women/6/7.jpg，img/product/women/6/8.jpg，img/product/women/6/9.jpg，img/product/women/6/10.jpg，img/product/women/6/11.jpg'),
(NULL,56,'img/product/women/7/1.jpg，img/product/women/7/2.jpg，img/product/women/7/3.jpg，img/product/women/7/4.jpg，img/product/women/7/5.jpg，img/product/women/7/6.jpg，img/product/women/7/7.jpg，img/product/women/7/8.jpg，img/product/women/7/9.jpg，img/product/women/7/10.jpg，img/product/women/7/11.jpg'),
(NULL,57,'img/product/women/8/1.jpg，img/product/women/8/2.jpg，img/product/women/8/3.jpg，img/product/women/8/4.jpg，img/product/women/8/5.jpg，img/product/women/8/6.jpg，img/product/women/8/7.jpg，img/product/women/8/8.jpg，img/product/women/8/9.jpg，img/product/women/8/10.jpg，img/product/women/8/11.jpg'),
(NULL,58,'img/product/women/9/1.jpg，img/product/women/9/2.jpg，img/product/women/9/3.jpg，img/product/women/9/4.jpg，img/product/women/9/5.jpg，img/product/women/9/6.jpg，img/product/women/9/7.jpg，img/product/women/9/8.jpg，img/product/women/9/9.jpg，img/product/women/9/10.jpg'),
(NULL,59,'img/product/women/10/1.jpg，img/product/women/10/2.jpg，img/product/women/10/3.jpg，img/product/women/10/4.jpg，img/product/women/10/5.jpg，img/product/women/10/6.jpg，img/product/women/10/7.jpg，img/product/women/10/8.jpg，img/product/women/10/9.jpg，img/product/women/10/10.jpg，img/product/women/10/11.jpg'),
(NULL,60,'img/product/women/11/1.jpg，img/product/women/11/2.jpg，img/product/women/11/3.jpg，img/product/women/11/4.jpg，img/product/women/11/5.jpg，img/product/women/11/6.jpg，img/product/women/11/7.jpg，img/product/women/11/8.jpg，img/product/women/11/9.jpg，img/product/women/11/10.jpg，img/product/women/11/11.jpg'),
(NULL,61,'img/product/women/12/1.jpg，img/product/women/12/2.jpg，img/product/women/12/3.jpg，img/product/women/12/4.jpg，img/product/women/12/5.jpg，img/product/women/12/6.jpg，img/product/women/12/7.jpg，img/product/women/12/8.jpg，img/product/women/12/9.jpg，img/product/women/12/10.jpg，img/product/women/12/11.jpg，img/product/women/12/12.jpg'),
(NULL,62,'img/product/women/13/1.jpg，img/product/women/13/2.jpg，img/product/women/13/3.jpg，img/product/women/13/4.jpg，img/product/women/13/5.jpg，img/product/women/13/6.jpg，img/product/women/13/7.jpg，img/product/women/13/8.jpg，img/product/women/13/9.jpg，img/product/women/13/10.jpg'),
(NULL,63,'img/product/women/14/1.jpg，img/product/women/14/2.jpg，img/product/women/14/3.jpg，img/product/women/14/4.jpg，img/product/women/14/5.jpg，img/product/women/14/6.jpg，img/product/women/14/7.jpg，img/product/women/14/8.jpg，img/product/women/14/9.jpg，img/product/women/14/10.jpg，img/product/women/14/11.jpg，img/product/women/14/12.jpg'),
(NULL,64,'img/product/women/15/1.jpg，img/product/women/15/2.jpg，img/product/women/15/3.jpg'),
(NULL,65,'img/product/women/16/1.jpg，img/product/women/16/2.jpg，img/product/women/16/3.jpg，img/product/women/16/4.jpg，img/product/women/16/5.jpg，img/product/women/16/6.jpg，img/product/women/16/7.jpg，img/product/women/16/8.jpg，img/product/women/16/9.jpg，img/product/women/16/10.jpg，img/product/women/16/11.jpg'),
(NULL,66,'img/product/women/17/1.jpg，img/product/women/17/2.jpg，img/product/women/17/3.jpg，img/product/women/17/4.jpg，img/product/women/17/5.jpg，img/product/women/17/6.jpg，img/product/women/17/7.jpg，img/product/women/17/8.jpg，img/product/women/17/9.jpg，img/product/women/17/10.jpg'),
/*女士->美容用品 67-74*/
(NULL,67,'img/product/women1/1/1.jpg，img/product/women1/1/2.jpg，img/product/women1/1/3.jpg，img/product/women1/1/4.jpg，img/product/women1/1/5.jpg，img/product/women1/1/6.jpg，img/product/women1/1/7.jpg，img/product/women1/1/8.jpg'),
(NULL,68,'img/product/women1/2/1.jpg，img/product/women1/2/2.jpg，img/product/women1/2/3.jpg，img/product/women1/2/4.jpg，img/product/women1/2/5.jpg，img/product/women1/2/6.jpg，img/product/women1/2/7.jpg，img/product/women1/2/8.jpg，img/product/women1/2/9.jpg，img/product/women1/2/10.jpg'),
(NULL,69,'img/product/women1/3/1.jpg，img/product/women1/3/2.jpg，img/product/women1/3/3.jpg，img/product/women1/3/4.jpg，img/product/women1/3/5.jpg，img/product/women1/3/6.jpg，img/product/women1/3/7.jpg，img/product/women1/3/8.jpg，img/product/women1/3/9.jpg，img/product/women1/3/10.jpg'),
(NULL,70,'img/product/women1/4/1.jpg，img/product/women1/4/2.jpg，img/product/women1/4/3.jpg，img/product/women1/4/4.jpg，img/product/women1/4/5.jpg，img/product/women1/4/6.jpg，img/product/women1/4/7.jpg，img/product/women1/4/8.jpg'),
(NULL,71,'img/product/women1/5/1.jpg，img/product/women1/5/2.jpg，img/product/women1/5/3.jpg，img/product/women1/5/4.jpg，img/product/women1/5/5.jpg，img/product/women1/5/6.jpg，img/product/women1/5/7.jpg'),
(NULL,72,'img/product/women1/6/1.jpg，img/product/women1/6/2.jpg，img/product/women1/6/3.jpg，img/product/women1/6/4.jpg，img/product/women1/6/5.jpg，img/product/women1/6/6.jpg，img/product/women1/6/7.jpg，img/product/women1/6/8.jpg，img/product/women1/6/9.jpg，img/product/women1/6/10.jpg，img/product/women1/6/11.jpg，img/product/women1/6/12.jpg，img/product/women1/6/13.jpg'),
(NULL,73,'img/product/women1/7/1.jpg，img/product/women1/7/2.jpg，img/product/women1/7/3.jpg，img/product/women1/7/4.jpg，img/product/women1/7/5.jpg，img/product/women1/7/6.jpg，img/product/women1/7/7.jpg，img/product/women1/7/8.jpg，img/product/women1/7/9.jpg，img/product/women1/7/10.jpg，img/product/women1/7/11.jpg'),
(NULL,74,'img/product/women1/8/1.jpg，img/product/women1/8/2.jpg，img/product/women1/8/3.jpg，img/product/women1/8/4.jpg，img/product/women1/8/5.jpg，img/product/women1/8/6.jpg，img/product/women1/8/7.jpg'),
/*女士->孕产用品 75-79*/
(NULL,75,'img/product/women2/1/1.jpg，img/product/women2/1/2.jpg，img/product/women2/1/3.jpg'),
(NULL,76,'img/product/women2/2/1.jpg，img/product/women2/2/2.jpg，img/product/women2/2/3.jpg，img/product/women2/2/4.jpg，img/product/women2/2/5.jpg，img/product/women2/2/6.jpg，img/product/women2/2/7.jpg，img/product/women2/2/8.jpg'),
(NULL,77,'img/product/women2/3/1.jpg，img/product/women2/3/2.jpg，img/product/women2/3/3.jpg，img/product/women2/3/4.jpg，img/product/women2/3/5.jpg，img/product/women2/3/6.jpg，img/product/women2/3/7.jpg，img/product/women2/3/8.jpg，img/product/women2/3/9.jpg，img/product/women2/3/10.jpg'),
(NULL,78,'img/product/women2/4/1.jpg，img/product/women2/4/2.jpg，img/product/women2/4/3.jpg，img/product/women2/4/4.jpg，img/product/women2/4/5.jpg，img/product/women2/4/6.jpg，img/product/women2/4/7.jpg，img/product/women2/4/8.jpg，img/product/women2/4/9.jpg，img/product/women2/4/10.jpg，img/product/women2/4/11.jpg'),
(NULL,79,'img/product/women2/5/1.jpg，img/product/women2/5/2.jpg，img/product/women2/5/3.jpg，img/product/women2/5/4.jpg，img/product/women2/5/5.jpg，img/product/women2/5/6.jpg，img/product/women2/5/7.jpg，img/product/women2/5/8.jpg，img/product/women2/5/9.jpg，img/product/women2/5/10.jpg'),

/*家居->厨房用品 80-81*/
(NULL,80,'img/product/home/1/1.jpg，img/product/home/1/2.jpg，img/product/home/1/3.jpg，img/product/home/1/4.jpg，img/product/home/1/5.jpg，img/product/home/1/6.jpg，img/product/home/1/7.jpg'),
(NULL,81,'img/product/home/2/1.jpg，img/product/home/2/2.jpg，img/product/home/2/3.jpg，img/product/home/2/4.jpg，img/product/home/2/5.jpg，img/product/home/2/6.jpg，img/product/home/2/7.jpg，img/product/home/2/8.jpg，img/product/home/2/9.jpg'),
/*家居->床上用品 82-86*/
(NULL,82,'img/product/home1/1/1.jpg，img/product/home1/1/2.jpg，img/product/home1/1/3.jpg，img/product/home1/1/4.jpg，img/product/home1/1/5.jpg，img/product/home1/1/6.jpg，img/product/home1/1/7.jpg，img/product/home1/1/8.jpg，img/product/home1/1/9.jpg，img/product/home1/1/10.jpg'),
(NULL,83,'img/product/home1/2/1.jpg，img/product/home1/2/2.jpg，img/product/home1/2/3.jpg，img/product/home1/2/4.jpg，img/product/home1/2/5.jpg，img/product/home1/2/6.jpg，img/product/home1/2/7.jpg，img/product/home1/2/8.jpg，img/product/home1/2/9.jpg，img/product/home1/2/10.jpg'),
(NULL,84,'img/product/home1/3/1.jpg，img/product/home1/3/2.jpg，img/product/home1/3/3.jpg，img/product/home1/3/4.jpg，img/product/home1/3/5.jpg，img/product/home1/3/6.jpg，img/product/home1/3/7.jpg，img/product/home1/3/8.jpg，img/product/home1/3/9.jpg，img/product/home1/3/10.jpg，img/product/home1/3/11.jpg'),
(NULL,85,'img/product/home1/4/1.jpg，img/product/home1/4/2.jpg，img/product/home1/4/3.jpg，img/product/home1/4/4.jpg，img/product/home1/4/5.jpg，img/product/home1/4/6.jpg，img/product/home1/4/7.jpg，img/product/home1/4/8.jpg，img/product/home1/4/9.jpg，img/product/home1/4/10.jpg'),
(NULL,86,'img/product/home1/5/1.jpg，img/product/home1/5/2.jpg，img/product/home1/5/3.jpg，img/product/home1/5/4.jpg，img/product/home1/5/5.jpg，img/product/home1/5/6.jpg，img/product/home1/5/7.jpg，img/product/home1/5/8.jpg，img/product/home1/5/9.jpg，img/product/home1/5/10.jpg'),

/*家居->护理用品 87-98*/
(NULL,87,'img/product/home2/1/1.jpg，img/product/home2/1/2.jpg，img/product/home2/1/3.jpg，img/product/home2/1/4.jpg，img/product/home2/1/5.jpg，img/product/home2/1/6.jpg，img/product/home2/1/7.jpg，img/product/home2/1/8.jpg，img/product/home2/1/9.jpg'),
(NULL,88,'img/product/home2/2/1.jpg，img/product/home2/2/2.jpg，img/product/home2/2/3.jpg，img/product/home2/2/4.jpg，img/product/home2/2/5.jpg，img/product/home2/2/6.jpg，img/product/home2/2/7.jpg，img/product/home2/2/8.jpg，img/product/home2/2/9.jpg'),
(NULL,89,'img/product/home2/3/1.jpg，img/product/home2/3/2.jpg，img/product/home2/3/3.jpg，img/product/home2/3/4.jpg，img/product/home2/3/5.jpg，img/product/home2/3/6.jpg，img/product/home2/3/7.jpg，img/product/home2/3/8.jpg，img/product/home2/3/9.jpg，img/product/home2/3/10.jpg，img/product/home2/3/11.jpg'),
(NULL,90,'img/product/home2/4/1.jpg，img/product/home2/4/2.jpg，img/product/home2/4/3.jpg，img/product/home2/4/4.jpg，img/product/home2/4/5.jpg，img/product/home2/4/6.jpg，img/product/home2/4/7.jpg，img/product/home2/4/8.jpg'),
(NULL,91,'img/product/home2/5/1.jpg，img/product/home2/5/2.jpg，img/product/home2/5/3.jpg，img/product/home2/5/4.jpg，img/product/home2/5/5.jpg，img/product/home2/5/6.jpg，img/product/home2/5/7.jpg，img/product/home2/5/8.jpg，img/product/home2/5/9.jpg'),
(NULL,92,'img/product/home2/6/1.jpg，img/product/home2/6/2.jpg，img/product/home2/6/3.jpg，img/product/home2/6/4.jpg，img/product/home2/6/5.jpg，img/product/home2/6/6.jpg，img/product/home2/6/7.jpg，img/product/home2/6/8.jpg，img/product/home2/6/9.jpg，img/product/home2/6/10.jpg，img/product/home2/6/11.jpg，img/product/home2/6/12.jpg'),
(NULL,93,'img/product/home2/7/1.jpg，img/product/home2/7/2.jpg，img/product/home2/7/3.jpg，img/product/home2/7/4.jpg，img/product/home2/7/5.jpg，img/product/home2/7/6.jpg，img/product/home2/7/7.jpg'),
(NULL,94,'img/product/home2/8/1.jpg，img/product/home2/8/2.jpg，img/product/home2/8/3.jpg，img/product/home2/8/4.jpg，img/product/home2/8/5.jpg，img/product/home2/8/6.jpg，img/product/home2/8/7.jpg，img/product/home2/8/8.jpg，img/product/home2/8/9.jpg，img/product/home2/8/10.jpg'),
(NULL,95,'img/product/home2/9/1.jpg，img/product/home2/9/2.jpg，img/product/home2/9/3.jpg，img/product/home2/9/4.jpg，img/product/home2/9/5.jpg，img/product/home2/9/6.jpg，img/product/home2/9/7.jpg，img/product/home2/9/8.jpg，img/product/home2/9/9.jpg，img/product/home2/9/10.jpg，img/product/home2/9/11.jpg，img/product/home2/9/12.jpg，img/product/home2/9/13.jpg，img/product/home2/9/14.jpg，img/product/home2/9/15.jpg，img/product/home2/9/16.jpg，img/product/home2/9/17.jpg，img/product/home2/9/18.jpg，img/product/home2/9/19.jpg，img/product/home2/9/20.jpg，img/product/home2/9/21.jpg'),
(NULL,96,'img/product/home2/10/1.jpg，img/product/home2/10/2.jpg，img/product/home2/10/3.jpg，img/product/home2/10/4.jpg，img/product/home2/10/5.jpg，img/product/home2/10/6.jpg，img/product/home2/10/7.jpg，img/product/home2/10/8.jpg，img/product/home2/10/9.jpg，img/product/home2/10/10.jpg，img/product/home2/10/11.jpg，img/product/home2/10/12.jpg'),
(NULL,97,'img/product/home2/11/1.jpg，img/product/home2/11/2.jpg，img/product/home2/11/3.jpg，img/product/home2/11/4.jpg，img/product/home2/11/5.jpg，img/product/home2/11/6.jpg，img/product/home2/11/7.jpg，img/product/home2/11/8.jpg，img/product/home2/11/9.jpg'),
(NULL,98,'img/product/home2/12/1.jpg，img/product/home2/12/2.jpg，img/product/home2/12/3.jpg，img/product/home2/12/4.jpg，img/product/home2/12/5.jpg，img/product/home2/12/6.jpg，img/product/home2/12/7.jpg'),
/*家居->收纳用品 99-100*/
(NULL,99,'img/product/home3/1/1.jpg，img/product/home3/1/2.jpg，img/product/home3/1/3.jpg，img/product/home3/1/4.jpg，img/product/home3/1/5.jpg，img/product/home3/1/6.jpg，img/product/home3/1/7.jpg，img/product/home3/1/8.jpg，img/product/home3/1/9.jpg'),
(NULL,100,'img/product/home3/2/1.jpg，img/product/home3/2/2.jpg，img/product/home3/2/3.jpg，img/product/home3/2/4.jpg，img/product/home3/2/5.jpg，img/product/home3/2/6.jpg，img/product/home3/2/7.jpg，img/product/home3/2/8.jpg，img/product/home3/2/9.jpg'),
/*家居->卫浴用品 101-111*/
(NULL,101,'img/product/home4/1/1.jpg，img/product/home4/1/2.jpg，img/product/home4/1/3.jpg，img/product/home4/1/4.jpg，img/product/home4/1/5.jpg，img/product/home4/1/6.jpg，img/product/home4/1/7.jpg，img/product/home4/1/8.jpg，img/product/home4/1/9.jpg'),
(NULL,102,'img/product/home4/2/1.jpg，img/product/home4/2/2.jpg，img/product/home4/2/3.jpg，img/product/home4/2/4.jpg，img/product/home4/2/5.jpg，img/product/home4/2/6.jpg，img/product/home4/2/7.jpg，img/product/home4/2/8.jpg'),
(NULL,103,'img/product/home4/3/1.jpg，img/product/home4/3/2.jpg，img/product/home4/3/3.jpg，img/product/home4/3/4.jpg，img/product/home4/3/5.jpg，img/product/home4/3/6.jpg，img/product/home4/3/7.jpg，img/product/home4/3/8.jpg，img/product/home4/3/9.jpg，img/product/home4/3/10.jpg，img/product/home4/3/11.jpg'),
(NULL,104,'img/product/home4/4/1.jpg，img/product/home4/4/2.jpg，img/product/home4/4/3.jpg，img/product/home4/4/4.jpg，img/product/home4/4/5.jpg，img/product/home4/4/6.jpg，img/product/home4/4/7.jpg'),
(NULL,105,'img/product/home4/5/1.jpg，img/product/home4/5/2.jpg，img/product/home4/5/3.jpg，img/product/home4/5/4.jpg，img/product/home4/5/5.jpg，img/product/home4/5/6.jpg，img/product/home4/5/7.jpg，img/product/home4/5/8.jpg，img/product/home4/5/9.jpg，img/product/home4/5/10.jpg，img/product/home4/5/11.jpg'),
(NULL,106,'img/product/home4/6/1.jpg，img/product/home4/6/2.jpg，img/product/home4/6/3.jpg，img/product/home4/6/4.jpg，img/product/home4/6/5.jpg，img/product/home4/6/6.jpg，img/product/home4/6/7.jpg'),
(NULL,107,'img/product/home4/7/1.jpg，img/product/home4/7/2.jpg，img/product/home4/7/3.jpg，img/product/home4/7/4.jpg，img/product/home4/7/5.jpg，img/product/home4/7/6.jpg，img/product/home4/7/7.jpg，img/product/home4/7/8.jpg，img/product/home4/7/9.jpg'),
(NULL,108,'img/product/home4/8/1.jpg，img/product/home4/8/2.jpg，img/product/home4/8/3.jpg，img/product/home4/8/4.jpg，img/product/home4/8/5.jpg，img/product/home4/8/6.jpg，img/product/home4/8/7.jpg，img/product/home4/8/8.jpg'),
(NULL,109,'img/product/home4/9/1.jpg，img/product/home4/9/2.jpg，img/product/home4/9/3.jpg，img/product/home4/9/4.jpg，img/product/home4/9/5.jpg，img/product/home4/9/6.jpg，img/product/home4/9/7.jpg，img/product/home4/9/8.jpg，img/product/home4/9/9.jpg，img/product/home4/9/10.jpg'),
(NULL,110,'img/product/home4/10/1.jpg，img/product/home4/10/2.jpg，img/product/home4/10/3.jpg，img/product/home4/10/4.jpg，img/product/home4/10/5.jpg，img/product/home4/10/6.jpg，img/product/home4/10/7.jpg，img/product/home4/10/8.jpg'),
(NULL,111,'img/product/home4/11/1.jpg，img/product/home4/11/2.jpg，img/product/home4/11/3.jpg，img/product/home4/11/4.jpg，img/product/home4/11/5.jpg，img/product/home4/11/6.jpg，img/product/home4/11/7.jpg，img/product/home4/11/8.jpg'),
/*男士->男士服装服饰 112-127*/
(NULL,112,'img/product/men/1/1.jpg，img/product/men/1/2.jpg，img/product/men/1/3.jpg，img/product/men/1/4.jpg，img/product/men/1/5.jpg，img/product/men/1/6.jpg，img/product/men/1/7.jpg，img/product/men/1/8.jpg，img/product/men/1/9.jpg，img/product/men/1/10.jpg，img/product/men/1/11.jpg'),
(NULL,113,'img/product/men/2/1.jpg，img/product/men/2/2.jpg，img/product/men/2/3.jpg，img/product/men/2/4.jpg，img/product/men/2/5.jpg，img/product/men/2/6.jpg，img/product/men/2/7.jpg'),
(NULL,114,'img/product/men/3/1.jpg，img/product/men/3/2.jpg，img/product/men/3/3.jpg，img/product/men/3/4.jpg，img/product/men/3/5.jpg，img/product/men/3/6.jpg，img/product/men/3/7.jpg，img/product/men/3/8.jpg，img/product/men/3/9.jpg，img/product/men/3/10.jpg，img/product/men/3/11.jpg'),
(NULL,115,'img/product/men/4/1.jpg，img/product/men/4/2.jpg，img/product/men/4/3.jpg，img/product/men/4/4.jpg，img/product/men/4/5.jpg，img/product/men/4/6.jpg，img/product/men/4/7.jpg，img/product/men/4/8.jpg'),
(NULL,116,'img/product/men/5/1.jpg，img/product/men/5/2.jpg，img/product/men/5/3.jpg，img/product/men/5/4.jpg，img/product/men/5/5.jpg，img/product/men/5/6.jpg，img/product/men/5/7.jpg，img/product/men/5/8.jpg，img/product/men/5/9.jpg'),
(NULL,117,'img/product/men/6/1.jpg，img/product/men/6/2.jpg，img/product/men/6/3.jpg，img/product/men/6/4.jpg，img/product/men/6/5.jpg，img/product/men/6/6.jpg，img/product/men/6/7.jpg，img/product/men/6/8.jpg，img/product/men/6/9.jpg'),
(NULL,118,'img/product/men/7/1.jpg，img/product/men/7/2.jpg，img/product/men/7/3.jpg，img/product/men/7/4.jpg，img/product/men/7/5.jpg，img/product/men/7/6.jpg，img/product/men/7/7.jpg，img/product/men/7/8.jpg，img/product/men/7/9.jpg，img/product/men/7/10.jpg，img/product/men/7/11.jpg，img/product/men/7/12.jpg，img/product/men/7/13.jpg'),
(NULL,119,'img/product/men/8/1.jpg，img/product/men/8/2.jpg，img/product/men/8/3.jpg，img/product/men/8/4.jpg，img/product/men/8/5.jpg，img/product/men/8/6.jpg，img/product/men/8/7.jpg，img/product/men/8/8.jpg，img/product/men/7/9.jpg'),
(NULL,120,'img/product/men/9/1.jpg，img/product/men/9/2.jpg，img/product/men/9/3.jpg，img/product/men/9/4.jpg，img/product/men/9/5.jpg，img/product/men/9/6.jpg，img/product/men/9/7.jpg，img/product/men/9/8.jpg'),
(NULL,121,'img/product/men/10/1.jpg，img/product/men/10/2.jpg，img/product/men/10/3.jpg，img/product/men/10/4.jpg，img/product/men/10/5.jpg，img/product/men/10/6.jpg，img/product/men/10/7.jpg，img/product/men/10/8.jpg'),
(NULL,122,'img/product/men/11/1.jpg，img/product/men/11/2.jpg，img/product/men/11/3.jpg，img/product/men/11/4.jpg，img/product/men/11/5.jpg，img/product/men/11/6.jpg，img/product/men/11/7.jpg，img/product/men/11/8.jpg，img/product/men/11/9.jpg'),
(NULL,123,'img/product/men/12/1.jpg，img/product/men/12/2.jpg，img/product/men/12/3.jpg，img/product/men/12/4.jpg，img/product/men/12/5.jpg，img/product/men/12/6.jpg，img/product/men/12/7.jpg'),
(NULL,124,'img/product/men/13/1.jpg，img/product/men/13/2.jpg，img/product/men/13/3.jpg，img/product/men/13/4.jpg，img/product/men/13/5.jpg，img/product/men/13/6.jpg，img/product/men/13/7.jpg，img/product/men/13/8.jpg'),
(NULL,125,'img/product/men/14/1.jpg，img/product/men/14/2.jpg，img/product/men/14/3.jpg，img/product/men/14/4.jpg，img/product/men/14/5.jpg，img/product/men/14/6.jpg，img/product/men/14/7.jpg，img/product/men/14/8.jpg，img/product/men/14/9.jpg，img/product/men/14/10.jpg'),
(NULL,126,'img/product/men/15/1.jpg，img/product/men/15/2.jpg，img/product/men/15/3.jpg，img/product/men/15/4.jpg，img/product/men/15/5.jpg，img/product/men/15/6.jpg，img/product/men/15/7.jpg，img/product/men/15/8.jpg，img/product/men/15/9.jpg，img/product/men/15/10.jpg，img/product/men/15/11.jpg'),
(NULL,127,'img/product/men/16/1.jpg，img/product/men/16/2.jpg，img/product/men/16/3.jpg，img/product/men/16/4.jpg'),



/*男士->男士卫生用品 128*/
(NULL,128,'img/product/men1/1/1.jpg，img/product/men/1/2.jpg，img/product/men/1/3.jpg，img/product/men/1/4.jpg，img/product/men/1/5.jpg，img/product/men/1/6.jpg，img/product/men/1/7.jpg，img/product/men/1/8.jpg，img/product/men/1/9.jpg');
