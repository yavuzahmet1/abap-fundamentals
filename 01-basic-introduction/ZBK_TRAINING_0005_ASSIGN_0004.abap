*&---------------------------------------------------------------------*
*& Report Z_PRACTICE_CASE_WHEN
*&---------------------------------------------------------------------*
REPORT z_practice_case_when.

* 1. Define the input parameters for the selection screen
PARAMETERS: p_num1  TYPE i OBLIGATORY,         " First Number
            p_num2  TYPE i OBLIGATORY,         " Second Number
            p_islem TYPE c LENGTH 1 OBLIGATORY. " Operation

* Define a variable to store the result 
* (Using type 'p' with decimals in case of division)
DATA: gv_result TYPE p DECIMALS 2.

START-OF-SELECTION.

* 2. Use the CASE WHEN structure to apply the mathematical operation
  CASE p_islem.
    WHEN '+'.
      gv_result = p_num1 + p_num2.
      
    WHEN '-'.
      gv_result = p_num1 - p_num2.
      
    WHEN '*'.
      gv_result = p_num1 * p_num2.
      
    WHEN '/'.
      " Guard against division by zero
      IF p_num2 = 0.
        WRITE: / 'Error: Cannot divide by zero!'.
        EXIT. " Stop processing
      ELSE.
        gv_result = p_num1 / p_num2.
      ENDIF.
      
    WHEN OTHERS.
      WRITE: / 'Error: Invalid operation entered! Please use +, -, *, or /'.
      EXIT. " Stop processing
  ENDCASE.

* 3. Print the result to the screen
  WRITE: / 'Result', gv_result.