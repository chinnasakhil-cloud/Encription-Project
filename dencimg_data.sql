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

/*Data for the table `dataownerregister` */

LOCK TABLES `dataownerregister` WRITE;

insert into `dataownerregister` values 
(1,'chaitu','a123456789A','chethan.datapoint@gmail.com','7013949045','Male','Ameerpet','Hyderabad','activated','Djxs8oLjVlO9zZNi');

UNLOCK TABLES;

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

/*Data for the table `datauserregister` */

LOCK TABLES `datauserregister` WRITE;

insert into `datauserregister` values 
(1,'alex','a123456789A','alex@gmail.com','9848775566','Male','Punjagutta','Hyderabad','activated','D2dFPOaFK2VWlTFH');

UNLOCK TABLES;

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

/*Data for the table `filerequest` */

LOCK TABLES `filerequest` WRITE;

insert into `filerequest` values 
(1,'pic','this is a secret info','2024-09-06','12345','Permitted'),
(2,'pic','this is a secret info','2024-09-06','12345','Permitted');

UNLOCK TABLES;

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

/*Data for the table `uploadimage` */

LOCK TABLES `uploadimage` WRITE;

insert into `uploadimage` values 
(1,'chaitu','pic','this is a secret info','12345','ÆáÆÙ9)sp9889989899Æâ9½90?>+*+,***,/,..!!..!.!.!!!!/.!,!//!$!#$...&\n\n8333747,6), , Æù9(19—8:89;(8:(8Æý9\"99;:8889999999999:=8;<9?>Æý9)98::;=<=;8::<99989;(:xh=XHÉ+¸¨˜øˆèØ*È<-{K«ë\Z\nk[‹Æý9.8888899999999999998;:Æý9/(888999999999999998(Æã95:89;(:(99Áð\\ÅØ`”lÈd(«ù´VK²t‹w3\nZM}Œ…èZ]/Ê¢\Z~DØ(éµ Pæ1\\¤FŸÛ(3F\"±„ÏÜÃ½Î0}9´Xq}ŸÍ}m\\·oJ¡x ¤M6jÕå8ÀÞ2¥ø$TVû•Ô]þñÿ;ªHäªæÕâTDœ¥	ˆ+4·Jì4?´:>Z”øÍt	9?ÁµÂ=éV¥ÍÎ1>žó\nP^ç£Í¼­ \ZuÒ÷t‚‹ï”ñcYÃõÍn^?øÕZä/oNÈ¦rCÞl ´¨èÿGòuj.²©ž|¤ý€ã/Í‡p%ðxzgPKW5*ÖƒIZü&	w |Â´ˆçðC¶\0öž\\ýDÂäÀˆ.‰Å•ÈÛ>p*ÑVð&Ù¶`Â\"f–v]ðE2ùy¤ý÷@@G,“R‡äF3Ö¢b“oTŠ)¸s×ª´€ŒšûuEÂŸ¢q?ßÃùÏeb$ËÂ›Ò\r½sT¸Û°2…+q+h#¡ÂÌè-8BàuUš—É¹i˜ñ§,qx|ð¶ÛÝmš;\r‚ujP§q M91ªÂn;iÐò~PÝ±ŒG,ð9plÈH}-j\râœëtÝDªí^bM‹¬$ðnú¾Gðþ‰AvLzŸý/7¹–pÑX€%ÚÜr|Ø)ê`û§,aÎÔÑ¡à¶½sÖÝ¸=äp“Ê¼F9¤3³ôÃv«7‘}üýÊÌ€zÈƒÇ\ZÞîvT,æ:hÝ•4µ[6ãE¨š\r!	L¢™·.ýÈÛøª\'ÝU±ó™ãà‰í\\Ã	1\n\n²Ü(°üHuÿÙÕX9Jx:KBìW†Ä¿Ç(¶a`ån<Ì&1	á¨…¡Žò1ì=²úOàÇáÐL“ÏaùÀß‘Q*(Íæã­Q±Ø½0#d`Í¸1tíBq¤Ê1g*ô;XºØH^²£\\ñH*D)$kS¹•{b³”EcÆ9³†×6™ø\n\nîžmÚä)€áôš†}Ú´³Bg	¼kš³•HZ”ù1–IK)bÀ€<vÜ`l{r·Þí—i€8\'}¡¡ß´p(Ð›7å\Zs<¡Y}màiƒÊç($ó<—¾r;‡Q!œå$Ãð€f…\ZjÒ½#­“1ºµx±mZÏnS6t™¥G‘û\\”ÎÄcêÕ²~°Iõ(—ÙÃ™O¤+Ût”ÂwéØ[<ŽOdÅû=5\"æI_*%É	h»×›BÊÅ™ÛÂfôTF7äÝäúÒò\'bŒ ýLãC^3¦ûy¹?›]¶°cæüëYLÿÏ½Íñ¢:ÊçÄÕ´-›ø\'õÿ§B·\0üù¯ù‰Œ÷ªð\nwq)\rêRÜLg-—¿çäFò ­:V+ÈÇ{G¤#x\n½®*ÿ!IÉú°C÷o´\"a_ýßLâ«PÅ5»8ÃškKZ¡û\Zôj’šµ4ÙßÀ·“…B+êàøc†Ó%8°.¾)T/(G˜#¶ÃA\r¹‘æ0æA\ZëãÒôî<ÉyéÐT$…Ì(‰oÔ38œø±.ø¶L%d\nØ)vxƒ#ø\Z@+pÏ$@“è9¨YŒ£ypý@x$k&JEJ¸Vh\\!8ïú®B\Z#[vl³	vx ‡N÷)Eg*G¤Z1œÒ$ölì½ËnJT\'aÄH\'Qy®È$,4\rêÀÂ1Ìx@Ý²œm’ÁlqÑ³“Üñe\r(ðt\r(™]ñç»ç¾l_U±e^ðoº–Ã@˜ŒåÍuiYßÆ9@1±4\n™NÉ“èÝ•ÿËÅ™\nhã)ÐéMC}4þi‘\"q·×SjJžqæÔ~jPÌztÉù/|˜žrPÌ~›ë%ä>½gÊ ´@ÖAyí}uV¸Ÿ{ìØQñUºÐZØ%Ñ\r$ÛRu|ÙÀ:ÍAIçª\'§\"¸5¡¡©}ôŠ\0uj˜|ÔD2OÓ°•nk9RØ=ÿWd/x”tœÏ(J«w\rµ\\U½ŠŸï(¸&Ü.ËrÈ+yª¨é*\0R`ŒD?Ãwßè0—Èw¡ÐK®19º¨\nÝ$^º9¹]_Ê?è™ÓD,dY >óá|È)ÐªÇ}ÃA„ŒRIÙ²ÚøÐD{lÅæ7Oâ+]L|4¬p†\n[ïµXý\r)v²\'%aµR Ís3@ ºZÊµ{†³x	y*9cYý¤M±ß›kÔ)_ê\nVüx—Á7²çÏ;\n@ì	aÐª™‰)L*DDlAèZAÃˆ\0=(B`(´ýý¤uÍ¼¬pþþöçoâÑDZpÞ\0ðóõÛ|zõô€Ñ´ýìð©\r/€â‚S¹qÐAÐ—ßûTÆ9nK¬}µ&²µ=mA\ZñÀ4«Ì!utˆÈ×¶kV;\Zá\\Ç\ZÓ¡Ç‘	)´uPìç_àráýqCG(xB¶ìécà³·¨NTŸ@LxYÞÝ½6øñÃoÇ|1‘ÑµG!\0nZK¹Õ‰ó¯}Ç·“™4½+# Øµ$Âóœ#}ÿâ­éè#§Í1ó¼©[MÜ\\#¬\Z;æMsHÆ9!vIÞ†Ž£¸ú¶Á¥±Á¬›ç+H:éÕ“èÈžçŸbÜ+íëØ…Å@èžÎÊÄš#´>Êô\'®5ue|…ÿ…¨\rS\r¾µ!íR*F´¯¶?é;Êô~4û´Œ>;îwjšîV{µìê957j(Þßž¿PÆ9ôŒ›=gÏê3÷ž!¨¸‰!àw ýÖîÅ¸.\"Uµ¸ÅÆ9uýQNLøîL1\\Ê?ê?M>ôQ” ºHG³$uy‡2•1²õ\"Ì3h†ÛtŒ…}²ó<SC¡Ü–ý`i9Ù\nFŸuª¶mœSÙªÃ¹ùégÞYik™¢âÐ°\n„ÖÕk­å¶À\"ç5ŒþÍ³Ó>üÆ9€Ø(°ë0¸Ì|Ì©Õõ4xô€›¨L/Žü#R>A½Š#eæ0!¡	v¸@Óô2°9f¯î€øÊr‹ëåÞëW˜;w ÉÿÛßeî\01Lª9KªïÏÍ½êÑ1#å¢[~mQº´MŒƒ¤C©ÛÁRSJñg_5öÌ3	8Ã¡õ²Q\0”G¡·iTÜö›jÄkžÇ¡(Æ9T\rh\\_o\\•yÒ	FCÅ.¨ÒÏß£™ÀLöp¤•\Zy°ýé¨9_|šFŒèM´yeô¸‡ŠÆ9&l¥Ó	~óêž»ûW6Çsç ]›¸`$kÍý\'K¥•=2¶iv}šÓQ\ZƒNcþà[ƒ¡Öð3’×½>ÿ€.ÓÝ€-/ ˜7¦}pxP^‡\\0¸	óO}\nœ–Î~EÐ*É¨Tªmâè5\n.‹S®}„/x&D*­¢Þ×µê\r÷w³b¾Lþ^v¿GÃ\ZIå,óOâ¡sjGƒVAÀc…‡¼)G$žâféwèYÏÌr£O©¤Tá¶W&°º\0>p/æ©}\0m89NTXJgwôÃŒˆß—9I¤1¨Ë—øñÍó)‚ºµc=\"ª56óßi„ðç>Å¹‰êôØñ“(ºE¦¢›¿P\r\rúy©I\ZF¬®b»]Æ9µÞP Çï†±5þNî}\0=á×D1íLo5·\Z¿>y?´+Ô9c8‡¨ôSÈÊÔÏplšK[ÏºÞ#K|É]ÖVF­Ž½ô·ƒ[ÁûNÿñðÂ«¯‡°GÞúÒQ\"bÉº’µ8Vü©rñ¢¥\'N¯Ñ¢“÷Æ9’átÅÖÜÁík€ÖBß®9L#@šmWãmí&rBŽÜ,¢w©Ú;vpßè†Ð0—Åßàhý1…L\'›\\s\nÒ«%Jöã+ü¦ª6…¸$,zd¡ˆüûž((Ô]‚âêèÅ_MyBÜ;Œf!zÇtè“(m1ëë.ysQ«,%á	œ‘3êñš\ræ]/½x1»¿ ÅEŸb†½^†ƒZúŽ\\)Ô(\ZÖË¥Ry(“öØ$92Ü5›6w˜.Ëth—îºêf}¢#*eþ¦Ú[µêtTø©$ïê%´ÉŽ‘¸Þ¯‚L`P¸Z@ö®ÔPëˆ\'Çb›o¶5ÂL\'ªìo¤:5Ò™»)øˆÀ¤~ˆtè@ \"$œ t©¦}iÑÄÍiúæÑIðÊÏ1xgÑV–õ@àÎå6ÇýÂƒr‰~‘ÌÅœ“2ñJ¥\"¬mÑ¾2ÎRk9*!GîjpéðÉðéôñÞè<ß7\ZÐG„>“7‘æŸvd”‰snX¡;Î“\\éïá_Óvä?œp7æŸB½™A”¡>žÎƒkŠ°.ç\n²«wÁu¹Õ8XÒË«Hˆ\Z(Ÿh™te°;pê¡þCfa¸‰ý)j*!*Ä}b]#µéÑ@¸U_(qm_H¤EÉ¬’RK#3ÚY^Jðýç¯ËyšüÄ~¥-„NÖéÕ@Ÿ³\"^ö©sî\nJFÒ‚™)ê¸·£XhþpêÂ}5Z!ÁqÈ,5À^×³‚äDG\0™m\næ“Îqz7;³4od=½åcigK³>½—jÛe¹åy\'<ù±fãØ1Üñ5s\r?­o­>V\Z“¢…J–B6âà QkH¸Ý¤œiNÀ`M¤äê;œ•¿\rEéyõðr¾’åÇo<ÒÂûC¼uJ×â\Z n®DEï¦1U‰Q…\'°ÃL÷>ž u^\"­¿ÛC¤90£~ÝýåÍ§r(öÃ76\\#˜Éx:(´\ZðÑì/„Ø Ÿè\nžŽÐ]I¥Rq\'~ì+qÇhR`PŠ±<‡Ó1ßßDéõmíBÌÂôh\ZP¨õÁ´ƒƒÃ_|ëE|X—ß<ŽÕ‘Am¿5õ*:vDŒùÎ´û,\'Ax¨PËÂ˜h–Ì80ˆç|Úz>_Ý²w‰D;&+ZHÖ\\g™ˆÈ1Ò¡\Z|ì»Kä%Ã›Ø¢¡…ÞïXk¯@ÀÓI£¯ªK>½Zh}> »QzÇ¾¡&¼ì¹q*îGJƒ£é#p#ýÀ=˜P¨µ}ÀÍÝ³œá í¤N«“Þg1ùF‚’6‘:Büö“*Á»%LŽ©}øÁº´C*™áMa¬=!á/cl§7„xÃM!Aß° /Ö{›ûL%™Õ­“]Ëu3kÑÖ«4y8öÔ#k 7i¤ÍÚ›˜m+ZæEèxÇz°mJ­…xm‘e€K7Sz:UQ—),“ÕK)ù™	·Jìd´\"™A¨!i\0u²f]@¦ÐpúÓµ´} ê0Ÿ¨­„³þpÖ£‰QjOÐÇ%Û<ƒÛ/	H¶ÇÒj½Ä¨¢#8Êõt·T›Ix©Ztœ§$ Ö›G´P:DEŸGØ)C2\r*/âÍwÉ,¥|Õ?Á°üÔ)\Z	ïPæ–@|šmy±^ð3à6Æ9¤þ¤Ì`Œ\'VÃM%ìý¤^/º™*·×€·ê9PR¡ó<\"hûý¡ºŸÔ&­O²$Ÿû\rÜ]#»YÇŸú®|å\Z±·TÎ;Ù=h$Û6çÃMpî‘^_~ð}“Î)VL*ß¸`Ž;\r.µ¦\r-R±ÏÙÊœ÷BŒ±ååÇÆ9RºC²¸š8??ZêD©g˜MY^ÉPìä#\'™¢MDªV\n€Ã™fÇ¢ØÓfw}¹Ùÿô*Î|ZoDé¶(#@½ÙÙð?Ô¤ƒAˆÆ9PslØ•}å%çÎ´h{–bòÙœçÊu~“)ëïÞecƒ\'W™P–æV¦ÔmÄšÕ•e^–X<÷rüsž³-Ö¦‹œeNì-Ðˆ«Ã“5s¿‚†ëSBÑ»¦üôK—yëm»šæ£Ý.¬i,Yie-Ct­˜È½5ˆ‰·ë®Tv-ûOñð¯¢\rÇkôÕçitÐ×#“vté’LÚÂTì,¥i/#NÒ$¬ÔJ†æ“ßíªMuS§D¬‘È\\‹•{\Z›WG‡OÅ-ÒRáÀTŠo<#ŸîÒŸyJH™S$Š/ˆûœ3†ÚéöÏ0C¥}¸BþÝc¬È÷ˆ–‰©¸óìx?Ï¶û,sî¢ÐÔÝ­DU·³·•Nˆ;p¯æaÊq£ætŠØ\'äkß#Ï+×D©ú¿…9@Ñ»÷ÐªB¥¤ùp„Ó­æZî›!Håu:D^Æ9í§†½’Òß4žõöƒc„E¶VfócœuÌs[Åz°÷ÄÎô.½sŒ|° üÈWÀåÜ/7l&iÚ„,%ÄNmÈd=tí‚3·\\,=¸²O,0daÜ=€<™×-˜óÝ)€yk(Sóm1²Œe›:-¢Vƒ	u# xZ¼YÄÏr… oZ³\"jÀ•Ã·»—îuö^£ ²R½–4êäê…z0É©W]CeB&\\h\rå•ã°R»\0:µ‘¶w–­þà^¾ÞÕ¸Ö ŒÈÁŸÅMË0SL\náÍ’yþØ=íÄÃø{BÇ-.!©Âœéd÷{Bì&nÔÉ½S®\02ÀmAí€¯Æ9K)hëª?Mðie-È¿Ì¦ƒ³<JM;(“%À‚†]œîd&V¬K½‘¬z˜zoK“KÜ2©FÆà');

UNLOCK TABLES;

SET FOREIGN_KEY_CHECKS=1;
