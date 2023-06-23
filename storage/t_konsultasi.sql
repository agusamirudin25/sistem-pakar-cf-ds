/*
 Navicat Premium Data Transfer

 Source Server         : laragon
 Source Server Type    : MySQL
 Source Server Version : 50733 (5.7.33)
 Source Host           : localhost:3307
 Source Schema         : db_sispak_cf_ds

 Target Server Type    : MySQL
 Target Server Version : 50733 (5.7.33)
 File Encoding         : 65001

 Date: 23/06/2023 23:47:40
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_jawaban_konsultasi
-- ----------------------------
DROP TABLE IF EXISTS `t_jawaban_konsultasi`;
CREATE TABLE `t_jawaban_konsultasi`  (
  `id_jawaban_konsultasi` int(11) NOT NULL AUTO_INCREMENT,
  `id_konsultasi` int(11) NULL DEFAULT NULL,
  `jawaban` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `pakar` int(1) NULL DEFAULT NULL,
  `created_at` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id_jawaban_konsultasi`) USING BTREE,
  INDEX `id_kon`(`id_konsultasi`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_jawaban_konsultasi
-- ----------------------------
INSERT INTO `t_jawaban_konsultasi` VALUES (1, 1, 'halo', 0, '2023-06-23 16:34:15', '2023-06-23 16:34:15');
INSERT INTO `t_jawaban_konsultasi` VALUES (2, 1, 'saya mau bertanya', 0, '2023-06-23 16:34:58', '2023-06-23 16:34:58');
INSERT INTO `t_jawaban_konsultasi` VALUES (3, 1, 'halo ada yang bisa dibantu?', 1, '2023-06-23 16:37:27', '2023-06-23 16:37:27');
INSERT INTO `t_jawaban_konsultasi` VALUES (4, 2, 'ya', 1, '2023-06-23 16:41:46', '2023-06-23 16:41:46');
INSERT INTO `t_jawaban_konsultasi` VALUES (5, 3, 'balasan pakar', 1, '2023-06-23 16:44:04', '2023-06-23 16:44:04');

-- ----------------------------
-- Table structure for t_konsultasi
-- ----------------------------
DROP TABLE IF EXISTS `t_konsultasi`;
CREATE TABLE `t_konsultasi`  (
  `id_konsultasi` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(64) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `pertanyaan` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `created_at` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id_konsultasi`) USING BTREE,
  INDEX `email_pengguna`(`email`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_konsultasi
-- ----------------------------
INSERT INTO `t_konsultasi` VALUES (2, 'farid123@gmail.com', 'tes', '2023-06-23 16:41:36', '2023-06-23 16:41:36');
INSERT INTO `t_konsultasi` VALUES (3, 'farid123@gmail.com', 'tes konsul', '2023-06-23 16:43:28', '2023-06-23 16:43:28');

SET FOREIGN_KEY_CHECKS = 1;
