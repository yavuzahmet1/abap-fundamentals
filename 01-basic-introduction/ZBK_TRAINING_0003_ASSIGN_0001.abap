*&---------------------------------------------------------------------*
*& Report ZBK_TRAIN_0003_HW_0001
*&---------------------------------------------------------------------*
*& ASSIGNMENT QUESTION: Practice - IF, MOD (1)
*& When the program is executed, it should provide the following output:
*& 
*& Even Number: 0
*& Odd Number : 1
*& Even Number: 2
*& Odd Number : 3
*& ...
*& Even Number: 100
*&---------------------------------------------------------------------*
REPORT ZBK_TRAIN_0003_HW_0001.

* 1. Variable Declaration
DATA: gv_num1 TYPE i.

* 2. Initial Value (Starting from 0)
gv_num1 = 0.

* 3. Loop from 0 to 100
WHILE gv_num1 <= 100.

  " If the remainder of division by 2 is 0, it's an even number
  IF gv_num1 MOD 2 = 0.
    WRITE: / 'Even Number :', gv_num1.
  ELSE.
    WRITE: / 'Odd Number  :', gv_num1.
  ENDIF.

  " Increment the counter by 1 for the next iteration
  gv_num1 = gv_num1 + 1.

ENDWHILE.