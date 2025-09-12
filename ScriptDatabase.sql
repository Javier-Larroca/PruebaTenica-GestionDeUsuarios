USE master;
GO

CREATE DATABASE UsersAdministration_DB

Use UsersAdministration_DB

GO
CREATE TABLE Users(
	Id int Primary Key Identity(1,1),
	Email varchar(100) unique Not null,
	Birthdate date not null,
    PasswordHash varbinary(256) Not null,
    PasswordSalt varbinary(128) Not null,
	FirstName varchar(100) Not null,
	LastName varchar(100) Not null,
	ConfirmedEmail Bit Not null default 0,
	Active Bit Not null default 1,
	Creation DATETIME NOT NULL DEFAULT GETDATE()
)

GO
CREATE PROCEDURE sp_GetActiveUsers
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        Id,
        Email,
        FirstName,
        LastName,
		Birthdate,
        ConfirmedEmail,
        Active,
        Creation
    FROM Users 
	WHERE Active = 1
	WITH (NOLOCK);
END
GO

CREATE PROCEDURE sp_InsertUsers
    @Email NVARCHAR(100),
	@Birthdate date,
    @PasswordHash VARBINARY(256),
    @PasswordSalt VARBINARY(128),
    @FirstName NVARCHAR(100),
    @LastName NVARCHAR(100)
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO Users (Email, Birthdate, PasswordHash, PasswordSalt, FirstName, LastName)
    VALUES (@Email, @Birthdate, @PasswordHash, @PasswordSalt, @FirstName, @LastName);
    
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

CREATE PROCEDURE sp_GetUserByEmail
    @Email VARCHAR(100)
AS
BEGIN
    SET NOCOUNT ON;

    SELECT TOP 1 Id, Email, Birthdate, PasswordHash, PasswordSalt, FirstName, LastName, ConfirmedEmail, Active, Creation
    FROM Users
    WHERE Email = @Email;
END
GO