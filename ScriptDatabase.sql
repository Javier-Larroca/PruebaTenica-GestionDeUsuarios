USE master;
GO

CREATE DATABASE UsersAdministration_DB

Use UsersAdministration_DB

GO
CREATE TABLE Users(
	Id int Primary Key Identity(1,1),
	Email varchar(100) Not null,
    PasswordHash varbinary(256) Not null,
    PasswordSalt varbinary(128) Not null,
	FirstName varchar(100) Not null,
	LastName varchar(100) Not null,
	ConfirmedEmail Bit Not null default 0,
	Active Bit Not null default 1,
	Creation DATETIME NOT NULL DEFAULT GETDATE()
)

GO
CREATE PROCEDURE sp_GetUsers
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        Id,
        Email,
        FirstName,
        LastName,
        ConfirmedEmail,
        Active,
        Creation
    FROM Users WITH (NOLOCK);
END
GO

CREATE PROCEDURE sp_InsertUsers
    @Email NVARCHAR(320),
    @PasswordHash VARBINARY(256),
    @PasswordSalt VARBINARY(128),
    @FirstName NVARCHAR(100),
    @LastName NVARCHAR(100)
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO Users (Email, PasswordHash, PasswordSalt, FirstName, LastName)
    VALUES (@Email, @PasswordHash, @PasswordSalt, @FirstName, @LastName);
    
    SELECT SCOPE_IDENTITY() AS NewUserId;
END
GO

CREATE PROCEDURE sp_DeleteUsers
    @Id INT
AS
BEGIN
    SET NOCOUNT ON;

    DELETE FROM Users
    WHERE Id = @Id;
END
GO
