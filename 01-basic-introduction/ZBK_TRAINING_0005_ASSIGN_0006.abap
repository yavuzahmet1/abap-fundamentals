# ABAP Practice: Radiobutton Operations

## Problem Statement
Create an ABAP program that includes two numeric input parameters and four radio buttons on the selection screen: 
* **ADDITION**
* **SUBTRACTION**
* **MULTIPLICATION**
* **DIVISION**

The program should take the two numbers entered by the user, perform the mathematical operation corresponding to the selected radio button, and print the calculated result to the screen. *(Note: The original prompt suggests doing the arithmetic operations inside `FORM` routines, but using a `CASE` statement in the main block is also a perfectly valid and direct way to solve it, as shown below).*

### Example Scenarios
* **Example 1:**
  * Parameter 1: 10
  * Parameter 2: 20
  * Selected Radiobutton: MULTIPLICATION
  * Calculation: (10 * 20)
  * Output: 200
* **Example 2:**
  * Parameter 1: 23
  * Parameter 2: 4
  * Selected Radiobutton: SUBTRACTION
  * Calculation: (23 - 4)
  * Output: 19

---

## Solution

```abap
*&---------------------------------------------------------------------*
*& Report ZBK_TRAINING_0005_ASSIGN_0006
*&---------------------------------------------------------------------*
*& PROBLEM STATEMENT:
*& There will be two input parameters and four radiobuttons on the 
*& screen (ADDITION, SUBTRACTION, MULTIPLICATION, DIVISION).
*& The program applies the selected arithmetic operation to the two 
*& input numbers and prints the result to the screen.
*&---------------------------------------------------------------------*
REPORT ZBK_TRAINING_0005_ASSIGN_0006.

PARAMETERS: p_num1 TYPE i,
            p_num2 TYPE i.

PARAMETERS: p_sum RADIOBUTTON GROUP gr1,
            p_sub RADIOBUTTON GROUP gr1,
            p_mul RADIOBUTTON GROUP gr1,
            p_div RADIOBUTTON GROUP gr1.

DATA: gv_result TYPE i.

START-OF-SELECTION.

  " Check which radiobutton is currently active (abap_true)
  CASE abap_true.
    WHEN p_sum.
      gv_result = p_num1 + p_num2.
    WHEN p_sub.
      gv_result = p_num1 - p_num2.
    WHEN p_mul.
      gv_result = p_num1 * p_num2.
    WHEN p_div.
      " Note: In a production environment, check for division by zero here
      gv_result = p_num1 / p_num2.
  ENDCASE.

  " Output the final calculated result
  WRITE: gv_result.