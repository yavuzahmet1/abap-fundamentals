*&---------------------------------------------------------------------*
*& Report Z_SCREENS_1
*&---------------------------------------------------------------------*
REPORT z_screens_1.

TABLES: zemployees.

DATA: wa_employee LIKE zemployees-employee.

PARAMETERS: my_ee   LIKE zemployees-employee DEFAULT '4234234234' OBLIGATORY,
            my_syn  LIKE zemployees-surname DEFAULT 'BORGES' LOWER CASE,
            my_box1 AS CHECKBOX,
            wa_green RADIOBUTTON GROUP grp1,
            wa_blue RADIOBUTTON GROUP grp1,
            wa_red RADIOBUTTON GROUP grp1.

INITIALIZATION.

AT SELECTION-SCREEN ON my_ee.

  IF my_ee > wa_employee.
    MESSAGE 'Wrong enter number' TYPE 'E'.
  ENDIF.

START-OF-SELECTION.
  SELECT * FROM zemployees.
    wa_employee = zemployees-employee.
    WRITE: / wa_employee.
    WRITE: / zemployees-employee, zemployees-surname.
  ENDSELECT.