*&---------------------------------------------------------------------*
*& Report Z_CHARACTER_STRINGS_USES
*&---------------------------------------------------------------------*

REPORT z_character_strings_uses.


*---------------------------------------------------------------------*
* 27. CONCATENATE
*---------------------------------------------------------------------*

* We define the variables and assign initial values.
DATA: lv_title(15)        TYPE c VALUE 'Mr',
      lv_surname(40)      TYPE c VALUE 'Smith',
      lv_forename(40)     TYPE c VALUE 'Joe',
      lv_destination(200) TYPE c.

* CONCATENATE is used to combine multiple character variables.
* SEPARATED BY space adds one space between each value.
CONCATENATE lv_title lv_surname lv_forename
       INTO lv_destination
       SEPARATED BY space.

* We display the combined result on the screen.
WRITE: / 'CONCATENATE Result:', lv_destination.


*---------------------------------------------------------------------*
* 28. CONDENSE
*---------------------------------------------------------------------*

DATA lv_condense(100) TYPE c.

* We create a text containing unnecessary extra spaces.
lv_condense = '   Mr     Smith      Joe   '.

* CONDENSE removes leading and trailing spaces.
* It also reduces multiple spaces between words to a single space.
CONDENSE lv_condense.

WRITE: / 'CONDENSE Result   :', lv_condense.

* NO-GAPS removes ALL spaces from the text.
CONDENSE lv_condense NO-GAPS.

* Result: MrSmithJoe
WRITE: / 'NO-GAPS Result    :', lv_condense.


*---------------------------------------------------------------------*
* 29. FIND THE LENGTH OF A STRING - STRLEN
*---------------------------------------------------------------------*

DATA: lv_length_text TYPE string,
      lv_length      TYPE i.

* We assign the text whose length we want to calculate.
lv_length_text = 'Mr Smith Joe'.

* STRLEN returns the number of characters in a string.
* Spaces are also counted as characters.
lv_length = strlen( lv_length_text ).

* Mr Smith Joe contains 12 characters.
WRITE: / 'String Length     :', lv_length.


*---------------------------------------------------------------------*
* 30. REPLACE
*---------------------------------------------------------------------*

DATA lv_replace(100) TYPE c.

lv_replace = 'Mr Smith Joe'.

* REPLACE changes one value in a text into another value.
* Here we replace Smith with Brown.
REPLACE 'Smith' WITH 'Brown' INTO lv_replace.

* Result: Mr Brown Joe
WRITE: / 'REPLACE Result    :', lv_replace.


*---------------------------------------------------------------------*
* 31. SEARCH
*---------------------------------------------------------------------*

DATA lv_search(100) TYPE c.

lv_search = 'Mr Smith Joe'.

* SEARCH looks for a specific value inside a text.
* Here we search for the word Smith.
SEARCH lv_search FOR 'Smith'.

* After SEARCH, the system stores the result in SY-SUBRC.
* SY-SUBRC = 0 means the value was found.
* SY-SUBRC <> 0 means the value was not found.
IF sy-subrc = 0.

  WRITE: / 'SEARCH Result     : Smith found'.

  * SY-FDPOS contains the starting position of the found value.
  WRITE: / 'Starting Position :', sy-fdpos.

ELSE.

  WRITE: / 'SEARCH Result     : Smith not found'.

ENDIF.


*---------------------------------------------------------------------*
* 32. SHIFT
*---------------------------------------------------------------------*

DATA lv_shift(100) TYPE c.

lv_shift = 'ABCDE'.

* SHIFT moves characters to the left or right.
* BY 2 PLACES LEFT removes the first two characters.
SHIFT lv_shift BY 2 PLACES LEFT.

* ABCDE -> CDE
WRITE: / 'SHIFT Result      :', lv_shift.


*---------------------------------------------------------------------*
* SHIFT - LEADING SPACE EXAMPLE
*---------------------------------------------------------------------*

lv_shift = '     Hello'.

* LEFT DELETING LEADING space removes
* the spaces at the beginning of the text.
SHIFT lv_shift LEFT DELETING LEADING space.

* Result: Hello
WRITE: / 'SHIFT Spaces      :', lv_shift.


*---------------------------------------------------------------------*
* 33. SPLIT
*---------------------------------------------------------------------*

DATA: lv_split(100) TYPE c,
      lv_part1(20)  TYPE c,
      lv_part2(20)  TYPE c,
      lv_part3(20)  TYPE c.

lv_split = 'Mr Smith Joe'.

