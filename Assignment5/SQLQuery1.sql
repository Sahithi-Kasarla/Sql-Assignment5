create database Assessment05Db
use Assessment05Db

create schema bank


CREATE TABLE bank.Customer (
    CId INT PRIMARY KEY identity (1000,1) NOT NULL,
    CName NVARCHAR(100) NOT NULL,
    CEmail NVARCHAR(100) UNIQUE NOT NULL,
	Contact varchar (10) not null unique check (contact like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
	CPwd as	 CONCAT(SUBSTRING(CName, LEN(CName) - 1, 2), 
   SUBSTRING(CAST(Cid AS VARCHAR),
   LEN(CAST(Cid AS VARCHAR)) - 1, 2), 
   SUBSTRING(contact, 1, 2))  Persisted   
)
drop table bank.Mailinfo
select * from bank.Customer
CREATE TABLE bank.Mailinfo (
    MailTo NVARCHAR(MAX) NOT NULL,
    MailDate DATE NOT NULL,
    MailMessage NVARCHAR(MAX) NOT NULL
)

CREATE TRIGGER bank.trgMailToCust
ON bank.Customer
AFTER INSERT
AS
BEGIN
    INSERT INTO bank.Mailinfo (MailTo, MailDate, MailMessage)
    SELECT CEmail, GETDATE(), 'Your net banking password is: ' + CPwd + '. It is valid up to 2 days only. Update It'
    FROM inserted;
END

INSERT INTO bank.Customer (CName, CEmail, Contact) VALUES
('Ram', 'Ram@sql.com', '1234567890'),
('harsha', 'harshaa@sql.com', '9876543210'),
('Sara', 'sara@sql.com', '1232343456');

select * from bank.Customer
select * from bank.Mailinfo

