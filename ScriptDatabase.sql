-- Crear base de datos si no existe
IF DB_ID('UsersAdministration_DB') IS NULL
BEGIN
    CREATE DATABASE UsersAdministration_DB;
END
GO

-- Usar la base de datos
USE UsersAdministration_DB;
GO

-- Crear tabla Users si no existe
IF OBJECT_ID('Users', 'U') IS NULL
BEGIN
    CREATE TABLE Users(
        Id INT PRIMARY KEY IDENTITY(1,1),
        Email VARCHAR(100) UNIQUE NOT NULL,
        Birthdate DATE NOT NULL,
        PasswordHash VARBINARY(256) NOT NULL,
        PasswordSalt VARBINARY(128) NOT NULL,
        FirstName VARCHAR(100) NOT NULL,
        LastName VARCHAR(100) NOT NULL,
        Active BIT NOT NULL DEFAULT 1,
        Creation DATETIME NOT NULL DEFAULT GETDATE()
    );
END
GO

-- Crear procedimiento sp_GetUsers
IF OBJECT_ID('sp_GetUsers', 'P') IS NOT NULL
    DROP PROCEDURE sp_GetUsers;
GO
CREATE PROCEDURE sp_GetUsers
AS
BEGIN
    SET NOCOUNT ON;
    SELECT Id, Email, FirstName, LastName, Birthdate, Active, Creation
    FROM Users;
END
GO

-- Crear procedimiento sp_InsertUsers
IF OBJECT_ID('sp_InsertUsers', 'P') IS NOT NULL
    DROP PROCEDURE sp_InsertUsers;
GO
CREATE PROCEDURE sp_InsertUsers
    @Email NVARCHAR(100),
    @Birthdate DATE,
    @PasswordHash VARBINARY(256),
    @PasswordSalt VARBINARY(128),
    @FirstName NVARCHAR(100),
    @LastName NVARCHAR(100)
AS
BEGIN
    SET NOCOUNT ON;

    -- Validar si ya existe un usuario con el mismo Email
    IF EXISTS (SELECT 1 FROM Users WHERE Email = @Email)
    BEGIN
        -- Devolver error con THROW (recomendado)
        THROW 50001, 'El email ya se encuentra registrado en el sistema.', 1;
        RETURN;
    END

    -- Si no existe, se inserta
    INSERT INTO Users (Email, Birthdate, PasswordHash, PasswordSalt, FirstName, LastName)
    VALUES (@Email, @Birthdate, @PasswordHash, @PasswordSalt, @FirstName, @LastName);

    SELECT SCOPE_IDENTITY() AS NewUserId;
END
GO

-- Crear procedimiento sp_DeleteUsers
IF OBJECT_ID('sp_DeleteUser', 'P') IS NOT NULL
    DROP PROCEDURE sp_DeleteUser;
GO
CREATE PROCEDURE sp_DeleteUser
    @Id INT
AS
BEGIN
    SET NOCOUNT ON;
    DELETE FROM Users WHERE Id = @Id;
END
GO

-- Crear procedimiento sp_DeleteUsers
IF OBJECT_ID('sp_DisableUser', 'P') IS NOT NULL
    DROP PROCEDURE sp_DisableUser;
GO
CREATE PROCEDURE sp_DisableUser
    @Id INT
AS
BEGIN
    SET NOCOUNT ON;
    UPDATE Users SET Active = 0 WHERE Id = @Id;
END
GO

-- Crear procedimiento sp_DeleteUsers
IF OBJECT_ID('sp_EnableUser', 'P') IS NOT NULL
    DROP PROCEDURE sp_EnableUser;
GO
CREATE PROCEDURE sp_EnableUser
    @Id INT
AS
BEGIN
    SET NOCOUNT ON;
    UPDATE Users SET Active = 1 WHERE Id = @Id;
END
GO

-- Crear procedimiento sp_UpdateUser
IF OBJECT_ID('sp_UpdateUser', 'P') IS NOT NULL
    DROP PROCEDURE sp_UpdateUser;
GO
CREATE PROCEDURE sp_UpdateUser
    @Id INT,
    @Email NVARCHAR(100),
    @Birthdate DATE,
    @Active BIT,
    @FirstName NVARCHAR(100),
    @LastName NVARCHAR(100)
AS
BEGIN
    SET NOCOUNT ON;
    UPDATE Users SET Email = @Email, Birthdate = @Birthdate, Active = @Active, FirstName = @FirstName, LastName = @LastName WHERE Id = @Id;
END
GO

-- Crear procedimiento sp_GetUserByEmail
IF OBJECT_ID('sp_GetUserByEmail', 'P') IS NOT NULL
    DROP PROCEDURE sp_GetUserByEmail;
