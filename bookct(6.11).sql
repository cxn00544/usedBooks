/*
 Navicat Premium Data Transfer

 Source Server         : jdbc
 Source Server Type    : MySQL
 Source Server Version : 80029
 Source Host           : localhost:3306
 Source Schema         : bookct

 Target Server Type    : MySQL
 Target Server Version : 80029
 File Encoding         : 65001

 Date: 29/05/2023 07:47:01
*/

-- 创建数据库语句
CREATE DATABASE bookct CHARACTER SET utf8mb4;
USE bookct;

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tadministrator
-- ----------------------------
DROP TABLE IF EXISTS `tadministrator`;
CREATE TABLE `tadministrator`  (
  `adminId` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL CHECK (adminId REGEXP '^[0-9a-zA-Z_]*$'),
  `adminName` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `adminPassword` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL CHECK (adminPassword REGEXP '^[0-9a-zA-Z_]*$'),
  `telephone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `email` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL CHECK (email LIKE '_%@_%._%'),
  PRIMARY KEY (`adminId`) USING BTREE,
  UNIQUE INDEX `adminId`(`adminId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tadministrator
-- ----------------------------
INSERT INTO `tadministrator` VALUES ('A001', '张三', 'admin001', '1359968652', '1294726@qq.com');

-- ----------------------------
-- Table structure for tuser
-- ----------------------------
DROP TABLE IF EXISTS `tuser`;
CREATE TABLE `tuser`  (
  `userId` int(0) NOT NULL AUTO_INCREMENT,
  `userName` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `sex` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `telephone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `email` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `userPassword` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `birthday` date NULL DEFAULT NULL,
  `address` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `del` int(0) NULL DEFAULT 0,
  PRIMARY KEY (`userId`) USING BTREE,
  UNIQUE INDEX `userId`(`userId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tuser
-- ----------------------------
INSERT INTO `tuser` VALUES (1, 'sfm', '女', '13168691665', '12@qq.com', '123456', NULL, NULL, 1);
---------------------------
-- Records of tuser
-- ----------------------------
INSERT INTO `tuser` VALUES (2, 'SFM', NULL, '13168691665', '12@qq.com', '123456', NULL, NULL);
-- ----------------------------
-- Records of tuser
-- ----------------------------


use bookct;
DROP TABLE `TconsigneeInfo`;
CREATE TABLE `TconsigneeInfo`  (
  `orderId` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `address` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
   `detail` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phoneNum` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `userId` int(0) ,
  -- `createTime` datetime default now(),
 `createTime`timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
   exist TINYINT(1) DEFAULT 1,
	
  PRIMARY KEY (`orderId`) USING BTREE,

  CONSTRAINT FK_TconsigneeInfo_Tuser FOREIGN KEY (userId) REFERENCES Tuser(userId)
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;



-- 插入的数据--
-- 地址信息表
INSERT INTO tconsigneeinfo (userId, name, address,detail,phoneNum)VALUES(1, 'sfm', '广东省','北京理工大学学生宿舍33','17875457945');

INSERT INTO tconsigneeinfo (userId, name,address,detail,phoneNum)VALUES(2, 'aike', '广东省','北京理工大学学生宿舍36','15896350712');
INSERT INTO tconsigneeinfo (userId, name, address,detail,phoneNum)VALUES(2, 'sfm', '广东省','北京理工大学学生宿舍40','17875457945');
INSERT INTO tconsigneeinfo (userId, name, address,detail,phoneNum)VALUES(1, 'aike', '广东省','北京理工大学学生宿舍33','17875457945');
-- ----------------------------
-- Table structure for tbooktype
-- ----------------------------
DROP TABLE IF EXISTS `tbooktype`;
CREATE TABLE `tbooktype`  (
  `typeId` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `typeName` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`typeId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbooktype
-- ----------------------------
INSERT INTO `tbooktype` VALUES ('A', '马列主义、毛泽东思想、邓小平理论');
INSERT INTO `tbooktype` VALUES ('B', '哲学、宗教');
INSERT INTO `tbooktype` VALUES ('C', '社会科学总论');
INSERT INTO `tbooktype` VALUES ('E', '军事');
INSERT INTO `tbooktype` VALUES ('F', '经济');
INSERT INTO `tbooktype` VALUES ('G', '文化、科学、教育、体育');
INSERT INTO `tbooktype` VALUES ('H', '语言、文字');
INSERT INTO `tbooktype` VALUES ('I', '文学');
INSERT INTO `tbooktype` VALUES ('J', '艺术');
INSERT INTO `tbooktype` VALUES ('K', '历史、地理');
INSERT INTO `tbooktype` VALUES ('N', '自然科学总论');
INSERT INTO `tbooktype` VALUES ('O', '数理科学和化学');
INSERT INTO `tbooktype` VALUES ('P', '天文学、地球科学');
INSERT INTO `tbooktype` VALUES ('Q', '生物科学');
INSERT INTO `tbooktype` VALUES ('R', '医药、卫生');
INSERT INTO `tbooktype` VALUES ('S', '农业科学');
INSERT INTO `tbooktype` VALUES ('T', '工业技术');
INSERT INTO `tbooktype` VALUES ('U', '交通运输');
INSERT INTO `tbooktype` VALUES ('V', '航空、航天');
INSERT INTO `tbooktype` VALUES ('X', '环境科学、安全科学');
INSERT INTO `tbooktype` VALUES ('Z', '综合性图书');

-- ----------------------------
-- Table structure for tbook
-- ----------------------------
DROP TABLE IF EXISTS `tbook`;
CREATE TABLE `tbook`  (
  `ISBN` CHAR(17) NOT NULL,
  `bookTitle` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `author` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `press` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `publishDate` date NULL DEFAULT NULL,
  `typeId` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ISBN`) USING BTREE,
  INDEX `FK_Tbook_TbookType`(`typeId`) USING BTREE,
  CONSTRAINT `FK_Tbook_TbookType` FOREIGN KEY (`typeId`) REFERENCES `tbooktype` (`typeId`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;
CREATE INDEX bookTitle_index ON Tbook(bookTitle);-- 为bookTitle床架索引，给订单表用

-- ----------------------------
-- Records of tbook
-- ----------------------------
insert into bookct.Tbook  values('978-7-111-60648-2', '操作系统概念精要', '亚伯兰罕', '机械工业出版社','2023-04-02','T');
INSERT INTO `tbook` VALUES (222222, 'ssm', '大师', '农业出版社', '2023-05-05', 'F');
INSERT INTO `tbook` VALUES (11111111, 'jsp', 'admin', '工业大学', '2023-05-03', 'A');

-- ----------------------------
-- Table structure for tsellbookitem
-- --------
use bookct;
DROP TABLE IF EXISTS `tsellbookitem`;
CREATE TABLE `tsellbookitem`  (
  `bookId` int(0) NOT NULL AUTO_INCREMENT,
  `ISBN` char(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `userId` int(0) NULL DEFAULT NULL,
  `sellDate` datetime(0) NOT NULL,
  `price` decimal(10, 2) NOT NULL,
  `introduction` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `status` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`bookId`) USING BTREE,
  INDEX `FK_TsellBookItem_Tuser`(`userId`) USING BTREE,
  INDEX `FK_TsellBookItem_Tbook`(`ISBN`) USING BTREE,
  CONSTRAINT `FK_TsellBookItem_Tbook` FOREIGN KEY (`ISBN`) REFERENCES `tbook` (`ISBN`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_TsellBookItem_Tuser` FOREIGN KEY (`userId`) REFERENCES `tuser` (`userId`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

use bookct;

INSERT INTO `tsellbookitem` VALUES (3, 222222, '2', '2023-05-28 01:32:03', 60.00, '', 'N');
INSERT INTO `tsellbookitem` VALUES (4, 222222, '2', '2023-05-28 01:32:03', 60.00, '', 'N');
INSERT INTO `tsellbookitem` VALUES (5, 222222, '2', '2023-05-28 01:32:03', 60.00, '', 'N');
INSERT INTO `tsellbookitem` VALUES (6, 222222, '2', '2023-05-28 01:32:03', 60.00, '', 'N');
INSERT INTO `tsellbookitem` VALUES (7, 222222, '2', '2023-05-28 01:32:03', 60.00, '', 'N');
INSERT INTO `tsellbookitem` VALUES (8, 222222, '2', '2023-05-28 01:32:03', 60.00, '', 'N');
INSERT INTO `tsellbookitem` VALUES (9, 222222, '2', '2023-05-28 01:32:03', 60.00, '', 'N');
INSERT INTO `tsellbookitem` VALUES (10, 222222, '2', '2023-05-28 01:32:03', 60.00, '', 'N');
INSERT INTO `tsellbookitem` VALUES (11, 222222, '2', '2023-05-28 01:32:03', 60.00, '', 'N');
INSERT INTO `tsellbookitem` VALUES (12, 222222, '2', '2023-05-28 01:32:03', 60.00, '', 'N');
INSERT INTO `tsellbookitem` VALUES (13, 222222, '2', '2023-05-28 01:32:03', 60.00, '', 'N');
INSERT INTO `tsellbookitem` VALUES (14, 222222, '2', '2023-05-28 01:32:03', 60.00, '', 'N');
INSERT INTO `tsellbookitem` VALUES (15, 222222, '2', '2023-05-28 01:32:03', 60.00, '', 'N');
INSERT INTO `tsellbookitem` VALUES (16, 222222, '2', '2023-05-28 01:32:03', 60.00, '', 'N');
INSERT INTO `tsellbookitem` VALUES (17, 222222, '2', '2023-05-28 01:32:03', 60.00, '', 'N');
INSERT INTO `tsellbookitem` VALUES (18, 222222, '2', '2023-05-28 01:32:03', 60.00, '', 'N');
INSERT INTO `tsellbookitem` VALUES (19, 222222, '2', '2023-05-28 01:32:03', 60.00, '', 'N');

INSERT INTO `tsellbookitem` VALUES (20, 222222, '2', '2023-05-28 01:32:03', 60.00, '', 'N');
INSERT INTO `tsellbookitem` VALUES (21, 222222, '2', '2023-05-28 01:32:03', 60.00, '', 'N');

INSERT INTO `tsellbookitem` VALUES (24, 222222, '2', '2023-05-28 01:32:03', 60.00, '', 'N');
INSERT INTO `tsellbookitem` VALUES (25, 222222, '2', '2023-05-28 01:32:03', 60.00, '', 'N');
INSERT INTO `tsellbookitem` VALUES (26, 222222, '2', '2023-05-28 01:32:03', 60.00, '', 'N');
INSERT INTO `tsellbookitem` VALUES (27, 222222, '2', '2023-05-28 01:32:03', 60.00, '', 'N');

INSERT INTO `tsellbookitem` VALUES (28, 222222, '2', '2023-05-28 01:32:03', 60.00, '', 'N');
INSERT INTO `tsellbookitem` VALUES (29, 222222, '2', '2023-05-28 01:32:03', 60.00, '', 'N');
INSERT INTO `tsellbookitem` VALUES (34, 222222, '2', '2023-05-28 01:32:03', 60.00, '', 'N');
INSERT INTO `tsellbookitem` VALUES (35, 222222, '2', '2023-05-28 01:32:03', 60.00, '', 'N');
INSERT INTO `tsellbookitem` VALUES (36, 222222, '2', '2023-05-28 01:32:03', 60.00, '', 'N');
INSERT INTO `tsellbookitem` VALUES (37, 222222, '2', '2023-05-28 01:32:03', 60.00, '', 'N');
INSERT INTO `tsellbookitem` VALUES (38, 222222, '1', '2023-05-28 01:32:03', 60.00, '', 'N');
INSERT INTO `tsellbookitem` VALUES (39, 222222, '1', '2023-05-28 01:32:03', 60.00, '', 'N');
INSERT INTO `tsellbookitem` VALUES (40, 222222, '1', '2023-05-28 01:32:03', 60.00, '', 'N');
INSERT INTO `tsellbookitem` VALUES (41, 222222, '1', '2023-05-28 01:32:03', 60.00, '', 'N');

INSERT INTO `tsellbookitem` VALUES (42, 222222, '2', '2023-05-28 01:32:03', 60.00, '', 'N');
INSERT INTO `tsellbookitem` VALUES (43, 222222, '2', '2023-05-28 01:32:03', 60.00, '', 'N');

INSERT INTO `tsellbookitem` VALUES (44, 222222, '2', '2023-05-28 01:32:03', 60.00, '', 'N');
INSERT INTO `tsellbookitem` VALUES (45, 222222, '1', '2023-05-28 01:32:03', 60.00, '', 'N');
INSERT INTO `tsellbookitem` VALUES (46, 222222, '1', '2023-05-28 01:32:03', 60.00, '', 'N');
INSERT INTO `tsellbookitem` VALUES (47, 222222, '1', '2023-05-28 01:32:03', 60.00, '', 'N');

INSERT INTO `tsellbookitem` VALUES (48, 222222, '2', '2023-05-28 01:32:03', 60.00, '', 'N');
INSERT INTO `tsellbookitem` VALUES (49, 222222, '2', '2023-05-28 01:32:03', 60.00, '', 'N');
-- Table structure for tbuybookitem
-- Table structure for tbuybookitem
-- Table structure for tbuybookitem
-- ----------------------------
-- ----------------------------
DROP TABLE IF EXISTS `tbuybookitem`;
CREATE TABLE `tbuybookitem`  (
  `demandId` int(0) NOT NULL AUTO_INCREMENT,
  `ISBN` char(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `userId` int(0) NULL DEFAULT NULL,
  `publishDate` datetime(0) NOT NULL,
  `price` decimal(10, 2) NOT NULL,
  `bookName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`demandId`) USING BTREE,
  INDEX `FK_TbuyBookItem_Tbook`(`ISBN`) USING BTREE,
  INDEX `FK_TbuyBookItem_Tuser`(`userId`) USING BTREE,
  CONSTRAINT `FK_TbuyBookItem_Tuser` FOREIGN KEY (`userId`) REFERENCES `tuser` (`userId`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;


-- Table structure for tcollect
-- ----------------------------
DROP TABLE IF EXISTS `tcollect`;
CREATE TABLE `tcollect`  (
`collectId` int(0) NOT NULL AUTO_INCREMENT,
  `userId` int(0) ,
  `bookId` int(0) NOT NULL,
	collectTime  datetime default now(),
  PRIMARY KEY (`collectId`) USING BTREE,
  INDEX `FK_Tcollect`(`bookId`) USING BTREE,
  CONSTRAINT `FK_Tcollect` FOREIGN KEY (`bookId`) REFERENCES `tsellbookitem` (`bookId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT FK_Tuser FOREIGN KEY (userId) REFERENCES Tuser(userId)
  
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

insert into Tcollect (userId,bookId,collectTime) values (20001,7,'2023-4-27');
select * from Tcollect,tuser where Tcollect.userId = tuser.userId;
-- ----------------------------
-- Records of tcollect
-- ----------------------------

-- ----------------------------
-- Table structure for tconsigneeinfo
-- ----------------------------

-- ----------------------------
-- Table structure for torder
-- ----------------------------
-- ----------------------------
use bookct;
DROP TABLE IF EXISTS `Torder`;
CREATE TABLE Torder (
    `orderNum` int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,-- ¶©µ¥±àºÅ
    bookId int(10) not NULL,-- 书籍编号 
    `userId` int(0) not null,-- 用户id
	-- `customer_id` int(11) DEFAULT NULL,
  --   paidFlag CHAR(1) NOT NULL CHECK (paidFlag IN ('Y', 'N')),
`orderId` int(11) NOT NULL ,-- 书籍id
 `submitDate` DATETIME NOT NULL,
  `status` TINYINT(1) DEFAULT 0,
   `exist` TINYINT(1) DEFAULT 1,
    FOREIGN KEY (bookId) REFERENCES  TsellBookItem (bookId),
	FOREIGN KEY (orderId) REFERENCES TconsigneeInfo (orderId),
    FOREIGN KEY (userId) REFERENCES Tuser (userId),
	INDEX (`userId`, `orderId`, `bookId`),
  CONSTRAINT `fk_order_tuser` FOREIGN KEY (`userId`) REFERENCES `tuser`(`userId`),
  CONSTRAINT `fk_order_tconsigneeInfo` FOREIGN KEY (`orderId`) REFERENCES `tconsigneeInfo`(`orderId`),
  CONSTRAINT `fk_order_tsellbookitem` FOREIGN KEY (`bookId`) REFERENCES `TsellBookItem`(`bookId`)
);
INSERT INTO `Torder` (`userId`, `submitDate`, `orderId`, `bookId`,`status`)
VALUES (1, '2023-03-23 10:00:00',4 ,1,2);
-- ----------------------------
-- Records of torder
-- ----------------------------
use bookct;
drop view OrderMessageList;
CREATE VIEW OrderMessageList AS
SELECT o.orderNum, o.userId,s.bookId as bookId,r1.userName AS userName,s.userId AS customerId,
 s.ISBN, s.price AS price, c.name, c.phoneNum, c.address,c.detail, o.submitDate,o.status ,o.exist AS orderExist
FROM `Torder` o
LEFT JOIN `tuser` r1 ON o.userId = r1.userId
JOIN `tsellbookitem` s ON o.bookId = s.bookId
JOIN `TconsigneeInfo` c ON o.orderId = c.orderId
ORDER BY o.submitDate DESC;

select *
from Torder,tsellbookitem,tuser
where Torder.bookId=TsellBookItem.bookId and TsellBookItem.userId=Tuser.userId;
use bookct;


use bookct;
DROP TABLE IF EXISTS `sp`;
CREATE TABLE `sp`  (
  `spID` int(0) NOT NULL AUTO_INCREMENT,
  `userId` int(0) NOT NULL,
  `sptittle` char(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `sp` char(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `telephone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `statuss` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '0',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`spID`) USING BTREE,
  UNIQUE INDEX `spID`(`spID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;




 
