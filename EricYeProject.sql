Create database Bank
use Bank

--Table 1: UserSecurityQuestions
Create Table UserSecurityQuestions
	(
	UserSecurityQuestionID tinyint Not Null Primary Key,
	UserSecurityQuestion varchar(50)
	)

Insert into UserSecurityQuestions Values (1,'Where did you grow up?'),
                                         (2,'What is your mothers maiden name?'),
                                         (3,'What is your favorite food?'),
									     (4,'What is your nickname?'),
									     (5,'What is your favorite hobby?')

Select * from UserSecurityQuestions


--Table 2: SavingsInterestRates
Create Table SavingsInterestRates
	(
	InterestSavingsRateID tinyint Not Null Primary Key,
	InterestRateValue numeric(9,9), 
	InterestRateDescription varchar(20)
	)

Insert into SavingsInterestRates Values (1, 0.08, 'Annual Rate'),
                                        (2, 0.03, 'Semiannual Rate'),
                                        (3, 0.06, 'Annual Rate'),
									    (4, 0.0125, 'Quarterly Rate'),
									    (5, 0.04, 'Semiannual Rate')

Select * from SavingsInterestRates



--Table 3: FailedTransactionErrorType
Create Table FailedTransactionErrorType
	(
	FailedTransactionErrorTypeID tinyint Not Null Primary Key,
	FailedTransactionDescription varchar(50)
	)

Insert into FailedTransactionErrorType Values (1,'Incorrect Input'),
											  (2,'No Internet Connection'),
                                              (3,'Unknown Card Type'),
											  (4,'Expired Card'),
											  (5,'Stolen Card')

Select * from FailedTransactionErrorType



--Table 4: LoginErrorLog
Create Table LoginErrorLog
	(
	ErrorLogID int Not Null Primary Key,
	ErrorTime datetime, 
	FailedTransactionXML XML
	)

Insert into LoginErrorLog Values (1, '20200214 17:25:24', 'errxml.754'),
                                 (2, '20200321 20:34:58', 'errxml.271'),
                                 (3, '20200624 05:39:32', 'errxml.93'),
								 (4, '20201019 11:07:37', 'errxml.404'),
								 (5, '20200303 08:47:59', 'errxml.24')

Select * from LoginErrorLog


--Table 5: AccountStatusType
Create Table AccountStatusType
	(
	AccountStatusTypeID tinyint Not Null Primary Key,
	AccountStatusDescription varchar(30)
	)

Insert into AccountStatusType Values (1,'Active'),
									 (2,'Active'),
									 (3,'Pending Activation'),
                                     (4,'Inactive'),
									 (5,'Inactive')

Select * from AccountStatusType


--Table 6: AccountType
Create Table AccountType
	(
	AccountTypeID tinyint Not Null Primary Key,
	AccountTypeDescription varchar(30)
	)

Insert into AccountType Values (1,'Saving'),
							   (2,'Chequing'),
							   (3,'Chequing'),
                               (4,'Saving'),
						       (5,'Chequing')

Select * from AccountType

--Table 7:TransactionType
Create Table TransactionType
	(
	TransactionTypeID tinyint Not Null Primary Key,
	TransactionTypeName char(10), 
	TransactionTypeDescription varchar(50), 
	TransactionFeeAmount smallmoney
	)

Insert into TransactionType values (1,'Deposit','Deposit money', 0.00),
								   (2,'Withdraw','Withdraw money', 0.02),
                                   (3,'E-transfer','Send/Recieve money', 0.01),
								   (4,'ATM','Withdraw money', 3.00),
								   (5,'Advance','Withdraw money', 5.00)


Select * from TransactionType


--Table 8: Employee
Create Table Employee
	(
	EmployeeID int Not Null Primary Key,
	EmployeeFirstName nvarchar(25), 
	EmployeeMiddleInitial char(1), 
	EmployeeLastName varchar(25), 
	EmployeeIsManager bit
	)

Insert into Employee values (101,'Harry','J','Potter','0'),
							(102,'John','A','Smith','1'),
							(103,'Ricky','N','Morty','0'),
							(104,'Paul','P','George','0'),
							(105,'Chris','W','James','1')

