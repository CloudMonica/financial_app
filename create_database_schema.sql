
-- 用户表
CREATE TABLE users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50) NOT NULL,
    account VARCHAR(50) UNIQUE NOT NULL,
    secret VARCHAR(100) NOT NULL,
    region VARCHAR(100)
);

-- 业务类型表
CREATE TABLE business_type (
    type_id INT PRIMARY KEY AUTO_INCREMENT,
    type_name VARCHAR(100) NOT NULL
);

-- 订单表
CREATE TABLE orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    type_id INT NOT NULL,
    order_name VARCHAR(100),
    province VARCHAR(100),
    amount DECIMAL(10,2),
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (type_id) REFERENCES business_type(type_id)
);

-- 商机表
CREATE TABLE opportunity (
    op_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    type_id INT NOT NULL,
    bo_name VARCHAR(100),
    province VARCHAR(100),
    amount DECIMAL(10,2),
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (type_id) REFERENCES business_type(type_id)
);

-- 月度报表表
CREATE TABLE monthly_report (
    mr_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT NOT NULL,
    month VARCHAR(10) NOT NULL,
    recv_it DECIMAL(10,2),
    recv_nt DECIMAL(10,2),
    act_rev_nt DECIMAL(10,2),
    refnd_exp DECIMAL(10,2),
    refnd_act DECIMAL(10,2),
    pay_est DECIMAL(10,2),
    pay_act DECIMAL(10,2),
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);