* SPLIT divides a text into separate parts
* based on a specified separator.
*
* We can think of SPLIT as the opposite of CONCATENATE.
*
* CONCATENATE:
* Mr + Smith + Joe -> Mr Smith Joe
*
* SPLIT:
* Mr Smith Joe -> Mr / Smith / Joe
*
* AT space means:
* split the text whenever a space is found.
SPLIT lv_split AT space
      INTO lv_part1 lv_part2 lv_part3.

WRITE: / 'SPLIT 1st Value   :', lv_part1.
WRITE: / 'SPLIT 2nd Value   :', lv_part2.
WRITE: / 'SPLIT 3rd Value   :', lv_part3.


*---------------------------------------------------------------------*
* 34. SUB-FIELDS
*---------------------------------------------------------------------*

DATA: lv_subfield_text(20) TYPE c,
      lv_subfield(10)      TYPE c.

lv_subfield_text = 'ABCDEFGHIJ'.

* SUB-FIELDS allow us to extract a specific part
* of a character variable.
*
* Syntax:
*
* variable+start(length)
*
* In +0(3):
*
* +0  = start from position 0
* (3) = take 3 characters
*
* ABCDEFGHIJ
* 0123456789
*
* +0(3) returns ABC.
lv_subfield = lv_subfield_text+0(3).

WRITE: / 'SUB-FIELD +0(3)   :', lv_subfield.


*---------------------------------------------------------------------*
* SUB-FIELD SECOND EXAMPLE
*---------------------------------------------------------------------*

* +3(4) means:
* start from position 3 and take 4 characters.
*
* ABCDEFGHIJ
* 0123456789
*    ----
*
* Result: DEFG
lv_subfield = lv_subfield_text+3(4).

WRITE: / 'SUB-FIELD +3(4)   :', lv_subfield.

**TR 

*---------------------------------------------------------------------*
* 27. CONCATENATE
*---------------------------------------------------------------------*

* Değişkenleri tanımlıyoruz ve başlangıç değerlerini veriyoruz.
DATA: lv_title(15)        TYPE c VALUE 'Mr',
      lv_surname(40)      TYPE c VALUE 'Smith',
      lv_forename(40)     TYPE c VALUE 'Joe',
      lv_destination(200) TYPE c.

* CONCATENATE birden fazla karakter değişkenini birleştirmek için kullanılır.
* SEPARATED BY space sayesinde kelimelerin arasına birer boşluk koyulur.
CONCATENATE lv_title lv_surname lv_forename
       INTO lv_destination
       SEPARATED BY space.

* Birleştirilmiş sonucu ekrana yazdırıyoruz.
WRITE: / 'CONCATENATE Sonucu:', lv_destination.


*---------------------------------------------------------------------*
* 28. CONDENSE
*---------------------------------------------------------------------*

DATA lv_condense(100) TYPE c.

* İçerisinde gereksiz fazla boşluklar bulunan bir metin oluşturuyoruz.
lv_condense = '   Mr     Smith      Joe   '.

* CONDENSE baştaki ve sondaki boşlukları kaldırır.
* Kelimeler arasındaki fazla boşlukları ise tek boşluğa düşürür.
CONDENSE lv_condense.

WRITE: / 'CONDENSE Sonucu   :', lv_condense.

* NO-GAPS kullanılırsa metindeki TÜM boşluklar kaldırılır.
CONDENSE lv_condense NO-GAPS.

* Sonuç: MrSmithJoe
WRITE: / 'NO-GAPS Sonucu    :', lv_condense.


*---------------------------------------------------------------------*
* 29. FIND THE LENGTH OF A STRING - STRLEN
*---------------------------------------------------------------------*

DATA: lv_length_text TYPE string,
      lv_length      TYPE i.

* Uzunluğunu hesaplamak istediğimiz metni değişkene atıyoruz.
lv_length_text = 'Mr Smith Joe'.

* STRLEN metnin kaç karakterden oluştuğunu bulur.
* Boşluklar da karakter olarak sayılır.
lv_length = strlen( lv_length_text ).

* Mr Smith Joe = 12 karakterdir.
WRITE: / 'Metin Uzunlugu    :', lv_length.


*---------------------------------------------------------------------*
* 30. REPLACE
*---------------------------------------------------------------------*

DATA lv_replace(100) TYPE c.

lv_replace = 'Mr Smith Joe'.

* REPLACE bir metnin içerisindeki değeri başka bir değerle değiştirir.
* Burada Smith kelimesini Brown kelimesi ile değiştiriyoruz.
REPLACE 'Smith' WITH 'Brown' INTO lv_replace.

