DROP DATABASE IF EXISTS something;
CREATE DATABASE something;
use something;
create table Department(
     Department_Number      	INT AUTO_INCREMENT PRIMARY KEY  ,
     Department_Name        	VARCHAR(50) NOT NULL
);

create table Employee_table(
     Employee_Number        	INT PRIMARY KEY AUTO_INCREMENT ,
     Employee_Name          	VARCHAR(50),
     Department_Number       	INT NOT NULL,
     foreign key (Department_Number) references department(Department_Number) on delete cascade
);

create table Employee_Skill_Table(
     Employee_Number        INT AUTO_INCREMENT,
     Skill_code             VARCHAR(30) NOT NULL,
     Date_registered        DATE,
     foreign key(Employee_Number) references Employee_table(Employee_number) on delete cascade);
     
     INSERT INTO Department	(Department_Name) 
VALUE 					(N'Marketing'	),
						(N'Sale'		),
						(N'Bảo vệ'		),
						(N'Nhân sự'		),
						(N'Kỹ thuật'	),
						(N'Tài chính'	),
						(N'Phó giám đốc'),
						(N'Giám đốc'	),
						(N'Thư kí'		),
						(N'Bán hàng'	);


INSERT INTO Employee_Table 	(Employee_Name		, Department_Number	)
VALUE						(N'Nguyễn Hải Đăng'	,		1			),
							(N'Dương Văn Quá'	,		1			),
                            (N'Tiểu Long Nữ'	,		2			),
                            (N'Chu Chỉ Nhược'	,		5			),
                            (N'Trương Vô Kị'	,		6			),
                            (N'Hoàng Dược Sư'	,		5			),
                            (N'Lý Mạc Sầu'		,		5			),
                            (N'Quách Tĩnh'		,		1			),
                            (N'Hoàng Dung'		,		9			),
                            (N'Chu Bá Thông'	,		10			);


INSERT INTO Employee_Skill_Table 	(Employee_Number, Skill_Code	, Date_Registered	)
VALUE								( 	1,				'Java'		, '2020-03-15'		),
									( 	2,				'Android'	, '2020-03-16'		),
									( 	3,				'C#'		, '2020-03-17'		),
									( 	1,				'SQL'		, '2020-03-20'		),
									( 	1,				'Postman'	, '2020-03-21'		),
									( 	4,				'Ruby'		, '2020-04-22'		),
									( 	5,				'Java'		, '2020-04-24'		),
									( 	6,				'C++'		, '2020-04-27'		),
									( 	7,				'C Sharp'	, '2020-04-04'		),
									( 	10,				'PHP'		, '2020-04-10'		);
                                    
 -- QS 3                                   
SELECT 	ET.Employee_Number, ET.Employee_Name, ET.Department_Number, EST.Skill_Code 
FROM	Employee_Table ET RIGHT JOIN Employee_Skill_Table EST
ON		ET.Employee_Number = EST.Employee_Number
WHERE	EST.Skill_Code = 'Java';
-- QS 4
SELECT		D.Department_Number, D.Department_Name, COUNT(ET.Department_Number)
FROM		Department D INNER JOIN Employee_Table ET
ON			D.Department_Number = ET.Department_Number
GROUP BY 	ET.Department_Number
HAVING		COUNT(ET.Department_Number)>=3
ORDER BY	D.Department_Number ASC;
	
-- QS 5
SELECT		ET.*
FROM		Department D INNER JOIN Employee_Table ET
ON			D.Department_Number = ET.Department_Number
ORDER BY	D.Department_Number ASC;
 
 -- QS 6
 
