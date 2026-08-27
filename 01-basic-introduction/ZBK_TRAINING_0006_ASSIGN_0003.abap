*&---------------------------------------------------------------------*
*& Report ZBK_TRAINING_0006_ASSIGN_0003
*&---------------------------------------------------------------------*
*& GÖREV (SORU):
*& Global bir integer değişken (gv_num = 10) tanımlanacak.
*& 4 farklı form oluşturulacak (1: +7, 2: -4, 3: /2, 4: *3).
*& Her form en az 1 kere kullanılarak değer 42'ye ulaştırılacak ve 
*& ekrana WRITE ile yazdırılacak.
*&---------------------------------------------------------------------*
REPORT ZBK_TRAINING_0006_ASSIGN_0003.

" 1. Global integer değişkenimizi ve 10 olan ilk değerini tanımlıyoruz
DATA: gv_num TYPE i VALUE 10.

START-OF-SELECTION.

  " 2. Hedef 42'ye ulaşmak için formları matematiksel sırayla çağırıyoruz
  PERFORM form_03_bol.    " 10 / 2 = 5
  PERFORM form_04_carp.   " 5 * 3  = 15
  PERFORM form_01_ekle.   " 15 + 7 = 22
  PERFORM form_02_cikar.  " 22 - 4 = 18
  PERFORM form_02_cikar.  " 18 - 4 = 14
  PERFORM form_04_carp.   " 14 * 3 = 42

  " 3. Elde edilen son değeri ekrana yazdırıyoruz
  WRITE: / 'Global Degiskenin Son Degeri:', gv_num.


*&---------------------------------------------------------------------*
*& Form 1: Global değişkene 7 eklesin
*&---------------------------------------------------------------------*
FORM form_01_ekle.
  gv_num = gv_num + 7.
ENDFORM.

*&---------------------------------------------------------------------*
*& Form 2: Global değişkenden 4 çıkarsın
*&---------------------------------------------------------------------*
FORM form_02_cikar.
  gv_num = gv_num - 4.
ENDFORM.

*&---------------------------------------------------------------------*
*& Form 3: Global değişkeni 2'ye bölsün
*&---------------------------------------------------------------------*
FORM form_03_bol.
  gv_num = gv_num / 2.
ENDFORM.

*&---------------------------------------------------------------------*
*& Form 4: Global değişkeni 3 ile çarpsın
*&---------------------------------------------------------------------*
FORM form_04_carp.
  gv_num = gv_num * 3.
ENDFORM.