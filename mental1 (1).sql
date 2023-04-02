-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 31, 2022 at 11:34 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mental1`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add tbl_idgen', 7, 'add_tbl_idgen'),
(26, 'Can change tbl_idgen', 7, 'change_tbl_idgen'),
(27, 'Can delete tbl_idgen', 7, 'delete_tbl_idgen'),
(28, 'Can view tbl_idgen', 7, 'view_tbl_idgen'),
(29, 'Can add tbl_expert', 8, 'add_tbl_expert'),
(30, 'Can change tbl_expert', 8, 'change_tbl_expert'),
(31, 'Can delete tbl_expert', 8, 'delete_tbl_expert'),
(32, 'Can view tbl_expert', 8, 'view_tbl_expert'),
(33, 'Can add tbl_question', 9, 'add_tbl_question'),
(34, 'Can change tbl_question', 9, 'change_tbl_question'),
(35, 'Can delete tbl_question', 9, 'delete_tbl_question'),
(36, 'Can view tbl_question', 9, 'view_tbl_question'),
(37, 'Can add tbl_login', 10, 'add_tbl_login'),
(38, 'Can change tbl_login', 10, 'change_tbl_login'),
(39, 'Can delete tbl_login', 10, 'delete_tbl_login'),
(40, 'Can view tbl_login', 10, 'view_tbl_login'),
(41, 'Can add tbl_user', 11, 'add_tbl_user'),
(42, 'Can change tbl_user', 11, 'change_tbl_user'),
(43, 'Can delete tbl_user', 11, 'delete_tbl_user'),
(44, 'Can view tbl_user', 11, 'view_tbl_user'),
(45, 'Can add tbl_article', 12, 'add_tbl_article'),
(46, 'Can change tbl_article', 12, 'change_tbl_article'),
(47, 'Can delete tbl_article', 12, 'delete_tbl_article'),
(48, 'Can view tbl_article', 12, 'view_tbl_article'),
(49, 'Can add tbl_video', 13, 'add_tbl_video'),
(50, 'Can change tbl_video', 13, 'change_tbl_video'),
(51, 'Can delete tbl_video', 13, 'delete_tbl_video'),
(52, 'Can view tbl_video', 13, 'view_tbl_video'),
(53, 'Can add tbl_query', 14, 'add_tbl_query'),
(54, 'Can change tbl_query', 14, 'change_tbl_query'),
(55, 'Can delete tbl_query', 14, 'delete_tbl_query'),
(56, 'Can view tbl_query', 14, 'view_tbl_query'),
(57, 'Can add tbl_review', 15, 'add_tbl_review'),
(58, 'Can change tbl_review', 15, 'change_tbl_review'),
(59, 'Can delete tbl_review', 15, 'delete_tbl_review'),
(60, 'Can view tbl_review', 15, 'view_tbl_review'),
(61, 'Can add tbl_bookexpert', 16, 'add_tbl_bookexpert'),
(62, 'Can change tbl_bookexpert', 16, 'change_tbl_bookexpert'),
(63, 'Can delete tbl_bookexpert', 16, 'delete_tbl_bookexpert'),
(64, 'Can view tbl_bookexpert', 16, 'view_tbl_bookexpert'),
(65, 'Can add tbl_webinar', 17, 'add_tbl_webinar'),
(66, 'Can change tbl_webinar', 17, 'change_tbl_webinar'),
(67, 'Can delete tbl_webinar', 17, 'delete_tbl_webinar'),
(68, 'Can view tbl_webinar', 17, 'view_tbl_webinar'),
(69, 'Can add tbl_result', 18, 'add_tbl_result'),
(70, 'Can change tbl_result', 18, 'change_tbl_result'),
(71, 'Can delete tbl_result', 18, 'delete_tbl_result'),
(72, 'Can view tbl_result', 18, 'view_tbl_result'),
(73, 'Can add tbl_event', 19, 'add_tbl_event'),
(74, 'Can change tbl_event', 19, 'change_tbl_event'),
(75, 'Can delete tbl_event', 19, 'delete_tbl_event'),
(76, 'Can view tbl_event', 19, 'view_tbl_event');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(12, 'mentalapp', 'tbl_article'),
(16, 'mentalapp', 'tbl_bookexpert'),
(19, 'mentalapp', 'tbl_event'),
(8, 'mentalapp', 'tbl_expert'),
(7, 'mentalapp', 'tbl_idgen'),
(10, 'mentalapp', 'tbl_login'),
(14, 'mentalapp', 'tbl_query'),
(9, 'mentalapp', 'tbl_question'),
(18, 'mentalapp', 'tbl_result'),
(15, 'mentalapp', 'tbl_review'),
(11, 'mentalapp', 'tbl_user'),
(13, 'mentalapp', 'tbl_video'),
(17, 'mentalapp', 'tbl_webinar'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2022-08-16 11:09:14.989914'),
(2, 'auth', '0001_initial', '2022-08-16 11:09:24.576207'),
(3, 'admin', '0001_initial', '2022-08-16 11:09:27.551408'),
(4, 'admin', '0002_logentry_remove_auto_add', '2022-08-16 11:09:27.661144'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2022-08-16 11:09:27.718677'),
(6, 'contenttypes', '0002_remove_content_type_name', '2022-08-16 11:09:29.361623'),
(7, 'auth', '0002_alter_permission_name_max_length', '2022-08-16 11:09:30.352980'),
(8, 'auth', '0003_alter_user_email_max_length', '2022-08-16 11:09:30.510232'),
(9, 'auth', '0004_alter_user_username_opts', '2022-08-16 11:09:30.589472'),
(10, 'auth', '0005_alter_user_last_login_null', '2022-08-16 11:09:31.326399'),
(11, 'auth', '0006_require_contenttypes_0002', '2022-08-16 11:09:31.376547'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2022-08-16 11:09:31.442496'),
(13, 'auth', '0008_alter_user_username_max_length', '2022-08-16 11:09:31.626688'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2022-08-16 11:09:32.023845'),
(15, 'auth', '0010_alter_group_name_max_length', '2022-08-16 11:09:32.203768'),
(16, 'auth', '0011_update_proxy_permissions', '2022-08-16 11:09:32.268738'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2022-08-16 11:09:32.437073'),
(18, 'mentalapp', '0001_initial', '2022-08-16 11:09:33.225314'),
(19, 'mentalapp', '0002_rename_addexpert_tbl_expert_alter_tbl_expert_table', '2022-08-16 11:09:33.744937'),
(20, 'mentalapp', '0003_alter_tbl_expert_phone', '2022-08-16 11:09:34.980610'),
(21, 'mentalapp', '0004_tbl_expert_experience', '2022-08-16 11:09:35.307280'),
(22, 'mentalapp', '0005_tbl_question_tbl_idgen_qid', '2022-08-16 11:09:35.719229'),
(23, 'mentalapp', '0006_tbl_login', '2022-08-16 11:09:36.010647'),
(24, 'mentalapp', '0007_alter_tbl_login_table_alter_tbl_question_table', '2022-08-16 11:09:36.517801'),
(25, 'mentalapp', '0008_rename_cataegory_tbl_login_category', '2022-08-16 11:09:36.653817'),
(26, 'mentalapp', '0009_tbl_idgen_userid', '2022-08-16 11:09:36.816845'),
(27, 'mentalapp', '0010_tbl_user', '2022-08-16 11:09:37.134055'),
(28, 'mentalapp', '0011_tbl_expert_category', '2022-08-16 11:09:37.430504'),
(29, 'mentalapp', '0012_tbl_article', '2022-08-16 11:09:39.740453'),
(30, 'mentalapp', '0013_tbl_idgen_article_id', '2022-08-16 11:09:39.892178'),
(31, 'mentalapp', '0014_tbl_video', '2022-08-16 11:09:41.504975'),
(32, 'mentalapp', '0015_tbl_idgen_video_id', '2022-08-16 11:09:41.723686'),
(33, 'mentalapp', '0016_tbl_user_category', '2022-08-16 11:09:41.849149'),
(34, 'mentalapp', '0017_tbl_idgen_query_id_tbl_query', '2022-08-16 11:09:44.575074'),
(35, 'mentalapp', '0018_tbl_query_query', '2022-08-16 11:09:45.065438'),
(36, 'mentalapp', '0019_tbl_idgen_review_id', '2022-08-16 11:09:45.231696'),
(37, 'mentalapp', '0020_tbl_review', '2022-08-16 11:09:48.041835'),
(38, 'mentalapp', '0021_tbl_idgen_book_id_tbl_bookexpert', '2022-08-16 11:09:50.710030'),
(39, 'mentalapp', '0022_alter_tbl_bookexpert_table', '2022-08-16 11:09:51.003739'),
(40, 'mentalapp', '0023_tbl_idgen_webinar_id_tbl_webinar', '2022-08-16 11:09:53.200890'),
(41, 'mentalapp', '0024_tbl_idgen_test_id_tbl_result', '2022-08-16 11:09:54.805645'),
(42, 'mentalapp', '0025_alter_tbl_result_user_id', '2022-08-16 11:10:04.764945'),
(43, 'mentalapp', '0026_remove_tbl_result_test', '2022-08-16 11:10:05.001969'),
(44, 'sessions', '0001_initial', '2022-08-16 11:10:05.709430'),
(45, 'mentalapp', '0027_tbl_question_status_alter_tbl_question_table', '2022-08-23 05:38:36.692036'),
(46, 'mentalapp', '0028_tbl_event_tbl_idgen_event_id', '2022-08-24 07:37:04.303116');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('22r6vc96v0uxms2mk29lh694sql0tccu', 'eyJzIjoxNCwiciI6M30:1oSy34:XcwfJFT42TETG-YMRwDK75XVmMmN6rAU_le5bN9EN4Y', '2022-09-13 10:00:46.502084'),
('a6zjr6x8apl8ei9p677nen7uqu41ofk9', 'eyJzIjozLCJyIjoyfQ:1oSbLY:p-YgQJMnUR6kEkRNarHPxaWpFX-1f6cTuGnb8d_89bE', '2022-09-12 09:46:20.134998'),
('i3vhh0xl2smmxwrp7r4u11qiy9pb40p6', 'eyJzIjo5LCJyIjo2LCJleHBlcnQiOiJFWFBfMDAzIiwiYWRtIjoiYWRtaW4ifQ:1oR8GO:lNL3Bj12aWia06h5EN6vgp0R09NmN-zFqP2KxhV57bk', '2022-09-08 08:30:56.995308'),
('y307zc4f8hlf27qwnbdiwidxs2b7dyd9', 'eyJzIjoxMCwiciI6NH0:1oTK6E:qT8k08jeKRrsW6kqx5Gr6bh6a5H3NeJm9E7-V61MfgY', '2022-09-14 09:33:30.488896');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_article`
--

