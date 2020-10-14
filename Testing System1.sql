drop database if exists testing_system;
create database testing_system;
use testing_system;
-- bảng 1
CREATE TABLE department (
    DepartmentID SMALLINT UNSIGNED PRIMARY KEY,
    DepartmentName VARCHAR(50) UNIQUE
);
-- bảng 2
CREATE TABLE Position (
    PositionID SMALLINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    PositionName ENUM('Dev', 'Test', 'Scrum', 'Master', 'PM')
);
-- bảng 3

CREATE TABLE `Account` (
    AccountID SMALLINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    Email VARCHAR(50) UNIQUE KEY NOT NULL,
    Username VARCHAR(20) UNIQUE KEY,
    FullName VARCHAR(20) NOT NULL,
    DepartmentID SMALLINT UNSIGNED,
    PositionID SMALLINT UNSIGNED,
    CreateDate DATETIME,
	FOREIGN KEY (Departmentid) REFERENCES Department (Departmentid) ON DELETE CASCADE,
    FOREIGN KEY (Positionid) REFERENCES Position (Positionid) ON DELETE CASCADE
);
-- bảng 4

CREATE TABLE `Group` (
    GroupID SMALLINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    GroupName VARCHAR(50) NOT NULL UNIQUE KEY,
    CreatorID SMALLINT UNSIGNED NOT NULL,
    CreateDate DATETIME
 
);
-- bảng 5

CREATE TABLE GroupAccount (
    GroupID SMALLINT UNSIGNED,
    AccountID SMALLINT UNSIGNED,
    JoinDate DATE,
    PRIMARY KEY (GroupID , AccountID),
    FOREIGN KEY (GroupID)
        REFERENCES `Group` (GroupID) ON DELETE CASCADE,
    FOREIGN KEY (AccountID)
        REFERENCES `Account` (AccountID) ON DELETE CASCADE
);
-- bảng 6
CREATE TABLE TypeQuestion (
    TypeID SMALLINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    TypeName ENUM('Essay', ' Multiple-Choice')
);
 -- bảng 7
CREATE TABLE CategoryQuestion (
    CategoryID SMALLINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    CategoryName VARCHAR(20)
);

-- bảng 8
CREATE TABLE Question (
    QuestionID SMALLINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    Content VARCHAR(1000),
    CategoryID SMALLINT UNSIGNED,
    TypeID SMALLINT UNSIGNED,
    CreatorID SMALLINT UNSIGNED,
    CreateDate DATE,
    FOREIGN KEY (CategoryID) 	REFERENCES CategoryQuestion (CategoryID) ON DELETE CASCADE,
    FOREIGN KEY (TypeID) 	REFERENCES TypeQuestion (TypeID) ON DELETE CASCADE
);

-- bảng 9
CREATE TABLE Answer (
    AnswerID SMALLINT UNSIGNED AUTO_INCREMENT,
    Content VARCHAR(1000),
    QuestionID SMALLINT UNSIGNED,
    isCorrect VARCHAR(10),
    PRIMARY KEY (AnswerID , QuestionID),
    FOREIGN KEY (QuestionID)
        REFERENCES Question (QuestionID) ON DELETE CASCADE
);

-- bảng 10
CREATE TABLE Exam (
    ExamID SMALLINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    `Code` SMALLINT UNSIGNED,
    Title VARCHAR(50),
    CategoryID SMALLINT UNSIGNED,
    Duration INT CHECK (Duration BETWEEN 50 AND 100),
    CreatorID SMALLINT UNSIGNED,
    CreateDate DATETIME,
     FOREIGN KEY(CategoryID) 	REFERENCES CategoryQuestion (CategoryID) ON DELETE CASCADE
);

-- bảng 11
CREATE TABLE ExamQuestion (
    ExamID SMALLINT UNSIGNED,
    QuestionID SMALLINT UNSIGNED,
    PRIMARY KEY (ExamID , QuestionID),
    FOREIGN KEY (ExamID)
        REFERENCES Exam (ExamID) ON DELETE CASCADE,
    FOREIGN KEY (QuestionID)
        REFERENCES Question (QuestionID) ON DELETE CASCADE 
);
insert into department (DepartmentID,DepartmentName)
value	 (1, 	N'MARKETING'		),
		 (2, 	N'SALE'				),
		 (3,	N'NHÂN SỰ'			),
         (4, 	N'KỸ THUẬT' 		),
         (5,	N'GIÁM ĐỐC'			);

