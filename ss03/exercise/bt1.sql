CREATE DATABASE QuanLySinhVien;
USE QuanLySinhVien;
CREATE TABLE class(

         class_id INT  AUTO_INCREMENT PRIMARY KEY,

          class_name VARCHAR(60) NOT NULL,

          start_date DATETIME NOT NULL,

          status_class BIT
);
CREATE TABLE student(

          student_id INT AUTO_INCREMENT PRIMARY KEY,

          student_name VARCHAR(30) NOT NULL,

          address VARCHAR(50),

          phone VARCHAR(20),

          status_student BIT,

          class_id INT NOT NULL,

          FOREIGN KEY (class_id) REFERENCES class (class_id)

);
CREATE TABLE subjects(

         sub_id INT AUTO_INCREMENT PRIMARY KEY,

         sub_name VARCHAR(30) NOT NULL,

         credit TINYINT NOT NULL DEFAULT 1 CHECK ( Credit >= 1 ),

         status_subject BIT DEFAULT 1

);
CREATE TABLE mark(

        mark_Id INT AUTO_INCREMENT PRIMARY KEY,

        sub_id INT NOT NULL,

        student_id INT NOT NULL,

        mark FLOAT DEFAULT 0 CHECK ( mark BETWEEN 0 AND 100),

        exam_times TINYINT DEFAULT 1,

        UNIQUE (sub_id, student_id),
	
        FOREIGN KEY (sub_id) REFERENCES subjects (sub_id),

        FOREIGN KEY (student_id) REFERENCES student (student_id)

 );
INSERT INTO class(class_name ,start_date ,status_class)
VALUES ('C0423G1','2023-04-01',0),
		('C0523G1','2023-05-01',0),
		('C0623G1','2023-12-01',1);

INSERT INTO student(student_name,address ,phone ,status_student ,class_id )
VALUES ('nguyen thi hai', '23/asdssa/Da Nang','123213213',0,1),
		('tran thi lasd', '45/adsfgf/Quang Binh','5345644',1,2);
INSERT INTO student(student_name,address ,phone ,status_student ,class_id )
VALUES ('nguyen phong hung', '01/asdssa/Da Nang','65534',0,1);
        
INSERT INTO subjects( sub_name ,credit ,status_subject )
VALUES ('LSDFSD SDFD',3,1),
		 ('FDSDF WRERE',5,0),
		 ('sdsd fghf',2,1);
INSERT INTO mark(sub_id ,student_id ,mark,exam_times )
VALUES (1,1,76,32),
		(1,2,57,41);
INSERT INTO mark(sub_id ,student_id ,mark,exam_times )
VALUES (2,1,57,32);     
INSERT INTO mark(sub_id ,student_id ,mark,exam_times )
VALUES (3,3,57,14);       
 SELECT * 
 FROM student
 WHERE substring_index(student_name, " ",-1)  like 'h%';
 
 SELECT * 
 FROM class
 WHERE month (start_date) = 12;
 
SELECT * 
 FROM subjects
 WHERE credit >= 3 AND credit <= 5;
 
UPDATE student SET class_id=2
WHERE student_name LIKE'%hung';

SELECT 	student_name,sub_name,mark
FROM  student
JOIN mark
ON student.student_id = mark.student_id
JOIN subjects
ON mark.sub_id = subjects.sub_id
ORDER BY mark.mark DESC, SUBSTRING_INDEX(student.student_name," ",-1) ASC;

 