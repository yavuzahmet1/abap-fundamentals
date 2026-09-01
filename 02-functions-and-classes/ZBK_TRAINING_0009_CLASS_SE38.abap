*&---------------------------------------------------------------------*
*& Report ZBK_TRAINING_00010
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZBK_TRAINING_00010.
DATA: go_edu_class TYPE REF TO ZBK_TRAINING_0009_CLASS.
DATA: gv_num1 type int4,
      gv_num2 type int4,
      gv_result type int4.

START-OF-SELECTION.

CREATE OBJECT go_edu_class.

" Değişkenlere değer atıyoruz
gv_num1 = 10.
gv_num2 = 20.

go_edu_class->sum_numbers(
  EXPORTING
    iv_num1 = gv_num1
    iv_num2 = gv_num2
  IMPORTING
    ev_result = gv_result
).

write: / gv_result.

ZBK_TRAINING_0009_CLASS=>sum_numbers_v2( ).