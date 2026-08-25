*&---------------------------------------------------------------------*
*& Report ZBK_TRAINING_0006
*&---------------------------------------------------------------------*
*& Description: Demonstration of Event Blocks, Forms, and Math
*&---------------------------------------------------------------------*
REPORT ZBK_TRAINING_0006.

* --- EVENT BLOCKS & PARAMETERS (Reference) ---
*PARAMETERS: p_num type int4.
*
*INITIALIZATION.
*  p_num = 12.
*
*AT SELECTION-SCREEN.
*  p_num = p_num + 1.
*
*START-OF-SELECTION.
*write: / 'Start of selection'.
*
*END-OF-SELECTION.
*write: / 'End of selection'.
* ---------------------------------------------


* --- Data Declarations ---
DATA: gv_num1 TYPE int4,
      gv_num2 TYPE int4,
      gv_num3 TYPE int4.

* --- Main Execution Block ---
START-OF-SELECTION.

  " 1. Addition (Incrementing a global variable)
  PERFORM add_one_to_the_number.
  PERFORM add_one_to_the_number.
  PERFORM add_one_to_the_number.
  PERFORM add_one_to_the_number.
  PERFORM add_one_to_the_number.

  WRITE: / 'Increment Result = ', gv_num1.

  " 2. Multiplication (Passing hardcoded values)
  PERFORM multiplication_of_two_numbers USING 23 13.

  " 3. Subtraction (Passing variables)
  gv_num2 = 18.
  gv_num3 = 6.

  PERFORM the_difference_of_two_numbers USING gv_num2 gv_num3.

END-OF-SELECTION.

*&---------------------------------------------------------------------*
*&                      Subroutines (FORMs)                            *
*&---------------------------------------------------------------------*

FORM add_one_to_the_number.
  gv_num1 = gv_num1 + 1.
ENDFORM.


FORM multiplication_of_two_numbers USING p_num1 TYPE int4
                                         p_num2 TYPE int4.
  DATA: lv_result TYPE int4.

  lv_result = p_num1 * p_num2.
  WRITE: / 'Multiplication Result = ', lv_result.
ENDFORM.


FORM the_difference_of_two_numbers USING p_num2 TYPE int4
                                         p_num3 TYPE int4.
  DATA: lv_result TYPE int4.

  lv_result = p_num2 - p_num3.
  WRITE: / 'Difference Result = ', lv_result.
ENDFORM.

*##############################
*
*As ABAP programs grow larger, keeping all the code in a single file makes it difficult to read, maintain, and debug. This is where INCLUDE programs come in.
*
*An INCLUDE program is a non-executable ABAP program used exclusively to organize and modularize code. When the main program is generated, the system literally copies the content of the INCLUDE program and pastes it into the main program at the exact
*location of the INCLUDE statement.
*
*Why do we use them?
*
*    Modularity & Readability: You can separate different parts of your code. For example, one INCLUDE for global DATA declarations, one for FORM routines, and another for UI events (PBO/PAI).
*
*    Reusability: You can use the same INCLUDE program across multiple different main programs.
*
*Example Usage:
*Instead of writing everything in the main report, you structure it like this:
*REPORT ZMY_REPORT.
*
*INCLUDE zmy_report_top. " Contains only DATA and TYPES declarations
*INCLUDE zmy_report_f01. " Contains all the FORM routines