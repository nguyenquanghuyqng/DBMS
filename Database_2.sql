CREATE DATABASE  IF NOT EXISTS `webtoeic` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `webtoeic`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: webtoeic
-- ------------------------------------------------------
-- Server version	5.7.19-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `listenaudio`
--

DROP TABLE IF EXISTS `listenaudio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `listenaudio` (
  `listenaudioid` int(11) NOT NULL,
  `audio` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`listenaudioid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `listenaudio`
--

LOCK TABLES `listenaudio` WRITE;
/*!40000 ALTER TABLE `listenaudio` DISABLE KEYS */;
INSERT INTO `listenaudio` VALUES (1,'audio1.wav  '),(2,'audio2.wav  '),(3,'audio3.wav  '),(4,'audio4.wav  '),(5,'audio5.wav  '),(6,'audio6.wav  '),(7,'audio7.wav  '),(8,'audio8.wav  '),(9,'audio9.wav  ');
/*!40000 ALTER TABLE `listenaudio` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger tg_Deletelistenaudio before delete on listenaudio 
 for each row
 begin
	delete from listening where listening.listenaudioid=OLD.listenaudioid;	
		
 end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `listening`
--

DROP TABLE IF EXISTS `listening`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `listening` (
  `listenid` int(11) NOT NULL AUTO_INCREMENT,
  `listennumber` int(11) DEFAULT NULL,
  `listencontent` text,
  `option1` text,
  `option2` text,
  `option3` text,
  `option4` text,
  `correctanswer` varchar(45) DEFAULT NULL,
  `listenaudioid` int(11) DEFAULT NULL,
  `testid` int(11) DEFAULT NULL,
  PRIMARY KEY (`listenid`),
  KEY `Listening_ListenAudio` (`listenaudioid`),
  KEY `testid` (`testid`),
  CONSTRAINT `Listening_ListenAudio` FOREIGN KEY (`listenaudioid`) REFERENCES `listenaudio` (`listenaudioid`),
  CONSTRAINT `listening_ibfk_1` FOREIGN KEY (`testid`) REFERENCES `test` (`testid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `listening_ibfk_2` FOREIGN KEY (`testid`) REFERENCES `test` (`testid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `listening_ibfk_3` FOREIGN KEY (`testid`) REFERENCES `test` (`testid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `listening_ibfk_4` FOREIGN KEY (`testid`) REFERENCES `test` (`testid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `listening`
--

LOCK TABLES `listening` WRITE;
/*!40000 ALTER TABLE `listening` DISABLE KEYS */;
INSERT INTO `listening` VALUES (1,1,'Where is the woman calling?','(A) an office ','(B) a garage ','(C) a doctor’s surgery ','(D) a factory ','B',1,1),(2,2,'What are they discussing?','(A) A movie they saw ','(B) Their evening plans ','(C) The new Arts Center ','(D)  The meal they just had ','B',2,1),(3,3,'Where will the woman be in the afternoon?','(A) At the mall ','(B) At the theater ','(C)  At the Arts Center ','(D)  At a restaurant ','B',2,1),(4,4,'When will the speakers likely meet?','(A)  At 6:00 ','(B) At 6:15 ','(C) At 6:30 ','(D) At 7:00 ','B',2,1),(5,5,'Who most likely is the man?','(A) A real estate agent ','(B) A superintendent ','(C) A tenant of the apartment ','(D)  A banker ','B',3,2),(6,6,'What will the man do next?','(A) Check out the apartment ','(B)  Write out a check for the rent ','(C)  Get something from his apartment ','(D) Take down the For-Rent sign ','B',3,2),(7,7,'What does the man mention about the one-bedroom apartments?','(A) They are quite big ','(B) They are all rented out ','(C) They are very expensive ','(D)  They are on the top floor ','B',3,2),(8,8,'Who most likely are the speakers?','(A) Florists ','(B) Caterers ','(C) Party organizers ','(D)  Waitresses ','B',4,2),(9,9,'What does the man want the woman to do?','(A) Buy a centerpiece ','(B) Talk to the client ','(C) Use the carnations ','(D) Get some roses ','B',4,2);
/*!40000 ALTER TABLE `listening` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reading`
--

DROP TABLE IF EXISTS `reading`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reading` (
  `readid` int(11) NOT NULL AUTO_INCREMENT,
  `readnumber` int(11) DEFAULT NULL,
  `readcontent` text,
  `option1` text,
  `option2` text,
  `option3` text,
  `option4` text,
  `correctanswer` varchar(45) DEFAULT NULL,
  `readtestid` int(11) DEFAULT NULL,
  `testid` int(11) DEFAULT NULL,
  PRIMARY KEY (`readid`),
  KEY `Reading_ReadTest` (`readtestid`),
  KEY `testid` (`testid`),
  CONSTRAINT `Reading_ReadTest` FOREIGN KEY (`readtestid`) REFERENCES `readtest` (`readtestid`),
  CONSTRAINT `reading_ibfk_1` FOREIGN KEY (`testid`) REFERENCES `test` (`testid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `reading_ibfk_2` FOREIGN KEY (`testid`) REFERENCES `test` (`testid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `reading_ibfk_3` FOREIGN KEY (`testid`) REFERENCES `test` (`testid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `reading_ibfk_4` FOREIGN KEY (`testid`) REFERENCES `test` (`testid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=198 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reading`
--

LOCK TABLES `reading` WRITE;
/*!40000 ALTER TABLE `reading` DISABLE KEYS */;
INSERT INTO `reading` VALUES (1,1,'While the stock ________ the staff worked in the evenings.','(A) was checked ','(B) check ','(C) has been checked ','(D) was being checked ','D',2,1),(2,2,'________ the end of year results were published, the managers got their bonuses.','(A) Because ','(B) When ','(C) While ','(D) If ','B',2,1),(3,3,'Strong exports ___________ in driving first-quarter growth, rising 35 percent from a year earlier.','(A) played a big role ','(B) played a hand ','(C) instrumental ','(D)  effectively ','A',2,1),(4,4,'The new service was expected to be a success; __________ very few customers upgraded their accounts.','(A) although ','(B) yet ','(C) just ','(D) moreover ','B',2,1),(7,7,'First quarter revenue _________ $45.1 billion from $44.7 billion a year earlier.','(A) increased ','(B) declined from ','(C) rose to ','(D) expanded at ','C',2,2),(8,8,'The executives pointed to immigration __________ the biggest drivers of the domestic market.','(A) rather than ','(B) as one of ','(C) as leading ','(D)  resulting in ','B',2,2),(9,9,'The report showed that overall prices are up 3.1 percent _________ 12 months.','(A) since the last ','(B) during the last ','(C)  in the following ','(D) periodically over ','B',2,2),(10,10,'The software developers __________ investigated the latest problem.','(A)  are just ','(B) still ','(C) have already ','(D) have yet ','C',2,2),(101,11,'The new prices are _____ on March 1st.','(A) effect','(B) effective','C) effecting','(D) effected','B',3,2),(102,12,'Martin and Scott will give _____ presentation tomorrow','(A) his','(B) its','(C) their','(D) theirselves','C',3,2),(103,13,'Orders for banquet tickets will be _____ this afternoon.','(A) taken','(B) given','(C) played','(D) stationed','A',3,2),(104,14,'Will the last person leaving the office please remember to _____ the lights?','(A) shut down','(B) close','C) turn off','(D) cancel','C',3,3),(105,15,'The Butler Building is _____ the corner of Fifth and Vine.','(A) in','(B) against','(C) between','(D) on','D',3,3),(106,16,'All our steaks are seared in the oven, and then seasoned to _____.','(A) prediction','(B) perfection','(C) perdition','(D) permission','B',3,3),(107,17,'All our steaks are seared in the oven, and then seasoned to _____.','(A) to bring','(B) bringing','C) brought','(D) brings','B',1,3),(108,18,'The play\'s long run on Broadway will _____ come to an end tonight.','(A) totally','(B) very','(C) temporarily','(D) finally','D',1,3),(109,19,'The bank is closed now, _____ you will have to wait until tomorrow to make the deposit.','(A) so','(B) as','(C) because','(D) and','A',1,3),(110,20,'Could I see your driver\'s _____ please?','(A) card','(B) permit','(C) license','(D) identification','C',1,3),(111,21,'We\'re _____ copy paper. Could you please order some more?','(A) through with','(B) down to','(C) out of','(D) used up','C',1,3),(112,22,'Lowman Bros. Inc. cordially ____ you to its annual fund-raising dinner','(A) invited','(B) invites','(C) invite','(D) inviting','B',1,3),(113,23,') The contract _____ on Dec. 31st.','(A) expunges','(B) finishes','(C) cancels','(D) expires','D',1,3),(114,24,'If my flight is on time, I should be _____ your office by 2 o\'clock.','(A) at','(B) near','(C) over','(D) on','A',1,3),(115,25,'Ace Architecture was honored for its commitment to green, _____ development.','(A) sustaining','(B) sustained','(C) sustainable','(D) sustains','C',1,3),(116,26,'Knowledge of computers is a ______ for this position.','(A) credential','(B) requirement','(C) legality','(D) certificate','B',1,3),(117,27,'Juan had just finished ______ the project when Keith walked in.','(A) to review','(B) reviewing','(C) reviewed','(D) reviews','B',1,3),(118,28,'Unlike our competitors, who opened too many stores last year, we need to expand ______','(A) quickly','(B) exponentially','(C) substantially','(D) gradually','D',1,3),(119,29,'______ the economy improves soon, we will have to have another round of layoffs.','(A) Unless','(B) Until','(C) If','(D) Because','A',1,3),(120,30,'Have you ever ______ to Geneva?','(A) gone','(B) come','(C) been','(D) went','C',1,3),(121,31,'Increased sales of its new smart phone application have put the firm in the ______ this quarter.','(A) red','(B) green','(C) black','(D) yellow','C',1,3),(122,32,'You can exchange your item for something of equal or lesser value, provided you have the original ______.','(A) recipe','(B) reception','(C) receptacle','(D) receipt','D',1,3),(123,33,'Sampson & Sons Inc. will issue ______ annual report on the 19th.','(A) their','(B) its','(C) his','(D) our','B',1,3),(124,34,'I ______ while you were working out.','(A) was sleeping','(B) had been sleeping','(C) slept','(D) sleep','A',1,3),(125,35,'Please fill out the form and return it at your ______ convenience.','(A) soonest','(B) least','(C) earliest','(D) quickest','C',1,3),(126,36,'Flying would have ______ almost twice as much as taking the train.','(A) spent','(B) cost','(C) lasted','(D) paid','B',1,3),(127,37,'I\'ll have the estimate for the painting ready for you in a ______ more days.','(A) little','(B) few','(C) several','(D) short','B',1,3),(128,38,'Congratulations on your _____ to senior vice president.','(A) raise','(B) qualification','(C) advance','(D) promotion','D',1,3),(129,39,'We did not hire John Delany due to ______ lack of previous experience.','(A) her','(B) their','(C) his','(D) us','C',1,3),(130,40,'If Kevin\'s Cleaners ______ be willing to lower their fees by 10 percent, I\'d be willing to contract with them.','(A) would','(B) should','(C) could','(D) won\'t','A',1,3),(131,41,'We named him Washington, ______ the father of our country.','(A) beside','(B) after','(C) over','(D) before','B',1,3),(132,42,'We believe that demand is driven largely by ______.','(A) scarcity','(B) scariness','(C) sacrifice','(D) synchronicity','A',1,3),(133,43,'Are you ready ______ ?','(A) ordering','(B) orders','(C) to order','(D) ordered','C',1,3),(134,44,'Could I have tea ______ coffee?','(A) rather for','(B) prefer to','(C) better than','(D) instead of','D',1,2),(135,45,'The company\'s board of directors rejected ACJ\'s hostile ______ bid.','(A) makeup','(B) takeover','(C) takeoff','(D) pulldown','B',1,2),(136,46,'Bonus pay is ______ upon the quality of your performance.','(A) depending','(B) dependent','(C) depended','(D) dependable','B',1,2),(137,47,'Mr. Morgan is out of the office right now, ______ I expect him back shortly.','(A) but','(B) and','(C) so','(D) therefore','A',1,2),(138,48,'A federal ______ prevented Mega Bank\'s financial failure.','(A) deposit','(B) contribution','(C) subsidy','(D) donation','C',1,2),(139,49,'The bond will mature on Dec. 31st, 2020, or the holder\'s 60th birthday, ______ comes first.','(A) whenever','(B) whatever','(C) whichever','(D) whoever','C',1,2),(140,50,'Because the firm was losing money, Susan was ______ from her management position.','(A) put out','(B) pushed down','(C) sent up','(D) laid off','D',1,2),(141,51,'Jan. 15th, 2012\nMidwest Bank\n2244 Main St., Omaha, NB 44331\nTel: (818) 555-8192\nRudolph Driscoll\n874 Tumbleweed Lane, #A-103\nOmaha, NB 44332\nDear Mr. Driscoll:\nWe are writing to inform you that check No. 1384, in the __________ of $2,500, was presented for payment on\nJan. 8th against an account balance of $2,275. In accordance with your overdraft protection provision, we have\npaid the check and charged your account a $30 overdraft fee.','(A) amount','(B) total','(C) value','(D) price','A',1,3),(142,52,'To avoid further action, please make a deposit to your checking account as soon as possible. If you __________\nalready done so, you may disregard this notice.','(A) had','(B) haven\'t','(C) have','(D) having','C',1,3),(143,53,'We appreciate your patronage of Midwest Bank. If you have any questions, or if there is a way we can service\nyour needs, call our customer assistance line __________ 555-7700 between 9 a.m. and 5 p.m. Monday to\nFriday, or come into one of our six Omaha branches.','(A) on','(B) at','(C) in','(D) as','B',1,3),(144,54,'Are you too busy to clean?\nWe understand.\nSo relax, and leave the cleaning to us! Our professional, reliable staff will leave your home feeling like new. We\nuse only100-percent safe, __________ friendly products, so you can rest assured there will be no harmful\nchemicals or dangerous liquid reside left behind.','(A) environment','(B) environments','(C) environmental','(D) environmentally','D',1,3),(145,55,'Our prices are among the lowest in the region. And, if you mention this flier, we will give you a 15-percent\ndiscount on your first cleaning. Plus, if you are not completely satisfied with our services, we will come again\nand re-clean the areas you specify free of __________!','(A) charge','(B) money','(C) cash','(D) guarantee','A',1,3),(146,56,'Why not give us a try? Call 555-4372 for a free cleaning estimate. We are open 7 a.m. to 5 p.m. Monday\n__________ Friday, and 9 a.m. to 4 p.m. on Saturdays. You can also visit us online at www.ecoclean.com. Isn\'t\nit about time you had the break you deserve?','(A) and','(B) by','(C) through','(D) until','C',1,3),(147,57,'To: All managers\nFrom: Dennis Kruger, CEO\nRe: Employee performance reviews\nAll of you __________ have received forms for annual employee evaluations. If you haven\'t, contact Candice in\nhuman resources as soon as possible. Evaluation forms must be completed by Jan. 10th and returned to human\nresources. Thank you for your prompt cooperation.','(A) would','(B) should','(C) could','(D) must','B',1,3),(148,58,'You will notice that this year\'s forms contain a new section that rates employee initiative and group\nparticipation. Please be sure to take a few minutes __________ this section before beginning performance\nreviews. Also remember to have each employee sign the review form.','(A) explain','(B) explains','(C) explained','(D) explaining','D',1,3),(149,59,'I will be conducting manager evaluations the week __________ Christmas and New Year\'s, and I hope to have a\nschedule made up by the 15th.','(A) next to','(B) of','(C) between','(D) after','C',1,3),(150,60,'To: dscott@aceconsulting.net\nFrom: tflowers@jbsanders.com\nSubject: confirmation\nDear Dave Scott,\nThis is to confirm the __________ reached this morning in the conference call between yourself and our\npresident, Jed Sanders. If any of this information is incomplete or inaccurate, please let us know immediately','(A) agreement','(B) conversation','(C) argument','(D) election','A',1,3),(151,61,'Ace Consulting has agreed to provide 40 hours of consultation for the JB Sanders Corporation, commencing on\nMarch 1st, at a rate of $120 an hour. Payment will be sent once a month upon __________of invoice from Ace\nConsulting. Ace agrees that invoices must be submitted no later than the 20th of each month','(A) receiving','(B) receiver','(C) receipt','(D) receive','C',3,3),(152,62,'JB Sanders Corporation has agreed to __________ up a formal contract and send it to Dave Scott for his\napproval by the end of the week. This contract will remain in effect until Ace Consulting has fulfilled its\ncommitment. At that time, the contract may be extended upon approval of both parties, or a new arrangement\nmay be negotiated.','(A) make','(B) tear','(C) draw','(D) get','C',3,3),(153,63,'What is being offered?','(A) A 20-percent discount','(B) Reduced shipping cost','(C) A free 30-day trial','(D) A new credit card','C',3,3),(154,64,'How can customers order?','(A) By sending in a coupon','(B) By making a phone call','(C) By e-mailing the company','(D) By going to a store','B',3,3),(155,65,'What is the main purpose of this memo?','(A) To announce a new arrangement','(B) To reveal the winner of the remodeling bid','(C) To inform staff of a surprise change','(D) To remind workers that the company is moving.','A',3,3),(156,66,'What can be inferred about the company?','(A) It is not very big.','(B) It occupies several floors.','(C) It is a manufacturer.','(D) It is relatively new.','B',3,3),(157,67,'What does the writer request readers do?','(A) E-mail their supervisors','(B) Disrupt their routines','(C) Move to the fifth floor','(D) Prepare ahead of time','D',3,3),(158,68,'What can be inferred about Dennis and Jack?','(A) They were college roommates.','(B) They are related to each other.','(C) They are former colleagues','(D) They have not known each other long.','C',3,3),(159,69,'What is the main purpose of the note?','(A) To arrange a date for lunch','(B) To inquire about employment','(C) To inform of an award','(D) To offer congratulations','D',3,3),(160,70,'What is true of ZipTech?','(A) It had sales of $2 million.','(B) It was started by Dennis.','(C) It began five years ago.','(D) It is a one-person business.','A',3,3),(161,71,'What advice does Dennis offer Jack?','(A) Hire more workers.','(B) Keep working hard.','(C) Take a vacation.','(D) Plan to retire early.','B',3,3),(162,72,'How can a customer receive a 50-percent discount?','(A) By presenting the coupon to the cashier','(B) By ordering two of the items on the coupon','(C) By buying a regular Coca Cola','(D) By buying one \"Choose 2\" at regular price','C',3,3),(163,73,'Which of the following is NOT true?','(A) The coupon will be honored through the end of 2010.','(B) The coupon does not apply to delivery orders.','(C) With the coupon, two items together will cost $2.50.','(D) The coupon is applicable to multiple orders.','D',3,3),(164,74,'What type of business is Darby\'s?','(A) A restaurant','(B) A hotel','(C) A coffee shop','(D) A theater','A',3,3),(165,75,'What is mentioned in the advertisement?','(A) Prices','(B) Locations','(C) Combination plates','(D) Specials','C',3,3),(166,76,'What does John Hartzell suggest about Stephen Toussant?','(A) He was a student of Claude Chemmert\'s.','(B) He plagiarized the original movie.','(C) He is a mediocre actor.','(D) He is a skilled director.','D',3,3),(167,77,'The phrase \"gets a lot of mileage\" is closest in meaning to','(D) He is a skilled director.','(B) Receives good value','(C) Depends on too heavily','(D) Cares for irresponsibly','B',3,3),(168,78,'What is John Hartzell\'s opinion of the movie?','(A) It relies on good acting.','(B) Its script is superbly written.','(C) It should have been longer.','(D) It will be an instant classic.','A',3,3),(169,79,'What is the purpose of the letter?','(A) To solicit a renewal','(B) To introduce a magazine','(C) To promote a cause','(D) To offer a special deal','A',3,3),(170,80,'What does the writer ask readers to do?','(A) Try the magazine for free','(B) Ask their children\'s opinion','(C) Make a telephone call','(D) Send in a reply card','D',3,3),(171,81,'How does the writer promote the magazine?','(A) By offering a free gift','(B) By emphasizing its low price','(C) By stressing its high quality','(D) By enclosing a complimentary issue','C',3,3),(172,82,'What does the writer say about upcoming issues?','(A) They will be offered at a discount.','(B) He is excited about their content','(C) They will feature bonus sections.','(D) He thinks they will win awards.','B',3,3),(173,83,'What does the chief executive recommend about the organization?','(A) It should move to a new location by the end of the month.','(B) It should begin an advertising campaign to hire new workers.','(C) It should delay moving unless a new facility','(D) It should reduce its current number of workers by 20 percent.','C',3,3),(174,84,'What did Douglas Carver suggest doing?','(A) Seeking legal counsel','(B) Having a Board retreat','(C) Notifying Board members','(D) Introducing a resolution','D',3,3),(175,85,'Why did Leslie Zevon abstain from selecting a computer consultant?','(A) She was worried about a potential conflict of interest.','(B) She is going to be out of town during the selection process.','(C) She does not feel knowledgeable enough about computers.','(D) She will be leaving the organization shortly.','A',3,3),(176,86,'Which package includes airport transportation?','(A) Basic','(B) Deluxe','(C) Super Grande','(D) All of them','D',3,3),(177,87,'What is true of the Grande package?','(A) It includes a presidential suite.','(B) It includes a free newspaper each day.','(C) It includes a 30-percent car-rental discount.','(D) It includes free one-day admission at Awesome World.','B',3,3),(178,88,'For three people, how much would the Basic Package cost apiece?','(A) $250','(B) $500','(C) $750','(D) $1,000','A',3,3),(179,89,'What can be inferred about the Centurion Hotel?','(A) It is world-famous.','(B) It is 20 stories high.','(C) It is near Awesome World.','(D) It is historic.','C',3,3),(180,90,'What is NOT true of the Deluxe Package?','(A) It includes a queen bed.','(B) It includes free breakfasts','(C) It includes a car-rental discount.','(D) It includes a two-for-one coupon.','D',3,3),(181,91,'Why does Tim Orsborne expect EarthFirst to keep growing?','(A) Its products are cheaper than its competitors\'.','(B) There is a large market for disposable plastics.','(C) EarthFirst is an old, established brand name.','(D) He is reducing the company\'s carbon footprint.','B',3,3),(182,92,'In the article, the word \"biodegradable\" in paragraph 4, line 2, is closest in meaning to','(A) ability to decompose','(B) ability to fall apart','(C) ability to withstand heat','(D) ability to hold food','A',3,3),(183,93,'What is Bryan Bosworth\'s opinion of EarthFirst products?','(A) They are too expensive.','(B) They are high quality.','(C) Their higher price is justified.','(D) They\'re not worth the money.','C',3,3),(184,94,'Why does Bryan Bosworth mention his supervisor?','(A) To illustrate close-minded thinking','(B) To refute a claim made in the article','(C) To demonstrate office procedure','(D) To make a point about changing perceptions','D',3,3),(185,95,'According to the article, what is true of traditional plastic bags?','(A) They biodegrade within 36 months.','(B) They can last up to 1,000 years.','(C) They are made of low-density polyethylene.','(D) They are made of polymers and proteins.','B',3,3),(186,96,'According to the delivery form, which item was not fully delivered?','(A) R01','(B) R05','(C) R07','(D) R10','C',3,3),(187,97,'What was the problem with the pocket door frame?','(A) The right side is damaged.','(B) It is on back order.','(C) The cover is broken.','(D) It is the wrong size.','A',3,3),(188,98,'What is the main purpose of the e-mail?','(A) To complain','(B) To empathize','(C) To threaten','(D) To cajole','A',3,3),(189,99,'In the e-mail, the word \"prompt\" in paragraph 4, line 1, is closest in meaning to','(A) full','(B) immediate','(C) improved','(D) impartial','B',3,3),(190,100,'Why weren\'t 10 sheets of drywall able to be delivered?','(A) They wouldn\'t fit in the delivery truck.','(B) They were damaged and had to be returned','(B) They were damaged and had to be returned','(D) Joe Buchanan has not paid for them yet.','C',3,3),(191,101,'According to the notice, what time will the 312 bus make its first stop on May 5th?','(A) 6 a.m.','(B) 6:15 a.m.','(C) 7 a.m.','(D) 7:45 a.m.','B',3,3),(192,102,'Where can people get a free copy of the new bus schedule?','(A) At City Hall','(B) In the newspaper','(C) At a convenience store','(D) In the city library','C',3,3),(193,103,'In the e-mail, the word \"dismayed\" in paragraph 2, line 1, is closest in meaning to','(A) disconcerted','(B) fascinated','(C) furious','(D) overjoyed','A',3,3),(194,104,'What is Dana Davis\' complaint about the new bus stop at Main and Pine?','(A) It is hard to find.','(B) It is too crowded.','(C) It is poorly signed.','(D) It is too far away.','D',3,3),(195,105,'What can be inferred from the notice about Main Street?','(A) It is not very busy.','(B) It is five miles long','(C) It runs north and south.','(D) It parallels Sycamore Street.','C',3,3);
/*!40000 ALTER TABLE `reading` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger tg_Deletereadtest before delete on reading 
 for each row
 begin
	delete from reading where reading.readtestid=OLD.readtestid;
 end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `reading_view`
--

DROP TABLE IF EXISTS `reading_view`;
/*!50001 DROP VIEW IF EXISTS `reading_view`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `reading_view` AS SELECT 
 1 AS `readnumber`,
 1 AS `readcontent`,
 1 AS `option1`,
 1 AS `option2`,
 1 AS `option3`,
 1 AS `option4`,
 1 AS `correctanswer`,
 1 AS `readtestid`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `readtest`
--

DROP TABLE IF EXISTS `readtest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `readtest` (
  `readtestid` int(11) NOT NULL,
  `readtestcontent` text,
  PRIMARY KEY (`readtestid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `readtest`
--

LOCK TABLES `readtest` WRITE;
/*!40000 ALTER TABLE `readtest` DISABLE KEYS */;
INSERT INTO `readtest` VALUES (1,'In this TOEIC practice test there are 10 questions. For each question you will see an incomplete sentence. Four words or phrases, marked A-D are given beneath each sentence. You are to choose the one word or phrase that best completes the sentence.  '),(2,'You are going to read some reading passages, each with 2-5 questions. For each question, choose the answer which you think fits best according to the text.  '),(3,'Choose the word that best completes the sentence.  ');
/*!40000 ALTER TABLE `readtest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `result`
--

DROP TABLE IF EXISTS `result`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `result` (
  `resultid` int(11) NOT NULL AUTO_INCREMENT,
  `numcorrectanswerread` int(11) DEFAULT NULL,
  `numcorrectanswerlisten` int(11) DEFAULT NULL,
  `point` int(11) DEFAULT NULL,
  `testid` int(11) DEFAULT NULL,
  `userid` int(11) DEFAULT NULL,
  PRIMARY KEY (`resultid`),
  KEY `Result_Test` (`testid`),
  KEY `Result_Users` (`userid`),
  CONSTRAINT `Result_Users` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `result`
--

LOCK TABLES `result` WRITE;
/*!40000 ALTER TABLE `result` DISABLE KEYS */;
INSERT INTO `result` VALUES (1,40,20,60,1,1),(2,30,40,70,2,2),(3,10,20,30,3,3),(4,20,50,70,1,4),(7,50,50,100,1,2);
/*!40000 ALTER TABLE `result` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `result_view`
--

DROP TABLE IF EXISTS `result_view`;
/*!50001 DROP VIEW IF EXISTS `result_view`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `result_view` AS SELECT 
 1 AS `resultid`,
 1 AS `numcorrectanswerread`,
 1 AS `numcorrectanswerlisten`,
 1 AS `point`,
 1 AS `testid`,
 1 AS `userid`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `roleid` int(11) NOT NULL AUTO_INCREMENT,
  `rolename` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`roleid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'admin'),(2,'user');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `slidebanner`
--

DROP TABLE IF EXISTS `slidebanner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `slidebanner` (
  `slidebannerid` int(11) NOT NULL,
  `slidebannername` text,
  `slidebannercontent` text,
  `slidebannerimage` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`slidebannerid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `slidebanner`
--

LOCK TABLES `slidebanner` WRITE;
/*!40000 ALTER TABLE `slidebanner` DISABLE KEYS */;
INSERT INTO `slidebanner` VALUES (1,'Life','I want to live my life without stress and worries, i do not need to be rich and famous','verry.jpg'),(2,'Good','To laugh with others is one of life’s great pleasures. To be laughed at by others is one of life’s great hurts.','important.jpg');
/*!40000 ALTER TABLE `slidebanner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `slidebanner_view`
--

DROP TABLE IF EXISTS `slidebanner_view`;
/*!50001 DROP VIEW IF EXISTS `slidebanner_view`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `slidebanner_view` AS SELECT 
 1 AS `slidebannername`,
 1 AS `slidebannercontent`,
 1 AS `slidebannerimage`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `test`
--

DROP TABLE IF EXISTS `test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test` (
  `testid` int(11) NOT NULL,
  `testname` varchar(45) DEFAULT NULL,
  `time` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`testid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test`
--

LOCK TABLES `test` WRITE;
/*!40000 ALTER TABLE `test` DISABLE KEYS */;
INSERT INTO `test` VALUES (1,'Mini Test','20'),(2,'Medium Test','60'),(3,'Large Test','90'),(4,'Test Sheet','120');
/*!40000 ALTER TABLE `test` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger tg_Deletetest after delete on test
for each row 
begin
	
		delete from listening where listening.testid=OLD.testid;
		delete from reading where reading.testid=OLD.testid;
        delete from result where result.testid=OLD.testid;

   
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `userid` int(11) NOT NULL,
  `username` varchar(45) DEFAULT NULL,
  `pass` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `roleid` int(11) DEFAULT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','123','nguyenquanghuy@gmail.com',1),(2,'qhuy','123','quangtuan@gmail.com  ',1),(3,'nqhuy','123','dinhthai@gmail.com  ',2),(4,'QuangLich','lich  ','quanglich@gmail.com  ',2),(7,'Hello','123','hello@gmail.com',2),(8,'Hello','123','hello@gmail.com',2),(11,'jackiebarry','123','huy@gmail.com',2),(13,'hello','hello','hello@gmail.com',2);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger tg_Deleteuser 
before delete on users for each row
begin	
	delete from result where result.userid= OLD.userid;

end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `users_view`
--

DROP TABLE IF EXISTS `users_view`;
/*!50001 DROP VIEW IF EXISTS `users_view`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `users_view` AS SELECT 
 1 AS `userid`,
 1 AS `username`,
 1 AS `pass`,
 1 AS `email`,
 1 AS `roleid`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `vocabulary`
--

DROP TABLE IF EXISTS `vocabulary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vocabulary` (
  `vocabularyid` int(11) NOT NULL,
  `vocabularyname` varchar(45) DEFAULT NULL,
  `vocabularymean` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`vocabularyid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vocabulary`
--

LOCK TABLES `vocabulary` WRITE;
/*!40000 ALTER TABLE `vocabulary` DISABLE KEYS */;
INSERT INTO `vocabulary` VALUES (1,'Contracts  ','hợp đồng, giao kèo, khế ước, giấy ký kết '),(2,'Marketing  ','thị trường, nơi tiêu thụ; khách hàng  '),(3,'Warranties   ','bảo hành, sự bảo đảm  '),(4,'Conferences   ','hội nghị, cuộc gặp mặt  '),(5,'Correspondence   ','quan hệ thư từ, sự phù hợp  '),(6,'Electronics   ','máy tính  '),(7,'Computers   ','Xin chào  '),(8,'Shopping  ','Mua sắm  '),(9,'Business planning  ','tổ chức kế hoạch công sở  '),(10,'Salaries and benefits  ','lương bổng và lợi ích  ');
/*!40000 ALTER TABLE `vocabulary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vocabulary_view`
--

DROP TABLE IF EXISTS `vocabulary_view`;
/*!50001 DROP VIEW IF EXISTS `vocabulary_view`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vocabulary_view` AS SELECT 
 1 AS `slidebannername`,
 1 AS `slidebannercontent`,
 1 AS `slidebannerimage`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'webtoeic'
--

--
-- Dumping routines for database 'webtoeic'
--
/*!50003 DROP FUNCTION IF EXISTS `func_NumberOfQuestionsReading` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `func_NumberOfQuestionsReading`(id int) RETURNS int(11)
begin
	declare num int;
    set num=0;
    select count(readid) into num from reading,test where reading.testid=test.testid
    and test.testid = id
    group by test.testid;
    return num;    
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `func_NumberOfTest` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `func_NumberOfTest`(id int) RETURNS int(11)
begin 
	declare re int;
	select count(resultid) into re
    from result 
    where userid = id
    group by result.userid;
    return re;
        
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `func_NumberOfUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `func_NumberOfUser`(test_id int) RETURNS int(11)
begin
	declare u int;
    select count(userid) into u from Result
    where result.testid =test_id
    group by result.testid;
    return u;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `func_ScoreID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `func_ScoreID`(id int) RETURNS double
begin
	declare re real;
	select avg(point) into re
    from result
    where result.userid=id
	group by userid;
    return re;           
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `func_Topuser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `func_Topuser`() RETURNS int(11)
begin 
declare id int;
select distinct result.userid into id
			from result
			group by result.userid
            having avg(point) >= all (select avg(point) from result group by userid);
		return id;	
			
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pr_AllExam` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pr_AllExam`()
BEGIN

	select users.userid,users.username,users.email,result.point
	from users,result
	where users.userid=result.userid;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pr_Champion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pr_Champion`()
begin 

select distinct result.userid, avg(point) as Average_Point
			from result
			group by result.userid
            having avg(point) >= all (select avg(point) from result group by userid);
			
			
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pr_Countid` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pr_Countid`()
begin
select result.userid,count(result.resultid) as Number_of_tests
			from Users,Result
			where Users.userid = Result.userid
			group by Result.userid;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pr_CountReading` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pr_CountReading`()
BEGIN
	select count(*) from Reading;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pr_DeleteReading` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pr_DeleteReading`(in id int)
BEGIN
	if(id!=null) then 
		Delete from reading
		where readid=id;
    end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pr_DeleteUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pr_DeleteUser`(in id int)
BEGIN

	if(id!='') then
		Delete from  users
		where userid=id;
	end if;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pr_DontExam` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pr_DontExam`()
BEGIN

	select distinct Users.userid,Users.username,users.email
	from Users , result
	where not exists (select * from Result
				where Users.userid= Result.userid );

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pr_InsertAccount` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pr_InsertAccount`(
in id int,
in name varchar(45),
in password varchar(45),
in mail varchar(45)
)
BEGIN
	Declare user int;
    Set user=0;
    
    if(length(name>3) and length(name<30)) 
			then set user = 1;
	elseif (length(password>3) and length(password<30)) 
			then set user = 1;
	end if;
	if(user = 1) then
	insert into users(userid, username, pass, email, roleid)
	value(id,name,password,mail,2);
    end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pr_InsertQuestion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pr_InsertQuestion`(
in question text,
in questionnumber int,
in questioncontent text,
in option1 text,
in option2 text,
in option3 text,
in option4 text,
in answerquestion varchar(45)
)
BEGIN

	if(lower(question)='Reading') then
		insert  into Reading(readnumber,readcontent,option1,option2,option3,option4,correctanswer)
		value(questionnumber,questioncontent,option1,option2,option3,option4,answerquestion);
    
    elseif(lower(question)='Listening') then
		insert  into Listening(listennumber,listencontent,option1,option2,option3,option4,correctanswer)
		value(questionnumber,questioncontent,option1,option2,option3,option4,answerquestion);
	end if;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pr_InsertUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pr_InsertUser`(
in id int,
in name varchar(45),
in password varchar(45),
in mail varchar(45),
in roleid int
)
BEGIN
	Declare user int;
    Set user=0;
    
    if(length(name>3) and length(name<30)) 
			then set user = 1;
		elseif (length(password>3) and length(password<30)) 
			then set user = 1;
	end if;
	if(user = 1) then
		insert into users(userid, username, pass, email, roleid)
		value(id,name,password,mail,roleid);
	end if;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pr_Rank` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pr_Rank`()
begin
select users.userid,avg(point) as Total,(case
								when  avg(point) >= 90 and avg(point) <= 100 then 'Crystal'
								when avg(point) >=80  and avg(point) < 90 then 'Gold'
								when avg(point) > 60 and avg(point) <=70 then 'Silver'
								else 'Bronze'
                                end) as Medal
 										 
			from Users,Result
			where Users.userid=Result.userid
			group by users.userid
            order by Total desc;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pr_TestSheet` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pr_TestSheet`()
BEGIN

	select Q.testid, Q.testname, 
    Q.listen as numberListen, count(readid) as numberRead, Q.time
	from reading, (select test.testid, testname,time, count(test.testid) as listen
					from listening, test
					where test.testid=listening.testid
                    group by (test.testid)) as Q
	where Q.testid= reading.testid
    group by (Q.testid);
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pr_UpdateQuestion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pr_UpdateQuestion`(
in question text,
in questionnumber int,
in questioncontent text,
in _option1 text,
in _option2 text,
in _option3 text,
in _option4 text,
in answerquestion varchar(45),
in questionid int
)
BEGIN

	if(lower(question)='Reading') then
		update reading set readnumber=questionnumber, readcontent=questioncontent,
        option1=_option1, option2=_option2, option3=_option3,
        option4=_option4, correctanswer=answerquestion where readid=questionid;   
        
    elseif(lower(question)='Listening') then
		update listening set listennumber=questionnumber, listencontent=questioncontent,
        option1=_option1, option2=_option2, option3=_option3,
        option4=_option4, correctanswer=answerquestion where listenid=questionid;    
	end if;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pr_UpdateUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pr_UpdateUser`(
in uname varchar(45),
in password varchar(45),
in emails varchar(45),
in rolid int,
in id int
)
BEGIN

	Declare flag int;
    Set flag=0;
    
    if(length(uname>3) and length(uname<30)) 
			then set flag = 1;
	elseif (length(password>=3) and length(password<30)) 
			then set flag = 1;
	end if;
    
    if(flag=1 and id!='') then
		update users set username=uname, pass=password, email=emails,
		roleid=rolid where userid = id;
        end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `reading_view`
--

/*!50001 DROP VIEW IF EXISTS `reading_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `reading_view` AS select `reading`.`readnumber` AS `readnumber`,`reading`.`readcontent` AS `readcontent`,`reading`.`option1` AS `option1`,`reading`.`option2` AS `option2`,`reading`.`option3` AS `option3`,`reading`.`option4` AS `option4`,`reading`.`correctanswer` AS `correctanswer`,`reading`.`readtestid` AS `readtestid` from `reading` order by `reading`.`readnumber` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `result_view`
--

/*!50001 DROP VIEW IF EXISTS `result_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `result_view` AS select `result`.`resultid` AS `resultid`,`result`.`numcorrectanswerread` AS `numcorrectanswerread`,`result`.`numcorrectanswerlisten` AS `numcorrectanswerlisten`,`result`.`point` AS `point`,`result`.`testid` AS `testid`,`result`.`userid` AS `userid` from `result` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `slidebanner_view`
--

/*!50001 DROP VIEW IF EXISTS `slidebanner_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `slidebanner_view` AS select `slidebanner`.`slidebannername` AS `slidebannername`,`slidebanner`.`slidebannercontent` AS `slidebannercontent`,`slidebanner`.`slidebannerimage` AS `slidebannerimage` from `slidebanner` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `users_view`
--

/*!50001 DROP VIEW IF EXISTS `users_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `users_view` AS select `users`.`userid` AS `userid`,`users`.`username` AS `username`,`users`.`pass` AS `pass`,`users`.`email` AS `email`,`users`.`roleid` AS `roleid` from `users` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vocabulary_view`
--

/*!50001 DROP VIEW IF EXISTS `vocabulary_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vocabulary_view` AS select `slidebanner`.`slidebannername` AS `slidebannername`,`slidebanner`.`slidebannercontent` AS `slidebannercontent`,`slidebanner`.`slidebannerimage` AS `slidebannerimage` from `slidebanner` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-11-19 11:05:16
