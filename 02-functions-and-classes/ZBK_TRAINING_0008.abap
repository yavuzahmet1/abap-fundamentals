*&---------------------------------------------------------------------*
*& Report ZBK_TRAINING_0008
*& Title: Calling a Function Module and Handling Exceptions
*&---------------------------------------------------------------------*
*& This report demonstrates how to call a custom Function Module (FM) 
*& from an executable program (SE38) and how to handle system 
*& return codes (sy-subrc) to prevent runtime errors (dumps).
*&---------------------------------------------------------------------*
REPORT ZBK_TRAINING_0008.

" 1. Data Declaration
DATA: gv_num1    TYPE int4,
      gv_num2    TYPE int4,
      gv_result  TYPE int4,
      gv_message TYPE char20.

START-OF-SELECTION.

" 2. Initializing Variables (Testing the Exception)
gv_num1 = 100.
gv_num2 = 0. " <-- We are intentionally passing 0 to trigger the exception!
gv_message = 'Resul is ok.'.

" 3. Calling the Function Module
" TIP: You don't have to type this manually! In SE38, click the 'Pattern' 
" button (Ctrl+F6), enter your FM name, and SAP will generate this block.
  CALL FUNCTION 'ZBK_TRAINING_0007_FUNC'
   EXPORTING
     " Note the inversion! EXPORTING here sends data TO the FM's IMPORTING parameters.
     IV_NUM1         = gv_num1
     IV_NUM2         = gv_num2
   IMPORTING
     " IMPORTING here receives data FROM the FM's EXPORTING parameters.
     EV_RESULT       = gv_result
   CHANGING
     " CHANGING is a two-way street. It sends 'gv_message' in, and updates 
     " it if the FM modifies it.
     CV_MESSAGE      = gv_message
   EXCEPTIONS
     " Linking the FM exceptions to our local sy-subrc values.
     DIVIDED_BY_ZERO = 1
     OTHERS          = 2.

" 4. Error Handling and Output
" sy-subrc is a system variable that stores the return code of the last statement.
  IF sy-subrc EQ 0.
     " sy-subrc = 0 means the function ran successfully without any errors.
     WRITE: / 'Result : ', gv_result.
     WRITE: / 'Message : ', gv_message.
     
  ELSEIF sy-subrc EQ 1.
    " sy-subrc = 1 means the FM caught our 'DIVIDED_BY_ZERO' exception.
    " This prevents a system crash (dump) and lets us display a friendly message.
    WRITE: / 'You cannot divide by zero.'.
  ENDIF.