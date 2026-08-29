*&---------------------------------------------------------------------*
*& Report ZBK_TRAINING_0006_ASSIGN_0005
*&---------------------------------------------------------------------*
*& TASK (QUESTION):
*& Create a temperature converter program.
*& 1. Get a temperature value (Celsius) from the user via a parameter.
*& 2. Use radio buttons to select the conversion type (Fahrenheit or Kelvin).
*& 3. Create two separate FORMs for calculations.
*& 4. Pass the input via USING, get the result back via CHANGING.
*&---------------------------------------------------------------------*
REPORT ZBK_TRAINING_0006_ASSIGN_0005.

" 1. Parameters & Radio Buttons
PARAMETERS: p_temp TYPE p DECIMALS 2.
PARAMETERS: rb_f TYPE c RADIOBUTTON GROUP g1 DEFAULT 'X',
            rb_k TYPE c RADIOBUTTON GROUP g1.

" Variable to hold the calculated result
DATA: gv_result TYPE p DECIMALS 2.

START-OF-SELECTION.

  " 2. Check which radio button is selected and call the respective form
  IF rb_f = 'X'.
    PERFORM convert_to_fahrenheit USING p_temp CHANGING gv_result.
    WRITE: / p_temp, '°C =', gv_result, '°F'.
    
  ELSEIF rb_k = 'X'.
    PERFORM convert_to_kelvin USING p_temp CHANGING gv_result.
    WRITE: / p_temp, '°C =', gv_result, 'K'.
  ENDIF.


*&---------------------------------------------------------------------*
*& Form convert_to_fahrenheit
*& Formula: ( C * 1.8 ) + 32
*&---------------------------------------------------------------------*
FORM convert_to_fahrenheit USING p_val TYPE p
                           CHANGING p_res TYPE p.
  
  p_res = ( p_val * '1.8' ) + 32.
  
ENDFORM.

*&---------------------------------------------------------------------*
*& Form convert_to_kelvin
*& Formula: C + 273.15
*&---------------------------------------------------------------------*
FORM convert_to_kelvin USING p_val TYPE p
                       CHANGING p_res TYPE p.
  
  p_res = p_val + '273.15'.
  
ENDFORM.