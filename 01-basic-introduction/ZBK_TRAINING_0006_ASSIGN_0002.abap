*&---------------------------------------------------------------------*
*& Report ZBK_TRAINING_0006_ASSIGN_0002
*&---------------------------------------------------------------------*
*& GÖREV (SORU):
*& Programda farklı isimlerde formlar olsun ve her formda sırasıyla 
*& şu kelimeler WRITE ile yazdırılsın: 
*& 1:Burak, 2:yapar, 3:yazılım, 4:hiç, 5:ama, 6:zorlanıyor, 7:dillerinden, 
*& 8:için, 9:zor, 10:biraz, 11:değil, 12:isterse, 13:abap
*&
*& Program çalıştırıldığında bu formlar çağrılarak aşağıdaki 3 cümle
*& ekrana bastırılsın:
*& 1- Burak abap yazılım biraz zorlanıyor ama yazılım dillerinden abap Burak için hiç zor değil
*& 2- Burak biraz isterse yapar
*& 3- Burak yazılım dillerinden abap yazılım zor değil
*&---------------------------------------------------------------------*
REPORT ZBK_TRAINING_0006_ASSIGN_0002.

START-OF-SELECTION.

  " 1. Cümle: Burak abap yazılım biraz zorlanıyor ama yazılım dillerinden abap Burak için hiç zor değil
  PERFORM form_01. " Burak
  PERFORM form_13. " abap
  PERFORM form_03. " yazılım
  PERFORM form_10. " biraz
  PERFORM form_06. " zorlanıyor
  PERFORM form_05. " ama
  PERFORM form_03. " yazılım
  PERFORM form_07. " dillerinden
  PERFORM form_13. " abap
  PERFORM form_01. " Burak
  PERFORM form_08. " için
  PERFORM form_04. " hiç
  PERFORM form_09. " zor
  PERFORM form_11. " değil

  " Alt satıra geçmek için
  WRITE: /.

  " 2. Cümle: Burak biraz isterse yapar
  PERFORM form_01. " Burak
  PERFORM form_10. " biraz
  PERFORM form_12. " isterse
  PERFORM form_02. " yapar

  " Alt satıra geçmek için
  WRITE: /.

  " 3. Cümle: Burak yazılım dillerinden abap yazılım zor değil
  PERFORM form_01. " Burak
  PERFORM form_03. " yazılım
  PERFORM form_07. " dillerinden
  PERFORM form_13. " abap
  PERFORM form_03. " yazılım
  PERFORM form_09. " zor
  PERFORM form_11. " değil


*&---------------------------------------------------------------------*
*& FORM TANIMLAMALARI (1'den 13'e kadar)
*&---------------------------------------------------------------------*
FORM form_01. 
  WRITE 'Burak'. 
ENDFORM.

FORM form_02. 
  WRITE 'yapar'. 
ENDFORM.

FORM form_03. 
  WRITE 'yazılım'. 
ENDFORM.

FORM form_04. 
  WRITE 'hiç'. 
ENDFORM.

FORM form_05. 
  WRITE 'ama'. 
ENDFORM.

FORM form_06. 
  WRITE 'zorlanıyor'. 
ENDFORM.

FORM form_07. 
  WRITE 'dillerinden'. 
ENDFORM.

FORM form_08. 
  WRITE 'için'. 
ENDFORM.

FORM form_09. 
  WRITE 'zor'. 
ENDFORM.

FORM form_10. 
  WRITE 'biraz'. 
ENDFORM.

FORM form_11. 
  WRITE 'değil'. 
ENDFORM.

FORM form_12. 
  WRITE 'isterse'. 
ENDFORM.

FORM form_13. 
  WRITE 'abap'. 
ENDFORM.