Select * from Employee



--Table 9: UserLogins
Create Table UserLogins
	(
	UserLoginID smallint Not Null Primary Key,
	UserLogin char(15), 
	UserPassword varchar(20)
	)

Insert into UserLogins values (1001,'Michael23','Bulls7210'),
							  (1002,'James','LeGM623'),
                              (1003,'Charles','cHARLE$21'),
							  (1004,'Christina','chrisTIN@'),
							  (1005,'Vivian','vivikiki321')

Select * from UserLogins


--Table 10: FailedTransactionLog
Create Table FailedTransactionLog
	(
	FailedTransactionID int Not Null Primary Key,
	FailedTransactionErrorTypeID tinyint Foreign Key references FailedTransactionErrorType (FailedTransactionErrorTypeID),
	FailedTransactionErrorTime datetime,
	FailedTransactionXML XML
	)

Insert Into FailedTransactionLog Values (001, 2, '08:24:31','fTR.xm32'),
										(002, 4, '13:24:49','fTR.xm82'),
                                        (003, 5, '23:06:23','fTR.xml76'),
										(004, 3, '07:00:12','fTR.xml41'),
										(005, 1, '01:45:25','fTR.xml23')


Select * from FailedTransactionLog


--Table 11: Account
Create Table Account
	(
	AccountID int Not Null Primary Key,
	CurrentBalance int,
	AccountTypeID tinyint Foreign Key references AccountType (AccountTypeID),
	AccountStatusTypeID tinyint Foreign Key references AccountStatusType (AccountStatusTypeID),
	InterestSavingsRateID tinyint Foreign Key references SavingsInterestRates (InterestSavingsRateID),
	)

Insert into Account Values (1, 4400, 1, 1, 2),
						   (2, 275000, 3, 4, 1),
						   (3, 3200, 4, 2, 5),
						   (4, 26000, 1, 3, 2),
						   (5, 55000, 2, 1, 4)


Select * from Account


--Table 12: OverdraftLog
Create Table OverdraftLog
	(
	AccountID int Not Null Primary Key Foreign Key references Account (AccountID),
	OverDraftDate datetime, 
	OverDraftAmount money,
	OverDraftTransactionXML XML
	)

Insert Into OverDraftLog values (1,'20210113', 10.00,'over.xml10'),
                                (2,'20180214', 5.00,'over.xml5'),
								(4,'20200420', 7.50,'over.xml7'),
								(3,'20190623', 20.00,'over.xml20'),
								(5,'20201225', 5.00,'over.xml5')

Select * from OverdraftLog


--Table 13: UserSecurityAnswers
Create Table UserSecurityAnswers
	(
	UserLoginID smallint Not Null Primary Key Foreign Key references UserLogins (UserLoginID),
	UserSecurityAnswer varchar(25), 
	UserSecurityQuestionID tinyint Foreign key references UserSecurityQuestions (UserSecurityQuestionID)
	)

Insert into UserSecurityAnswers values (1001,'Basketball',5),
									   (1002,'Bronny',4),
									   (1003,'Korean',3),
                                       (1004,'Barkley',2),
									   (1005,'Toronto',1) 

Select * from UserSecurityAnswers


--Table 14: Login_Account
Create Table Login_Account
	(
	UserLoginID smallint Foreign Key references UserLogins (UserLoginID),
	AccountID int Foreign Key references Account (AccountID)
	)

Insert into Login_Account values (1001, 1),
								 (1002, 2),
								 (1003, 3),
                                 (1004, 4),
								 (1005, 5) 

Select * from Login_Account


--Table 15: Customer
Create Table Customer
	(
	CustomerID int Not Null Primary Key,
	AccountID int Foreign Key references Account (AccountID),
	CustomerAddress1 varchar(30),
	CustomerAddress2 varchar(30),
	CustomerFirstName varchar(30),
	CustomerMiddleInitial varchar(1),
	CustomerLastName varchar(30),
	City varchar(20),
	State char(2),
	ZipCode char(10),
	EmailAddress varchar(40),
	HomePhone char(10),
	CellPhone char(10),
	WorkPhone char(10),
	SSN char(9),
	UserLoginID smallint Foreign Key references UserLogins(UserLoginID)
	)

