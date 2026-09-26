DATA wa_employees LIKE zemployees.

wa_employees-employee = '01000100'.
wa_employees-surname  = 'WESTRON'.
wa_employees-forename = 'BURC'.
wa_employees-title    = 'MR'.
wa_employees-dob      = '19820808'.

INSERT zemployees FROM wa_employees.

*----------------------------------------------------------------------*
* ENGLISH - IF / ELSEIF / ELSE
*----------------------------------------------------------------------*
* IF checks the first condition.
* ELSEIF checks another condition if the previous conditions are false.
* ELSE runs if none of the previous conditions is true.
* ENDIF closes the entire IF structure.
*
* Only the first matching branch is executed.
* After a match, the remaining branches are skipped.
*
* DATA: surname(15) TYPE c.
* Declares a character variable with a fixed length of 15.
*
* surname = 'SMITH'.
* Assigns a value to the variable.
*
* IF surname = 'SMITH1'.
* Compares the variable with a value; it does not change the variable.
*
* In this example, SMITH matches neither SMITH1 nor WESTRON.
* Therefore, ELSE runs.
*----------------------------------------------------------------------*
* TÜRKÇE - IF / ELSEIF / ELSE
*----------------------------------------------------------------------*
* IF: İlk koşulu kontrol eder.
* ELSEIF: Önceki koşullar yanlışsa başka bir koşulu kontrol eder.
* ELSE: Önceki koşulların hiçbiri doğru değilse çalışır.
* ENDIF: IF yapısını kapatır.
*
* Yalnızca ilk doğru koşula ait dal çalışır.
* Sonraki ELSEIF ve ELSE dalları atlanır.
*
* DİKKAT: = işaretinin görevi kullanıldığı yere göre değişir.
* surname = 'SMITH'.    -> Değişkene değer ATAR.
* IF surname = 'SMITH'. -> Değişkenin değerini KARŞILAŞTIRIR.
*
* Karşılaştırma yapmak, değişkenin içindeki değeri değiştirmez.
*----------------------------------------------------------------------*

* 15 karakter uzunluğunda bir karakter değişkeni tanımlarız.
DATA: surname(15) TYPE c.

* Değişkenin içine SMITH değerini koyarız.
surname = 'SMITH'.

* 1. KONTROL: surname değeri SMITH1 mi?
* Hayır. SMITH ile SMITH1 farklıdır; bu WRITE çalışmaz.
IF surname = 'SMITH1'.
  WRITE 'You have won a CAR!'.

* 2. KONTROL: İlk koşul yanlış olduğu için buraya geçilir.
* surname değeri WESTRON mi?
* Hayır. Bu WRITE da çalışmaz.
ELSEIF surname = 'WESTRON'.
  WRITE 'You have won a CAR! WESTRON'.

* 3. DURUM: Önceki koşulların hiçbiri doğru değildir.
* Bu nedenle ELSE içindeki WRITE çalışır.
ELSE.
  WRITE 'You have not won a CAR!'.
ENDIF.

* ENDIF programı bitirmez; yalnızca IF yapısını kapatır.
* Varsa bundan sonraki komutlarla program devam eder.

*----------------------------------------------------------------------*
* ALIŞTIRMA
* surname değişkenine atanan değeri değiştirerek tekrar dene:
*
* 'SMITH1'  -> IF çalışır.
* 'WESTRON' -> ELSEIF çalışır.
* 'SMITH'   -> ELSE çalışır.
*
* ELSE'nin yanına koşul yazılmaz.
* İhtiyaç varsa ELSE'den önce birden fazla ELSEIF eklenebilir.
*----------------------------------------------------------------------*

* ENGLISH
* Each IF has its own ENDIF.
* The ELSE below belongs to IF location = 'UK'.
* Every WRITE reached by the program runs separately.

* TÜRKÇE
* Her IF kendi ENDIF satırıyla kapanır.
* Aşağıdaki ELSE, IF location = 'UK' koşuluna aittir.
* Programın ulaştığı her WRITE ayrı ayrı çalışır.

DATA: surname(15)  TYPE c VALUE 'SMITH',
      forename(15) TYPE c VALUE 'JOHN',
      location(15) TYPE c VALUE 'UK'.

IF surname = 'SMITH'.
  WRITE / 'You have won a car!'.
  WRITE / 'You have won a car!'.

  IF forename = 'JOHN'.
    WRITE / 'You have won a car!'.
    WRITE / 'You have won a car!'.

    IF location = 'UK'.
      WRITE / 'You have won a car!'.
      WRITE / 'You have won a car!'.
    ELSE.
      WRITE / 'Oooo, so close'.
    ENDIF.

    WRITE / 'You have won a car!'.
  ENDIF.
ENDIF.