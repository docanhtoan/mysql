-- QS1
SELECT * FROM Department

-- QS2 
SELECT DepartmentID FROM Department WHERE DepartmentName = 'Sale'

-- QS3
SELECT * FROM Account 
WHERE LENGTH(Fullname) = (SELECT MAX(LENGTH(Fullname)) FROM `Account`)

-- QS 4
SELECT * FROM`Account`
WHERE LENGTH(Fullname) = (SELECT MAX(LENGTH(Fullname)) FROM `Account`);

-- QS 5
SELECT GroupName FROM `Group`
WHERE CreateDate < '2019-12-20';

-- QS 6
SELECT * FROM `Group`
ORDER BY CreateDate DESC LIMIT 5;

-- QS 8
DELETE FROM Exam WHERE CreateDate < '2019-12-20';
ROLLBACK;
-- QS 9
UPDATE `Account` SET Fullname = N'Nguyễn Bá Lộc', Email = 'loc.nguyenba@vti.com.vn'
WHERE AccountID = 5;

-- QS 10
SELECT * 
FROM `Account`
WHERE ACCOUNTID AND DepartmentID ;

-- QS 11
SELECT a.Fullname, p.PositionName 
FROM Testing_system.`Account` a
INNER JOIN Testing_system.Position p ON p.PositionID = a.PositionID
WHERE p.PositionName = 'DEV';
