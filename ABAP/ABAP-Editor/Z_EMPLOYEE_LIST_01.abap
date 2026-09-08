*&---------------------------------------------------------------------*
*& Report Z_EMPLOYEE_LIST_01
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_employee_list_01 LINE-SIZE 132.

TABLES zemployees.

SELECT * FROM zemployees.
  WRITE: / zemployees-employee,
           zemployees-title,
           zemployees-forename,
           zemployees-surname,
           zemployees-dob.
ENDSELECT.

ULINE.

SELECT * FROM zemployees.
  WRITE: / zemployees.
ENDSELECT.

ULINE.

SELECT * FROM zemployees.
  WRITE: zemployees.
  WRITE: /.
ENDSELECT.