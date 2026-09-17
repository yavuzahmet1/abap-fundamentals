*&---------------------------------------------------------------------*
*& Report Z_OPENSQL_1
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_opensql_1.

DATA wa_employees LIKE zemployees.

wa_employees-employee = '01000100'.
wa_employees-surname  = 'WESTRON'.
wa_employees-forename = 'BURC'.
wa_employees-title    = 'MR'.
wa_employees-dob      = '19820808'.

INSERT zemployees FROM wa_employees.

IF sy-subrc = 0.

  WRITE: 'Record Inserted Correctly'.

ELSE.

  WRITE: 'We have a return code of ', sy-subrc.

ENDIF.


*---------------------------------------------------------------------*
* SY-SUBRC
*---------------------------------------------------------------------*
* sy-subrc is a system return code.
* SAP sets this value automatically after certain operations.
*
* Common values:
*
* sy-subrc = 0
* -> Operation was successful.
*
* sy-subrc = 4
* -> Operation was not successful / expected result was not found.
* -> Example: INSERT failed because the key already exists.
* -> Example: SELECT did not find a record.
*
* sy-subrc = 8
* -> A more serious error or different exceptional situation occurred.
* -> Exact meaning depends on the ABAP statement.
*
*---------------------------------------------------------------------*

*---------------------------------------------------------------------*
* IMPORTANT DIFFERENCE
*---------------------------------------------------------------------*
*
* CLEAR
* -> Clears data from program memory.
* -> Does NOT delete database records.
*
* INSERT
* -> Adds a new record to the database.
*
* DELETE
* -> Removes a record from the database.