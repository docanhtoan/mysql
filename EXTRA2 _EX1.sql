-- EX1 
-- QS 2

SELECT GROUP_CONCAT(full_name), month(birth_date)
FROM trainee 
GROUP BY month(birth_date);

-- QS 3
SELECT *
FROM Trainee
WHERE LENGTH(Full_Name) = (SELECT MAX(LENGTH(Full_Name)) FROM Trainee);

-- QS 4
SELECT *
FROM Trainee
WHERE ET_IQ + ET_Gmath>=20 AND ET_Gmath>=8 AND  ET_English>=18;

-- QS 5

DELETE FROM Trainee WHERE TraineeID = 1; 

-- QS 6
UPDATE Trainee 
SET Training_Class = 'VTI002' 
WHERE TraineeID = 5;