/*
SQLyog - Free MySQL GUI v5.0
Host - 5.0.16-nt : Database - dencimg
*********************************************************************
Server version : 5.0.16-nt
*/


create database if not exists `dencimg`;

USE `dencimg`;

SET FOREIGN_KEY_CHECKS=0;

/*Table structure for table `dataownerregister` */

DROP TABLE IF EXISTS `dataownerregister`;

CREATE TABLE `dataownerregister` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `mobile` varchar(50) NOT NULL,
  `gender` varchar(50) NOT NULL,
  `address` varchar(50) NOT NULL,
  `city` varchar(50) NOT NULL,
  `status` varchar(50) NOT NULL,
  `accesskey` varchar(50) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



/*Table structure for table `datauserregister` */

DROP TABLE IF EXISTS `datauserregister`;

CREATE TABLE `datauserregister` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `mobile` varchar(50) NOT NULL,
  `gender` varchar(50) NOT NULL,
  `address` varchar(50) NOT NULL,
  `city` varchar(50) NOT NULL,
  `status` varchar(50) NOT NULL,
  `accesskey` varchar(50) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


/*Table structure for table `filerequest` */

DROP TABLE IF EXISTS `filerequest`;

CREATE TABLE `filerequest` (
  `id` int(11) NOT NULL auto_increment,
  `filename` varchar(50) NOT NULL,
  `message` varchar(150) NOT NULL,
  `reqdate` date NOT NULL,
  `seckeys` varchar(10) NOT NULL,
  `status` varchar(80) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



/*Table structure for table `uploadimage` */

DROP TABLE IF EXISTS `uploadimage`;

CREATE TABLE `uploadimage` (
  `id` int(50) NOT NULL auto_increment,
  `name` varchar(50) NOT NULL,
  `filename` varchar(50) NOT NULL,
  `message` varchar(100) NOT NULL,
  `seckeys` varchar(50) NOT NULL,
  `image` longblob NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



SET FOREIGN_KEY_CHECKS=1;
