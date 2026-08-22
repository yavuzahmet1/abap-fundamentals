*&---------------------------------------------------------------------*
*& Report ZBK_TRAINING_0004
*&---------------------------------------------------------------------*
*& Description: Basic Open SQL Operations (SELECT, UPDATE, INSERT, DELETE, MODIFY)
*&---------------------------------------------------------------------*
REPORT ZBK_TRAINING_0004.

* --- 1. DATA DECLARATIONS ---
DATA: gv_persid      TYPE ZBK_PERSID_DE,       " Single variable for Personnel ID
      gv_persname    TYPE ZBK_PERSNAME_DE,     " Single variable for Name
      gv_perssurname TYPE ZBK_PERSSURNAMEE_DE, " Single variable for Surname
      gv_persgender  TYPE ZBK_PERSGENDERR_DE,  " Single variable for Gender
      
      gs_pers_t      TYPE ZBK_PERS_T,          " Work Area (holds a single record/row)
      gt_pers_t      TYPE TABLE OF ZBK_PERS_T. " Internal Table (holds multiple records/rows)


* ---------------------------------------------------------------------*
* EXAMPLES OF OPEN SQL COMMANDS (Currently commented out for reference)
* ---------------------------------------------------------------------*

* --- SELECT (Read Data) ---
* Fetch all records into the internal table
* SELECT * FROM ZBK_PERS_T
*   INTO TABLE gt_pers_t.
*   WHERE personel_id EQ 1.

* Fetch a single record into the work area
* SELECT SINGLE * FROM zbk_pers_t
*   INTO gs_pers_t.

* Fetch only the ID field into a single variable
* SELECT SINGLE PERSONEL_ID FROM ZBK_PERS_T
*   INTO gv_persid.

* --- UPDATE (Modify existing data directly) ---
* UPDATE ZBK_PERS_T SET PERS_NAME = 'CABBAR'
* WHERE PERSONEL_ID EQ 2.
* WRITE : 'Updated!'.

* --- INSERT (Add new data) ---
* Populate work area
* gs_pers_t-personel_id = 3.
* gs_pers_t-pers_name = 'JHON'.
* gs_pers_t-personel_surname = 'MASH'.
* gs_pers_t-personel_gender = 'M'.
* Insert work area into database table
* INSERT zbk_pers_t FROM gs_pers_t.
* WRITE : 'Personel Added!'.

* --- DELETE (Remove data) ---
* DELETE FROM ZBK_PERS_T WHERE personel_id EQ 2.
* WRITE : 'Personel Deleted!'.


* ---------------------------------------------------------------------*
* ACTIVE CODE: MODIFY 
* Note: MODIFY acts as INSERT if the primary key does not exist, 
*       and acts as UPDATE if the primary key already exists.
* ---------------------------------------------------------------------*

* 1. Populate the work area with data
gs_pers_t-personel_id      = 13.       " Set Key Field
gs_pers_t-pers_name        = 'Günay'.  " Set Name
gs_pers_t-personel_surname = 'AYDIN'.  " Set Surname
gs_pers_t-personel_gender  = 'F'.      " Set Gender

* 2. Execute MODIFY command
MODIFY ZBK_PERS_T FROM gs_pers_t.

* 3. (Optional but recommended) Check if the operation was successful
IF sy-subrc = 0.
  WRITE: 'Record successfully modified!'.
ENDIF.