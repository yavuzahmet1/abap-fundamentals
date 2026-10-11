*&---------------------------------------------------------------------*
*& Report Z_WHILE_LOOP_EXAMPLE
*&---------------------------------------------------------------------*
REPORT z_while_loop_example.

DATA lv_counter TYPE i VALUE 15.

WRITE: / 'Countdown sequence starting...'.
ULINE.

" The loop will keep running as long as the condition is true
WHILE lv_counter > 0.
  
  " Decrease the counter by 1 in each iteration
  lv_counter = lv_counter - 1.

  " Skip the number 13 
  IF lv_counter = 13.
    WRITE: / 'Number 13 is skipped.'.
    CONTINUE. 
  ENDIF.

  " Terminate the entire loop if the counter reaches 5
  IF lv_counter = 5.
    WRITE: / 'Counter reached 5. Emergency stop!'.
    EXIT. 
  ENDIF.

  WRITE: / 'Current count:', lv_counter.

ENDWHILE.

ULINE.
WRITE: / 'Countdown finished.'.