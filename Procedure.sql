
-- 1 Thêm một tài khoản user từ admin

USE `webtoeic`;
DROP procedure IF EXISTS `pr_InsertUser`;

DELIMITER $$
USE `webtoeic`$$
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

END$$

DELIMITER ;

Call pr_InsertUser(7,'Hello','123','hello@gmail.com',2);
select * from users;


-- 2 Hiển thị tất cả các user có thực hiện thi và có kết quả. 

USE `webtoeic`;
DROP procedure IF EXISTS `pr_AllExam`;

DELIMITER $$
USE `webtoeic`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pr_AllExam`()
BEGIN

	select users.userid,users.username,users.email,result.point
	from users,result
	where users.userid=result.userid;
    
END$$

DELIMITER ;

Call pr_AllExam();



-- 3 Xóa một câu hỏi khi truyền vào id của câu hỏi đó


USE `webtoeic`;
DROP procedure IF EXISTS `pr_DeleteReading`;

DELIMITER $$
USE `webtoeic`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pr_DeleteReading`(in id int)
BEGIN
	if(id!=null) then 
		Delete from reading
		where readid=id;
    end if;
END$$

DELIMITER ;


Call pr_DeleteReading(10);



-- 4 Thêm một tài khoản từ người dùng 

USE `webtoeic`;
DROP procedure IF EXISTS `pr_InsertAccount`;

DELIMITER $$
USE `webtoeic`$$
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
END$$

DELIMITER ;

Call pr_InsertAccount(8,'Hello','123','hello@gmail.com');
select * from users;



-- 5 Xóa một tài khoản user 

USE `webtoeic`;
DROP procedure IF EXISTS `pr_DeleteUser`;

DELIMITER $$
USE `webtoeic`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pr_DeleteUser`(in id int)
BEGIN

	if(id!='') then
		Delete from  users
		where userid=id;
	end if;

END$$

DELIMITER ;

Call pr_DeleteUser(15);


-- 6 Hiển thị danh sách những thí sinh không thi

USE `webtoeic`;
DROP procedure IF EXISTS `pr_DontExam`;

DELIMITER $$
USE `webtoeic`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pr_DontExam`()
BEGIN

	select distinct Users.userid,Users.username,users.email
	from Users , result
	where not exists (select * from Result
				where Users.userid= Result.userid );

END$$

DELIMITER ;

Call pr_DontExam();


-- 7 Đếm số dòng của Reading

USE `webtoeic`;
DROP procedure IF EXISTS `pr_CountReading`;

