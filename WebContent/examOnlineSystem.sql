
create database `exam_online_system`;
use  `exam_online_system`;

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
	`user_id` VARCHAR(20) PRIMARY KEY,
	`user_name` VARCHAR(50) NOT NULL,
	`password` VARCHAR(50) NOT NULL,
	`user_type` TINYINT(3) NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `question`;
CREATE TABLE `question` (
	`ques_id` INT PRIMARY KEY AUTO_INCREMENT,
	`ques_type` INT,
	`ques_course` VARCHAR(50) NOT NUll,
	`ques_content` TEXT, 
	`opt_a` TEXT,
	`opt_b` TEXT,
	`opt_c` TEXT,
	`opt_d` TEXT,
	`answer` VARCHAR(10)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `test_set`;
CREATE TABLE `test_set` (
	`course` VARCHAR(50) PRIMARY KEY,
	`judge_ques_num` TINYINT(3),
	`judge_ques_score` TINYINT(3),
	`single_ques_num` TINYINT(3),
	`single_ques_score` TINYINT(3),
	`muti_ques_num` TINYINT(3),
	`muti_ques_score` TINYINT(3),
	`total_time` TINYINT(3),
	`test_time` VARCHAR(50)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `user_flag`;
CREATE TABLE `user_flag` (
	`user_id` varchar(20),
	`course` VARCHAR(50),
	`flag` TINYINT(3),
	`test_time` VARCHAR(50)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `test_record`;
CREATE TABLE `test_record` (
	`user_id` varchar(20),
    `course` VARCHAR(50),
	`ques_id` INT,
	`ques_num` INT,
	`ques_type` INT,
	`answer` TEXT,
    `score` INT,
	`test_time` TEXT
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `paper`;
CREATE TABLE `paper` (
	`paper_id` INT PRIMARY KEY auto_increment,
	`user_id` varchar(30) NOT NUll,
	`paper_course` VARCHAR(50) NOT NUll,
	`score` INT
)ENGINE=InnoDB DEFAULT CHARSET=utf8;


insert `user` values(
	'15090128', 'JiahaoYang', 'e10adc3949ba59abbe56e057f20f883e', 1
);
insert `user` values(
	'15090146', 'ShihuiQian', 'e10adc3949ba59abbe56e057f20f883e', 2
);
insert `user` values(
	'15090127' , 'JianJianLi', 'e10adc3949ba59abbe56e057f20f883e', 3
);
insert `user` values(binary
	'15090130' , 'JibaYao', 'e10adc3949ba59abbe56e057f20f883e', 3
);



insert `user_flag` values(
	'15090127', '数学', '0', '2017-11-02'
);
insert `user_flag` values(
	'15090130', '数学', '0', '2017-11-02'
);
insert user_flag values(
	'15090127' ,'语文', '0', '2017-11-02'
);
insert user_flag values(
	'15090130' ,'语文', '0', '2017-11-02'
);


insert `test_set` values(
	'数学', 1,1, 2,2, 3,3, 1, '2017-11-02'  
);
insert `test_set` values(
	'语文', 1,1, 0,2, 2,3, 1, '2017-11-02'  
);
insert `test_set` values(
	'英语', 1,1, 2,2, 2,3, 1, '2017-11-03'  
);



insert `question` values(
	1,  1,  '数学',  '1+1=2?',  '正确', '错误', '', '', 'yes'
);
insert `question` values(
	2, 2, '数学', '1+1=?', '1','2','3','4' ,'B'
);
insert `question` values(
	3, 2, '数学', '1+2=?', '1','2','3','4' ,'C'
);
insert `question` values(
	4, 3, '数学', '?+?=3', '1+1','2+1','1+2','3+0', 'B C D'
);
insert `question` values(
	5, 3, '数学', '?+?=5', '1+1','4+1','1+2','3+2', 'B D'
);
insert `question` values(
	6, 3, '数学', '?+?=6', '1+5','2+1','1+2','3+3', 'A D'
);
insert `question` values(
	7, 1, '语文', '杜甫是元朝人', '正确', '错误', '', '', 'no'
);
insert `question` values(
	8, 2, '语文', '床前明月光,___________', '汗滴禾下土', '飞流直下三千尺', '疑是地上霜', '更有早行人', 'C'
);
insert `question` values(
	9, 2, '语文', '举头望明月,___________', '汗滴禾下土', '飞流直下三千尺', '疑是地上霜', '低头思故乡', 'D'
);
insert `question` values(
	10, 2, '语文', '鹅鹅鹅,___________', '汗滴禾下土', '曲项向天歌', '疑是地上霜', '更有早行人', 'B'
);
insert `question` values(
	11, 2, '语文', '洛阳亲友如相问,___________', '一片冰心在玉壶', '飞流直下三千尺', '疑是地上霜', '更有早行人', 'A'
);
insert `question` values(
	12, 3, '语文', '修辞手法有哪些', '比喻', '飞流直下三千尺', '拟人', '排比', 'A C D'
);
insert `question` values(
	13, 3, '语文', '柳永是宋代专力写词的第一人,为后世留下了许多佳作,他给词坛带来的新变化有：', 
    '大量创作慢词', '变雅为俗,用通俗化语言表现市民生活', '成功地运用了铺叙和白描的手法', '词的审美趣味向通俗化和自我化方向转变', 
    'A B'
);
insert `question`(ques_type, ques_course, ques_content, opt_a, opt_b, opt_c, opt_d, answer) values(
	 3, '语文', '修辞手法有哪些', '比喻', '飞流直下三千尺', '拟人', '排比', 'A C D'
);

select * FROM question;







