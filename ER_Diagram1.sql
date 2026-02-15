
SQL*Plus: Release 21.0.0.0.0 - Production on Sat Feb 14 23:46:49 2026
Version 21.3.0.0.0

Copyright (c) 1982, 2021, Oracle.  All rights reserved.

Enter user-name: system
Enter password:
Last Successful login time: Sat Feb 14 2026 23:17:54 +05:30

Connected to:
Oracle Database 21c Express Edition Release 21.0.0.0.0 - Production
Version 21.3.0.0.0

SQL> CREATE TABLE Learner (
  2      learner_id NUMBER PRIMARY KEY,
  3      name VARCHAR2(50),
  4      department VARCHAR2(50),
  5      year NUMBER
  6  );

Table created.

SQL> SELECT * FROM Learner;

no rows selected

SQL> INSERT INTO Learner (learner_id, name, department, year)
  2  VALUES (1, 'Rahul', 'CSE', 2);

1 row created.

SQL> INSERT INTO Learner (learner_id, name, department, year)
  2  VALUES (2, 'Anita', 'ECE', 3);

1 row created.

SQL> INSERT INTO Learner (learner_id, name, department, year)
  2  VALUES (3, 'Sohail', 'ME', 1);

1 row created.

SQL> COMMIT;

Commit complete.

SQL> SELECT * FROM Learner;

LEARNER_ID NAME
---------- --------------------------------------------------
DEPARTMENT                                               YEAR
-------------------------------------------------- ----------
         1 Rahul
CSE                                                         2

         2 Anita
ECE                                                         3

         3 Sohail
ME                                                          1


SQL> CREATE TABLE Course (
  2      course_id NUMBER PRIMARY KEY,
  3      course_name VARCHAR2(50),
  4      credits NUMBER
  5  );

Table created.

SQL> SELECT * FROM Course;

no rows selected

SQL> INSERT INTO Course (course_id, course_name, credits)
  2  VALUES (101, 'Database Systems', 4);

1 row created.

SQL>
SQL> INSERT INTO Course (course_id, course_name, credits)
  2  VALUES (102, 'Operating Systems', 3);

1 row created.

SQL>
SQL> INSERT INTO Course (course_id, course_name, credits)
  2  VALUES (103, 'Data Structures', 3);

1 row created.

SQL> COMMIT;

Commit complete.

SQL> SELECT * FROM Course;

 COURSE_ID COURSE_NAME                                          CREDITS
---------- -------------------------------------------------- ----------
       101 Database Systems                                           4
       102 Operating Systems                                          3
       103 Data Structures                                            3

SQL> CREATE TABLE Enrollment (
  2      learner_id NUMBER,
  3      course_id NUMBER,
  4      enrollment_date DATE,
  5      CONSTRAINT pk_enrollment PRIMARY KEY (learner_id, course_id),
  6      CONSTRAINT fk_enroll_learner FOREIGN KEY (learner_id)
  7          REFERENCES Learner(learner_id),
  8      CONSTRAINT fk_enroll_course FOREIGN KEY (course_id)
  9          REFERENCES Course(course_id)
 10  );

Table created.

SQL> SELECT * FROM Enrollment;

no rows selected

SQL> INSERT INTO Enrollment (learner_id, course_id, enrollment_date)
  2  VALUES (1, 101, TO_DATE('2026-02-14', 'YYYY-MM-DD'));

1 row created.

SQL>
SQL> INSERT INTO Enrollment (learner_id, course_id, enrollment_date)
  2  VALUES (1, 103, TO_DATE('2026-02-15', 'YYYY-MM-DD'));

1 row created.

SQL>
SQL> INSERT INTO Enrollment (learner_id, course_id, enrollment_date)
  2  VALUES (2, 102, TO_DATE('2026-02-14', 'YYYY-MM-DD'));

1 row created.

