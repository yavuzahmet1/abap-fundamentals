*&---------------------------------------------------------------------*
*& Report Z_ITERATIONS
*&---------------------------------------------------------------------*
REPORT z_iterations.

*======================================================================*
* ENGLISH - Reading database records with SELECT ... ENDSELECT
*======================================================================*
*
* SELECT reads rows from the database table ZEMPLOYEES.
* The code between SELECT and ENDSELECT runs once for each selected row.
*
* Method 1: Explicit work area
* DATA creates a variable that can hold one ZEMPLOYEES row.
* INTO places each selected row into that variable.
*
* DATA wa_employee TYPE zemployees.
*
* SELECT * FROM zemployees INTO wa_employee.
*   WRITE: / wa_employee-employee,
*            wa_employee-surname,
*            wa_employee-forename.
* ENDSELECT.
*
* Method 2: Implicit work area using TABLES
* TABLES declares the table work area ZEMPLOYEES.
* In this older ABAP style, SELECT without INTO puts each row into
* that work area automatically.
* WHERE limits the selection to rows whose surname is 'Yavuz'.
* WRITE displays the chosen fields; / starts a new output line.
*
*======================================================================*
* TÜRKÇE - SELECT ... ENDSELECT ile veritabanı kayıtlarını okuma
*======================================================================*
*
* SELECT, ZEMPLOYEES tablosundaki kayıtları okur.
* SELECT ile ENDSELECT arasındaki kod, seçilen her kayıt için bir kez
* çalışır.
*
* Yöntem 1: Açıkça tanımlanmış çalışma alanı
* DATA, ZEMPLOYEES tablosundan bir kaydı tutabilecek değişken tanımlar.
* INTO, okunan her kaydı bu değişkene aktarır.
*
* Yöntem 2: TABLES ile örtük çalışma alanı
* TABLES, ZEMPLOYEES adlı tablo çalışma alanını tanımlar.
* Bu eski ABAP kullanımında INTO yazılmadığında okunan kayıt
* otomatik olarak bu çalışma alanına aktarılır.
* WHERE yalnızca soyadı 'Yavuz' olan kayıtları seçer.
* WRITE seçilen alanları gösterir; / çıktıda yeni satır açar.
*
* Not: WHERE olmazsa tablodaki bütün kayıtlar okunur.
* Aranan soyadı bulunmazsa döngü çalışmaz ve çıktı oluşmaz.

TABLES: zemployees.

SELECT * FROM zemployees WHERE surname = 'Yavuz'.
  WRITE: / zemployees-employee,
           zemployees-surname,
           zemployees-forename.
ENDSELECT.