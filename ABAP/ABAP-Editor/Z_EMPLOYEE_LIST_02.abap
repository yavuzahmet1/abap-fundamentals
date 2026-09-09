REPORT z_employee_list_02 LINE-SIZE 132.

TABLES zemployees.

*SELECT * FROM zemployees.
*  WRITE: / zemployees-employee,
*           zemployees-title,
*           zemployees-forename,
*           zemployees-surname,
*           zemployees-dob.
*ENDSELECT.
*
*ULINE.
*
*SELECT * FROM zemployees.
*  WRITE: / zemployees.
*ENDSELECT.
*
*ULINE.
*
*SELECT * FROM zemployees.
*  WRITE: zemployees.
*  WRITE: /.
*ENDSELECT.

** Sabitler (Global Constants) -> 'gc_' öneki alır
*CONSTANTS gc_myconstant01 TYPE p DECIMALS 1 VALUE '6.6'.
*CONSTANTS gc_myconstant02 TYPE i VALUE 6.

* Değişkenler (Global Variables) -> 'gv_' öneki alır
DATA gv_integer01 TYPE i VALUE 22.
DATA gv_packet_dec01 TYPE p DECIMALS 1 VALUE '-5.5'.

DATA result LIKE gv_packet_dec01.

result = gv_packet_dec01 + gv_integer01.

WRITE result.

ADD 12 to result.

WRITE: / result.

data lv_num1 type p DECIMALS 2 VALUE '3.33'.
data lv_result TYPE i.

lv_result = lv_num1.

uline.
WRITE: / lv_result.

*DATA lv_num1   TYPE p DECIMALS 2 VALUE '3.33'.
*DATA lv_result TYPE i.

*TRY.
*    " '# ' işareti hedef değişkenin (lv_result) tipini otomatik algılar.
*    lv_result = EXACT #( lv_num1 ).
*
*    WRITE: / 'Dönüşüm başarılı:', lv_result.
*
*  CATCH cx_sy_conversion_rounding INTO DATA(lx_error).
*    " Eğer veri kaybı (yuvarlama) olursa program buraya düşer.
*    WRITE: / 'Hata: Yuvarlama (veri kaybı) tespit edildi! İşlem iptal edildi.'.
*ENDTRY.

*ABAP'ta otomatik dönüşümler pratik olsa da, özellikle finansal veya hassas matematiksel hesaplamalarda veri kaybına (küsuratın silinmesi gibi) yol açması büyük bir risktir.
*
*Sessizce gerçekleşen bu yuvarlama veya kırpılma işlemlerini engellemek için modern ABAP'ta (7.40 ve sonrası) EXACT operatörü (Kayıpsız Atama - Lossless Assignment) kullanılır.
*
*EXACT, bir trafik polisi gibi davranır. Atama işlemi sırasında bir veri kaybı (yuvarlama veya kesilme) olacağını fark ederse işlemi durdurur ve bir istisna (Exception) fırlatarak sizi uyarır.
*EXACT Operatörünün Kullanımı
*
*EXACT kullanırken, programın "Dump" (çökme) hatası vermesini engellemek için işlemi TRY ... CATCH bloğu içine almalısınız.

*EXACT metinsel (string) verilerin yanlışlıkla kırpılmasını önlemek için de kullanılır.
*
*Örneğin, 10 karakterlik bir metni 5 karakterlik bir değişkene atamaya çalışırsanız, ABAP normalde son 5 karakteri sessizce siler. EXACT kullanırsanız bunu da yakalayabiliriz.

DATA lv_long_text  TYPE c LENGTH 10 VALUE 'ABAP DUNYA'.
DATA lv_short_text TYPE c LENGTH 5.

TRY.
    lv_short_text = EXACT #( lv_long_text ).

  CATCH cx_sy_conversion_data_loss.
    WRITE: / 'Hata: Metin kırpılması tespit edildi!'.
ENDTRY.