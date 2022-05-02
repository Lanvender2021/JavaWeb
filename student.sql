SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for stuinfo
-- ----------------------------
drop table  if exists `stuinfo`;
CREATE TABLE `stuinfo` 
(
  `sid` int(11) DEFAULT NULL,
  `sname` varchar(255) DEFAULT NULL,
  `ssex` varchar(255) DEFAULT NULL,
  `sage` int(11) DEFAULT NULL,
  `sweight` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of stuinfo
-- ----------------------------
INSERT INTO `stuinfo` VALUES ('2013001001', '小强', '男', '18', '50');
INSERT INTO `stuinfo` VALUES ('2013001002', '张威', '男', '18', '62');
INSERT INTO `stuinfo` VALUES ('2013001003', '李想', '女', '17', '45');
