*&---------------------------------------------------------------------*
*& Report ZBK_TRAINING_0008_ASSIGN_1_RND
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZBK_TRAINING_0008_ASSIGN_1_RND.

DATA: gv_random_number type int4.

START-OF-SELECTION.

CALL FUNCTION 'ZBK_TRAINING_0008_ASSIGN_RAND'
EXPORTING
  iv_min = 0
  iv_max = 150
IMPORTING
  ev_random = gv_random_number.

WRITE: / 'The number it produces = ', gv_random_number.
WRITE: / 'On The Screen;'.

if gv_random_number >= 0 and gv_random_number <= 25.
  write: / 'It is between 0 and 25!'.

elseif gv_random_number > 25 and gv_random_number <= 50.
  write: / 'It is between 25 and 50!'.

elseif gv_random_number > 50 and gv_random_number <= 75.
  write: / 'It is between 50 and 75!'.

elseif gv_random_number > 75 and gv_random_number <= 100.
  write: / 'It is between 75 and 100!'.

elseif gv_random_number > 100 and gv_random_number <= 150.
  write: / 'It is between 100 and 150!'.

ENDIF.