* Sonuç: Mr Brown Joe
WRITE: / 'REPLACE Sonucu    :', lv_replace.


*---------------------------------------------------------------------*
* 31. SEARCH
*---------------------------------------------------------------------*

DATA lv_search(100) TYPE c.

lv_search = 'Mr Smith Joe'.

* SEARCH verilen metnin içerisinde istediğimiz kelimeyi arar.
* Burada Smith kelimesini arıyoruz.
SEARCH lv_search FOR 'Smith'.

* SEARCH işleminden sonra sistem sonucu SY-SUBRC değişkenine yazar.
* SY-SUBRC = 0 ise aranan değer bulunmuştur.
* SY-SUBRC <> 0 ise aranan değer bulunamamıştır.
IF sy-subrc = 0.

  WRITE: / 'SEARCH Sonucu     : Smith bulundu'.

  * SY-FDPOS bulunan değerin başladığı karakter pozisyonunu gösterir.
  WRITE: / 'Baslangic Pozisyonu:', sy-fdpos.

ELSE.

  WRITE: / 'SEARCH Sonucu     : Smith bulunamadi'.

ENDIF.


*---------------------------------------------------------------------*
* 32. SHIFT
*---------------------------------------------------------------------*

DATA lv_shift(100) TYPE c.

lv_shift = 'ABCDE'.

* SHIFT karakterleri sağa veya sola kaydırmak için kullanılır.
* BY 2 PLACES LEFT dediğimiz için ilk 2 karakter kaldırılır.
SHIFT lv_shift BY 2 PLACES LEFT.

* ABCDE -> CDE
WRITE: / 'SHIFT Sonucu      :', lv_shift.


*---------------------------------------------------------------------*
* SHIFT - LEADING SPACE ÖRNEĞİ
*---------------------------------------------------------------------*

lv_shift = '     Hello'.

* LEFT DELETING LEADING space komutu
* metnin başında bulunan boşlukları kaldırır.
SHIFT lv_shift LEFT DELETING LEADING space.

* Sonuç: Hello
WRITE: / 'SHIFT Bosluk      :', lv_shift.


*---------------------------------------------------------------------*
* 33. SPLIT
*---------------------------------------------------------------------*

DATA: lv_split(100) TYPE c,
      lv_part1(20)  TYPE c,
      lv_part2(20)  TYPE c,
      lv_part3(20)  TYPE c.

lv_split = 'Mr Smith Joe'.

* SPLIT bir metni belirli bir karaktere göre parçalara ayırır.
* CONCATENATE işleminin tersine benzetebiliriz.
*
* CONCATENATE:
* Mr + Smith + Joe -> Mr Smith Joe
*
* SPLIT:
* Mr Smith Joe -> Mr / Smith / Joe
*
* AT space ifadesi boşluk gördüğünde metni böl anlamına gelir.
SPLIT lv_split AT space
      INTO lv_part1 lv_part2 lv_part3.

WRITE: / 'SPLIT 1. Deger    :', lv_part1.
WRITE: / 'SPLIT 2. Deger    :', lv_part2.
WRITE: / 'SPLIT 3. Deger    :', lv_part3.


*---------------------------------------------------------------------*
* 34. SUB-FIELDS
*---------------------------------------------------------------------*

DATA: lv_subfield_text(20) TYPE c,
      lv_subfield(10)      TYPE c.

lv_subfield_text = 'ABCDEFGHIJ'.

* SUB-FIELD ile bir karakter değişkeninin belirli bir bölümünü alabiliriz.
*
* Kullanımı:
*
* degisken+baslangic(uzunluk)
*
* +0(3) ifadesinde:
*
* +0  = 0. pozisyondan başla
* (3) = 3 karakter al
*
* ABCDEFGHIJ
* 0123456789
*
* +0(3) sonucu ABC olur.
lv_subfield = lv_subfield_text+0(3).

WRITE: / 'SUB-FIELD +0(3)   :', lv_subfield.


*---------------------------------------------------------------------*
* SUB-FIELD İKİNCİ ÖRNEK
*---------------------------------------------------------------------*

* +3(4) ifadesi:
* 3. pozisyondan başla ve 4 karakter al anlamına gelir.
*
* ABCDEFGHIJ
* 0123456789
*    ----
*
* Sonuç: DEFG
lv_subfield = lv_subfield_text+3(4).

WRITE: / 'SUB-FIELD +3(4)   :', lv_subfield.