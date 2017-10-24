
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
	`ques_id` INT PRIMARY KEY,
	`ques_type` INT,
	`ques_course` VARCHAR(50) NOT NUll,
	`ques_content` TEXT, 
	`opt_a` TEXT,
	`opt_b` TEXT,
	`opt_c` TEXT,
	`opt_d` TEXT,
	`answer` CHAR(5)
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
	`falg` TINYINT(3),
	`test_time` VARCHAR(50)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;


insert `user` values(
	'15090128', 'yjh', '123456', 3
);

insert `user` values(
	'admin', 'admin', 'admin', 1
);

insert `user_flag` values(
	'15090128', '数学', '0', '2017/10/17'
);

insert `test_set` values(
	'数学', 1,1, 2,2, 0,4, 3, '2017/10/17'  
);

insert `test_set` values(
	'语文', 1,1, 2,2, 0,4, 3, '2017/10/18'  
);

insert `user_flag` values(
	'15090128', '语文', '0', '2017/10/18'
);

insert `test_set` values(
	'英语', 1,1, 2,2, 0,4, 3, '2017/10/18'  
);

update `test_set` set test_time='2017/10/20' where course='数学';
update `user_flag` set test_time='2017/10/20' where course='数学';
update `test_set` set muti_ques_num=3 where course='数学';
update `test_set` set muti_ques_score=2 where course='数学';

insert `question` values(
	1,  1,  '数学',  '1+1=2?',  '正确', '错误', '', '', 'A'
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

/*试卷：题目数量，题号列表*/
DROP TABLE IF EXISTS `paper`;
CREATE TABLE `paper` (
	`paper_id` INT PRIMARY KEY,
	`user_id` INT NOT NUll,
	`paper_course` VARCHAR(50) NOT NUll,
	`judge_ques_list` TEXT,
	`single_ques_list` TEXT,
	`muti_ques_list` TEXT,
	`score` INT
)ENGINE=InnoDB DEFAULT CHARSET=utf8;


