* ENGLISH
* CASE checks the value of surname.
* The matching WHEN branch runs.
* WHEN OTHERS runs if no value matches.
* ENDCASE closes the structure.

* TÜRKÇE
* CASE, surname değişkeninin değerini kontrol eder.
* Eşleşen WHEN dalı çalışır.
* Hiçbir değer eşleşmezse WHEN OTHERS çalışır.
* ENDCASE yapıyı kapatır.

DATA: surname(15)  TYPE c VALUE 'SMITH',
      forename(15) TYPE c VALUE 'BARRY'.

CASE surname.                    " Dıştaki CASE
  WHEN 'SMITH'.
    WRITE / 'You have won a CAR!'.

    CASE forename.               " İçteki CASE
      WHEN 'BARRY'.
        WRITE / 'Hi Barry'.
    ENDCASE.                     " forename CASE'ini kapatır

  WHEN 'JONES'.
    WRITE / 'You have won a PLANE!'.

  WHEN 'GREEN'.
    WRITE / 'You have won a BOAT!'.

  WHEN OTHERS.
    WRITE / 'You have not won a prize.'.
ENDCASE.                         " surname CASE'ini kapatır