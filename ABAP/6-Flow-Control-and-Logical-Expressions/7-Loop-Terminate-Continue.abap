DATA a TYPE i.

a = 0.

DO 15 TIMES.
  a = a + 1.

  IF sy-index = 2.
    CONTINUE.
  ENDIF.

  WRITE: / 'Outer Loop cycle: ', a.
ENDDO.

*sy-indexin mantığını anlamadım a da diyebilirdik neden sy-index?
*In ABAP, `sy-index` is a system variable that holds the current iteration count of a loop. 
*It is automatically updated by the system for each iteration of the loop, starting from 1 for the first iteration.

*Evet, bu örnekte a = 2 de diyebilirdik. Çünkü a sıfırdan başlıyor ve her turda bir artıyor; bu yüzden a ile sy-index aynı değere ulaşıyor.
*Fark şu:
*- a, senin tanımladığın ve değiştirdiğin değişken.
*- sy-index, ABAP’ın DO döngüsünde tuttuğu tur numarası. İlk turda 1, ikinci turda 2 olur.