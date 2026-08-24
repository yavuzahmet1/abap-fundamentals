# ABAP Practice: Checkbox Operations

## Problem Statement (Soru)
Create an ABAP program with three checkboxes on the selection screen: 
* **ADD 2**
* **ADD 3**
* **ADD 5**

Define a default numeric variable with an initial starting value of `10`. The program should evaluate which checkboxes the user has selected, add the corresponding values to the initial default variable, and print the final calculated result to the screen.

### Example Scenarios
* **Example 1:**
  * Selected Checkboxes: ADD 2, ADD 5
  * Calculation: (10 + 2 + 5)
  * Output: 17
* **Example 2:**
  * Selected Checkboxes: ADD 2, ADD 3, ADD 5
  * Calculation: (10 + 2 + 3 + 5)
  * Output: 20
* **Example 3:**
  * Selected Checkboxes: ADD 3
  * Calculation: (10 + 3)
  * Output: 13

---

## Solution

```abap
*&---------------------------------------------------------------------*
*& Report ZBK_TRAINING_0005_ASSIGN_0005
*&---------------------------------------------------------------------*
*& PROBLEM STATEMENT:
*& There will be three checkboxes on the screen (ADD 2, ADD 3, ADD 5).
*& A default numeric variable is defined with a value of 10.
*& The program adds the values of the selected checkboxes to this 
*& variable and prints the final result.
*&---------------------------------------------------------------------*
REPORT ZBK_TRAINING_0005_ASSIGN_0005.

PARAMETERS: p_num2 AS CHECKBOX,
            p_num3 AS CHECKBOX,
            p_num5 AS CHECKBOX.

DATA: gv_result TYPE i VALUE 10.

START-OF-SELECTION.

  " Add 2 if the first checkbox is selected
  IF p_num2 EQ abap_true.
    gv_result = gv_result + 2.
  ENDIF.

  " Add 3 if the second checkbox is selected
  IF p_num3 EQ abap_true.
    gv_result = gv_result + 3.
  ENDIF.

  " Add 5 if the third checkbox is selected
  IF p_num5 EQ abap_true.
    gv_result = gv_result + 5. 
  ENDIF.

  " Output the final result
  WRITE: / gv_result.