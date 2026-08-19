*&---------------------------------------------------------------------*
*& Report ZBK_TRAINING_0002
*&---------------------------------------------------------------------*
*& Mathematical Operations, Conditions, and Loops
*&---------------------------------------------------------------------*
REPORT ZBK_TRAINING_0002.

* This is a comment
* It does not affect the program flow
DATA: gv_variable1 TYPE i,
      gv_variable3 TYPE i,
      gv_variable2 TYPE n LENGTH 10,
      gv_result    TYPE i,
      gv_text      TYPE string.

* Assigning values
gv_variable1 = 1.
gv_variable2 = 10.
gv_variable3 = 7.

gv_text = 'Result = '.

* ==========================================
* 1. MATHEMATICAL OPERATIONS
* ==========================================

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

* ==========================================
* 2. CONDITIONS (IF / ELSEIF / ELSE)
* ==========================================
IF gv_variable1 = gv_variable2.
  WRITE: / 'Both values are equal to each other.'.
ELSEIF gv_variable1 > gv_variable2.
  WRITE: / 'First number is biggest!'.
ELSE.
  WRITE: / 'Second number is biggest!'.
ENDIF.

* ==========================================
* 3. CONDITIONS (CASE / WHEN)
* ==========================================
CASE gv_variable3.
  WHEN 1.
    WRITE: / 'Variable value is 1.'.
  WHEN 2.
    WRITE: / 'Variable value is 2.'.
  WHEN 3.
    WRITE: / 'Variable value is 3.'.
  WHEN 4.
    WRITE: / 'Variable value is 4.'.
  WHEN 5.
    WRITE: / 'Variable value is 5.'.
  WHEN 6.
    WRITE: / 'Variable value is 6.'.
  WHEN 7.
    WRITE: / 'Variable value is 7.'.
  WHEN 8.
    WRITE: / 'Variable value is 8.'.
  WHEN OTHERS.
    WRITE: / 'It is not equal to any value.'.
ENDCASE.

* ==========================================
* 4. LOOPS (DO & WHILE)
* ==========================================

* DO Loop Example
DO 10 TIMES.
 gv_variable1 = gv_variable1 + 1.
 WRITE: / gv_variable1, 'We are learning SAP with DO loop.'.
ENDDO.

* Resetting the variable before WHILE loop
gv_variable1 = 0.

* WHILE Loop Example
WHILE gv_variable1 < 10.
 gv_variable1 = gv_variable1 + 1.
 WRITE: / gv_variable1, 'We are learning SAP with WHILE loop.'.
ENDWHILE.

* ==========================================
* APPENDIX: ABAP LOGICAL OPERATORS
* ==========================================
* Symbol | Keyword | Meaning (English)
* ------------------------------------------
*   <    |   LT    | Less Than
*   >    |   GT    | Greater Than
*   <=   |   LE    | Less than or Equal to
*   >=   |   GE    | Greater than or Equal to
*   =    |   EQ    | Equal to
*   <>   |   NE    | Not Equal to