* ==============================================================================
* LESSON: Understanding ABAP Function Modules (SE37)
* ==============================================================================
* In this lesson, we created a Function Group and a Function Module (FM)
* using transaction SE37. 
*
* --- PARAMETER EXPLANATIONS ---
*
* 1. IMPORTING (IV_NUM1, IV_NUM2):
*    - These are the input parameters we send into the module.
*    - Defined as INT4 (Integer) with DEFAULT values of 10 and 2.
*
* 2. EXPORTING (EV_RESULT):
*    - This is the output parameter used to send the processed result
*      (division result) back to the calling program.
*
* 3. CHANGING (CV_MESSAGE):
*    - Acts as both input and output. You can pass a value, modify it
*      inside the FM, and return the updated value (Type: CHAR20).
*
* 4. EXCEPTIONS (DIVIDED_BY_ZERO):
*    - Handles anticipated errors. Dividing by zero causes a system crash.
*    - We define this to gracefully catch the error instead of crashing.
*
* --- IMPORTANT FLAGS EXPLAINED ---
* - Optional: If checked, the calling program is not required to provide this parameter.
* - Pass by Value: Creates a local copy of the variable inside the FM. This protects 
*   the original data from being accidentally altered. (By default, ABAP uses 
*   "Pass by Reference", which points directly to the original memory address).
* ==============================================================================

FUNCTION ZBK_TRAINING_0007_FUNC.
*"----------------------------------------------------------------------
*"*"Local Interface:
*"  IMPORTING
*"     REFERENCE(IV_NUM1) TYPE  INT4 DEFAULT 10
*"     REFERENCE(IV_NUM2) TYPE  INT4 DEFAULT 2
*"  EXPORTING
*"     REFERENCE(EV_RESULT) TYPE  INT4
*"  CHANGING
*"     REFERENCE(CV_MESSAGE) TYPE  CHAR20
*"  EXCEPTIONS
*"      DIVIDED_BY_ZERO
*"----------------------------------------------------------------------

  " Perform the mathematical division operation
  ev_result = iv_num1 / iv_num2.

  " Modifying the changing parameter to send back a new text
  cv_message = 'Modified data'.

ENDFUNCTION.