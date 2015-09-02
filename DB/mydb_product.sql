-- MySQL dump 10.13  Distrib 5.6.24, for Win64 (x86_64)
--
-- Host: localhost    Database: mydb
-- ------------------------------------------------------
-- Server version	5.5.45

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
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product` (
  `product_id` varchar(8) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `product_name` varchar(100) DEFAULT NULL,
  `product_name_en` varchar(100) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `summary` varchar(200) DEFAULT NULL,
  `filename_big` varchar(200) DEFAULT NULL,
  `filename_small` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`product_id`),
  KEY `Foreign_idx` (`category_id`),
  CONSTRAINT `` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='產品資料';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES ('Drink_01',4,'冰荔枝綠茶','Iced Lychee Green Tea',100,'熱量Calories：94卡','Drink_01_b.jpg','Drink_01_s.jpg'),('Drink_02',4,'碳火焙煎咖啡','Charcoal Roasted Coffee',100,'熱量Calories：11卡','Drink_02_b.jpg','Drink_02_s.jpg'),('Drink_03',4,'冰咖啡','Iced Coffee',100,'熱量Calories：21卡','Drink_03_b.jpg','Drink_03_s.jpg'),('Drink_04',4,'冰咖啡拿鐵','Iced Café Latte',150,'熱量Calories：245卡','Drink_04_b.jpg','Drink_04_s.jpg'),('Drink_05',4,'卡布奇諾','Cappuccino',150,'熱量Calories：102卡','Drink_05_b.jpg','Drink_05_s.jpg'),('Drink_06',4,'冰繽紛水果茶','Iced Fruit Tea',150,'熱量Calories：253卡','Drink_06_b.jpg','Drink_06_s.jpg'),('Drink_07',4,'冰焦糖奶茶','Iced Caramel Milk Ceylon Tea',150,'熱量Calories：332卡','Drink_07_b.jpg','Drink_07_s.jpg'),('Drink_08',4,'蜜柚蘋果熱紅茶','Honey Yuzu Apple Tea',150,'熱量Calories：80卡','Drink_08_b.jpg','Drink_08_s.jpg'),('Drink_09',4,'伯爵奶茶','Earl Grey Milk Tea',150,'熱量Calories：280卡','Drink_09_b.jpg','Drink_09_s.jpg'),('Drink_10',4,'熱紅茶','Black Tea',100,'熱量Calories：2卡','Drink_010_b.jpg','Drink_010_s.jpg'),('Drink_11',4,'冰紅茶','Iced Black Tea',100,'熱量Calories：3卡','Drink_011_b.jpg','Drink_011_s.jpg'),('Drink_12',4,'大吉嶺水果茶','Darjeeling Fruit Tea',150,'熱量Calories：120卡','Drink_012_b.jpg','Drink_012_s.jpg'),('Pasta_01',2,'安格斯牛肉義大利麵','Spaghetti with Angus Beef & King Trumpet Mushroom',250,'安格斯牛肉搭配柚子胡椒醬，正點美味。牛肉產地:美國。','Pasta_01_b.jpg','Pasta_01_s.jpg'),('Pasta_02',2,'柚香明太子烏賊義大利麵','Squid & Mentaiko Spaghetti with Pomelo Flavor',250,'日本直輸明太子，清沁柚子香，全新出擊。','Pasta_02_b.jpg','Pasta_02_s.jpg'),('Pasta_03',2,'培根蛋奶麵','Spaghetti Carbonara with Vegetable',200,'帕瑪森起士、鮮奶油、蛋黃濃稠醬汁裹住麵條，香溜順口。','Pasta_03_b.jpg','Pasta_03_s.jpg'),('Pasta_04',2,'南義蝦仁義大利麵','Spaghetti with Shrimp & Anchovy Tomato Sauce',200,'鯷魚、大蒜、牛奶和橄欖油鹹香海洋滋味，以強烈味道聞名。','Pasta_04_b.jpg','Pasta_04_s.jpg'),('Pasta_05',2,'燻鴨義大利麵','Spaghetti Peperoncino with Smoked Duck',250,'煙燻香氣與鴨肉甜味，為義大利家常麵加分。','Pasta_05_b.jpg','Pasta_05_s.jpg'),('Pasta_06',2,'蒜香白酒干貝蛤蜊義大利麵','paghetti with Vongole & Scallop in Garlic Wine Sauce',200,'招牌義大利麵加碼升級多了干貝，增添海鮮風味。','Pasta_06_b.jpg','Pasta_06_s.jpg'),('Pasta_07',2,'香草雞肉南瓜焗斜管麵','Penne Cheese Gratin with Herbal Chicken & Pumpkin',200,'雞肉、南瓜、青花菜、起士，營養美味兼顧。','Pasta_07_b.jpg','Pasta_07_s.jpg'),('Pasta_08',2,'手工雞肉丸肉醬焗斜管麵','Penne Cheese Gratin with Meat Sauce & Chicken Meat Ball',200,'手工雞肉丸和肉醬充分融合的好滋味 ●牛肉產地:澳洲、紐西蘭。','Pasta_08_b.jpg','Pasta_08_s.jpg'),('Pasta_09',2,'海鮮焗烤斜管麵','Penne with Seafood Gratin',250,'超人氣的奶油焗烤義大利麵。','Pasta_09_b.jpg','Pasta_09_s.jpg'),('Pasta_10',2,'海鮮蕃茄湯扁麵','Seafood Linguine in Tomato Broth',250,'更甜更鮮美蕃茄口味的義大利經典招牌菜。','Pasta_010_b.jpg','Pasta_010_s.jpg'),('Pasta_11',2,'綠花椰南瓜扁麵','Linguine with Broccoli & Pumpkin',200,'扁麵充分吸附香濃南瓜醬汁，香烤微焦熟軟甜南瓜，幸福有感。','Pasta_011_b.jpg','Pasta_011_s.jpg'),('Pasta_12',2,'烏賊墨扁麵','Linguine with Squid lnk Sauce',200,'烏賊墨汁的鮮甜味原汁呈現。','Pasta_012_b.jpg','Pasta_012_s.jpg'),('Pizza_01',1,'明太子雞肉芝麻葉比薩','Mentaiko Pizza with Chicken & Fresh Rocket ',300,'日式風味鱈魚卵明太子與雞肉和芝麻葉原創比薩','Pizza_01_b.jpg','Pizza_01_s.jpg'),('Pizza_02',1,'手工雞肉丸&臘腸比薩','Homemade Chicken Ball & Salami Pizza',300,'鮮鹹義式臘腸與美味雞肉丸子，最適合小酌','Pizza_02_b.jpg','Pizza_02_s.jpg'),('Pizza_03',1,'健康野菜比薩','Vegetable Pizza',250,'蕃茄、綜合野菜、青花菜與筊白筍 健康蔬食樂活比薩','Pizza_03_b.jpg','Pizza_03_s.jpg'),('Pizza_04',1,'辣味牛肉比薩',' Spicy Beef Pizza',300,'享受牛肉、起士、黑橄欖、墨西哥辣椒、馬鈴薯泥，營養有活力。牛肉產地:美國','Pizza_04_b.jpg','Pizza_04_s.jpg'),('Pizza_05',1,'海鮮青醬比薩','Seafood & Basil Sauce Pizza',250,'濃郁蘿勒與香甜海鮮攜手合作比薩佳餚','Pizza_05_b.jpg','Pizza_05_s.jpg'),('Pizza_06',1,'野菇總匯青醬比薩','Mushroom & Pesto Sauce Pizza',250,'海鹽與奶油香炒新鮮白洋菇香菇杏鮑菇，與蕃茄sauce青醬，風味絕佳','Pizza_06_b.jpg','Pizza_06_s.jpg'),('Pizza_07',1,'總匯比薩','Supreme Mixed Pizza',300,'義式臘腸、瑞典香腸與蝦仁完美組合風味','Pizza_07_b.jpg','Pizza_07_s.jpg'),('Pizza_08',1,'夏威夷比薩','Hawaiian Pizza',200,'鳳梨果香搭配火腿、蝦仁和起士；加上特製蕃茄sauce，好吃又爽口','Pizza_08_b.jpg','Pizza_08_s.jpg'),('Pizza_09',1,'瑪格麗特比薩','Margherita Pizza',250,'嫣紅清甜蕃茄sauce、白色乳酪白、蘿勒綠葉，經典比薩','Pizza_09_b.jpg','Pizza_09_s.jpg'),('Pizza_10',1,'燻火腿雙起士比薩餃','Somked Ham Calzone & Fresh Salad',250,'切開酥脆餅皮，滿滿餡料呼之欲出，快樂有趣','Pizza_010_b.jpg','Pizza_010_s.jpg'),('Pizza_11',1,'瑪格麗特+夏威夷比薩','Margherita + Hawaiian Pizza',300,'雙重口感清爽美味','Pizza_011_b.jpg','Pizza_011_s.jpg'),('Pizza_12',1,'手工雞肉丸+瑪格麗特比薩','Homemade Chicken Ball + Margherita Pizza',300,'雙重口味雙重享受','Pizza_012_b.jpg','Pizza_012_s.jpg'),('Rice_01',3,'咖哩風蕃茄海鮮焗飯','Seafood Doria with Curry & Tomato',200,'蕃茄SAUCE與辛香咖哩結合海鮮甘甜','Rice_01_b.jpg','Rice_01_s.jpg'),('Rice_02',3,'野菇青醬焗飯','Doria with Basil Sauce & Mushroom',200,'濃郁蘿勒青醬與野菇的蔬食焗飯','Rice_02_b.jpg','Rice_02_s.jpg'),('Rice_03',3,'松露風野菇起士燉飯','Risotto with Mushroom & Truffle Sauce',200,'為之一亮的帕馬森起士瓦片，高雅豪華松露醬香氣，俘虜您的胃口','Rice_03_b.jpg','Rice_03_s.jpg'),('Rice_04',3,'米蘭牛肉焗飯','Beef Doria - Milano Style',250,'肉醬結合蕃茄sauce充分釋放牛肋條肉美味 ●牛肉產地:澳洲、紐西蘭','Rice_04_b.jpg','Rice_04_s.jpg'),('Rice_05',3,'西班牙海鮮烤飯','Seafood Paella',250,'海鮮甘甜番紅花飯，舞動西班牙熱情','Rice_05_b.jpg','Rice_05_s.jpg'),('Rice_06',3,'烏賊墨燉飯','Risotto with Squid lnk Sauce',200,'烏溜金黑飯粒，加上新鮮帕瑪森起士更好吃','Rice_06_b.jpg','Rice_06_s.jpg'),('Rice_07',3,'酥炸海陸&辣雞肉麵佐義式麵包','Deep Fried Chicken & Squid ． Spaghetti Arrabiata with Chicken ． Pita Bread',200,'直接吃或沾點莎露莎醬汁享受雙重美味。','Rice_07_b.jpg','Rice_07_s.jpg'),('Rice_08',3,'芝麻葉香煎牛肉&肉醬鑲蛋佐佛卡夏','Pan-Seared Beef with Rocket ． Meat Sauce & Egg Gratin with Focaccia',200,'牛肉產地:澳洲、紐西蘭','Rice_08_b.jpg','Rice_08_s.jpg'),('Rice_09',3,'香煎雞柳&蕃茄鑲蛋佐佛卡夏','Sauteed Herbal Chicken ． Tomato & Egg Gratin with Focaccia',200,'皮脆肉嫩多汁，超級飽滿美味的新一代暢銷餐點','Rice_09_b.jpg','Rice_09_s.jpg'),('Rice_10',3,'藍帶活菌豬&義大利雞柳','Pork Cordon Bleu & Sauteed Herbal Chicken',350,'五星級牧場飼養的活菌豬，Mozzarella 熔岩 Cheese，健康安全美味，令人驚奇的熔岩 Cheese','Rice_010_b.jpg','Rice_010_s.jpg'),('Rice_11',3,'義式鮮魚燉煮','Acqua Pazza',350,'肉質鮮甜高檔青衣魚，淋上香草橄欖油， 道地拿坡里','Rice_011_b.jpg','Rice_011_s.jpg'),('Rice_12',3,'海陸拼盤','Grilled Squid & Deep Fried Fish & Herbal Chicken Platter',400,'豐富的鮮烤透抽，義大利香料雞排，香酥美味鮮魚','Rice_012_b.jpg','Rice_012_s.jpg');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-09-02 15:08:50
