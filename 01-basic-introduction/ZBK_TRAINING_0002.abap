*&---------------------------------------------------------------------*
*& Report ZBK_TRAINING_0002
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZBK_TRAINING_0002.

**DATA gv_variable1 TYPE i.
**DATA gv_variable2 TYPE n LENGTH 10.

* This is a comment
* It does not affect the program flow
DATA: gv_variable1 TYPE i,
      gv_variable2 TYPE n LENGTH 10,
      gv_result    TYPE i,
      gv_text      TYPE string.

* Assigning values
gv_variable1 = 100.
gv_variable2 = 10.

*WRITE gv_variable1.
*WRITE gv_variable2.

gv_text = 'Result = '.

* Addition
gv_result = gv_variable1 + gv_variable2.
WRITE / gv_result.   " Print on a new line

* Subtraction
gv_result = gv_variable1 - gv_variable2.
WRITE / gv_result.   " Print on a new line

* Displaying text and result together
WRITE: / gv_text, gv_result. " Print on a new line

* Displaying custom string and result together
WRITE: / 'Result = = ', gv_result. " Print on a new line