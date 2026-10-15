*&---------------------------------------------------------------------*
*& Report Z_SCREENS_1
*&---------------------------------------------------------------------*
REPORT z_screens_1.

TABLES: zemployees.

DATA: wa_employee LIKE zemployees-employee.

START-OF-SELECTION.

  SELECT * FROM zemployees.
    wa_employee = zemployees-employee.

  WRITE: / wa_employee.
  WRITE: / zemployees-employee, zemployees-surname.
  ENDSELECT.