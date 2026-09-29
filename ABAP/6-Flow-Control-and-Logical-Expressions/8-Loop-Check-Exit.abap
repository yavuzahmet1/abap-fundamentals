*&---------------------------------------------------------------------*
*& Report Z_LOOP_TERMINATION_CHECK
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_loop_termination_check.

DATA lv_number TYPE i.

DO 10 TIMES.
  lv_number = sy-index.

  " 1, 2 ve 3 için bu döngü turunun kalanını atla.
  CHECK lv_number > 3.

  " 7'ye gelince döngüyü tamamen bitir.
  IF lv_number = 7.
    EXIT.
  ENDIF.

  WRITE: / 'Number:', lv_number.
ENDDO.

WRITE: / 'Loop finished.'.