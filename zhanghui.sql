-- ============================================================
--  张慧 · 代码与月光  个人网站数据库
--  文件名：zhanghui.sql
--  编码：utf8mb4
--  表名前缀：姓名全拼 zhanghui + 下划线 + 作用
--  ------------------------------------------------------------
--  导入方法（二选一）：
--  1）phpMyAdmin 中选择数据库 → 导入 → 选择本文件 → 执行
--  2）浏览器访问  http://你的网址/install.php?key=zhanghui2026
-- ============================================================

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- 1、管理员表 zhanghui_admin
-- ----------------------------
DROP TABLE IF EXISTS `zhanghui_admin`;
CREATE TABLE `zhanghui_admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '管理员ID',
  `username` varchar(32) NOT NULL COMMENT '登录账号',
  `password` char(32) NOT NULL COMMENT '登录密码（md5）',
  `nickname` varchar(32) DEFAULT '张慧' COMMENT '显示名称',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='管理员表';

-- 默认账号 admin，密码 admin888
INSERT INTO `zhanghui_admin` (`id`, `username`, `password`, `nickname`, `created_at`) VALUES
(1, 'admin', '7fef6171469e80d32c0559f88b377245', '张慧', '2026-09-01 09:00:00');

-- ----------------------------
-- 2、日志（新闻）表 zhanghui_news
-- ----------------------------
DROP TABLE IF EXISTS `zhanghui_news`;
CREATE TABLE `zhanghui_news` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '日志ID',
  `title` varchar(120) NOT NULL COMMENT '标题',
  `category` varchar(32) DEFAULT '随笔' COMMENT '分类',
  `summary` varchar(255) DEFAULT '' COMMENT '摘要',
  `content` mediumtext COMMENT '正文',
  `is_top` tinyint(1) DEFAULT 0 COMMENT '是否置顶 1是 0否',
  `views` int(11) DEFAULT 0 COMMENT '阅读量',
  `created_at` datetime DEFAULT NULL COMMENT '发布时间',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_created` (`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='日志表';

INSERT INTO `zhanghui_news` (`id`, `title`, `category`, `summary`, `content`, `is_top`, `views`, `created_at`, `updated_at`) VALUES
(1, '网站总算跑起来了', '代码', '白屏了一下午，最后发现是数据库名少写了一个字母。',
'下午四点二十，首页终于在浏览器里显示出来了。前面两个小时一直是白屏，我以为是页面写错了，把 index.php 从头到尾看了一遍，没看出问题。后来想起来要看错误提示，翻到 environ.php 才发现库名少写了一个字母。

改完刷新，页面出来了。我在宿舍小声喊了一句，室友问我在干嘛。

这个网站做了一个多星期。前台是首页、日志、关于、留言板，后台能发文章、能删留言、能回复。数据库三张表，admin 存账号，news 存文章，message 存留言，表名按老师的要求改成了 zhanghui_ 开头。一开始漏改了一个文件里的 SQL，点了半天没反应，又找了很久。

写的过程里最麻烦的不是 HTML，是让表单和数据库对上。字段名多打一个字母就报错，报错只有一行英文，看不懂。我记了两页纸，现在回头看，大多数错误都犯得很低级。

后台在 admin/login.php，账号 admin，密码先设的 admin888。老师说要改成自己的密码，我记在便签上了，等交完作业再改。

还没弄好的：手机上表格会挤，图片一直没加。

2026-11-02 记。',
1, 0, '2026-11-02 16:38:00', '2026-11-02 16:38:00'),
(2, '中午的食堂', '生活', '十一点四十下课，十一点四十三到食堂，队伍已经排到门口。',
'食堂一楼最里面那家做番茄炒蛋，三块五，加米饭五块五。鸡蛋给得实在，番茄不太酸，是我这学期吃得最多的一道菜。

今天十一点四十下课，从教学楼走过去三分钟。到的时候队伍已经拐了个弯，排了大概七分钟。轮到我时番茄炒蛋只剩盆底一点，阿姨用勺子刮了两下，全扣在我盘子里，还问要不要再加点汤汁。

桌子是四人长桌，中午基本要拼桌。今天对面坐了两个男生，一个说自己电脑蓝屏了，另一个在教他怎么进安全模式。我一边吃一边听，感觉比上机课讲得清楚。

吃完出来，太阳正好。台阶上趴着一只橘猫，晒得很舒展，我叫它，它不理。',
0, 0, '2026-10-31 12:20:00', '2026-10-31 12:20:00'),
(3, '学校的小猫', '生活', '食堂后门那只三花，今天总算让我摸到了。',
'食堂后门靠垃圾桶那边有个纸箱，垫着旧衣服，是它的窝。不知道是谁搭的。

这只三花平时见人就跑，只有中午人少的时候才肯待在门口。今天我刚坐下，它自己走过来，在我脚边转了两圈，尾巴翘得挺高。

我把盘子里的鸡腿撕了一小块放地上，它闻了闻，没吃。我以为嫌小，又撕了一块，还是不吃。旁边刷碗的阿姨说，它一天两顿有人喂，猫粮管够，看不上鸡腿。

难怪。它不吃，但也没走，就在我脚边趴着，让我摸了两下背。毛有点硬。

宿舍不让养，只能中午过来看看。它好像也不在意我来不来。',
0, 0, '2026-10-29 13:05:00', '2026-10-29 13:05:00'),
(4, '传文件传到 404', '代码', 'FTP 传错了目录，首页 404 了半个多小时。',
'老师说网站要传到网页空间上，别人才能打开。我装了 FileZilla，填好主机、账号、密码，连上去看到一堆文件夹。

第一次传的时候网断了，重新连上以后，我把整个项目直接拖到了刚登录进来的那个目录，不是 wwwroot。传完打开网址，404。

我以为是空间还没生效，等了二十分钟，又刷新了十几次，还是 404。后来问了同学，他说网站必须放在 wwwroot 里面，放别的地方访问不到。

删掉重传，这次一口气传完。再打开网址，页面跟本地一模一样，连留言板里我测试时写的那条「111」都在。

有点不真实。原来我电脑上的东西，别人也能看到了。',
0, 0, '2026-10-26 19:47:00', '2026-10-26 19:47:00');

-- ----------------------------
-- 3、留言表 zhanghui_message
-- ----------------------------
DROP TABLE IF EXISTS `zhanghui_message`;
CREATE TABLE `zhanghui_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '留言ID',
  `name` varchar(32) NOT NULL COMMENT '昵称',
  `email` varchar(80) DEFAULT '' COMMENT '邮箱',
  `content` varchar(500) NOT NULL COMMENT '留言内容',
  `reply` varchar(500) DEFAULT '' COMMENT '站长回复',
  `ip` varchar(45) DEFAULT '' COMMENT '留言IP',
  `is_visible` tinyint(1) DEFAULT 1 COMMENT '是否显示 1显示 0隐藏',
  `created_at` datetime DEFAULT NULL COMMENT '留言时间',
  PRIMARY KEY (`id`),
  KEY `idx_created` (`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='留言表';

INSERT INTO `zhanghui_message` (`id`, `name`, `email`, `content`, `reply`, `ip`, `is_visible`, `created_at`) VALUES
(1, '王老师', '', '首页的标题改成「31张慧-首页」了，其他页面也要一起改。数据库导出的 sql 记得放根目录。', '改好了老师，正在重新传。', '10.12.0.2', 1, '2026-11-02 09:12:00'),
(2, '陈雨', '', '手机上打开导航会变成两条杠，能用。就是留言的输入框在小屏上有点靠下，要滑一下。', '', '10.12.3.21', 1, '2026-11-01 20:41:00'),
(3, '匿名', '', '路过，收藏了。', '', '10.12.5.66', 1, '2026-10-30 22:05:00');

SET FOREIGN_KEY_CHECKS = 1;

-- ============================================================
--  导入完成后即可使用：
--  前台首页  index.php
--  后台地址  admin/login.php
--  后台账号  admin
--  后台密码  admin888
-- ============================================================
