# ABAP Practice: Radiobuttons, Checkboxes, and Forms

## Problem Statement
Create an ABAP program that includes two numeric input parameters, four radio buttons, and two checkboxes on the selection screen:

**Radiobuttons:**
* **ADDITION**
* **SUBTRACTION**
* **MULTIPLICATION**
* **DIVISION**

**Checkboxes:**
* **Multiply by 10**
* **Divide by 2**

The program must take the two entered numbers and perform the mathematical operation corresponding to the selected radio button. **Crucial Requirement:** The logic for each radio button's arithmetic operation MUST be placed inside its own `FORM` routine.

After the initial radio button calculation, the program should check if any checkboxes are selected. If they are, it should apply those operations to the current result sequentially. Finally, print the ultimate calculated result to the screen.

### Example Scenarios
* **Example 1:**
  * Parameter 1: 10
  * Parameter 2: 20
  * Selected Radiobutton: MULTIPLICATION
  * Selected Checkboxes: Multiply by 10, Divide by 2
  * Calculation: (10 * 20) * 10 / 2
  * Output: 1000
* **Example 2:**
  * Parameter 1: 23
  * Parameter 2: 5
  * Selected Radiobutton: SUBTRACTION
  * Selected Checkbox: Divide by 2
  * Calculation: (23 - 5) / 2
  * Output: 9

---

## Solution

```abap
*&---------------------------------------------------------------------*
*& Report ZBK_TRAINING_0005_ASSIGN_0007
*&---------------------------------------------------------------------*
*& PROBLEM STATEMENT:
*& There will be two input parameters, four radiobuttons (ADD, SUB, MUL, DIV),
*& and two checkboxes (Multiply by 10, Divide by 2).
*& The arithmetic operation for the radiobuttons MUST be done in a FORM.
*& Checkbox operations are applied to the result of the FORM calculation.
*&---------------------------------------------------------------------*
REPORT ZBK_TRAINING_0005_ASSIGN_0007.

" Input parameters
PARAMETERS: p_num1 TYPE p DECIMALS 2,
            p_num2 TYPE p DECIMALS 2.

" Radiobuttons for primary calculation
PARAMETERS: p_sum RADIOBUTTON GROUP gr1,
            p_sub RADIOBUTTON GROUP gr1,
            p_mul RADIOBUTTON GROUP gr1,
            p_div RADIOBUTTON GROUP gr1.

" Checkboxes for secondary calculation
PARAMETERS: p_chk10 AS CHECKBOX, " Multiply by 10
            p_chk2  AS CHECKBOX. " Divide by 2

" Variable to hold the result
DATA: gv_result TYPE p DECIMALS 2.

START-OF-SELECTION.

  " 1. Perform the primary operation using FORM routines based on the radiobutton
  CASE abap_true.
    WHEN p_sum.
      PERFORM calculate_sum USING p_num1 p_num2 CHANGING gv_result.
    WHEN p_sub.
      PERFORM calculate_sub USING p_num1 p_num2 CHANGING gv_result.
    WHEN p_mul.
      PERFORM calculate_mul USING p_num1 p_num2 CHANGING gv_result.
    WHEN p_div.
      PERFORM calculate_div USING p_num1 p_num2 CHANGING gv_result.
  ENDCASE.

  " 2. Apply checkbox operations sequentially if selected
  IF p_chk10 EQ abap_true.
    gv_result = gv_result * 10.
  ENDIF.

  IF p_chk2 EQ abap_true.
    gv_result = gv_result / 2.
  ENDIF.

  " 3. Output the final calculated result
  WRITE: / 'Result:', gv_result.


*&---------------------------------------------------------------------*
*&      FORM Routines for Arithmetic Operations
*&---------------------------------------------------------------------*

FORM calculate_sum USING pv_num1 TYPE p pv_num2 TYPE p CHANGING cv_result TYPE p.
  cv_result = pv_num1 + pv_num2.
ENDFORM.

FORM calculate_sub USING pv_num1 TYPE p pv_num2 TYPE p CHANGING cv_result TYPE p.
  cv_result = pv_num1 - pv_num2.
ENDFORM.

FORM calculate_mul USING pv_num1 TYPE p pv_num2 TYPE p CHANGING cv_result TYPE p.
  cv_result = pv_num1 * pv_num2.
ENDFORM.

FORM calculate_div USING pv_num1 TYPE p pv_num2 TYPE p CHANGING cv_result TYPE p.
  " Safety check to prevent division by zero runtime errors
  IF pv_num2 NE 0.
    cv_result = pv_num1 / pv_num2.
  ELSE.
    WRITE: / 'Error: Division by zero is not allowed.'.
    EXIT.
  ENDIF.
ENDFORM.