SQL>
SQL> INSERT INTO Enrollment (learner_id, course_id, enrollment_date)
  2  VALUES (3, 101, TO_DATE('2026-02-15', 'YYYY-MM-DD'));

1 row created.

SQL> COMMIT;

Commit complete.

SQL> SELECT * FROM Enrollment;

LEARNER_ID  COURSE_ID ENROLLMEN
---------- ---------- ---------
         1        101 14-FEB-26
         1        103 15-FEB-26
         2        102 14-FEB-26
         3        101 15-FEB-26

SQL> CREATE TABLE Exam (
  2      exam_id NUMBER PRIMARY KEY,
  3      exam_name VARCHAR2(50),
  4      exam_date DATE,
  5      course_id NUMBER,
  6      CONSTRAINT fk_exam_course FOREIGN KEY (course_id)
  7          REFERENCES Course(course_id)
  8  );

Table created.

SQL> SELECT * FROM Exam;

no rows selected

SQL> INSERT INTO Exam (exam_id, exam_name, exam_date, course_id)
  2  VALUES (201, 'Midterm DB', TO_DATE('2026-03-01', 'YYYY-MM-DD'), 101);

1 row created.

SQL>
SQL> INSERT INTO Exam (exam_id, exam_name, exam_date, course_id)
  2  VALUES (202, 'Final DB', TO_DATE('2026-04-15', 'YYYY-MM-DD'), 101);

1 row created.

SQL>
SQL> INSERT INTO Exam (exam_id, exam_name, exam_date, course_id)
  2  VALUES (203, 'Midterm OS', TO_DATE('2026-03-05', 'YYYY-MM-DD'), 102);

1 row created.

SQL>
SQL> INSERT INTO Exam (exam_id, exam_name, exam_date, course_id)
  2  VALUES (204, 'Final DS', TO_DATE('2026-04-20', 'YYYY-MM-DD'), 103);

1 row created.

SQL> COMMIT;

Commit complete.

SQL> SELECT * FROM Exam;

   EXAM_ID EXAM_NAME                                          EXAM_DATE
---------- -------------------------------------------------- ---------
 COURSE_ID
----------
       201 Midterm DB                                         01-MAR-26
       101

       202 Final DB                                           15-APR-26
       101

       203 Midterm OS                                         05-MAR-26
       102


   EXAM_ID EXAM_NAME                                          EXAM_DATE
---------- -------------------------------------------------- ---------
 COURSE_ID
----------
       204 Final DS                                           20-APR-26
       103


SQL> CREATE TABLE Result (
  2      result_id NUMBER PRIMARY KEY,
  3      learner_id NUMBER,
  4      exam_id NUMBER,
  5      marks NUMBER,
  6      CONSTRAINT fk_result_learner FOREIGN KEY (learner_id)
  7          REFERENCES Learner(learner_id),
  8      CONSTRAINT fk_result_exam FOREIGN KEY (exam_id)
  9          REFERENCES Exam(exam_id)
 10  );

Table created.

SQL> SELECT * FROM Result;

no rows selected

SQL> INSERT INTO Result (result_id, learner_id, exam_id, marks)
  2  VALUES (301, 1, 201, 85);

1 row created.

SQL>
SQL> INSERT INTO Result (result_id, learner_id, exam_id, marks)
  2  VALUES (302, 1, 204, 90);

1 row created.

SQL>
SQL> INSERT INTO Result (result_id, learner_id, exam_id, marks)
  2  VALUES (303, 2, 203, 78);

1 row created.

SQL>
SQL> INSERT INTO Result (result_id, learner_id, exam_id, marks)
  2  VALUES (304, 3, 201, 88);

1 row created.

SQL> COMMIT;

Commit complete.

SQL> SELECT * FROM Result;

 RESULT_ID LEARNER_ID    EXAM_ID      MARKS
---------- ---------- ---------- ----------
       301          1        201         85
       302          1        204         90
       303          2        203         78
       304          3        201         88

SQL>