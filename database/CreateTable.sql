-- 1. Tạo Database
CREATE DATABASE IF NOT EXISTS clothestore CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE clothestore;

-- 2. Tạo bảng Category
CREATE TABLE Category (
                          CategoryID INT AUTO_INCREMENT PRIMARY KEY,
                          categoryName NVARCHAR(255)
);

-- 3. Tạo bảng Users
CREATE TABLE Users (
                       userID INT AUTO_INCREMENT PRIMARY KEY,
                       firstName NVARCHAR(255),
                       lastName NVARCHAR(255),
                       email NVARCHAR(255),
                       verify BIT,
                       username NVARCHAR(255) NOT NULL UNIQUE,
                       password NVARCHAR(255) NOT NULL,
                       Phone NVARCHAR(50),
                       birthday DATE,
                       gender INT DEFAULT -1,
                       createAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                       Role INT DEFAULT 1,
                       STATUS INT DEFAULT 1
);

-- 4. Tạo bảng Address (Liên kết với Users)
CREATE TABLE Address (
                         addressID INT AUTO_INCREMENT PRIMARY KEY,
                         fulladdress NVARCHAR(255),
                         ward NVARCHAR(255),
                         city_code NVARCHAR(255),
                         country NVARCHAR(255),
                         phone NVARCHAR(50),
                         userID INT NOT NULL,
                         isDefault BIT DEFAULT 0,
                         FOREIGN KEY (userID) REFERENCES Users(userID) ON DELETE CASCADE
);

-- 5. Tạo bảng Products (Liên kết với Category)
CREATE TABLE Products (
                          ProductsID INT AUTO_INCREMENT PRIMARY KEY,
                          productsName NVARCHAR(255),
                          categoryID INT,
                          price DECIMAL(10,2),
                          status VARCHAR(50) DEFAULT 'active',
                          img NVARCHAR(255),
                          DESCRIPTION TEXT,
                          createAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

                          FOREIGN KEY (categoryID) REFERENCES Category(CategoryID) ON DELETE SET NULL
);

-- 6. Tạo bảng Products_Variants (Liên kết với Products)
CREATE TABLE Products_Variants (
                                   variantID INT AUTO_INCREMENT PRIMARY KEY,
                                   productID INT,
                                   size NVARCHAR(50),
                                   sku NVARCHAR(100),
                                   priceAdjustment DECIMAL(10,2) DEFAULT 0,
                                   stock INT,
                                   status NVARCHAR(50),
                                   FOREIGN KEY (productID) REFERENCES Products(ProductsID) ON DELETE CASCADE
);

-- 7. Tạo bảng Orders (Liên kết với Users và Address)
CREATE TABLE Orders (
                        orderID INT AUTO_INCREMENT PRIMARY KEY,
                        userID INT,
                        addressID INT,
                        shipping_fee DECIMAL(10,2),
                        note TEXT,
                        subtotal DECIMAL(10,2),
                        paymentMethod NVARCHAR(50),

                        discountAmount DECIMAL(10,2),
                        totalAmount DECIMAL(10,2),
                        createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                        updateAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
                        status NVARCHAR(50) DEFAULT 'pending', -- hủy đơn -> cancelled
                        FOREIGN KEY (userID) REFERENCES Users(userID),
                        FOREIGN KEY (addressID) REFERENCES Address(addressID)
);

-- 8. Tạo bảng ORDER_DETAILS (Liên kết với Orders, Products, Products_Variants)
CREATE TABLE ORDER_DETAILS (
                               orderDetailID INT AUTO_INCREMENT PRIMARY KEY,
                               orderID INT NOT NULL,
                               productID INT NOT NULL,
                               quantity INT NOT NULL,
                               variantID INT NOT NULL,
                               price DECIMAL(10,2) NOT NULL,
                               FOREIGN KEY (orderID) REFERENCES Orders(orderID) ON DELETE CASCADE,
                               FOREIGN KEY (productID) REFERENCES Products(ProductsID),
                               FOREIGN KEY (variantID) REFERENCES Products_Variants(variantID)
);
-- 9. Tạo bảng review
CREATE TABLE REVIEWS(
                        review_id INT AUTO_INCREMENT PRIMARY KEY,
                        order_detail_id INT NOT NULL,
                        user_id INT NOT NULL,
                        product_id INT NOT NULL,
                        rating INT NOT NULL CHECK(rating BETWEEN 1 AND 5),
                        created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
                        FOREIGN KEY(order_detail_id) REFERENCES order_details(orderDetailID),
                        FOREIGN KEY (user_id) REFERENCES users(userID),
                        FOREIGN KEY (product_id) REFERENCES products(ProductsID)
);
-- 10. tạo bảng vourche
CREATE TABLE Vouchers (
                          voucherID INT AUTO_INCREMENT PRIMARY KEY,
                          code NVARCHAR(50) UNIQUE NOT NULL,
                          discount INT NOT NULL,        -- số tiền giảm
                          quantity INT,                 -- số lượt dùng
                          used INT DEFAULT 0,
                          status BIT DEFAULT 1          -- 1: dùng được, 0: khóa
);

-- 11. remember me
CREATE TABLE RememberTokens (
                                userID INT PRIMARY KEY,
                                token NVARCHAR(255),
                                expiredAt DATETIME,
                                FOREIGN KEY (userID) REFERENCES Users(userID)
);

-- 12 Shpping tax
CREATE TABLE shipping (
                          spid INT PRIMARY KEY AUTO_INCREMENT,
                          city_name NVARCHAR(255),
                          city_code NVARCHAR(255),
                          price DECIMAL(10,2)
)