-- EX  1

drop DATABASE IF EXISTS quan_ly;
create database quan_ly;
use	quan_ly;
create table trainee 
(
TraineeID  			int auto_increment primary key,
Full_name  			varchar(50),
Birth_Date 			date,
Gender				enum('male', 'famale','unknown') not null,
ET_IQ 				int,check (ET_IQ <=20 ),
ET_Gmath 			int,check (ET_Gmath  <=20 ),
ET_English			int,check (ET_English  <=50 ),
Training_Class		varchar(50) not null,
Evaluation_Notes	nvarchar(1000)
);
alter table trainee add column vti_account smallint unique not null;


INSERT into trainee (TraineeID 		,Full_name 				,    Birth_Date 	,Gender	,ET_IQ 	, ET_Gmath 	,ET_English	,Training_Class	,	 Evaluation_Notes , vti_account)
VALUES				( 	123	  	 	, N'Trần tuấn minh'		,	'2001-09-23' 	, 'male'	,15		, 	18		,	20		,	'TH24'		,	N'bình thường', 01457	),
					(	149			, N'đinh mạnh dũng' 	,	'1999-01-16'	, 'male'	,18		,	19		,	30		,	'TH22'		,	N'giỏi'		  ,	02253	),
                    (	255			, N'trinh xuân trinh'	,	'2002-06-09'	, 'male'	,7		,   10		,	10		,	'TH09'		,	N'yếu'		  ,	03648	),
                    (  	366			, N'nguyen phuong linh'	,	'2000-11-04'	, 'famale'	,10		, 	10		,	10		,	'TH01'		, 	N'KHÁ'		  ,	01495	);	

-- EX 2
drop database if exists `data_types`;
create database data_types;
use data_types;
create table `data`
(
ID 				mediumint auto_increment primary key,
`name` 			varchar(50) not null,
`Code` 			char(5) unique not null,
ModifiedDate 	timestamp
);

-- EX3

drop database if exists`data_types2`;
create database data_types2;
use data_types;
create table `data1`
(
ID mediumint auto_increment primary key,
`name` varchar(50) not null,
BirthDate date not null,
Gender enum('0','1'), -- (0 la male, 1 la female, null la unknown),
IsDeletedFlag bit not null -- (0 la dang hoat dong,1 la da xoa--)
);