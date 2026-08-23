*&---------------------------------------------------------------------*
*& Report ZBK_TRAINING_0005
*&---------------------------------------------------------------------*
*& Description: Selection Screen Design (Parameters, Select-Options, 
*&              Checkboxes, and Radio Button Groups with Frames)
*&---------------------------------------------------------------------*
REPORT ZBK_TRAINING_0005.

* --- 1. TABLES AND DATA DECLARATIONS ---
TABLES: ZBK_PERS_T.                            " Declare database table to use its fields

DATA: gv_perssurname TYPE ZBK_PERSSURNAMEE_DE. " Single variable for Personnel Surname


* --- 2. SINGLE VALUE INPUTS (PARAMETERS) ---
PARAMETERS: p_num1   TYPE int4,                " Standard integer input field
            p_pernam TYPE ZBK_PERSNAME_DE.     " Personnel Name input field


* --- 3. MULTIPLE VALUE/RANGE INPUTS (SELECT-OPTIONS) ---
SELECT-OPTIONS: s_persur FOR gv_perssurname,            " Range selection for Surname
                s_pergen FOR ZBK_PERS_T-PERSONEL_GENDER." Range selection for Gender


* --- 4. CHECKBOX ---
PARAMETERS: p_cbox1 AS CHECKBOX.               " Checkbox (e.g., 'I have read the form')


* --- 5. BLOCKS AND RADIO BUTTON GROUPS ---
" Block 1: Age Range Selection
SELECTION-SCREEN BEGIN OF BLOCK b11 WITH FRAME TITLE text-001.
PARAMETERS: p_rad1 RADIOBUTTON GROUP gr1,      " Age Option 1
            p_rad2 RADIOBUTTON GROUP gr1,      " Age Option 2
            p_rad3 RADIOBUTTON GROUP gr1.      " Age Option 3
SELECTION-SCREEN END OF BLOCK b11.

" Block 2: Gender Selection
SELECTION-SCREEN BEGIN OF BLOCK b12 WITH FRAME TITLE text-002.
PARAMETERS: p_rad4 RADIOBUTTON GROUP gr2,      " Gender Option 1
            p_rad5 RADIOBUTTON GROUP gr2.      " Gender Option 2
SELECTION-SCREEN END OF BLOCK b12.

" * What are text-001 and text-002?
" In the code above, TITLE text-001 and text-002 refer to Text Symbols in ABAP.
" Instead of hardcoding text directly into the source code (e.g., TITLE 'Age Range'), 
" ABAP best practices require using text symbols. 
" This approach allows the program to be easily translated into different 
" languages without changing the actual code.