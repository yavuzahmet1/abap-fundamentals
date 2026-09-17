*---------------------------------------------------------------------*
* CLEAR
*---------------------------------------------------------------------*
*
* CLEAR removes the current values from a variable or work area.
*
* IMPORTANT:
* CLEAR does NOT delete a record from the database.
*
* Example:
*
* CLEAR wa_employees.
*
* This clears all fields inside wa_employees:
*
* wa_employees-employee
* wa_employees-surname
* wa_employees-forename
* wa_employees-title
* wa_employees-dob
*
* After CLEAR, the work area is empty again.
*
* Example:
*
* CLEAR wa_employees.
*
* wa_employees-employee = '01000101'.
* wa_employees-surname  = 'WESTRON'.
* wa_employees-forename = 'BURC'.
* wa_employees-title    = 'MR'.
* wa_employees-dob      = '19820808'.
*
*---------------------------------------------------------------------*
* CLEARING ONLY ONE FIELD
*---------------------------------------------------------------------*
*
* It is also possible to clear only one field.
*
* Example:
*
* CLEAR wa_employees-employee.
*
* Only the employee field is cleared.
* Other fields are not changed.

*---------------------------------------------------------------------*
*  IMPORTANT DIFFERENCE
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