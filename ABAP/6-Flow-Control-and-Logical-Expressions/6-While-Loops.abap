*&---------------------------------------------------------------------*
*& Report Z_ITERATIONS_WHILE_LOOPS
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_iterations_while_loops.

TABLES: zemployees.

SELECT * FROM zemployees WHERE surname = 'AHMET'.
  WRITE: / zemployees-employee,
           zemployees-surname,
           zemployees-forename.
ENDSELECT.

*&---------------------------------------------------------------------*
*& WHILE Loop Example
*&---------------------------------------------------------------------*

* EN: Declare three integer variables.
* TR: Üç tam sayı değişkeni tanımlıyoruz.
DATA: a TYPE i,
      b TYPE i,
      c TYPE i.

* EN: Set the initial values. b and c are not used in this example.
* TR: Başlangıç değerlerini veriyoruz. b ve c bu örnekte kullanılmıyor.
a = 0.
c = 0.

* EN: <> means "not equal to".
* EN: Repeat the loop while a is not equal to 15.
* TR: <> işareti "eşit değil" anlamına gelir.
* TR: a değeri 15'e eşit olmadığı sürece döngüyü tekrarla.
WHILE a <> 15.

  * EN: Display the current value of a on a new line.
  * TR: a'nın mevcut değerini yeni bir satırda göster.
  WRITE: / 'Loop cycle: ', a.

  * EN: Increase a by 1 so the loop can reach its stopping value.
  * TR: a'yı 1 artır; böylece döngü bitiş değerine ulaşabilir.
  a = a + 1.

ENDWHILE.

* EN: The displayed values are 0, 1, 2, ... 14.
* EN: After displaying 14, a becomes 15. The next condition is false,
* EN: so the loop ends without displaying 15.
*
* TR: Ekrana 0, 1, 2, ... 14 değerleri yazılır.
* TR: 14 yazıldıktan sonra a, 15 olur. Sonraki koşul yanlış olduğu
* TR: için döngü biter ve 15 ekrana yazılmaz.