GO
CREATE PROCEDURE sp_GetUserByEmail
    @Email VARCHAR(100)
AS
BEGIN
    SET NOCOUNT ON;
    SELECT TOP 1 Id, Email, Birthdate, PasswordHash, PasswordSalt, FirstName, LastName, Active, Creation
    FROM Users
    WHERE Email = @Email;
END
GO

-- Crear procedimiento sp_GetUserById
IF OBJECT_ID('sp_GetUserById', 'P') IS NOT NULL
    DROP PROCEDURE sp_GetUserById;
GO
CREATE PROCEDURE sp_GetUserById
    @Id INT
AS
BEGIN
    SET NOCOUNT ON;
    SELECT TOP 1 Id, Email, Birthdate, PasswordHash, PasswordSalt, FirstName, LastName, Active, Creation
    FROM Users
    WHERE Id = @Id;
END
GO

-- Insertar primer usuario Administrador si no existe
IF NOT EXISTS (SELECT 1 FROM Users WHERE Email = 'admin@mail.com')
BEGIN
    INSERT INTO Users (Email, Birthdate, PasswordHash, PasswordSalt, FirstName, LastName)
    VALUES (
        'admin@mail.com',
        '1980-01-01',
        0x0B8935EAAB17486655D2CA3C046220AF32F011C412CAA47D64EFE71D5E338DFA,
        0xAE4C2B4FBD59484E9BCA7AFE6064A6665C188BA23AAE5973A8BDF31162B2535F0D81BBC22CD585A0B113BD35B937D954E2DA2A1EF1AF50FDAAA2F940ACAC9E0F,
        'Administrador',
        'Master'
    );
END
GO

-- Insertar 19 usuarios de prueba si no existen
IF NOT EXISTS (SELECT 1 FROM Users WHERE Email = 'user1@mail.com')
BEGIN
    INSERT INTO Users (Email, Birthdate, PasswordHash, PasswordSalt, FirstName, LastName) VALUES
    ('user1@mail.com', '1990-05-12', 0x707773646631, 0x11111111, 'Lucas', 'Gomez'),
    ('user2@mail.com', '1985-08-23', 0x707773646632, 0x22222222, 'Sofia', 'Martinez'),
    ('user3@mail.com', '1992-02-17', 0x707773646633, 0x33333333, 'Mateo', 'Lopez'),
    ('user4@mail.com', '1988-11-05', 0x707773646634, 0x44444444, 'Valentina', 'Perez'),
    ('user5@mail.com', '1995-07-30', 0x707773646635, 0x55555555, 'Thiago', 'Diaz'),
    ('user6@mail.com', '1991-03-21', 0x707773646636, 0x66666666, 'Camila', 'Fernandez'),
    ('user7@mail.com', '1989-12-15', 0x707773646637, 0x77777777, 'Benjamin', 'Gonzalez'),
    ('user8@mail.com', '1993-09-09', 0x707773646638, 0x88888888, 'Emilia', 'Ruiz'),
    ('user9@mail.com', '1996-01-26', 0x707773646639, 0x99999999, 'Santiago', 'Torres'),
    ('user10@mail.com', '1990-06-18', 0x70777364663130, 0xAAAAAAAA, 'Isabella', 'Ramos'),
    ('user11@mail.com', '1987-04-10', 0x70777364663131, 0xBBBBBBBB, 'Sebastian', 'Castro'),
    ('user12@mail.com', '1994-10-22', 0x70777364663132, 0xCCCCCCCC, 'Victoria', 'Vega'),
    ('user13@mail.com', '1986-08-03', 0x70777364663133, 0xDDDDDDDD, 'Nicolas', 'Cabrera'),
    ('user14@mail.com', '1992-11-12', 0x70777364663134, 0xEEEEEEEE, 'Martina', 'Mendoza'),
    ('user15@mail.com', '1991-05-25', 0x70777364663135, 0xFFFFFFFF, 'Gabriel', 'Figueroa'),
    ('user16@mail.com', '1989-07-14', 0x70777364663136, 0x12341234, 'Julieta', 'Ortega'),
    ('user17@mail.com', '1993-03-08', 0x70777364663137, 0x56785678, 'Lautaro', 'Rojas'),
    ('user18@mail.com', '1990-09-27', 0x70777364663138, 0x9ABC9ABC, 'Lucia', 'Silva'),
    ('user19@mail.com', '1988-12-05', 0x70777364663139, 0xDEF0DEF0, 'Tomás', 'Blanco'),
    ('user20@mail.com', '1995-02-15', 0x70777364663230, 0x13571357, 'Agustina', 'Campos');
END
GO
