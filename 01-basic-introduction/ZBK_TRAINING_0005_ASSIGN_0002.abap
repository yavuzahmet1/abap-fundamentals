*&---------------------------------------------------------------------*
*& Report ZBK_TRAIN_0005_ASSIGN_0002
*&---------------------------------------------------------------------*
*& Practice - IF, PARAMETER (2)
*& Task: Letter Grade Calculation
*&---------------------------------------------------------------------*
REPORT ZBK_TRAINING_0005_ASSIGN_0002.

Parameters: p_grade type i.

START-OF-SELECTION.

if p_grade < 0 or p_grade > 100.
  message 'Please enter a valid grade between 0 and 100!' type 'I'.

else.

  if p_grade >= 0 and p_grade <= 20.
    write: / 'Your Letter Grade is FF'.

   elseif p_grade > 20 and p_grade <= 40.
     write: / 'Your Letter Grade is DD'.

   elseif p_grade > 40 and p_grade <= 60.
     write: / 'Your Letter Grade is CC'.

   elseif p_grade > 60 and p_grade <= 80.
     write: / 'Your Letter Grade is BB'.

   elseif p_grade > 80 and p_grade <= 100.
     write: / 'Your Letter Grade is AA'.

endif.

endif.