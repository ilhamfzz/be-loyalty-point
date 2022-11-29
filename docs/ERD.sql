-- PostgreSQL for ERD Generated

CREATE TABLE Users (
    ID INTEGER PRIMARY KEY,
    CreatedAt TIMESTAMP NOT NULL,
    UpdatedAt TIMESTAMP NOT NULL,
    Username VARCHAR(255) NOT NULL,
    Email VARCHAR(255) NOT NULL,
    Password VARCHAR(255) NOT NULL,
    Points INTEGER NOT NULL
);

CREATE TABLE Products (
    ID INTEGER PRIMARY KEY,
    CreatedAt TIMESTAMP NOT NULL,
    UpdatedAt TIMESTAMP NOT NULL,
    Category VARCHAR(255) NOT NULL,
    Name VARCHAR(255) NOT NULL,
    Description VARCHAR(255) NOT NULL,
    Price INTEGER NOT NULL,
    Stock INTEGER NOT NULL,
    Image VARCHAR(255) NOT NULL,
    CreatedBy VARCHAR(255) NOT NULL,
    UpdatedBy VARCHAR(255) NOT NULL,
    FOREIGN KEY (CreatedBy) REFERENCES Admins(Name),
    FOREIGN KEY (UpdatedBy) REFERENCES Admins(Name)
);

CREATE TABLE SerialNumbers (
    ID INTEGER PRIMARY KEY,
    CreatedAt TIMESTAMP NOT NULL,
    UpdatedAt TIMESTAMP NOT NULL,
    SerialNumber VARCHAR(255) NOT NULL,
    ProductID INTEGER NOT NULL,
    Status VARCHAR(255) NOT NULL,
    CreatedBy VARCHAR(255) NOT NULL,
    FOREIGN KEY (ProductID) REFERENCES Products(ID),
    FOREIGN KEY (CreatedBy) REFERENCES Admins(Name)
);

CREATE TABLE Transactions (
    ID INTEGER PRIMARY KEY,
    CreatedAt TIMESTAMP NOT NULL,
    UpdatedAt TIMESTAMP NOT NULL,
    UserID INTEGER NOT NULL,
    ProductID INTEGER NOT NULL,
    SerialNumber VARCHAR(255) NOT NULL,
    IdentifierNum VARCHAR(255) NOT NULL,
    TotalPrice INTEGER NOT NULL,
    Status VARCHAR(255) NOT NULL,
    LastUpdatedBy VARCHAR(255) NOT NULL,
    FOREIGN KEY (UserID) REFERENCES Users(ID),
    FOREIGN KEY (ProductID) REFERENCES Products(ID),
    FOREIGN KEY (LastUpdatedBy) REFERENCES Admins(Name)
);

CREATE TABLE Admins (
    ID INTEGER PRIMARY KEY,
    CreatedAt TIMESTAMP NOT NULL,
    UpdatedAt TIMESTAMP NOT NULL,
    Name VARCHAR(255) NOT NULL,
    Username VARCHAR(255) NOT NULL,
    Password VARCHAR(255) NOT NULL
);

INSERT INTO Users(id, created_at, updated_at, role, username, email, password)
VALUES
    ('ini string panjang', '2020-12-01 00:00:00', '2020-12-01 00:00:00', 'admin', 'admin01', 'admin01@gmail.com', 'adminpass'),
    ('ini string panjang user01', '2020-12-01 00:00:00', '2020-12-01 00:00:00', 'user', 'user01', 'user01@gmail.com', 'userpass'),
    ('ini string panjang user02', '2020-12-01 00:00:00', '2020-12-01 00:00:00', 'user', 'user02', 'user02@gmail.com', 'userpass');

INSERT INTO Transactions(id, created_at, updated_at, payment_method, user_id, product_id, serial_number, identifier_num, price, status)
VALUES
    ('ini string panjang transaksi01', '2020-12-01 00:00:00', '2020-12-01 00:00:00', 'redeem', 'ini string panjang user01', 'ini string panjang produk', 234131423213, '081239684271', 10000, 'pending'),
    ('ini string panjang transaksi02', '2020-12-01 00:00:00', '2020-12-01 00:00:00', 'redeem', 'ini string panjang user02', 'ini string panjang produk', 234131423213, '081239684271', 10000, 'pending');

-- eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFkbWluIiwiZW1haWwiOiJhZG1pbiJ9.nhtusWo0vQPmvmEZYd0mzrIELXDPZbL7yuQK5eaL-dA