Insert into Customer Values (1, 1, 'Apt 114', '100 Graydon Hall Dr.', 'Michael', 'F', 'Porter','Toronto', 'ON', 'M3A3B2', 'porter@gmail.com', '6473523562', '4168265638','4162736508', '123456789', 1001),
							(2, 2, 'Apt 2194', '250 Shady Dr.', 'James', 'L', 'Smith', 'Scarborough', 'ON', 'L5Y8U3', 'james23@yahoo.com', '905729487', '4163839088','9056368179','563848561', 1002),
							(3, 3, 'Apt 114', '27 Sussex St..', 'Charles', 'P', 'Boyd', 'New York', 'NY', '12574', 'charlesb@hotmail.com', '2125482952', '7180976394','2129475396','401749382', 1003),
							(4, 4, 'Unit 500', '45 Evergreen Rd..', 'Christina', 'M', 'Kim','Toronto', 'ON', 'M3C1I5', 'kimC@yahoo.ca', '6472955746', '4169502064','4164838408','561928374', 1004),
							(5, 5, 'Unit 9', '7 Gould Ln.', 'Vivian', 'J', 'Robertson','Brooklyn', 'NY', '12957', 'vivi321@gmail.com', '2185066233', '7189992846','7183710256','601982678', 1005)


Select * from Customer


--Table 16: Customer_Account
Create Table Customer_Account
	(
	AccountID int Foreign Key references Account (AccountID),
	CustomerID int Foreign Key references Customer (CustomerID)
	)

Insert into Customer_Account Values (1, 1),
									(2, 2),
									(3, 3),
									(4, 4),
									(5, 5)

Select * from Customer_Account


--Table 17: TransactionLog
Create Table TransactionLog
	(
	TransactionID int Not Null Primary Key,
	TransactionDate datetime,
	TransactionTypeID tinyint Foreign Key references TransactionType (TransactionTypeID),
	TransactionAmount money,
	NewBalance money,
	AccountID int Foreign Key references Account (AccountID),
	CustomerID int Foreign Key references Customer (CustomerID),
	EmployeeID int Foreign Key references Employee (EmployeeID),
	UserLoginID smallint Foreign Key references UserLogins (UserLoginID)
	)

Insert into TransactionLog values (801, '20210412 08:23:50', 1, 200.00, 4200.00, 1, 1, 103, 1001),
								  (802, '20210412 10:26:25', 3, 1000.00, 274000.00, 2, 2, 104, 1002),
								  (803, '20210412 15:34:32', 5, 100.00, 3100.00, 3, 3, 101, 1003),
								  (804, '20210413 07:52:17', 3, 2000.00, 24000.00, 4, 4, 103, 1004),
								  (805, '20210413 17:29:48', 5, 4000.00, 51000.00, 5, 5, 103, 1005)

Select * from TransactionLog



--Question 1: Create a view to get all customers with checking account from ON province. 
Create View
ON_CHECKING1
as
select C.CustomerID, C.CustomerFirstName + ' ' + C.CustomerLastName as [Customer Name], C.State, T.AccountTypeDescription
   from Customer as C
   join Customer_Account as CA 
   on C.CustomerID = CA.CustomerID
   join Account as A
   on CA.AccountID = A.AccountID
   join AccountType as T
   on A.AccountTypeID = T.AccountTypeID
   where T.AccountTypeDescription='Chequing' and C.State='ON';

Select * from ON_CHECKING



--Question 2: Create a view to get all customers with total account balance greater than 5000. 
[dbo].[Login_Account]

