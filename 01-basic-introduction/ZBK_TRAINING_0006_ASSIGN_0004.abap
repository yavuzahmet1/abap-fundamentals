*&---------------------------------------------------------------------*
*& Report ZBK_TRAINING_0006_ASSIGN_0004
*&---------------------------------------------------------------------*
*& TASK (QUESTION):
*& Create a login screen with two character type parameters: User & Password.
*& The Password field should display as **** when typing.
*& If User: 'sapuser' and Password: '12345678', print success message.
*& If any of them is incorrect, print a specific error message stating 
*& which one is wrong.
*&---------------------------------------------------------------------*
REPORT ZBK_TRAINING_0006_ASSIGN_0004.

" 1. Define Parameters
" Note: LOWER CASE is used to prevent ABAP from automatically converting inputs to uppercase.
" MODIF ID 'pw' tags the password parameter so we can modify it dynamically.
PARAMETERS: p_user TYPE char20 LOWER CASE,
            p_pass TYPE char20 LOWER CASE MODIF ID pw.

" 2. Mask the password field with asterisks (****)
AT SELECTION-SCREEN OUTPUT.
  LOOP AT SCREEN.
    IF screen-group1 = 'PW'.
      screen-invisible = 1. " This setting masks the input
      MODIFY SCREEN.
    ENDIF.
  ENDLOOP.

" 3. Login Validation Logic
START-OF-SELECTION.

  " Check if the user is correct
  IF p_user <> 'sapuser'.
    WRITE: 'Hata: Kullanıcı adı (User) hatalı girildi!'.
    
  " Check if the password is correct
  ELSEIF p_pass <> '12345678'.
    WRITE: 'Hata: Şifre (Password) hatalı girildi!'.
    
  " If both are correct
  ELSE.
    WRITE: 'Başarılı bir şekilde sisteme bağlandınız.'.
  ENDIF.