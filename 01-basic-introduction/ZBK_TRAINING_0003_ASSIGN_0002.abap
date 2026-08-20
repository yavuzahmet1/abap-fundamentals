*&---------------------------------------------------------------------*
*& Report ZBK_TRAIN_0003_HW_0002
*&---------------------------------------------------------------------*
*& ASSIGNMENT QUESTION: Practice - IF, MOD (2)
*& Find numbers between 0 and 100 that are exactly divisible by 2, 3, and 5.
*& Output them in a comma-separated format on a single line.
*&---------------------------------------------------------------------*
REPORT ZBK_TRAIN_0003_HW_0002.

* 1. Variable Declaration
DATA: gv_num       TYPE i,
      gv_num_str   TYPE string,
      gv_result_2  TYPE string,
      gv_result_3  TYPE string,
      gv_result_5  TYPE string.

* 2. Initial Value
gv_num = 1. " Starting from 1 (since 0 is divisible by all, but the expected output starts from 2, 3, 5)

* 3. Main Loop
WHILE gv_num <= 100.

  " Convert the integer to a string and remove empty spaces (CONDENSE)
  gv_num_str = gv_num.
  CONDENSE gv_num_str.

  " Check if divisible by 2
  IF gv_num MOD 2 = 0.
    IF gv_result_2 IS INITIAL.
      gv_result_2 = gv_num_str.
    ELSE.
      gv_result_2 = gv_result_2 && ',' && gv_num_str. " String concatenation
    ENDIF.
  ENDIF.

  " Check if divisible by 3
  IF gv_num MOD 3 = 0.
    IF gv_result_3 IS INITIAL.
      gv_result_3 = gv_num_str.
    ELSE.
      gv_result_3 = gv_result_3 && ',' && gv_num_str.
    ENDIF.
  ENDIF.

  " Check if divisible by 5
  IF gv_num MOD 5 = 0.
    IF gv_result_5 IS INITIAL.
      gv_result_5 = gv_num_str.
    ELSE.
      gv_result_5 = gv_result_5 && ',' && gv_num_str.
    ENDIF.
  ENDIF.

  " Increment the counter!
  gv_num = gv_num + 1.

ENDWHILE.

* 4. Display the results
WRITE: / 'Numbers exactly divisible by 2: ', gv_result_2.
WRITE: / 'Numbers exactly divisible by 3: ', gv_result_3.
WRITE: / 'Numbers exactly divisible by 5: ', gv_result_5.

"CONSENSE Command : When ABAP converts numbers into text (strings),
"it usually adds leading spaces by default (e.g., "  2"). The CONDENSE command removes these unnecessary spaces,
"acting exactly like the .trim() method in JavaScript.

"IS INITIAL Check: This condition checks whether a variable is completely empty or in its default initial state
"(similar to checking for null, undefined, or an empty string "" in other languages).
"We used it to ensure we didn't place a comma before the very first number in the loop.

"&& Operator: In modern ABAP, this is the string concatenation operator used to join two text values together.
"It works just like the + operator in JavaScript or the . (dot) operator in PHP.