Create View
G_5000
as 
Select C.CustomerID, C.CustomerFirstName + ' ' + C.CustomerLastName as [Customer Name], A.Currentbalance + S.InterestRateValue as [Total Account Balance]
	 from Customer as C
     Join Customer_Account as CA
	 on C.CustomerID = CA.CustomerID

	 Join Account as A
	 on CA.AccountID = A.AccountID

	 join SavingsInterestRates as S
	 on A.AccountID = S.InterestSavingsRateID 

	 Group by C.CustomerID, C.CustomerFirstName + ' ' + C.CustomerLastName, A.Currentbalance + S.InterestRateValue
	 Having (A.Currentbalance+S.InterestRateValue) > 5000

Select * from G_5000




--Question 3: 
Create View
TOTAL_ACC
As
Select C.CustomerID, C.CustomerFirstName + ' ' + C.CustomerLastName as [Customer Name],
       Count(T.AccountTypeDescription) as totalAccounts, T.AccountTypeDescription
	From Customer C
    join Customer_Account as CA
	 on C.CustomerID = CA.CustomerID

	 join Account as A
	 on CA.AccountID = A.AccountID

	 join AccountType as T
	 on A.AccountID = T.AccountTypeID 

	 Group by
		C.CustomerId,(C.CustomerFirstName + ' ' + C.CustomerLastName),T.AccountTypeID, T.AccountTypeDescription



Select * from TOTAL_ACC




--Question 4: Create a view to get any particular user’s login and password using AccountId
Create View
USER_PASS
As
Select A.AccountID, U.UserLogin, U.UserPassword 
	 From Account as A
     join Login_Account as LA
	 on A.AccountID = LA.AccountID

	 join UserLogins as U
	 on LA.UserLoginID = U.UserLoginID
	 

Select * from USER_PASS 




--Question 5: Create a view to get all customers’ overdraft amount
Create View 
OVERDRAFTS
As
Select C.CustomerFirstName + ' ' + C.CustomerLastName as [Customer Name], ODL.OverDraftAmount
	 From Customer C
     join Customer_Account as CA
	 on C.CustomerID = CA.CustomerID

	 join Account as A
	 on CA.AccountID = A.AccountID

	 join OverDraftLog as ODL
     on A.AccountID = ODL.AccountID


Select * from OVERDRAFTS



--Question 6: Create stored procedure to add “User_” as a prefix to everyone’s login (username)
Create Procedure
USER_PREFIX
as
begin 
     Select *, ('User_' + UserLogin) as USERNAME 
 from UserLogins
end 

execute USER_PREFIX 



--Question 7: Create a stored procedure that accepts AccountId as a parameter and returns customer’s full name. 

Create Procedure
Id_Name1
@AccountID Int
As
if (@AccountID in (select AccountID from Customer))
	SELECT A.AccountID, C.CustomerFirstName + ' ' + C.CustomerMIddleInitial + ' ' + C.CustomerLastName as [Customer Full Name]
	FROM Customer as C
	JOIN Account as A
	ON C.AccountID = A.AccountID
	WHERE A.AccountID = @AccountID;
else 
	 print 'Account ID does not match a person'
GO


Execute Id_Name1 5

Execute Id_Name1 7



--Question 8: Create a stored procedure that takes a deposit as a parameter and updates CurrentBalance value for that particular account. 
CREATE PROCEDURE 
DepositUpdate 
@AccountID INT, @Deposit INT
AS
UPDATE Account
SET CurrentBalance = CurrentBalance + @Deposit
where AccountID = @AccountID;
GO

EXECUTE DepositUpdate 1, 6000;
GO

SELECT * FROM Account





--Question 9: Create a stored procedure that takes a withdrawal amount as a parameter and updates CurrentBalance value for that particular account. 
CREATE PROCEDURE 
WithdrawalUpdate 
@AccountID INT, @Withdraw INT
AS
UPDATE Account
SET CurrentBalance = CurrentBalance - @Withdraw
WHERE AccountID = @AccountID;
GO

EXECUTE WithdrawalUpdate 5, 5000;
GO

SELECT * FROM Account





-- Question 10:	Write a query to remove SSN column from Customer table. 

Create Procedure
RemoveSSN
As
	Alter Table CUSTOMER
	Drop Column SSN;
	Go

Execute RemoveSSN;
Go
Select * From Customer