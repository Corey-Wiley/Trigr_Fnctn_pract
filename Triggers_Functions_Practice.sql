use synthea

-- TRIGGER
delimiter $$
CREATE TRIGGER coreyw_covidvaccine AFTER INSERT ON synthea.immunizations
FOR EACH ROW
BEGIN
IF NEW.code = 140 THEN
SIGNAL SQLSTATE '45000'
SET MESSAGE_TEXT = 'ERROR: RECOMMEND COVID VACCINE!';
END IF;
END; $$
delimiter ;

-- (I used the query "show triggers;" to check if the trigger was saved)

-- Function
DELIMITER $$
Create Function Charity_Care(Care Decimal(10,2))
Returns VarChar(20)
Begin
Declare CharityCareEligible VarChar(20);
If Healthcare_Expenses >= 50000 Then
Set CharityCareEligible = 'Yes';
ElseIf Healthcare_Expenses < 50000 Then
Set CharityCareEligible = 'no';
End If;
Return (CharityCareEligible);
End
$$
DELIMITER;

-- (I used the query "show function status;" to check if the function was 
-- saved/however I kept getting weird error messages)

-- To find
Select 
Id,
HEALTHCARE_EXPENSES,
CharityCare(HEALTHCARE_EXPENSES)
From
patients;

-- (I used the query above to activate the function/however I kept
-- getting error messages)


