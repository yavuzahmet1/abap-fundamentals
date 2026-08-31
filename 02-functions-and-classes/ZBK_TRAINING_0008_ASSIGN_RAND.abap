FUNCTION ZBK_TRAINING_0008_ASSIGN_RAND.
*"----------------------------------------------------------------------
*"*"Local Interface:
*"  IMPORTING
*"     VALUE(IV_MIN) TYPE  INT4 DEFAULT 0
*"     VALUE(IV_MAX) TYPE  INT4 DEFAULT 150
*"  EXPORTING
*"     VALUE(EV_RANDOM) TYPE  INT4
*"----------------------------------------------------------------------

CALL FUNCTION 'QF05_RANDOM_INTEGER'

    EXPORTING
      ran_int_max = iv_max
      ran_int_min = iv_min
    IMPORTING
      ran_int     = ev_random.

ENDFUNCTION.