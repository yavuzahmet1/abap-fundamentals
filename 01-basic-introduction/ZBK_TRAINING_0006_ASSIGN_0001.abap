*&---------------------------------------------------------------------*
*& Report ZBK_TRAINING_0006_ASSIGN_0001
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZBK_TRAINING_0006_ASSIGN_0001.

PARAMETERS: p_num1 type i,
            p_num2 type i.

START-OF-SELECTION.

"Call the form and pass the parameters entered on the screen

PERFORM calculate_ratio USING p_num1 p_num2.

*&---------------------------------------------------------------------*
*& Form calculate_ratio
*&---------------------------------------------------------------------*

FORM calculate_ratio USING p_val1 TYPE i
                           p_val2 TYPE i.

  " Define integers for comparison and a packed number with 2 decimals for the result

  DATA: lv_max TYPE i,
        lv_min TYPE i,
        lv_result TYPE p DECIMALS 2.

" 1. Determine which number is greater

  IF p_val1 >= p_val2.
    lv_max = p_val1.
    lv_min = p_val2.
  ELSE.
    lv_max = p_val2.
    lv_min = p_val1.
  ENDIF.

" 2. Safety check: Prevent division by zero (dump error)

IF lv_min = 0.
  WRITE: 'Error: The divisor cannot be 0!'.
  RETURN.
ENDIF.

" 3. Perform the division
lv_result = lv_max / lv_min.

" 4. Print the result to the screen in the requested format
WRITE: / lv_max, '/', lv_min, '=', lv_result.

ENDFORM.