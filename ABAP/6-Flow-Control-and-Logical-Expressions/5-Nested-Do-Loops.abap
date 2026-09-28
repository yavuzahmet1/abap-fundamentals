*&---------------------------------------------------------------------*
*& Report Z_ITERATIONS_DO_LOOPS
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_iterations_do_loops.

*======================================================================*
* ENGLISH
*======================================================================*
*
* TABLES creates the implicit work area ZEMPLOYEES.
* SELECT reads employees whose surname is 'MILLS'.
* The code inside SELECT ... ENDSELECT runs for each matching record.
*
* DATA a TYPE i declares an integer variable.
* a = 0 assigns its initial value.
*
* DO 15 TIMES repeats its contents exactly 15 times.
* In each repetition, a = a + 1 increases the value by one.
* WRITE / a displays the new value on a new line.
* The DO loop is separate from the SELECT loop above.
*
*======================================================================*
* TÜRKÇE
*======================================================================*
*
* TABLES, ZEMPLOYEES için örtük bir çalışma alanı oluşturur.
* SELECT, soyadı 'MILLS' olan çalışanları okur.
* SELECT ... ENDSELECT içindeki kod, bulunan her kayıt için çalışır.
*
* DATA a TYPE i, tam sayı türünde bir değişken tanımlar.
* a = 0, değişkenin başlangıç değerini 0 yapar.
*
* DO 15 TIMES, içindeki komutları tam 15 kez tekrarlar.
* Her tekrarda a = a + 1, değeri bir artırır.
* WRITE / a, yeni değeri ekranda yeni bir satıra yazar.
* DO döngüsü, yukarıdaki SELECT döngüsünden bağımsızdır.

TABLES: zemployees.

SELECT * FROM zemployees WHERE surname = 'AHMET'.
  WRITE: / zemployees-employee,
           zemployees-surname,
           zemployees-forename.
ENDSELECT.

DATA: a TYPE i,
      b TYPE i,
      c TYPE i.

a = 0.
c = 0.

DO 15 TIMES.
  a = a + 1.
  WRITE: / 'Outher Loop cycle:', a.
  b = 0.
  DO 10 TIMES.
    b = b + 1.
    WRITE: /'Inner Loop cycle: ', b.
  ENDDO.
ENDDO.
c = c + a.

WRITE: / 'Totatl Iterations : ', c.