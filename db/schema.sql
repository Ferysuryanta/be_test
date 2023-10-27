-- table user --
CREATE TABLE user (
      user_id INT PRIMARY KEY,
      name VARCHAR(255),
      date_of_birth DATE,
      join_date DATE,
);

-- table department--
CREATE TABLE department (
    department_id INT PRIMARY KEY,
    name VARCHAR(255)
);

-- table position --
CREATE TABLE position (
      position_id INT PRIMARY KEY,
      name VARCHAR(255),
      department_id INT,
);

-- table address --
CREATE TABLE address (
     address_id INT PRIMARY KEY,
     user_id INT,
     street_address VARCHAR(255),
     city VARCHAR(255),
     state VARCHAR(255),
     postal_code VARCHAR(10)
);

-- Query SQL --

a) Daftar karyawan yang memiliki usia di atas 30 tahun dan lama bekerja di atas 5 tahun:
SELECT name
FROM user
WHERE DATE_DIFF(CURDATE(), date_of_birth) > 30
  AND DATE_DIFF(CURDATE(), join_date) > 5;

b) Jumlah karyawan yang memiliki jabatan "STAFF" dari seluruh divisi:

SELECT COUNT(*) AS jumlah_staff
FROM user u
         JOIN position p ON u.user_id = p.user_id
WHERE p.name = 'STAFF';

c) Jumlah alamat dari setiap karyawan:
SELECT u.name, COUNT(a.address_id) AS jumlah_alamat
FROM user u
         LEFT JOIN address a ON u.user_id = a.user_id
GROUP BY u.name;

d) Daftar karyawan yang memiliki jabatan "MANAGER" dengan lama bekerja di bawah 3 tahun:
SELECT u.name
FROM user u
         JOIN position p ON u.user_id = p.user_id
WHERE p.name = 'MANAGER'
  AND DATE_DIFF(CURDATE(), join_date) < 3;

e) Jumlah karyawan dari setiap divisi:
SELECT d.name AS divisi, COUNT(u.user_id) AS jumlah_karyawan
FROM user u
         JOIN position p ON u.user_id = p.user_id
         JOIN department d ON p.department_id = d.department_id
GROUP BY d.name;

f) Daftar karyawan divisi "MARKETING" yang memiliki jumlah alamat lebih dari 2:
SELECT u.name, COUNT(a.address_id) AS jumlah_alamat
FROM user u
         JOIN position p ON u.user_id = p.user_id
         JOIN department d ON p.department_id = d.department_id
         LEFT JOIN address a ON u.user_id = a.user_id
WHERE d.name = 'MARKETING'
GROUP BY u.name
HAVING jumlah_alamat > 2;
