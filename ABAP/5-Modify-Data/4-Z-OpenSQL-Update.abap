*---------------------------------------------------------------------*
* UPDATE
*---------------------------------------------------------------------*
*
* ENGLISH:
*
* UPDATE changes an existing record in a database table.
*
* INSERT = Add a new record
* UPDATE = Change an existing record
*
* Example:
*
* UPDATE zemployees
*   SET surname = 'YAVUZ'
*   WHERE employee = '01000101'.
*
* WHERE determines which record will be updated.
*
* sy-subrc = 0
* -> Record was successfully updated.
*
* sy-subrc = 4
* -> No matching record was found.
*
*---------------------------------------------------------------------*
* TURKISH:
*
* UPDATE, database tablosunda zaten bulunan bir kaydı değiştirir.
*
* INSERT = Yeni kayıt ekler
* UPDATE = Var olan kaydı değiştirir
*
* Örnek:
*
* UPDATE zemployees
*   SET surname = 'YAVUZ'
*   WHERE employee = '01000101'.
*
* WHERE hangi kaydın değiştirileceğini belirler.
*
* sy-subrc = 0
* -> Kayıt başarıyla güncellendi.
*
* sy-subrc = 4
* -> Koşula uygun kayıt bulunamadı.
*
*---------------------------------------------------------------------*