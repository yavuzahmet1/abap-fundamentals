*&---------------------------------------------------------------------*
*& Report ZBK_EGITIM_0001
*&---------------------------------------------------------------------*
REPORT ZBK_TRAINING_0001.

* 1. Variable Declarations (Chaining with DATA: is cleaner)
DATA: gv_desg1 TYPE p DECIMALS 2,
      gv_desg2 TYPE int4,
      gv_desg3 TYPE n LENGTH 3, " Length set to 3 to fit '324'
      gv_desg4 TYPE c LENGTH 1, " Character length specified as 1
      gv_desg5 TYPE string.

* 2. Value Assignments (Spaces added on both sides of the equals sign)
* ATTENTION: In ABAP, use SINGLE QUOTES (') for value assignments, NOT DOUBLE QUOTES (")!

gv_desg1 = '12.54'.
gv_desg1 = '23.456'. " Since this is assigned last, the value will be rounded and stored as 23.46

gv_desg2 = 12345.
gv_desg2 = 123442423.

gv_desg3 = '324'. " Since it is TYPE n (numeric text), it's safer to enclose it in single quotes

gv_desg4 = 'A'.
gv_desg4 = 'b'.

gv_desg5 = 'Any sentence can be written here.'.

* 3. Screen Output (To display the assigned values on the screen)
WRITE: / 'Variable 1 (p)      :', gv_desg1,
       / 'Variable 2 (int4)   :', gv_desg2,
       / 'Variable 3 (n)      :', gv_desg3,
       / 'Variable 4 (c)      :', gv_desg4,
       / 'Variable 5 (string) :', gv_desg5.