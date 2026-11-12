CREATE DATABASE IF NOT EXISTS logitrack CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE logitrack;
SET FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS freight_products;
DROP TABLE IF EXISTS freights;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS addresses;
DROP TABLE IF EXISTS carriers;
SET FOREIGN_KEY_CHECKS=1;

CREATE TABLE products (
 id INT AUTO_INCREMENT PRIMARY KEY,
 name VARCHAR(120) NOT NULL,
 description TEXT NULL,
 weight DECIMAL(10,2) NOT NULL DEFAULT 0,
 quantity INT NOT NULL DEFAULT 1,
 price DECIMAL(12,2) NOT NULL DEFAULT 0,
 created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB;

CREATE TABLE addresses (
 id INT AUTO_INCREMENT PRIMARY KEY,
 label VARCHAR(80) NOT NULL,
 cep VARCHAR(9) NOT NULL,
 street VARCHAR(150) NOT NULL,
 number VARCHAR(20) NOT NULL,
 complement VARCHAR(100) NULL,
 neighborhood VARCHAR(100) NOT NULL,
 city VARCHAR(100) NOT NULL,
 state CHAR(2) NOT NULL,
 created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB;

CREATE TABLE carriers (
 id INT AUTO_INCREMENT PRIMARY KEY,
 name VARCHAR(140) NOT NULL,
 document VARCHAR(20) NULL,
 phone VARCHAR(30) NULL,
 email VARCHAR(140) NULL,
 vehicle_type VARCHAR(80) NULL,
 created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB;

CREATE TABLE freights (
 id INT AUTO_INCREMENT PRIMARY KEY,
 carrier_id INT NOT NULL,
 origin_id INT NOT NULL,
 destination_id INT NOT NULL,
 freight_date DATE NOT NULL,
 status ENUM('Pendente','Em trânsito','Entregue','Cancelado') NOT NULL DEFAULT 'Pendente',
 notes TEXT NULL,
 created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
 CONSTRAINT fk_freight_carrier FOREIGN KEY(carrier_id) REFERENCES carriers(id),
 CONSTRAINT fk_freight_origin FOREIGN KEY(origin_id) REFERENCES addresses(id),
 CONSTRAINT fk_freight_destination FOREIGN KEY(destination_id) REFERENCES addresses(id)
) ENGINE=InnoDB;

CREATE TABLE freight_products (
 freight_id INT NOT NULL,
 product_id INT NOT NULL,
 quantity INT NOT NULL DEFAULT 1,
 PRIMARY KEY(freight_id,product_id),
 CONSTRAINT fk_fp_freight FOREIGN KEY(freight_id) REFERENCES freights(id) ON DELETE CASCADE,
 CONSTRAINT fk_fp_product FOREIGN KEY(product_id) REFERENCES products(id)
) ENGINE=InnoDB;

INSERT INTO products(name,description,weight,quantity,price) VALUES
('Notebook corporativo','Notebook para uso administrativo',2.40,12,3899.90),
('Monitor 24 polegadas','Monitor LED Full HD',3.80,8,899.00),
('Teclado sem fio','Teclado padrão ABNT2',0.65,30,129.90),
('Mouse óptico','Mouse USB',0.18,40,49.90);

INSERT INTO addresses(label,cep,street,number,complement,neighborhood,city,state) VALUES
('Centro de distribuição','87010-000','Avenida Brasil','1200','Galpão 2','Centro','Maringá','PR'),
('Filial Londrina','86010-000','Rua Sergipe','455','','Centro','Londrina','PR'),
('Cliente Cascavel','85801-000','Avenida Toledo','890','Sala 4','Centro','Cascavel','PR');

INSERT INTO carriers(name,document,phone,email,vehicle_type) VALUES
('TransRápido Logística','12.345.678/0001-90','(44) 3333-2222','contato@transrapido.example','Caminhão baú'),
('Expresso Paraná','98.765.432/0001-10','(43) 99999-8888','operacao@expressoparana.example','Van');

INSERT INTO freights(carrier_id,origin_id,destination_id,freight_date,status,notes) VALUES
(1,1,2,CURDATE(),'Em trânsito','Carga de equipamentos de informática para a filial.');
INSERT INTO freight_products(freight_id,product_id,quantity) VALUES (1,1,2),(1,2,3),(1,3,5);
