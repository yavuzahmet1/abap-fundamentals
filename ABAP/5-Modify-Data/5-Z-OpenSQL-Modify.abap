*---------------------------------------------------------------------*
* MODIFY
*---------------------------------------------------------------------*
*
* ENGLISH:
*
* MODIFY can update an existing record or insert a new record.
*
* If the key already exists:
* -> The existing record is updated.
*
* If the key does not exist:
* -> A new record can be inserted.
*
* Example:
*
* DATA wa_employees LIKE zemployees.
*
* CLEAR wa_employees.
*
* wa_employees-employee = '01000101'.
* wa_employees-surname  = 'YAVUZ'.
* wa_employees-forename = 'BURC'.
* wa_employees-title    = 'MR'.
* wa_employees-dob      = '19820808'.
*
* MODIFY zemployees FROM wa_employees.
*
* IF sy-subrc = 0.
*   WRITE: 'Record modified successfully'.
* ELSE.
*   WRITE: 'Return code: ', sy-subrc.
* ENDIF.
*
*---------------------------------------------------------------------*
* TURKISH:
*
* MODIFY, mevcut bir kaydı güncelleyebilir veya yeni kayıt ekleyebilir.
*
* Eğer aynı key zaten varsa:
* -> Mevcut kayıt güncellenir.
*
* Eğer key yoksa:
* -> Yeni kayıt eklenebilir.
*
* Örnek:
*
* DATA wa_employees LIKE zemployees.
*
* CLEAR wa_employees.
*
* wa_employees-employee = '01000101'.
* wa_employees-surname  = 'YAVUZ'.
* wa_employees-forename = 'BURC'.
* wa_employees-title    = 'MR'.
* wa_employees-dob      = '19820808'.
*
* MODIFY zemployees FROM wa_employees.
*
* IF sy-subrc = 0.
*   WRITE: 'Record modified successfully'.
* ELSE.
*   WRITE: 'Return code: ', sy-subrc.
* ENDIF.
*
*---------------------------------------------------------------------*
* QUICK DIFFERENCE
*---------------------------------------------------------------------*
*
* INSERT = Yeni kayıt ekler
* UPDATE = Var olan kaydı değiştirir
* MODIFY = Varsa değiştirir, yoksa ekler
*
*---------------------------------------------------------------------*