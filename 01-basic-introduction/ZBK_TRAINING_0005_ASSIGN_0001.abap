*&---------------------------------------------------------------------*
*& Report ZBK_TRAIN_0005_ASSIGN_0001
*&---------------------------------------------------------------------*
*& Practice - IF, PARAMETER (1)
*& Task: Have a numerical parameter on the screen. 
*& Write an application that prints the matching condition to the screen 
*& based on the entered number in the parameter.
*&
*& Conditions;
*& - Is it between 0 and 25?
*& - Is it between 25 and 50?
*& - Is it between 50 and 75?
*& - Is it between 75 and 100?
*& - Is it greater than 100?
*&---------------------------------------------------------------------*
REPORT ZBK_TRAIN_0005_ASSIGN_0001.

PARAMETERS: p_entnum TYPE i.

START-OF-SELECTION.

  WRITE: / 'Entered Number:', p_entnum.

  IF p_entnum >= 0 AND p_entnum <= 25.
    WRITE: / 'Your number is between 0 and 25.'.
    
  ELSEIF p_entnum > 25 AND p_entnum <= 50.
    WRITE: / 'Your number is between 26 and 50.'.
    
  ELSEIF p_entnum > 50 AND p_entnum <= 75.
    WRITE: / 'Your number is between 51 and 75.'.
    
  ELSEIF p_entnum > 75 AND p_entnum <= 100.
    WRITE: / 'Your number is between 76 and 100.'.
    
  ELSEIF p_entnum > 100.
    WRITE: / 'Entered number is greater than 100!'.
    
  ELSE.
    WRITE: / 'Entered number is less than 0!'.
    
  ENDIF.