CREATE TABLE `mydict` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `word` varchar(20) NOT NULL,
  `explain` varchar(200) NOT NULL,
  `tf_flg` int(11) DEFAULT '0',
  `root` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `word_3` (`word`),
  KEY `word` (`word`),
  KEY `word_2` (`word`)
);



INSERT INTO `mydict` (`id`, `word`, `explain`, `tf_flg`, `root`) VALUES
(1, 'a', 'n.(A)As 或 A''s  安(ampere);(a) art.一;n.字母A /[军] Analog.Digital,模拟/数字 /(=account of) 帐上', 2, '\n  1 \na：一 (个)不定冠词an在发展过程中出现的缩略形式，应用于首字母为辅音的单词及h发音单词。\n  2 \nA：英语字母表的第一个字母英语字母 A 来自希腊字母alpha,来自腓尼基字母aleph,可能最终来自象形符号≮，表示牛头。\n  3 \nA：英语字母表的第一个字母如同汉字起源于象形，英语字母表中的每个字母一开始都是描摹某种动物或物体形状的图画，而这些图画最后演变成为符号。但这些符号和原先被描摹之实物的形状几无相似之处。谁也不能肯定这些象形字母原先究竟代表什么。我们的解释只能是学者们基于史料作出的有根据的猜测。一般认为希腊字母乃西方所有字母，包括拉丁字母的始祖。其实希腊人的字母又是从腓尼基人那里借过来的。约在3000年前，在腓基尼字母表中字母A读如aleph,写起来形似字母V，中间再加一横，代表牛头或者牛角。以后希腊人将它倒过来写。对于古代腓尼基人来说，牛意味着财富，吃，穿，耕作都少不了它。这也许就是A被列为第一个字母的缘故。\n'),
(2, 'aaal', 'American Academy of Arts and Letters 美国艺术和文学学会', 0, NULL),
(3, 'aachen', ' 亚琛[德意志联邦共和国西部城市]', 0, NULL),
(4, 'aacs', 'Airways and Air Communications Service (美国)航路与航空通讯联络处', 0, NULL),
(5, 'aah', ' [军]Armored Artillery Howitzer,装甲榴弹炮;[军]Advanced Attack Helicopter,先进攻击直升机', 0, NULL),
(6, 'aal', 'ATM Adaptation Layer,ATM适应层', 0, NULL),
(7, 'aapamoor', 'n.[生]丘泽,高低位镶嵌沼泽', 0, NULL),
(8, 'aapss', 'American Academy of Political and Social Science 美国政治和社会科学研究院', 0, NULL),
(9, 'aar', 'n.阿勒河(位于瑞士中部,亦作Aare)', 0, NULL),
(10, 'aardvark', 'n.[动]土豚', 0, '\naardvark：土豚aard同earth,表示土。vark同pork,猪肉，furrow,垄，farrow,一窝小猪，表示拱的动作，猪。\n'),
(11, 'aardwolf', 'n.[动]土狼', 0, NULL),
(12, 'aare', ' 阿勒河[瑞士中部]', 0, NULL),
(13, 'aarnet', 'the Australian Academic and Research Network,澳大利亚科研网', 0, NULL),
(14, 'aaron', 'n.[圣经]亚伦(摩西之兄,犹太教的第一祭司长)', 0, NULL),
(15, 'aaronic', 'adj.亚伦的', 0, NULL),
(16, 'aarp', 'AppleTalk Address Resolution Protocol,AppleTalk地址解析协议', 0, NULL),
(17, 'aasvogel', 'n.[动]南非秃鹫', 0, NULL),
(18, 'aau', 'Amateur Athletic Union (of the United States) (美国)业余体育联合会', 0, NULL),
(19, 'aaui', 'Apple attachment unit interface,Apple插件单元接口', 0, NULL),
(20, 'aaup', 'American Association of University Professors 美国大学教授联合会', 0, NULL),
(21, 'aauw', 'American Association of University Women 美国大学妇女联合会', 0, NULL),
(22, 'ab', ' [军] Airborne,空运 (历法)阿布月(即犹太教历5月)', 0, NULL),
(23, 'aba', 'n.毛织物,(阿拉伯式)长袍', 0, NULL),
(24, 'abac', ' <英>(=nomogram)[数]算图,诺模图', 0, NULL),
(25, 'abaca', 'n.[植]马尼拉麻,麻蕉', 0, NULL),
(26, 'abaci', 'n.算盘(abacus的复数)', 0, NULL),
(27, 'abacist', 'n.用算盘者', 0, NULL),
(28, 'aback', 'adv.向后地', 2, '\naback：大吃一惊来自古英语on back 的缩写，多用于短语take aback, 表示被人从后面突然打了一下，吃惊。\n'),
(29, 'abacterial', 'adj.非细菌性的', 0, NULL),
(30, 'abactinal', 'adj.无触角的', 0, NULL),
(31, 'abacus', 'n.算盘', 2, NULL),
(32, 'abaddon', 'n.[圣经]地狱,魔鬼(地狱里的魔王)', 0, NULL),
(33, 'abaft', 'adv.向船尾;prep.在...后', 0, NULL),
(34, 'abalienate', 'v.[律]移转,让渡(产权或财产)', 0, NULL),
(35, 'abalone', 'n.<美>[动]鲍鱼(软体动物)', 0, '\nabalone：鲍鱼来自印地安土著语。\n'),
(36, 'abampere', 'n.[电] 电磁安(培)(1电磁安=10安)', 0, NULL),
(37, 'abandon', 'vt.放弃,遗弃;n.放任,狂热', 2, NULL),
(38, 'abandoned', 'adj.被抛弃的,自甘堕落的,没有约束的,放荡的', 0, NULL),
(39, 'abandonee', 'n.被遗弃者,被委付者', 0, NULL),
(40, 'abandoner', 'n.遗弃者,委付者', 0, NULL),
(41, 'abandonment', 'n.放弃', 2, NULL),
(42, 'abaptiston', 'n.圆锯(用于脑部手术)', 0, NULL),
(43, 'abas', 'vt.打倒', 0, NULL),
(44, 'abasable', 'adj.可贬黜的,可降低的', 0, NULL),
(45, 'abase', 'v.降低', 0, '\nabase：使低下，卑微，屈从前缀a-,同ad-, 去，往。base, 低下，卑微，见base metal, 贱金属。\n'),
(46, 'abasement', 'n.降低', 0, NULL),
(47, 'abash', 'vt.使局促不安,使困窘', 0, NULL),
(48, 'abashed', 'adj.不安的,窘迫的', 0, '\nabashed：羞愧前缀a-同ex-。-bash同词根bat, 拟声词，表示张嘴，窘迫，羞愧，同bashful.\n'),
(49, 'abashment', 'n.羞愧,害臊', 0, NULL),
(50, 'abasia', 'n.[医] (神经系统疾病引发的)步行不能', 0, NULL),
(51, 'abask', 'adv.暖洋洋地', 0, NULL),
(52, 'abatage', 'n.(=abattage)为防止传染而屠杀有病的牲畜', 0, NULL),
(53, 'abate', 'vt.使(数量、程度等)减少,减轻,除去,缓和,打折扣vi.(数量、程度等)减少,减轻,失效,缓和,(法令等)被废除', 2, NULL),
(54, 'abatement', 'n.消除', 2, NULL),
(55, 'abattage', 'n.为防止传染而被屠杀的有病之牲畜', 0, NULL),
(56, 'abattis', 'n.=abatis', 0, NULL),
(57, 'abattoir', 'n.<法>屠宰场,(拳击,摔跤,斗牛等的)角斗场', 2, '\nabattoir：屠宰场词源同abate,指更严重的打压，喻指屠宰。\n'),
(58, 'abaxial', 'adj.离轴的', 0, NULL),
(59, 'abaya', 'n.=aba', 2, '\nabaya：阿拉伯长袍来自阿拉伯语。\n'),
(60, 'abb', 'n.横丝,纬纱,劣质羊毛', 0, NULL),
(61, 'abba', 'n.神父', 0, '\nabba：阿爸来自犹太语分支阿拉米语，最终来自儿语拟声词，同father. abbey 隐修院 词源同abbot. -y地点后缀。\n'),
(62, 'abbacy', 'n.男修道院院长的职位、管区、任期', 0, NULL),
(63, 'abbatial', 'adj.修道院长的', 0, NULL),
(64, 'abbe', 'n.男修道院院长,僧侣,神父', 0, NULL),
(65, 'abbess', 'n.女修道院院长,女庵主持', 0, NULL),
(66, 'abbevillian', 'adj.&n.阿布维利文化(的)(指欧洲旧石器时代初期较早阶段的文化)', 0, NULL),
(67, 'abbey', 'n.修道院,修道士(总称)', 2, '\nabbey：隐修院词源同abbot.-y 地点后缀。\n'),
(68, 'abbeystead', 'n.修道院所在地', 0, NULL),
(69, 'abborrent', '嫌恶的', 0, NULL),
(70, 'abbot', 'n.修道院,修道士的总称', 2, NULL),
(71, 'abbr', '缩写(abbreviation)', 0, NULL),