INSERT INTO Position (PositionID ,PositionName)
VALUE 	 (1,	'DEV'	   			),
		 (2, 	'Test'				),
         (3, 	'Scrum'				),
         (4,	'Master'			),
         (5,	'PM'				);
         
         
insert into `Account` (AccountID,Email,Username,FullName,DepartmentID,PositionID,CreateDate)
value	 ( 1,	N'duy12@yahoo.com'	,	'duy12'		, 	'nguen van duy'		 	,1 , 1 , '2019-01-03' ),
		 ( 2,   N'manh01@yahoo.com'	,	'manh01'	,	'TRẦN MẠNH DŨNG'		,2 , 2 , '2019-05-02 ' ),
         ( 3, 	N'tuan03@yahoo.com'	,	'tuan03'	,	'NGUYỄN ANH TUẤN'		,3 , 3 , '2020-01-07'  ),
         ( 4, 	N'thanh04@yahoo.com' ,	'thanh04'	,	'Nguyễn TRUNG THÀNH'	,4 , 4 , '2020-01-04 ' ),
         ( 5, 	N'quan05@yahoo.com'	,	'quan05'	,	'NGUYỄN THẾ QUÂN'	 	, 5 , 5 , '2019-04-05'  );
         
insert into `Group` (GroupID ,GroupName,CreatorID ,CreateDate)
value				(1 	,	N'nhóm 1'	, 1 , '2019-01-03' ),
					(2 	,	N'nhóm 2'	, 2 , '2019-05-02 '),
					(3	, 	N'nhóm 3'	, 3 , '2020-01-07' ),
					(4	,  	N'nhóm 4'	, 4 , '2020-01-04 '),
					(5 	, 	N'nhóm 5'	, 5 , '2019-04-05');
			
insert into GroupAccount (GroupID,AccountID,JoinDate)
value					(	1     	, 2     , '2019-01-03' ),
						(	2		, 1		, '2019-05-02 '),
                        (	3		, 5		, '2020-01-07' ),
                        (	4		, 3 	, '2020-01-04 '),
                        (	5		, 4		,  '2019-04-05');
                        
insert into TypeQuestion (TypeID ,TypeName)
value					(1 	, 'Essay'),
						(2	, 'Essay'),
						(3	, 'Essay'),
                        (4	, 'Essay'),
                        (5	, 'Essay');
                        
insert into CategoryQuestion (CategoryID	,CategoryName)
value						( 1			,'Java'),
							( 2			,'.NET'),
                            ( 3			,'Posman'),
                            ( 4			,'SQL'),
                            ( 5			,'Ruby');
                            
insert into Question (QuestionID  	 ,Content			 ,CategoryID,		TypeID,		CreatorID,		CreateDate )
value					( 1		, N'Java là gì' 	, 1	, 1	,	1 	, '2019-01-03' ),
						( 2		, N'.NET là gì' 	, 2 , 2 , 	2	, '2019-05-02 '),
                        ( 3		, N'Posman là gì'	, 3 , 3	,	3	, '2020-01-07' ),
                        ( 4		, N'SQL là gì'		, 4	, 4 ,	4 	, '2020-01-04 '),
                        ( 5		, N'Ruby là gì'		, 5 , 5 ,	5 	, '2019-04-05');
                        INSERT into Answer (AnswerID,Content,QuestionID,isCorrect)  
VALUE				(1, 	N'Java là' 	, 1	       	,N'đúng'),
					(2,		N'.NET là' 	, 2			,N'sai'),
                    (3,		N'Posman là', 3			,N'đúng'),
                    (4,		N'SQL là'	, 4 		,N'đúng'),
                    (5,		N'Ruby là'  , 5			,N'sai'	);

INSERT into Exam (ExamID ,`Code` ,Title	,CategoryID,Duration,CreatorID,CreateDate)
VALUE			(1		, 2  	,'KT JAVA' 		, 1		, 50 , 1		, '2019-01-03' ),
				(2		, 3  	,'KT .NET' 		, 2		, 60 , 2		, '2019-05-02 '),
				(3		, 5  	,'KT Posman' 	, 3		, 70 , 3		, '2020-01-07' ),
                (4		, 4  	,'KT SQL'  		, 4		, 80 , 4		, '2020-01-04 '),
                (5		, 1  	,'KT Ruby' 		, 5		, 90 , 5		, '2019-04-05');
                
INSERT INTO ExamQuestion (ExamID ,QuestionID)
VALUE					(1	,2),
						(2	,1),
                        (3	,5),
                        (4	,3),
                        (5	,4);