DELIMITER $$
USE `webtoeic`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pr_CountReading`()
BEGIN
	select count(*) from Reading;
END$$

DELIMITER ;

Call pr_CountReading();


-- 8 Đếm số lượng câu hỏi reading và listening Test Sheet

USE `webtoeic`;
DROP procedure IF EXISTS `pr_TestSheet`;

DELIMITER $$
USE `webtoeic`$$
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
    
END$$

DELIMITER ;

Call pr_TestSheet();


-- 9 Thêm câu hỏi vào bảng Reading hoặc listening

USE `webtoeic`;
DROP procedure IF EXISTS `pr_InsertQuestion`;

DELIMITER $$
USE `webtoeic`$$
CREATE PROCEDURE `pr_InsertQuestion` (
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
    
END$$

DELIMITER ;


Call pr_InsertQuestion('reading',100,'1+1=','(A) 2','(B) 3','(C) 10','(D) 1','A');
select * from reading;
select * from listening;


-- 10 Cập nhật bảng user 

USE `webtoeic`;
DROP procedure IF EXISTS `pr_UpdateUser`;

DELIMITER $$
USE `webtoeic`$$
CREATE PROCEDURE `pr_UpdateUser` (
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
		update users 
		set username=uname, pass=password, email=emails, roleid=rolid 
		where userid = id;
	end if;
END$$

DELIMITER ;

Call pr_UpdateUser('nqhuy','1234','huy@gmail.com',1,15);
select * from users;


-- 11 Update Question

USE `webtoeic`;
DROP procedure IF EXISTS `pr_UpdateQuestion`;

DELIMITER $$
USE `webtoeic`$$
CREATE PROCEDURE `pr_UpdateQuestion` (
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

END$$

DELIMITER ;

Call pr_UpdateQuestion('listening',11,'1+1=','(A) 2','(B) 3','(C) 10','(D) 1','A',10);
select * from reading;
select * from listening;



-- 12 Bảng thông tin của user có điểm cao nhất---------------
drop procedure if exists pr_Champion;		
DELIMITER $$
create procedure pr_Champion()
begin 

select distinct result.userid, avg(point) as Average_Point
			from result
			group by result.userid
            having avg(point) >= all (select avg(point) from result group by userid);
			
			
end $$

-- Gọi hàm 
call pr_champion();



-- 13 Bảng xếp hạng users, phân loại điểm-------------------------------------------
drop procedure if exists pr_Rank;
DELIMITER $$
create procedure pr_Rank()
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
end $$
-- Gọi hàm
call pr_Rank();

select*from Result



-- 14 Bảng kết quả số lần thi của user---------------------------------------------
drop procedure if exists pr_Countid;
DELIMITER $$
create procedure pr_Countid()
begin
select result.userid,count(result.resultid) as Number_of_tests
			from Users,Result
			where Users.userid = Result.userid
			group by Result.userid;
end $$
insert into result values('7','50','50','100','1','2');
-- Gọi hàm
call pr_Countid();
select *from result;


-- FUNCTION -------------


-- 1 Số bài test của 1 user ------------------------------------------------------
DELIMITER $$
create function func_NumberOfTest(id int)
returns int 
begin 
	declare re int;
	select count(resultid) into re
    from result 
    where userid = id
    group by result.userid;
    return re;
        
end $$
-- nhập userid
select func_NumberOfTest(2);




-- 1 Tạo bảng view reding_view
USE `webtoeic`;
CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `reading_view` AS
    SELECT 
        `reading`.`readnumber` AS `readnumber`,
        `reading`.`readcontent` AS `readcontent`,
        `reading`.`option1` AS `option1`,
        `reading`.`option2` AS `option2`,
        `reading`.`option3` AS `option3`,
        `reading`.`option4` AS `option4`,
        `reading`.`correctanswer` AS `correctanswer`,
        `reading`.`readtestid` AS `readtestid`
    FROM
        `reading`
    ORDER BY `reading`.`readnumber`;

select * from reading_view;


-- 2 Tạo bảng view result_view
USE `webtoeic`;
CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `result_view` AS
    SELECT 
        `result`.`resultid` AS `resultid`,
        `result`.`numcorrectanswerread` AS `numcorrectanswerread`,
        `result`.`numcorrectanswerlisten` AS `numcorrectanswerlisten`,
        `result`.`point` AS `point`,
        `result`.`testid` AS `testid`,
        `result`.`userid` AS `userid`
    FROM
        `result`;
        
select * from result_view;
        

-- 3  Tạo bảng slide banner view 
USE `webtoeic`;
CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `slidebanner_view` AS
    SELECT 
        `slidebanner`.`slidebannername` AS `slidebannername`,
        `slidebanner`.`slidebannercontent` AS `slidebannercontent`,
        `slidebanner`.`slidebannerimage` AS `slidebannerimage`
    FROM
        `slidebanner`;
       
select * from slidebanner_view;
       
       
--  4 Tạo bảng view user_view
USE `webtoeic`;
CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `users_view` AS
    SELECT 
        `users`.`userid` AS `userid`,
        `users`.`username` AS `username`,
        `users`.`pass` AS `pass`,
        `users`.`email` AS `email`,
        `users`.`roleid` AS `roleid`
    FROM
        `users`;
	
select * from users_view;
        

-- 5  Tạo bảng view Vocabulary_view
USE `webtoeic`;
CREATE 
     OR REPLACE ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `vocabulary_view` AS
    SELECT 
    
        `slidebanner`.`slidebannername` AS `slidebannername`,
        `slidebanner`.`slidebannercontent` AS `slidebannercontent`,
        `slidebanner`.`slidebannerimage` AS `slidebannerimage`
    FROM
        `slidebanner`;

select * from vocabulary_view;



-- TRIGGER----------------------------------

-- 1 Xóa tài khoản thì kết quả bên bảng result của user đó sẽ xóa theo
drop trigger if exists tg_Deleteuser ;
DELIMITER $$
create trigger tg_Deleteuser 
before delete on users for each row
begin	
	delete from result where result.userid= OLD.userid;

end	$$
-- Gọi hàm
delete from users where userid='6';
-- Xem kết quả
select*from users;
select *from result;



 -- 2 Xóa listenaudio thì câu hỏi nào trong bảng listening có liên quan đến audio đó
 -- sẽ xóa theo
 drop trigger if exists tg_Deletelistenaudio;
 DELIMITER $$
 create trigger tg_Deletelistenaudio before delete on listenaudio 
 for each row
 begin
	delete from listening where listening.listenaudioid=OLD.listenaudioid;	
		
 end $$
 
delete from listenaudio where listenaudioid=10;
select * from listenaudio;
select * from listening;


 -- 3 Xóa readtest  thì những câu hỏi reading nào liên quan đến readtest 
 -- thì sẽ xóa theo
 drop trigger if exists tg_Deletereadtest;
 DELIMITER $$
 create trigger tg_Deletereadtest before delete on reading 
 for each row
 begin
	delete from reading where reading.readtestid=OLD.readtestid;
 end $$
 

delete from readtest where readtestid=4;
select*from reading;
select*from readtest;


 -- 5 Xóa bảng một bài test thì những câu hỏi nào liên quan đến bài test thì
 -- sẽ xóa theo

drop trigger if exists tg_Deletetest;
DELIMITER $$
create trigger tg_Deletetest after delete on test
for each row 
begin
	
		delete from listening where listening.testid=OLD.testid;
		delete from reading where reading.testid=OLD.testid;
        delete from result where result.testid=OLD.testid;

   
end $$

-- Gọi hàm
delete from test where test.testid='5';
-- Kiểm tra kết quả
select *from test;
select *from reading;








-- Phân quyền

DROP USER IF EXISTS 'admin'@'%'; -- xóa user
CREATE USER 'admin'@'%' IDENTIFIED BY '1234';

-- REVOKE [type of permission] ON [database name].[table name] FROM '[username]'@'localhost'; -- thu hồi quyền
GRANT SELECT,INSERT,UPDATE,DELETE,GRANT OPTION ON webtoeic.reading TO 'admin'@'%';
GRANT SELECT,INSERT,UPDATE,DELETE,GRANT OPTION ON webtoeic.users TO 'admin'@'%';
GRANT SELECT,INSERT,UPDATE,DELETE,GRANT OPTION ON webtoeic.result TO 'admin'@'%';
GRANT SELECT,INSERT,UPDATE,DELETE,GRANT OPTION ON webtoeic.test TO 'admin'@'%';
GRANT SELECT,GRANT OPTION ON webtoeic.reading_view TO 'admin'@'%';
GRANT SELECT,GRANT OPTION ON webtoeic.users_view TO 'admin'@'%';
GRANT SELECT,GRANT OPTION ON webtoeic.result_view TO 'admin'@'%';
GRANT SELECT,GRANT OPTION ON webtoeic.vocabulary_view TO 'admin'@'%';
GRANT SELECT,GRANT OPTION ON webtoeic.slidebanner_view TO 'admin'@'%';

GRANT CREATE ROUTINE ON webtoeic.* TO 'admin'@'%';
GRANT ALL ON procedure webtoeic.pr_AllExam TO 'admin'@'%';
GRANT EXECUTE ON procedure webtoeic.pr_CountReading TO 'admin'@'%';
GRANT EXECUTE ON procedure webtoeic.pr_DeleteReading TO 'admin'@'%';
GRANT EXECUTE ON procedure webtoeic.pr_DeleteUser TO 'admin'@'%';
GRANT EXECUTE ON procedure webtoeic.pr_DontExam TO 'admin'@'%';
GRANT EXECUTE ON procedure webtoeic.pr_InsertAccount TO 'admin'@'%';
GRANT EXECUTE ON procedure webtoeic.pr_InsertQuestion TO 'admin'@'%';

GRANT EXECUTE ON procedure webtoeic.pr_InsertUser TO 'admin'@'%';
GRANT EXECUTE ON procedure webtoeic.pr_TestSheet TO 'admin'@'%';
GRANT ALL ON procedure webtoeic.pr_UpdateQuestion TO 'admin'@'%';

GRANT ALL ON procedure webtoeic.pr_UpdateUser TO 'admin'@'%';


Show grants for 'admin'@'%';










-- insert users new wrong


USE `webtoeic`;
DROP procedure IF EXISTS `pr_InsertUser`;

DELIMITER $$
USE `webtoeic`$$
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
    
     IF (roleid=1) THEN
		CREATE USER '_Username'@'%' IDENTIFIED BY '_Password';

		GRANT SELECT,INSERT,UPDATE,DELETE,GRANT OPTION ON webtoeic.listenaudio TO '_Username'@'%';
		GRANT SELECT,INSERT,UPDATE,DELETE,GRANT OPTION ON webtoeic.listening TO '_Username'@'%';
		GRANT SELECT,INSERT,UPDATE,DELETE,GRANT OPTION ON webtoeic.reading TO '_Username'@'%';
		GRANT SELECT,INSERT,UPDATE,DELETE,GRANT OPTION ON webtoeic.readtest TO '_Username'@'%';
        GRANT SELECT,INSERT,UPDATE,DELETE,GRANT OPTION ON webtoeic.result TO '_Username'@'%';
		GRANT SELECT,INSERT,UPDATE,DELETE,GRANT OPTION ON webtoeic.reoles TO '_Username'@'%';
		GRANT SELECT,INSERT,UPDATE,DELETE,GRANT OPTION ON webtoeic.slidebanner TO '_Username'@'%';
		GRANT SELECT,INSERT,UPDATE,DELETE,GRANT OPTION ON webtoeic.test TO '_Username'@'%';
        GRANT SELECT,INSERT,UPDATE,DELETE,GRANT OPTION ON webtoeic.users TO '_Username'@'%';
		GRANT SELECT,INSERT,UPDATE,DELETE,GRANT OPTION ON webtoeic.vocabulary TO '_Username'@'%';
        FLUSH PRIVILEGES;
	ELSEIF (roleid=2) THEN
		CREATE USER '_Username'@'%' IDENTIFIED BY '_Password';

		GRANT INSERT ON webtoeic.users TO '_Username'@'%';
		GRANT SELECT ON webtoeic.test TO '_Username'@'%'; -- 
		GRANT SELECT ON webtoeic.vocabulary TO '_Username'@'%'; --
		Show grants for '_Username'@'%';
        
        FLUSH PRIVILEGES;
    end if;
	if(user = 1) then
		insert into users(userid, username, pass, email, roleid)
		value(id,name,password,mail,roleid);
	end if;

END$$

DELIMITER ;





