*---------------------------------------------------------------------*
* DELETE
*---------------------------------------------------------------------*
*
* ENGLISH:
*
* DELETE removes an existing record from a database table.
*
* Example:
*
* DELETE FROM zemployees
*   WHERE employee = '01000101'.
*
* WHERE determines which record will be deleted.
*
* sy-subrc = 0
* -> Record was successfully deleted.
*
* sy-subrc <> 0
* -> No matching record was deleted or another situation occurred.
*
*---------------------------------------------------------------------*
* TURKISH:
*
* DELETE, database tablosunda bulunan mevcut bir kaydı siler.
*
* Örnek:
*
* DELETE FROM zemployees
*   WHERE employee = '01000101'.
*
* WHERE hangi kaydın silineceğini belirler.
*
* sy-subrc = 0
* -> Kayıt başarıyla silindi.
*
* sy-subrc <> 0
* -> Uygun kayıt silinemedi veya farklı bir durum oluştu.
*
*---------------------------------------------------------------------*
* IMPORTANT
*---------------------------------------------------------------------*
*
* CLEAR
* -> Program belleğindeki değeri temizler.
* -> Database kaydını silmez.
*
* DELETE
* -> Database içindeki gerçek kaydı siler.
*
*---------------------------------------------------------------------*
* QUICK DIFFERENCE
*---------------------------------------------------------------------*
*
* SELECT = Veri oku
* INSERT = Yeni kayıt ekle
* UPDATE = Var olan kaydı değiştir
* MODIFY = Varsa değiştir, yoksa ekle
* DELETE = Kaydı sil
*
*---------------------------------------------------------------------*