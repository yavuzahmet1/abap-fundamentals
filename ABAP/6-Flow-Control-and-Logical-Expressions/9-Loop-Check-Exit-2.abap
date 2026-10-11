*&---------------------------------------------------------------------*
*& Report Z_LOOP_CONTROL_EXAMPLE
*&---------------------------------------------------------------------*
REPORT z_loop_control_example.

DATA: lt_numbers TYPE TABLE OF i,
      lv_num     TYPE i.

" Populate the internal table with numbers from 1 to 10
DO 10 TIMES.
  APPEND sy-index TO lt_numbers.
ENDDO.

WRITE: / 'Loop starting...'.
ULINE.

LOOP AT lt_numbers INTO lv_num.

  " Skip even numbers (Moves to the next iteration if the condition is met)
  " This serves the same purpose as CHECK in the previous example.
  IF lv_num MOD 2 = 0.
    CONTINUE.
  ENDIF.

  " Terminate the loop completely when the number reaches 9 (EXIT usage)
  IF lv_num = 9.
    WRITE: / 'Reached number 9, breaking the loop!'.
    EXIT.
  ENDIF.

  WRITE: / 'Processed odd number:', lv_num.

ENDLOOP.

ULINE.
WRITE: / 'Program finished.'.