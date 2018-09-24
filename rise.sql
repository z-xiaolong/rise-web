/*
Navicat MySQL Data Transfer

Source Server         : cocome
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : rise

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2018-09-24 21:45:44
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for rise_admin
-- ----------------------------
DROP TABLE IF EXISTS `rise_admin`;
CREATE TABLE `rise_admin` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `account` varchar(45) NOT NULL,
  `userName` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `status` int(10) DEFAULT NULL,
  `type` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rise_admin
-- ----------------------------
INSERT INTO `rise_admin` VALUES ('1', 'superadmin', '超级管理员', '96a33bb88bf2758cc306d7f6602be0de', '18883342482', '297993231@qq.com', '1', '超级管理员');
INSERT INTO `rise_admin` VALUES ('2', 'admin', '周小龙', '21232f297a57a5a743894a0e4a801fc3', '18883342482', '670095603@qq.com', '1', '普通管理员');
INSERT INTO `rise_admin` VALUES ('3', '12306', '12306', '69f65a2e91e6051a23abe7293bf3386a', '13845174267', '481648179@qq.com', '0', '普通管理员');
INSERT INTO `rise_admin` VALUES ('4', '10086', '10086', '96a33bb88bf2758cc306d7f6602be0de', '15879414632', '789415489@qq.com', '1', '普通管理员');
INSERT INTO `rise_admin` VALUES ('5', '121123', '3213', '1b80b1fdf7a4fa060249b6509802f94e', '13648921478', '5494514789@qq.com', '1', '管理员');
INSERT INTO `rise_admin` VALUES ('6', '3213', '3213', '9bd5ee6fe55aaeb673025dbcb8f939c1', '13648795214', '4324324', '0', '4234324');
INSERT INTO `rise_admin` VALUES ('7', '456456', '456461231', 'b51e8dbebd4ba8a8f342190a4b9f08d7', '18884424572', '5615484891', '1', '489489465');
INSERT INTO `rise_admin` VALUES ('8', '10000', '10000', 'b7a782741f667201b54880c925faec4b', '13547984512', '116489218@qq.com', '1', '普通管理员');

-- ----------------------------
-- Table structure for rise_article
-- ----------------------------
DROP TABLE IF EXISTS `rise_article`;
CREATE TABLE `rise_article` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `type` varchar(64) DEFAULT NULL,
  `subType` varchar(64) DEFAULT NULL,
  `createTime` timestamp NULL DEFAULT NULL,
  `publishTime` varchar(64) DEFAULT NULL,
  `publisher` varchar(20) DEFAULT NULL,
  `author` varchar(20) DEFAULT NULL,
  `content` text NOT NULL,
  `browseCounts` int(10) DEFAULT NULL,
  `titleImage` varchar(255) DEFAULT NULL,
  `status` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rise_article
-- ----------------------------
INSERT INTO `rise_article` VALUES ('3', 'aaa', '学术报告', '出访', '2018-09-12 21:03:12', '2018-09-13', '管理员', '管理员', '<p style=\"text-align: center;\">aasfsdfsgdgdfgdsfgsdgdfg<img src=\"http://localhost:8080/uploadImage/20180912/25701536757384663.jpg\" _src=\"http://localhost:8080/uploadImage/20180912/25701536757384663.jpg\"/></p>', '0', '', '0');
INSERT INTO `rise_article` VALUES ('5', 'ccc', '学术会议', '国际会议', '2018-09-12 21:26:08', '2018-09-25', '周小龙', '周小龙', '<p>dsadasdasdas</p>', '0', '', '1');
INSERT INTO `rise_article` VALUES ('6', '测试', '学术交流', '出访', '2018-09-13 09:53:59', '2018-09-27', '周小龙', '周小龙', '<p>测试</p>', '0', '', '1');
INSERT INTO `rise_article` VALUES ('8', 'dadasd', '学术交流', '出访', '2018-09-13 16:45:01', '2018-09-26', '周小龙', '周小龙', '<p>ddsadsa</p>', '0', '', '0');
INSERT INTO `rise_article` VALUES ('9', '欣慰', '招贤纳士', null, '2018-09-13 16:46:05', '2018-09-21', '周小龙', '周小龙', '<p>fdsfsdfsdfsdfd</p>', '0', '', '1');
INSERT INTO `rise_article` VALUES ('10', '社区', '招贤纳士', null, '2018-09-13 16:46:21', '2018-09-18', '周小龙', '周小龙', '<p>发犯得上发射点发生·法大师傅士大夫·gaknjknnfakjkldsj</p><p style=\"text-align: center;\"><img src=\"http://localhost:8080/uploadImage/20180913/32551536837458200.jpg\" _src=\"http://localhost:8080/uploadImage/20180913/32551536837458200.jpg\"/></p><p style=\"text-align: left;\">fdfsdfaf</p>', '0', '', '0');
INSERT INTO `rise_article` VALUES ('11', '测试fdsf', '学术报告', null, '2018-09-13 16:50:13', '2018-09-10', '周小龙', '周小龙', '<p>asfasf<img src=\"http://localhost:8080/uploadImage/20180913/82511536828609468.jpg\" _src=\"http://localhost:8080/uploadImage/20180913/82511536828609468.jpg\"/></p>', '0', '', '1');
INSERT INTO `rise_article` VALUES ('14', 'cs1', '学术交流', '出访', '2018-09-13 21:40:50', '2018-09-12', '周小龙', '周小龙', '<p><img src=\"http://localhost:8080/uploadImage/20180913/40291536846046044.jpg\" _src=\"http://localhost:8080/uploadImage/20180913/40291536846046044.jpg\"/></p>', '0', '', '1');
INSERT INTO `rise_article` VALUES ('17', '测试', '招贤纳士', null, '2018-09-13 21:51:55', '2018-09-17', '超级管理员', '超级管理员', '<p style=\"color: rgb(0, 0, 0); white-space: normal;\"><span style=\"font-family:楷体, 楷体_GB2312, SimKai\"><span style=\"font-size: 18px;\">RISE is at the forefront of advancing software development for heterogeneous inter-networking systems. It links emerging theories and methods inter-disciplines (mathematics, computation, control, network communications, artificial intelligence, ICT, and economic and social dilemmas).</span><br/></span></p><p style=\"color: rgb(0, 0, 0); white-space: normal;\"><span style=\"font-size: 18px;font-family:楷体, 楷体_GB2312, SimKai\">Our contributions include</span></p><ul class=\" list-paddingleft-2\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; width: 870.028px; padding-left: 30px; color: rgb(0, 0, 0); white-space: normal;\"><li style=\"clear: both;\"><p><span style=\"font-size: 18px;font-family:楷体, 楷体_GB2312, SimKai\">Development unifying theories of modelling relevant to software development stages. This refers also to various kinds of systems, such as concurrent systems, fault-tolerant systems, real-time and hybrid systems.</span></p></li><li style=\"clear: both;\"><p><span style=\"font-size: 18px;font-family:楷体, 楷体_GB2312, SimKai\">Novel techniques, algorithms, and tools have been developed for modelling, refining and verifying object-oriented architectures, component-based architectures, service-oriented architectures, and hybrid systems, in order for them to meet critical system requirements for the interrelated correctness, safety, security, real-time, and fault-tolerance. Some of the theories, techniques, and tools are experimented with development of applications in domains of healthcare and high speed train systems. Some are used in undergraduate and postgraduate teaching too.</span></p></li><li style=\"clear: both;\"><p><span style=\"font-size: 18px;font-family:楷体, 楷体_GB2312, SimKai\">Techniques, models and algorithms are developed in data mining artificial intelligence, and optimisation. Our research in data mining addresses challenges in privacy preserving data mining, complex patterns mining, and mining on sequence or time series data. The techniques are applied to the domain of medical informatics to predict abnormal medical conditions, for example.</span></p></li></ul><p style=\"color: rgb(0, 0, 0); white-space: normal; text-align: justify;\"><span style=\"font-size: 18px;font-family:楷体, 楷体_GB2312, SimKai\">With funding from China Natural Science Foundation and other funding sources of national and local governments, Southwest University, and industry, our projects investigate the following areas and problems.</span></p><ul class=\" list-paddingleft-2\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; width: 870.028px; padding-left: 30px; color: rgb(0, 0, 0); white-space: normal;\"><li style=\"clear: both;\"><p><span style=\"font-size: 18px;font-family:楷体, 楷体_GB2312, SimKai\">Cyber-Physical Systems Hybrid Systems Modelling, Verification</span></p></li><li style=\"clear: both;\"><p><span style=\"font-size: 18px;font-family:楷体, 楷体_GB2312, SimKai\">Intelligent Architecture for Dynamic Uncertainty of Requirements</span></p></li><li style=\"clear: both;\"><p><span style=\"font-size: 18px;font-family:楷体, 楷体_GB2312, SimKai\">Formal Software Engineering (Analysis, Design, Verification, Testing)</span></p></li><li style=\"clear: both;\"><p><span style=\"font-size: 18px;font-family:楷体, 楷体_GB2312, SimKai\">Evolving and Adaptive Software Architectures and Microservice Architecture</span></p></li><li style=\"clear: both;\"><p><span style=\"font-size: 18px;font-family:楷体, 楷体_GB2312, SimKai\">Service Based Systems and Service Recommendation Systems</span></p></li><li style=\"clear: both;\"><p><span style=\"font-size: 18px;font-family:楷体, 楷体_GB2312, SimKai\">Theory of Quantum Private Communication</span></p><p><span style=\"font-family:楷体, 楷体_GB2312, SimKai\"><span style=\"font-size: 18px;\"></span></span></p></li></ul><p style=\"color: rgb(0, 0, 0); white-space: normal;\"><span style=\"font-family:楷体, 楷体_GB2312, SimKai\"><span style=\"font-size: 18px;\">Details of research projects can be found at&nbsp;</span><a href=\"http://www.swu-rise.net.cn/#/research\" target=\"_self\"><span style=\"font-family:楷体, 楷体_GB2312, SimKai\"><span style=\"font-size: 18px;\">Projects at RISE</span></span></a><span style=\"font-size: 18px;\">&nbsp;and information of publications are available at&nbsp;</span><a href=\"http://www.swu-rise.net.cn/#/research\" target=\"_self\"><span style=\"font-family:楷体, 楷体_GB2312, SimKai\"><span style=\"font-size: 18px;\">Publications of RISE</span></span></a><span style=\"font-size: 18px;\">.</span></span></p><p style=\"color: rgb(0, 0, 0); white-space: normal;\"><span style=\"font-size: 18px;font-family:楷体, 楷体_GB2312, SimKai\">The RISE strategic plan brings into focus emerging challenges in inter-networking systems, including&nbsp;<strong>Cyber-Physical Systems</strong>,&nbsp;<strong>Internet of Things</strong>, and&nbsp;<strong>Cloud Computing</strong>. The challenges are reflected in developing sounds methods for correct design and continuous evolution with requirements of safety, security and privacy. To this end, we investigate the need of seamless integration of theories and methods of structured models in software engineering and both model-based and data driven approaches to artificial intelligence, and we call this research theme as&nbsp;<strong>Unifying Artificial Intelligence and Software Engineering</strong>.</span></p><h2 style=\"color: rgb(0, 0, 0); white-space: normal;\"><span style=\"color: rgb(0, 112, 192);font-family:楷体, 楷体_GB2312, SimKai\">Research Directions&nbsp;</span></h2><p style=\"color: rgb(0, 0, 0); white-space: normal;\"><span style=\"font-size: 18px;font-family:楷体, 楷体_GB2312, SimKai\">We organise our research into the following themes</span></p><p style=\"color: rgb(0, 0, 0); white-space: normal;\"><span style=\"font-family:楷体, 楷体_GB2312, SimKai\"><span style=\"font-size: 18px;\"><strong>1. Software and Systems Design&nbsp;</strong></span><span style=\"font-size: 14px;\">(Coordinators: &nbsp;Hengjun and Taolue Chen)&nbsp;</span></span></p><ul class=\" list-paddingleft-2\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; width: 870.028px; padding-left: 30px; color: rgb(0, 0, 0); white-space: normal;\"><li style=\"clear: both;\"><p><span style=\"font-size: 18px;font-family:楷体, 楷体_GB2312, SimKai\">Cyber-Physical Systems Modelling, Verification, and Synthesis</span></p></li><li style=\"clear: both;\"><p><span style=\"font-size: 18px;font-family:楷体, 楷体_GB2312, SimKai\">Software Architecture Modelling&nbsp;</span></p></li><li style=\"clear: both;\"><p><span style=\"font-size: 18px;font-family:楷体, 楷体_GB2312, SimKai\">Service Based Systems&nbsp;</span></p></li><li style=\"clear: both;\"><p><span style=\"font-size: 18px;font-family:楷体, 楷体_GB2312, SimKai\">Internet of Things</span></p></li><li style=\"clear: both;\"><p><span style=\"font-size: 18px;font-family:楷体, 楷体_GB2312, SimKai\">Software Defined Networks</span></p><p><span style=\"font-family:楷体, 楷体_GB2312, SimKai\"><br/></span></p></li></ul><p style=\"color: rgb(0, 0, 0); white-space: normal;\"><span style=\"font-family:楷体, 楷体_GB2312, SimKai\"><strong><span style=\"font-size: 18px;\">2. Software Verification and Testing&nbsp;</span></strong><span style=\"font-size: 14px;\">(Coordinator: &nbsp;Liyun Dai and Zijiang Yang)</span></span></p><p style=\"color: rgb(0, 0, 0); white-space: normal;\"><span style=\"font-family:楷体, 楷体_GB2312, SimKai\"><span style=\"font-size: 14px;\"></span></span></p><ul class=\" list-paddingleft-2\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; width: 870.028px; padding-left: 30px; color: rgb(0, 0, 0); white-space: normal;\"><li style=\"clear: both;\"><p><span style=\"font-size: 18px;font-family:楷体, 楷体_GB2312, SimKai\">Formal Verification</span></p></li><li style=\"clear: both;\"><p><span style=\"font-size: 18px;font-family:楷体, 楷体_GB2312, SimKai\">(Probabilistic) Model checking&nbsp;</span></p></li><li style=\"clear: both;\"><p><span style=\"font-size: 18px;font-family:楷体, 楷体_GB2312, SimKai\">Program Analysis&nbsp;</span></p><p><span style=\"font-family:楷体, 楷体_GB2312, SimKai\"><br/></span></p></li></ul><p style=\"color: rgb(0, 0, 0); white-space: normal;\"><span style=\"font-family:楷体, 楷体_GB2312, SimKai\"><strong><span style=\"font-size: 18px;\">3. Security&nbsp;</span></strong>(Coordinator: Hong Lai and Jun Pang)</span></p><ul class=\" list-paddingleft-2\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; width: 870.028px; padding-left: 30px; color: rgb(0, 0, 0); white-space: normal;\"><li style=\"clear: both;\"><p><span style=\"font-size: 18px;font-family:楷体, 楷体_GB2312, SimKai\">Access, information flow and usage control&nbsp;</span></p></li><li style=\"clear: both;\"><p><span style=\"font-size: 18px;font-family:楷体, 楷体_GB2312, SimKai\">Adversarial machine learning&nbsp;</span></p></li><li style=\"clear: both;\"><p><span style=\"font-size: 18px;font-family:楷体, 楷体_GB2312, SimKai\">Risk management and thread modelling</span></p></li><li style=\"clear: both;\"><p><span style=\"font-size: 18px;font-family:楷体, 楷体_GB2312, SimKai\">Information and Quantum Security</span></p></li><li style=\"clear: both;\"><p><span style=\"font-family:楷体, 楷体_GB2312, SimKai\"><span style=\"font-size: 18px;\">Formal methods for security</span><br/></span></p></li></ul><p style=\"color: rgb(0, 0, 0); white-space: normal;\"><span style=\"font-family:楷体, 楷体_GB2312, SimKai\"><br/></span></p><p style=\"color: rgb(0, 0, 0); white-space: normal;\"><span style=\"font-family:楷体, 楷体_GB2312, SimKai\"><strong><span style=\"font-size: 18px;\">4. Big Data and AI&nbsp;<span style=\"font-size: 14px;\"></span></span></strong><span style=\"font-size: 14px;\">(Coordinator: Peng Cheng and Zhiming Liu)</span></span></p><p style=\"color: rgb(0, 0, 0); white-space: normal;\"><span style=\"font-family:楷体, 楷体_GB2312, SimKai\"><span style=\"font-size: 14px;\"></span></span></p><ul class=\" list-paddingleft-2\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; width: 870.028px; padding-left: 30px; color: rgb(0, 0, 0); white-space: normal;\"><li style=\"clear: both;\"><p><span style=\"font-size: 18px;font-family:楷体, 楷体_GB2312, SimKai\">AI in Software Engineering&nbsp;</span></p></li><li style=\"clear: both;\"><p><span style=\"font-size: 18px;font-family:楷体, 楷体_GB2312, SimKai\">Verifiable models of AI</span></p></li><li style=\"clear: both;\"><p><span style=\"font-size: 18px;font-family:楷体, 楷体_GB2312, SimKai\">Privacy in Data Mining&nbsp;</span></p></li><li style=\"clear: both;\"><p><span style=\"font-size: 18px;font-family:楷体, 楷体_GB2312, SimKai\">Data Driven and Model Driven AI</span></p></li><li style=\"clear: both;\"><p><span style=\"font-size: 18px;font-family:楷体, 楷体_GB2312, SimKai\">Multi-Agent Systems</span></p></li><li style=\"clear: both;\"><p><span style=\"font-size: 18px;font-family:楷体, 楷体_GB2312, SimKai\">Robotics and Autonomous Systems</span></p></li><li style=\"clear: both;\"><p><span style=\"font-size: 18px;font-family:楷体, 楷体_GB2312, SimKai\">Network Planning and Optimisation&nbsp;</span></p></li></ul><p style=\"color: rgb(0, 0, 0); white-space: normal;\"><span style=\"font-size: 14px;font-family:楷体, 楷体_GB2312, SimKai\"><br/></span></p><p><br/></p>', '0', '', '1');
INSERT INTO `rise_article` VALUES ('18', 'DASDA', '中心动态', null, '2018-09-13 22:03:45', '2018-09-03', '超级管理员', '超级管理员', '<p>DSAD</p>', '0', '', '1');

-- ----------------------------
-- Table structure for rise_catalog
-- ----------------------------
DROP TABLE IF EXISTS `rise_catalog`;
CREATE TABLE `rise_catalog` (
  `id` int(10) NOT NULL,
  `type` varchar(255) DEFAULT NULL,
  `typeName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rise_catalog
-- ----------------------------
INSERT INTO `rise_catalog` VALUES ('1', 'News', '中心动态');
INSERT INTO `rise_catalog` VALUES ('2', 'Exchanges', '学术交流');
INSERT INTO `rise_catalog` VALUES ('3', 'Conferences', '学术会议');
INSERT INTO `rise_catalog` VALUES ('4', 'Join us', '招贤纳士');
INSERT INTO `rise_catalog` VALUES ('5', 'Seminar', '学术报告');
INSERT INTO `rise_catalog` VALUES ('6', 'About us', '关于我们');

-- ----------------------------
-- Table structure for rise_file
-- ----------------------------
DROP TABLE IF EXISTS `rise_file`;
CREATE TABLE `rise_file` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fileName` varchar(64) DEFAULT NULL,
  `fileType` int(11) DEFAULT NULL,
  `uploader` varchar(64) DEFAULT NULL,
  `size` double(11,0) DEFAULT NULL,
  `uploadTime` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `flag` varchar(255) DEFAULT NULL,
  `downloadCounts` int(10) DEFAULT NULL,
  `extension` varchar(64) DEFAULT NULL,
  `authority` int(11) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rise_file
-- ----------------------------
INSERT INTO `rise_file` VALUES ('1', '文本', '1', 'admin', '1024', '2018-09-15 08:00:07', '文件', '11', 'ppt', '0', '/uploadFile');
INSERT INTO `rise_file` VALUES ('2', '软件工程', '2', 'admin', '4613', '2018-09-15 08:00:10', '论文', '12', 'pdf', '1', '/uploadFile');
INSERT INTO `rise_file` VALUES ('3', '系统结构', '3', 'admin', '3221', '2018-09-15 08:08:25', '论文', '22', 'MP4', '0', '/uploadFile');
INSERT INTO `rise_file` VALUES ('4', 'java', '1', 'superadmin', '23213', '2018-09-18 16:23:48', '资料', '23', 'pdf', '0', '/uploadFile');
INSERT INTO `rise_file` VALUES ('5', 'C++', '3', 'admin', '342', '2018-09-18 16:23:38', '书籍', '23', 'pdf', '1', '/uploadFile');

-- ----------------------------
-- Table structure for rise_filetype
-- ----------------------------
DROP TABLE IF EXISTS `rise_filetype`;
CREATE TABLE `rise_filetype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) DEFAULT NULL,
  `typeName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rise_filetype
-- ----------------------------
INSERT INTO `rise_filetype` VALUES ('1', 'prelection', '讲座分享');
INSERT INTO `rise_filetype` VALUES ('2', 'paper', '论文分享');
INSERT INTO `rise_filetype` VALUES ('3', 'resource', '资源下载');

-- ----------------------------
-- Table structure for rise_student
-- ----------------------------
DROP TABLE IF EXISTS `rise_student`;
CREATE TABLE `rise_student` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `firstName` varchar(40) DEFAULT NULL,
  `lastName` varchar(40) DEFAULT NULL,
  `gender` varchar(45) DEFAULT NULL,
  `title` varchar(40) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `supervisor` varchar(45) DEFAULT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `introduce` text,
  `researchField` text,
  `projects` text,
  `publications` text,
  `activites` text,
  `resume` text,
  `graduationYear` int(11) DEFAULT NULL,
  `enrolmentYear` int(11) DEFAULT NULL,
  `urlHomePage` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rise_student
-- ----------------------------

-- ----------------------------
-- Table structure for rise_subtype
-- ----------------------------
DROP TABLE IF EXISTS `rise_subtype`;
CREATE TABLE `rise_subtype` (
  `id` int(10) NOT NULL,
  `parentID` int(10) DEFAULT NULL,
  `subType` varchar(255) DEFAULT NULL,
  `subTypeName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rise_subtype
-- ----------------------------
INSERT INTO `rise_subtype` VALUES ('1', '2', 'Visitors', '来访');
INSERT INTO `rise_subtype` VALUES ('2', '2', 'Missions', '出访');
INSERT INTO `rise_subtype` VALUES ('3', '3', 'Domestic', '国内会议');
INSERT INTO `rise_subtype` VALUES ('4', '3', 'Foreign', '国际会议');

-- ----------------------------
-- Table structure for rise_teacher
-- ----------------------------
DROP TABLE IF EXISTS `rise_teacher`;
CREATE TABLE `rise_teacher` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `type` varchar(45) DEFAULT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rise_teacher
-- ----------------------------

-- ----------------------------
-- Table structure for system_authority
-- ----------------------------
DROP TABLE IF EXISTS `system_authority`;
CREATE TABLE `system_authority` (
  `id` int(11) NOT NULL,
  `typeID` int(11) DEFAULT NULL,
  `menuID` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of system_authority
-- ----------------------------
INSERT INTO `system_authority` VALUES ('1', '1', '1');
INSERT INTO `system_authority` VALUES ('2', '1', '2');
INSERT INTO `system_authority` VALUES ('3', '1', '3');
INSERT INTO `system_authority` VALUES ('4', '1', '4');

-- ----------------------------
-- Table structure for system_log
-- ----------------------------
DROP TABLE IF EXISTS `system_log`;
CREATE TABLE `system_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `account` varchar(32) DEFAULT NULL,
  `userName` varchar(32) DEFAULT NULL,
  `ip` varchar(32) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `operationTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `responseTime` varchar(10) DEFAULT NULL,
  `status` tinyint(3) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=742 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of system_log
-- ----------------------------
INSERT INTO `system_log` VALUES ('734', 'admin', '周小龙', '127.0.0.1', '取消发布新闻', '2018-09-13 21:48:25', '28ms', '1');
INSERT INTO `system_log` VALUES ('735', 'admin', '周小龙', '127.0.0.1', '取消发布新闻', '2018-09-13 21:48:29', '28ms', '1');
INSERT INTO `system_log` VALUES ('736', 'superadmin', '超级管理员', '127.0.0.1', '添加新闻', '2018-09-13 21:51:55', '33ms', '1');
INSERT INTO `system_log` VALUES ('737', 'superadmin', '超级管理员', '127.0.0.1', '发布新闻', '2018-09-13 21:52:03', '29ms', '1');
INSERT INTO `system_log` VALUES ('738', 'superadmin', '超级管理员', '127.0.0.1', '停用管理员账号', '2018-09-13 21:52:26', '31ms', '1');
INSERT INTO `system_log` VALUES ('739', 'superadmin', '超级管理员', '127.0.0.1', '编辑新闻', '2018-09-13 22:00:12', '83ms', '1');
INSERT INTO `system_log` VALUES ('740', 'superadmin', '超级管理员', '127.0.0.1', '添加新闻', '2018-09-13 22:03:45', '48ms', '1');
INSERT INTO `system_log` VALUES ('741', 'admin', '周小龙', '127.0.0.1', '发布新闻', '2018-09-23 20:46:16', '86ms', '1');

-- ----------------------------
-- Table structure for system_menu
-- ----------------------------
DROP TABLE IF EXISTS `system_menu`;
CREATE TABLE `system_menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `icon` varchar(64) DEFAULT NULL,
  `link` varchar(128) DEFAULT NULL,
  `status` tinyint(3) NOT NULL,
  `order_number` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of system_menu
-- ----------------------------
INSERT INTO `system_menu` VALUES ('1', '账号管理', 'fa fa-fw fa-users', '/accountManage/toAccountManagePage', '1', null);
INSERT INTO `system_menu` VALUES ('2', '新闻管理', 'fa fa-fw fa-pencil', '/articleManage/toArticleManagePage', '1', null);
INSERT INTO `system_menu` VALUES ('3', '文件管理', 'fa fa-fw fa-file-image-o', '/fileManage/toFileManagePage', '1', null);
INSERT INTO `system_menu` VALUES ('4', '访问统计', 'fa fa-fw fa-bar-chart-o', '/statisticsManage/toStatisticsManagePage', '1', null);

-- ----------------------------
-- Table structure for system_usertype
-- ----------------------------
DROP TABLE IF EXISTS `system_usertype`;
CREATE TABLE `system_usertype` (
  `id` int(11) NOT NULL,
  `userType` varchar(32) DEFAULT NULL,
  `TypeID` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of system_usertype
-- ----------------------------
INSERT INTO `system_usertype` VALUES ('1', 'admin', '1');
INSERT INTO `system_usertype` VALUES ('2', 'teacher', '2');
INSERT INTO `system_usertype` VALUES ('3', 'student', '3');
