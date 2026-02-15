# DBMS SQL Lab – College Database System

This repository contains the Database Management System (DBMS) assignment 
based on designing and implementing a College Database.

The project includes:
- ER Diagram (Part A)
- Relational Tables (Part B)
- SQL Implementation (Part C)


## Student Information

**Name:**Sarita Kumari 
**Reg no:**23157128024
**Course:** B.Tech(CSE(AL&ML)) 
**Subject:** Database Management System  
---

# Part A – ER Diagram

## Objective
To design an Entity-Relationship (ER) model representing a College Database system.

## Entities Identified

1. **Department**
   - Dept_ID (Primary Key)
   - Dept_Name
   - Office_Location

2. **Student**
   - Student_ID (Primary Key)
   - Name
   - Date_of_Birth
   - Gender
   - Contact_Number
   - Dept_ID (Foreign Key)

3. **Faculty**
   - Faculty_ID (Primary Key)
   - Name
   - Designation
   - Email
   - Dept_ID (Foreign Key)

4. **Course**
   - Course_ID (Primary Key)
   - Course_Name
   - Credits
   - Dept_ID (Foreign Key)
   - Faculty_ID (Foreign Key)

5. **Enrollment**
   - Enrollment_ID (Primary Key)
   - Student_ID (Foreign Key)
   - Course_ID (Foreign Key)
   - Semester
   - Grade

## Relationships & Cardinality

- One Department → Many Students (1:M)
- One Department → Many Faculty (1:M)
- One Department → Many Courses (1:M)
- One Faculty → Many Courses (1:M)
- Student ↔ Course (M:N resolved using Enrollment)

---

# Part B – Relational Tables

The ER Diagram was converted into relational tables as follows:

### Department
Primary Key: Dept_ID

### Student
Primary Key: Student_ID  
Foreign Key: Dept_ID references Department(Dept_ID)

### Faculty
Primary Key: Faculty_ID  
Foreign Key: Dept_ID references Department(Dept_ID)

### Course
Primary Key: Course_ID  
Foreign Keys:
- Dept_ID references Department(Dept_ID)
- Faculty_ID references Faculty(Faculty_ID)

### Enrollment
Primary Key: Enrollment_ID  
Foreign Keys:
- Student_ID references Student(Student_ID)
- Course_ID references Course(Course_ID)

---

# Part C – SQL Implementation

The database was implemented using SQL with:
# College Database SQL Project

## Overview
This project implements a simple **College Database** using SQL.  
It contains three main tables:

1. **Learner / Student** – Stores basic information about students.  
2. **Exam / Test** – Stores exam details like name and ID.  
3. **Result / Score** – Stores marks of students and links students with exams using foreign keys.

---

## ER Diagram 
*The ER diagram shows the tables and their relationships.*

---

## SQL Tables
The SQL code includes **CREATE TABLE** statements for all tables:

```sql
CREATE TABLE Learner (
    learner_id NUMBER PRIMARY KEY,
    learner_name VARCHAR2(50),
    department VARCHAR2(50),
    year NUMBER
);

CREATE TABLE Exam (
    exam_id NUMBER PRIMARY KEY,
    exam_name VARCHAR2(50)
);

CREATE TABLE Result (
    result_id NUMBER PRIMARY KEY,
    learner_id NUMBER,
    exam_id NUMBER,
    marks NUMBER,
    CONSTRAINT fk_result_learner FOREIGN KEY (learner_id)
        REFERENCES Learner(learner_id),
    CONSTRAINT fk_result_exam FOREIGN KEY (exam_id)
        REFERENCES Exam(exam_id)
);
