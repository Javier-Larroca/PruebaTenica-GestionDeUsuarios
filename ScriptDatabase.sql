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
		Birthdate,
        Active,
        Creation
    FROM Users;
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

    SELECT TOP 1 Id, Email, Birthdate, PasswordHash, PasswordSalt, FirstName, LastName, Active, Creation
    FROM Users
    WHERE Email = @Email;
END
GO


-- Primer registro: Administrador
INSERT INTO Users (Email, Birthdate, PasswordHash, PasswordSalt, FirstName, LastName)
VALUES (
    'admin@mail.com',
    '1980-01-01',
    0x61646D696E61646D696E,  -- Representación simple de 'adminadmin' como ejemplo
    0x1234567890ABCDEF,      -- Salt de ejemplo
    'Administrador',
    'Master'
);

-- 19 registros aleatorios de prueba
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