CREATE TABLE `tbl_article` (
  `article_id` varchar(30) NOT NULL,
  `uploaded_date` varchar(100) NOT NULL,
  `article` varchar(100) NOT NULL,
  `expert_id_id` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_article`
--

INSERT INTO `tbl_article` (`article_id`, `uploaded_date`, `article`, `expert_id_id`) VALUES
('ART_001', '2022-08-26', '/media/Hasna%20Hassan%20Kolathil%20(3)_N4bt9Rn.pdf', 'EXP_002'),
('ART_002', '2022-08-29', '/media/Hasna_Hassan_Kolathil%20(1).DOCX', 'EXP_002'),
('ART_003', '2022-08-30', '/media/Hasna%20Hassan%20Kolathil%20(3)_KE88EXK.pdf', 'EXP_005'),
('ART_004', '2022-08-30', '/media/Hasna_Hassan_Kolathil%20(1)_69htGOq.DOCX', 'EXP_005');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_bookexpert`
--

CREATE TABLE `tbl_bookexpert` (
  `booking_id` varchar(30) NOT NULL,
  `bookingdate` varchar(100) NOT NULL,
  `bookingtime` varchar(100) NOT NULL,
  `status` varchar(100) NOT NULL,
  `expert_id_id` varchar(30) NOT NULL,
  `user_id_id` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_bookexpert`
--

INSERT INTO `tbl_bookexpert` (`booking_id`, `bookingdate`, `bookingtime`, `status`, `expert_id_id`, `user_id_id`) VALUES
('BOOKING_001', '2022-09-06', '6:30 AM', 'PENDING', 'EXP_001', 'USER_001'),
('BOOKING_0010', '2022-09-08', '8:30 PM', 'PENDING', 'EXP_007', 'USER_005'),
('BOOKING_0011', '2022-09-10', '7:30 PM', 'PENDING', 'EXP_001', 'USER_005'),
('BOOKING_0012', '2022-09-07', '8:30 PM', 'PENDING', 'EXP_004', 'USER_005'),
('BOOKING_0013', '2022-09-07', '7:30 PM', 'PENDING', 'EXP_005', 'USER_004'),
('BOOKING_0014', '2022-09-08', '5:30 PM', 'PENDING', 'EXP_002', 'USER_004'),
('BOOKING_002', '2022-08-29', '5:30 AM', 'PENDING', 'EXP_002', 'USER_002'),
('BOOKING_003', '2022-09-09', '5:15 PM', 'PENDING', 'EXP_004', 'USER_001'),
('BOOKING_004', '2022-09-07', '7:00 PM', 'ACCEPTED', 'EXP_007', 'USER_003'),
('BOOKING_005', '2022-09-09', '3:30 PM', 'PENDING', 'EXP_007', 'USER_001'),
('BOOKING_006', '2022-09-04', '3:35 PM', 'PENDING', 'EXP_008', 'USER_002'),
('BOOKING_007', '2022-09-05', '4:30 PM', 'PENDING', 'EXP_007', 'USER_003'),
('BOOKING_008', '2022-09-09', '6:30 PM', 'PENDING', 'EXP_008', 'USER_004'),
('BOOKING_009', '2022-09-06', '5:40 PM', 'PENDING', 'EXP_005', 'USER_002');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_event`
--

CREATE TABLE `tbl_event` (
  `event_id` varchar(30) NOT NULL,
  `event` varchar(100) NOT NULL,
  `photo` varchar(100) NOT NULL,
  `event_date` varchar(100) NOT NULL,
  `status` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_event`
--

INSERT INTO `tbl_event` (`event_id`, `event`, `photo`, `event_date`, `status`) VALUES
('EVENT_001', 'Mental Programme', '/media/2_xSHJP0N.jpg', '2022-08-17', 'PENDING'),
('EVENT_002', 'Mental Health Care', '/media/1_3lCGg6u.jpg', '2022-08-08', 'PENDING'),
('EVENT_003', 'OCD Awareness Week', '/media/1_Cx0oZwC.jpg', '2022-08-16', 'PENDING'),
('EVENT_004', 'National Worklife Week', '/media/2_5Zp2luA.jpg', '2022-08-08', 'PENDING');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_expert`
--

CREATE TABLE `tbl_expert` (
  `expert_id` varchar(30) NOT NULL,
  `expert_name` varchar(30) NOT NULL,
  `address` varchar(100) NOT NULL,
  `gender` varchar(100) NOT NULL,
  `dob` varchar(100) NOT NULL,
  `qualification` varchar(100) NOT NULL,
  `description` varchar(100) NOT NULL,
  `phone` varchar(100) NOT NULL,
  `email` varchar(30) NOT NULL,
  `photo` varchar(30) NOT NULL,
  `adhar` varchar(100) NOT NULL,
  `status` varchar(30) NOT NULL,
  `experience` varchar(100) NOT NULL,
  `category` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_expert`
--

INSERT INTO `tbl_expert` (`expert_id`, `expert_name`, `address`, `gender`, `dob`, `qualification`, `description`, `phone`, `email`, `photo`, `adhar`, `status`, `experience`, `category`) VALUES
('EXP_001', 'Hasna Hassan', 'Feroke', 'Female', '1995-10-18', 'B-tech', 'ok', '8157878466', 'hasna@gmail.como', '/media/2_zDoeD0N.jpg', '112233445566', 'VERIFIED', '3 year', 'Mental_Ability'),
('EXP_002', 'Nihad', 'Mannur', 'Male', '1995-02-01', 'BCA', 'ok', '9074553904', 'nihad@yahoo.com', '/media/2_U7EbR55.jpg', '112233445566', 'VERIFIED', '2 year', 'Sex_Education'),
('EXP_004', 'surya', 'calicut', 'Female', '2022-08-01', 'b-tech', 'Verygood', '9037510754', 'surya@gmail.como', '/media/2_gxQQogF.jpg', '567890344412', 'VERIFIED', '3 year', 'Mental_Ability'),
('EXP_005', 'Nazal', 'Calicut', 'Male', '1998-08-02', 'Degree', 'Verygood', '9037510671', 'nazal@gmail.com', '/media/2_X653iJf.jpg', '908765432190', 'VERIFIED', '2 year', 'Sex_Education'),
('EXP_006', 'Anusree', 'Perumanna', 'Female', '1999-12-23', 'BSC', 'ok', '9037510672', 'anusreevt@yahoo.com', '/media/2_R9tbgI0.jpg', '112233445566', 'REJECTED', '1 year', 'Sex_Education'),
('EXP_007', 'anas', 'kondotty', 'Male', '1997-04-04', 'Poly', 'good', '8197651234', 'anas@yahoo.com', '/media/1_w2p7Rro.jpg', '567890344412', 'VERIFIED', '1 year', 'Mental_Ability'),
('EXP_008', 'Farha', 'Pantheeramkav', 'Female', '1995-05-02', 'B-tech', 'Good', '9781234560', 'farha@gmail.com', '/media/1_QhVfnRD.jpg', '567890344412', 'NOT VERIFIED', '3 year', 'Sex_Education'),
('EXP_009', 'Arun', 'Malappuram', 'Male', '1998-11-23', 'BSC', 'Verygood', '8157878466', 'arun@gmail.com', '/media/1_OR6dpzB.jpg', '567890344412', 'NOT VERIFIED', '3 year', 'Mental_Ability');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_idgen`
--

CREATE TABLE `tbl_idgen` (
  `id` bigint(20) NOT NULL,
  `eid` int(11) NOT NULL,
  `qid` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `article_id` int(11) NOT NULL,
  `video_id` int(11) NOT NULL,
  `query_id` int(11) NOT NULL,
  `review_id` int(11) NOT NULL,
  `book_id` int(11) NOT NULL,
  `webinar_id` int(11) NOT NULL,
  `test_id` int(11) NOT NULL,
  `event_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_idgen`
--

INSERT INTO `tbl_idgen` (`id`, `eid`, `qid`, `userid`, `article_id`, `video_id`, `query_id`, `review_id`, `book_id`, `webinar_id`, `test_id`, `event_id`) VALUES
(1, 9, 15, 5, 4, 6, 6, 15, 14, 4, 4, 4);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_login`
--

CREATE TABLE `tbl_login` (
  `id` bigint(20) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `category` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_login`
--

INSERT INTO `tbl_login` (`id`, `username`, `password`, `category`) VALUES
(1, 'admin', 'admin', 'ADMIN'),
(12, 'USER_001', '9074553904', 'USER'),
(13, 'USER_002', '8157878466', 'USER'),
(14, 'EXP_002', '9074553904', 'EXPERT'),
(15, 'EXP_001', '8157878466', 'EXPERT'),
(16, 'EXP_004', '9037510754', 'EXPERT'),
(17, 'USER_003', '9087654321', 'USER'),
(18, 'USER_004', '9123456780', 'USER'),
(19, 'EXP_005', '9037510671', 'EXPERT'),
(20, 'EXP_007', '8197651234', 'EXPERT'),
(21, 'USER_005', '9027610978', 'USER');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_query`
--

CREATE TABLE `tbl_query` (
  `query_id` varchar(30) NOT NULL,
  `date` varchar(100) NOT NULL,
  `status` varchar(100) NOT NULL,
  `queryanswer` varchar(100) NOT NULL,
  `user_id_id` varchar(30) NOT NULL,
  `query` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_query`
--

INSERT INTO `tbl_query` (`query_id`, `date`, `status`, `queryanswer`, `user_id_id`, `query`) VALUES
('QUERY_001', '2022-08-26', 'ANSWERED', 'my name is hasna', 'USER_002', 'what is your name??'),
('QUERY_002', '2022-08-26', 'PENDING', 'NULL', 'USER_002', 'What is your age?'),
('QUERY_003', '2022-08-30', 'ANSWERED', 'Yes', 'USER_004', 'I believe sex education should be taught in primary level?'),
('QUERY_004', '2022-08-30', 'PENDING', 'NULL', 'USER_004', 'I think sex education is helpful towards preventing teenage pregnancy among the youth?'),
('QUERY_005', '2022-08-30', 'PENDING', 'NULL', 'USER_004', 'I don’t think teachers today are capable of teaching sex education in an effective way to children i'),
('QUERY_006', '2022-08-30', 'PENDING', 'NULL', 'USER_002', 'What About Stress?');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_question`
--

CREATE TABLE `tbl_question` (
  `question_no` varchar(30) NOT NULL,
  `question` varchar(100) NOT NULL,
  `status` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_question`
--

INSERT INTO `tbl_question` (`question_no`, `question`, `status`) VALUES
('QUE_001', 'What is your Name?', 'PENDING'),
('QUE_0010', 'Having little interest or pleasure in doing things?	', 'PENDING'),
('QUE_0011', 'Feeling down, depressed or hopeless?', 'PENDING'),
('QUE_0012', 'Trouble falling asleep, staying asleep, or sleeping too much?', 'PENDING'),
('QUE_0013', 'Feeling tired or having little energy?', 'PENDING'),
('QUE_0014', 'Poor Appetite or overeating?', 'PENDING'),
('QUE_0015', '	Feeling bad about yourself – or that you are a failure or have let yourself or your family', 'PENDING'),
('QUE_002', 'What about your health?', 'PENDING'),
('QUE_003', 'What is your age?', 'PENDING'),
('QUE_004', 'Are you a tensed person?', 'PENDING'),
('QUE_005', 'Have you ever experienced an ‘attack’ of fear, anxiety, or panic?', 'PENDING'),
('QUE_006', 'Trouble concentrating on things, such as reading the newspaper or watching television?	', 'PENDING'),
('QUE_007', 'Do you ever feel that you’ve been affected by feelings of edginess, anxiety, or nerves?', 'PENDING'),
('QUE_008', 'Have you ever experienced a terrible occurrence that has impacted you significantly? ', 'PENDING'),
('QUE_009', 'what is your current situation ?', 'PENDING');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_result`
--

CREATE TABLE `tbl_result` (
  `test_no` varchar(30) NOT NULL,
  `score` varchar(100) NOT NULL,
  `date` varchar(100) NOT NULL,
  `interference` varchar(100) NOT NULL,
  `user_id_id` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_result`
--

INSERT INTO `tbl_result` (`test_no`, `score`, `date`, `interference`, `user_id_id`) VALUES
('TEST_001', '19', '2022-08-30', 'You are stressed', 'USER_003'),
('TEST_002', '9', '2022-08-30', 'Stress is likely', 'USER_001'),
('TEST_003', '4', '2022-08-30', 'Stress Unlikely', 'USER_005'),
('TEST_004', '4', '2022-08-31', 'Stress Unlikely', 'USER_003');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_review`
--

CREATE TABLE `tbl_review` (
  `review_id` varchar(30) NOT NULL,
  `reviewdate` varchar(100) NOT NULL,
  `review` varchar(100) NOT NULL,
  `expert_id_id` varchar(30) NOT NULL,
  `user_id_id` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_review`
--

INSERT INTO `tbl_review` (`review_id`, `reviewdate`, `review`, `expert_id_id`, `user_id_id`) VALUES
('REVIEW_001', '2022-08-26', 'Good', 'EXP_001', 'USER_001'),
('REVIEW_0010', '2022-08-30', 'OK', 'EXP_002', 'USER_004'),
('REVIEW_0011', '2022-08-30', 'OK', 'EXP_001', 'USER_005'),
('REVIEW_0012', '2022-08-30', 'OK', 'EXP_004', 'USER_005'),
('REVIEW_0013', '2022-08-30', 'Good', 'EXP_007', 'USER_005'),
('REVIEW_0014', '2022-08-30', 'OK', 'EXP_002', 'USER_004'),
('REVIEW_0015', '2022-08-30', 'Good', 'EXP_005', 'USER_004'),
('REVIEW_002', '2022-08-26', 'Good', 'EXP_002', 'USER_002'),
('REVIEW_003', '2022-08-29', 'Good', 'EXP_004', 'USER_001'),
('REVIEW_004', '2022-08-29', 'OK', 'EXP_005', 'USER_002'),
('REVIEW_005', '2022-08-30', 'OK', 'EXP_007', 'USER_003'),
('REVIEW_006', '2022-08-30', 'Good', 'EXP_001', 'USER_003'),
('REVIEW_007', '2022-08-30', 'Good', 'EXP_004', 'USER_003'),
('REVIEW_008', '2022-08-30', 'Good', 'EXP_007', 'USER_001'),
('REVIEW_009', '2022-08-30', 'Good', 'EXP_005', 'USER_004');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user`
--

CREATE TABLE `tbl_user` (
  `user_id` varchar(30) NOT NULL,
  `user_name` varchar(30) NOT NULL,
  `address` varchar(100) NOT NULL,
  `phone` varchar(100) NOT NULL,
  `email` varchar(30) NOT NULL,
  `category` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_user`
--

INSERT INTO `tbl_user` (`user_id`, `user_name`, `address`, `phone`, `email`, `category`) VALUES
('USER_001', 'Athira', 'Parappanangadi', '9074553904', 'athira@yahoo.com', 'Mental_Ability'),
('USER_002', 'Surya', 'Calicut', '8157878466', 'surya@gmail.com', 'Sex_Education'),
('USER_003', 'noora', 'chelari', '9087654321', 'noora@gmail.com', 'Mental_Ability'),
('USER_004', 'Jithin', 'Calicut', '9123456780', 'jithin@email.com', 'Sex_Education'),
('USER_005', 'Adhil', 'Trivandrum', '9027610978', 'adhil@yahoo.com', 'Mental_Ability');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_video`
--

CREATE TABLE `tbl_video` (
  `video_id` varchar(30) NOT NULL,
  `uploaded_date` varchar(100) NOT NULL,
  `category` varchar(100) NOT NULL,
  `video` varchar(100) NOT NULL,
  `expert_id_id` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_video`
--

INSERT INTO `tbl_video` (`video_id`, `uploaded_date`, `category`, `video`, `expert_id_id`) VALUES
('VID_001', '2022-08-26', 'Mental_Ability', '/media/video_H9AjHA5.mp4', 'EXP_001'),
('VID_002', '2022-08-29', 'Mental_Ability', '/media/video_0eWtuws.mp4', 'EXP_001'),
('VID_003', '2022-08-29', 'Mental_Ability', '/media/video_lyDpPLF.mp4', 'EXP_004'),
('VID_004', '2022-08-29', 'Sex_Education', '/media/video_Dh6XRpE.mp4', 'EXP_002'),
('VID_005', '2022-08-30', 'Sex_Education', '/media/video_Dcf5a5k.mp4', 'EXP_005'),
('VID_006', '2022-08-30', 'Mental_Ability', '/media/video_FdEDzSy.mp4', 'EXP_007');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_webinar`
--

CREATE TABLE `tbl_webinar` (
  `webinar_id` varchar(30) NOT NULL,
  `webinardate` varchar(100) NOT NULL,
  `Topic` varchar(100) NOT NULL,
  `status` varchar(100) NOT NULL,
  `expert_id_id` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_webinar`
--

INSERT INTO `tbl_webinar` (`webinar_id`, `webinardate`, `Topic`, `status`, `expert_id_id`) VALUES
('WEB_001', '2022-09-07', 'Mental Health', 'PENDING', 'EXP_001'),
('WEB_002', '2022-09-08', 'About Health', 'PENDING', 'EXP_001'),
('WEB_003', '2022-09-10', 'Mental', 'PENDING', 'EXP_004'),
('WEB_004', '2022-09-08', 'Mental Health', 'PENDING', 'EXP_007');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `tbl_article`
--
ALTER TABLE `tbl_article`
  ADD PRIMARY KEY (`article_id`),
  ADD KEY `tbl_article_expert_id_id_f080d5d6_fk_tbl_expert_expert_id` (`expert_id_id`);

--
-- Indexes for table `tbl_bookexpert`
--
ALTER TABLE `tbl_bookexpert`
  ADD PRIMARY KEY (`booking_id`),
  ADD KEY `tbl_book_expert_id_id_db986b54_fk_tbl_expert_expert_id` (`expert_id_id`),
  ADD KEY `tbl_book_user_id_id_044acfbc_fk_tbl_user_user_id` (`user_id_id`);

--
-- Indexes for table `tbl_event`
--
ALTER TABLE `tbl_event`
  ADD PRIMARY KEY (`event_id`);

--
-- Indexes for table `tbl_expert`
--
ALTER TABLE `tbl_expert`
  ADD PRIMARY KEY (`expert_id`);

--
-- Indexes for table `tbl_idgen`
--
ALTER TABLE `tbl_idgen`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_login`
--
ALTER TABLE `tbl_login`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_query`
--
ALTER TABLE `tbl_query`
  ADD PRIMARY KEY (`query_id`),
  ADD KEY `tbl_query_user_id_id_d365daa0_fk_tbl_user_user_id` (`user_id_id`);

--
-- Indexes for table `tbl_question`
--
ALTER TABLE `tbl_question`
  ADD PRIMARY KEY (`question_no`);

--
-- Indexes for table `tbl_result`
--
ALTER TABLE `tbl_result`
  ADD PRIMARY KEY (`test_no`),
  ADD KEY `tbl_result_user_id_id_bfe48655_fk_tbl_user_user_id` (`user_id_id`);

--
-- Indexes for table `tbl_review`
--
ALTER TABLE `tbl_review`
  ADD PRIMARY KEY (`review_id`),
  ADD KEY `tbl_review_expert_id_id_b9701eb4_fk_tbl_expert_expert_id` (`expert_id_id`),
  ADD KEY `tbl_review_user_id_id_58ae3cd1_fk_tbl_user_user_id` (`user_id_id`);

--
-- Indexes for table `tbl_user`
--
ALTER TABLE `tbl_user`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `tbl_video`
--
ALTER TABLE `tbl_video`
  ADD PRIMARY KEY (`video_id`),
  ADD KEY `tbl_video_expert_id_id_6590441c_fk_tbl_expert_expert_id` (`expert_id_id`);

--
-- Indexes for table `tbl_webinar`
--
ALTER TABLE `tbl_webinar`
  ADD PRIMARY KEY (`webinar_id`),
  ADD KEY `tbl_webinar_expert_id_id_d4a2b3e0_fk_tbl_expert_expert_id` (`expert_id_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `tbl_idgen`
--
ALTER TABLE `tbl_idgen`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_login`
--
ALTER TABLE `tbl_login`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `tbl_article`
--
ALTER TABLE `tbl_article`
  ADD CONSTRAINT `tbl_article_expert_id_id_f080d5d6_fk_tbl_expert_expert_id` FOREIGN KEY (`expert_id_id`) REFERENCES `tbl_expert` (`expert_id`);

--
-- Constraints for table `tbl_bookexpert`
--
ALTER TABLE `tbl_bookexpert`
  ADD CONSTRAINT `tbl_book_expert_id_id_db986b54_fk_tbl_expert_expert_id` FOREIGN KEY (`expert_id_id`) REFERENCES `tbl_expert` (`expert_id`),
  ADD CONSTRAINT `tbl_book_user_id_id_044acfbc_fk_tbl_user_user_id` FOREIGN KEY (`user_id_id`) REFERENCES `tbl_user` (`user_id`);

--
-- Constraints for table `tbl_query`
--
ALTER TABLE `tbl_query`
  ADD CONSTRAINT `tbl_query_user_id_id_d365daa0_fk_tbl_user_user_id` FOREIGN KEY (`user_id_id`) REFERENCES `tbl_user` (`user_id`);

--
-- Constraints for table `tbl_result`
--
ALTER TABLE `tbl_result`
  ADD CONSTRAINT `tbl_result_user_id_id_bfe48655_fk_tbl_user_user_id` FOREIGN KEY (`user_id_id`) REFERENCES `tbl_user` (`user_id`);

--
-- Constraints for table `tbl_review`
--
ALTER TABLE `tbl_review`
  ADD CONSTRAINT `tbl_review_expert_id_id_b9701eb4_fk_tbl_expert_expert_id` FOREIGN KEY (`expert_id_id`) REFERENCES `tbl_expert` (`expert_id`),
  ADD CONSTRAINT `tbl_review_user_id_id_58ae3cd1_fk_tbl_user_user_id` FOREIGN KEY (`user_id_id`) REFERENCES `tbl_user` (`user_id`);

--
-- Constraints for table `tbl_video`
--
ALTER TABLE `tbl_video`
  ADD CONSTRAINT `tbl_video_expert_id_id_6590441c_fk_tbl_expert_expert_id` FOREIGN KEY (`expert_id_id`) REFERENCES `tbl_expert` (`expert_id`);

--
-- Constraints for table `tbl_webinar`
--
ALTER TABLE `tbl_webinar`
  ADD CONSTRAINT `tbl_webinar_expert_id_id_d4a2b3e0_fk_tbl_expert_expert_id` FOREIGN KEY (`expert_id_id`) REFERENCES `tbl_expert` (`expert_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
