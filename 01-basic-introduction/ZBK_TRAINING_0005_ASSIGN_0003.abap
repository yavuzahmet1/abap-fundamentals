*&---------------------------------------------------------------------*
*& Report ZBK_TRAIN_0005_ASSIGN_0003
*&---------------------------------------------------------------------*
*& Practice 3: Find the Middle Number
*& Task: Have three numerical parameters on the screen.
*& Write a program that indicates which of the entered numbers
*& is between the other two.
*&---------------------------------------------------------------------*
REPORT ZBK_TRAIN_0005_ASSIGN_0003.

" 3 numbers to be taken from the screen (Parameters)
PARAMETERS: p_num1 TYPE i,
            p_num2 TYPE i,
            p_num3 TYPE i.

START-OF-SELECTION.

  " Check if the 1st number is in the middle
  IF ( p_num1 > p_num2 AND p_num1 < p_num3 ) OR
     ( p_num1 < p_num2 AND p_num1 > p_num3 ).

    WRITE: / |First number ({ p_num1 }) is in the middle of { p_num2 } and { p_num3 }.|.

  " Check if the 2nd number is in the middle
  ELSEIF ( p_num2 > p_num1 AND p_num2 < p_num3 ) OR
         ( p_num2 < p_num1 AND p_num2 > p_num3 ).

    WRITE: / |Second number ({ p_num2 }) is in the middle of { p_num1 } and { p_num3 }.|.

  " Check if the 3rd number is in the middle
  ELSEIF ( p_num3 > p_num1 AND p_num3 < p_num2 ) OR
         ( p_num3 < p_num1 AND p_num3 > p_num2 ).

    WRITE: / |Third number ({ p_num3 }) is in the middle of { p_num1 } and { p_num2 }.|.

  " If the numbers are equal or a middle number cannot be found
  ELSE.
    WRITE: / |Cannot determine a single middle number. You entered: { p_num1 }, { p_num2 }, and { p_num3 }.|.

  ENDIF.