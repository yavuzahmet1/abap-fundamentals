*---------------------------------------------------------------------*
* LESSON: COPYING AN EXISTING TABLE AND ADDING NEW FIELDS
*---------------------------------------------------------------------*
*
* In this lesson, we learned how to copy an existing database table
* and extend the copied table with additional fields.
*
* We already had an employee table called ZEMPLOYEES.
* Instead of creating a completely new table from the beginning,
* we copied the existing ZEMPLOYEES table and created a new table
* called ZEMPLOYEES2.
*
*---------------------------------------------------------------------*
* 1. COPYING THE EXISTING TABLE
*---------------------------------------------------------------------*
*
* First, we opened transaction SE11 (ABAP Dictionary).
*
* The existing table ZEMPLOYEES was used as the source table.
*
* We copied this table and created a new table:
*
* Source Table : ZEMPLOYEES
* New Table    : ZEMPLOYEES2
*
* By copying the table, all existing fields and their definitions
* were transferred to the new table.
*
* This is useful when we want to create a new version of a table
* without defining all fields again manually.
*
*---------------------------------------------------------------------*
* 2. ADDING NEW FIELDS
*---------------------------------------------------------------------*
*
* After copying the table, we added four new fields to ZEMPLOYEES2.
*
* The new fields were:
*
* INITIALS
* GENDER
* SALARY
* ECURRENCY
*
*---------------------------------------------------------------------*
* INITIALS
*---------------------------------------------------------------------*
*
* The INITIALS field is used to store the initials of an employee.
*
* Example:
*
* Employee Name : Joe Smith
* Initials      : JS
*
* This field normally uses a character-based data type.
*
*---------------------------------------------------------------------*
* GENDER
*---------------------------------------------------------------------*
*
* The GENDER field is used to store the gender information
* of the employee.
*
* This field also uses a character-based data type.
*
*---------------------------------------------------------------------*
* SALARY
*---------------------------------------------------------------------*
*
* The SALARY field is used to store the employee's salary.
*
* The important point is that SALARY is defined with the
* CURR data type.
*
* CURR is used in SAP for currency amount fields.
*
* Example:
*
* SALARY = 50000
*
* However, the value 50000 alone is not enough.
*
* SAP also needs to know which currency belongs to this amount.
*
* For example:
*
* 50000 TRY
* 50000 EUR
* 50000 USD
*
* For this reason, a CURR field must normally be connected
* to a currency key field.
*
*---------------------------------------------------------------------*
* ECURRENCY
*---------------------------------------------------------------------*
*
* The ECURRENCY field is used to store the currency key
* belonging to the SALARY field.
*
* The ECURRENCY field uses the CUKY data type.
*
* CUKY is the SAP data type used for currency keys.
*
* Example values:
*
* TRY = Turkish Lira
* EUR = Euro
* USD = US Dollar
*
*---------------------------------------------------------------------*
* 3. DEFINING THE CURRENCY REFERENCE
*---------------------------------------------------------------------*
*
* Because SALARY is a CURR field, we must tell SAP which field
* contains the currency information for the salary.
*
* Therefore, we defined ECURRENCY as the reference field
* for SALARY.
*
* In the "Currency/Quantity Fields" section of the table,
* the following reference was defined:
*
* Field           : SALARY
* Reference Table : ZEMPLOYEES2
* Reference Field : ECURRENCY
*
* The reference table is ZEMPLOYEES2 because the ECURRENCY field
* exists inside the same table.
*
* The reference field is ECURRENCY because this field contains
* the currency key of the salary.
*
*---------------------------------------------------------------------*
* 4. HOW THE REFERENCE WORKS
*---------------------------------------------------------------------*
*
* Example:
*
* SALARY    = 50000
* ECURRENCY = TRY
*
* SAP can understand this value as:
*
* 50000 TRY
*
* Another employee could have:
*
* SALARY    = 3000
* ECURRENCY = EUR
*
* SAP can understand this value as:
*
* 3000 EUR
*
* This means that ECURRENCY does not contain the salary itself.
* It only defines which currency belongs to the SALARY value.
*
*---------------------------------------------------------------------*
* 5. IMPORTANT DATA TYPE RELATIONSHIP
*---------------------------------------------------------------------*
*
* SALARY
*   |
*   |-- Data Type: CURR
*   |
*   |-- Reference Table: ZEMPLOYEES2
*   |
*   |-- Reference Field: ECURRENCY
*
* ECURRENCY
*   |
*   |-- Data Type: CUKY
*   |
*   |-- Stores currency keys such as TRY, EUR and USD
*
*---------------------------------------------------------------------*
* 6. SUMMARY
*---------------------------------------------------------------------*
*
* In this lesson, we learned:
*
* - How to copy an existing SAP database table.
* - How to create ZEMPLOYEES2 from ZEMPLOYEES.
* - How to add additional fields to the copied table.
* - How to add INITIALS and GENDER fields.
* - How to create a SALARY field using the CURR data type.
* - How to create an ECURRENCY field using the CUKY data type.
* - How to connect SALARY with ECURRENCY.
* - Why currency amount fields need a currency reference.
*
* The most important relationship in this lesson is:
*
* SALARY -> ZEMPLOYEES2 -> ECURRENCY
*
* SALARY contains the amount,
* while ECURRENCY contains the currency of that amount.
*
*---------------------------------------------------------------------*

-----TR

*---------------------------------------------------------------------*
* DERS: MEVCUT BİR TABLOYU KOPYALAMA VE YENİ ALANLAR EKLEME
*---------------------------------------------------------------------*
*
* Bu derste mevcut bir veritabanı tablosunun nasıl kopyalandığını
* ve kopyalanan tabloya nasıl yeni alanlar eklendiğini öğrendik.
*
* Daha önceden ZEMPLOYEES adında bir çalışan tablomuz vardı.
*
* Sıfırdan yeni bir tablo oluşturmak yerine mevcut ZEMPLOYEES
* tablosunu kopyalayarak ZEMPLOYEES2 adında yeni bir tablo oluşturduk.
*
*---------------------------------------------------------------------*
* 1. MEVCUT TABLONUN KOPYALANMASI
*---------------------------------------------------------------------*
*
* İlk olarak SE11 (ABAP Dictionary) işlem kodunu açtık.
*
* Mevcut ZEMPLOYEES tablosunu kaynak tablo olarak kullandık.
*
* Bu tabloyu kopyalayarak yeni bir tablo oluşturduk:
*
* Kaynak Tablo : ZEMPLOYEES
* Yeni Tablo   : ZEMPLOYEES2
*
* Tabloyu kopyaladığımız için mevcut alanlar ve alanların
* tanımları yeni tabloya da aktarılmış oldu.
*
* Bu yöntem, benzer bir tablo oluşturmak istediğimizde tüm alanları
* tekrar tek tek tanımlamak zorunda kalmamamızı sağlar.
*
*---------------------------------------------------------------------*
* 2. YENİ ALANLARIN EKLENMESİ
*---------------------------------------------------------------------*
*
* Tabloyu kopyaladıktan sonra ZEMPLOYEES2 tablosuna
* dört yeni alan ekledik.
*
* Eklediğimiz alanlar:
*
* INITIALS
* GENDER
* SALARY
* ECURRENCY
*
*---------------------------------------------------------------------*
* INITIALS
*---------------------------------------------------------------------*
*
* INITIALS alanı çalışanın ad ve soyadının baş harflerini
* saklamak için kullanılır.
*
* Örnek:
*
* Çalışan Adı : Joe Smith
* Initials    : JS
*
* Bu alan genellikle karakter tabanlı bir veri tipi kullanır.
*
*---------------------------------------------------------------------*
* GENDER
*---------------------------------------------------------------------*
*
* GENDER alanı çalışanın cinsiyet bilgisini saklamak için kullanılır.
*
* Bu alan da karakter tabanlı bir veri tipi kullanır.
*
*---------------------------------------------------------------------*
* SALARY
*---------------------------------------------------------------------*
*
* SALARY alanı çalışanın maaş bilgisini saklamak için kullanılır.
*
* Buradaki önemli nokta SALARY alanının veri tipinin
* CURR olarak tanımlanmış olmasıdır.
*
* CURR, SAP sisteminde parasal tutarları saklamak için
* kullanılan veri tipidir.
*
* Örnek:
*
* SALARY = 50000
*
* Fakat yalnızca 50000 değerinin bulunması yeterli değildir.
*
* SAP bu tutarın hangi para birimine ait olduğunu da bilmelidir.
*
* Örneğin:
*
* 50000 TRY
* 50000 EUR
* 50000 USD
*
* Bu nedenle CURR veri tipine sahip bir alanın genellikle
* bir para birimi alanına bağlanması gerekir.
*
*---------------------------------------------------------------------*
* ECURRENCY
*---------------------------------------------------------------------*
*
* ECURRENCY alanı SALARY alanındaki maaşın hangi para birimine
* ait olduğunu saklamak için kullanılır.
*
* ECURRENCY alanının veri tipi CUKY'dir.
*
* CUKY, SAP sisteminde para birimi anahtarlarını saklamak için
* kullanılan veri tipidir.
*
* Örnek değerler:
*
* TRY = Türk Lirası
* EUR = Euro
* USD = Amerikan Doları
*
*---------------------------------------------------------------------*
* 3. PARA BİRİMİ REFERANSININ TANIMLANMASI
*---------------------------------------------------------------------*
*
* SALARY alanı CURR veri tipine sahip olduğu için SAP'e
* maaşın para biriminin hangi alanda bulunduğunu belirtmemiz gerekir.
*
* Bu nedenle ECURRENCY alanını SALARY alanının referans alanı
* olarak tanımladık.
*
* Tablonun "Currency/Quantity Fields" bölümünde aşağıdaki
* tanımlamayı yaptık:
*
* Field           : SALARY
* Reference Table : ZEMPLOYEES2
* Reference Field : ECURRENCY
*
* Reference Table olarak ZEMPLOYEES2 yazmamızın nedeni,
* ECURRENCY alanının ZEMPLOYEES2 tablosunun içerisinde bulunmasıdır.
*
* Reference Field olarak ECURRENCY yazmamızın nedeni ise,
* SALARY değerinin para biriminin ECURRENCY alanında tutulmasıdır.
*
*---------------------------------------------------------------------*
* 4. REFERANS NASIL ÇALIŞIR?
*---------------------------------------------------------------------*
*
* Örnek:
*
* SALARY    = 50000
* ECURRENCY = TRY
*
* SAP bu bilgiyi şu şekilde yorumlayabilir:
*
* 50000 TRY
*
* Başka bir çalışan için:
*
* SALARY    = 3000
* ECURRENCY = EUR
*
* SAP bu bilgiyi:
*
* 3000 EUR
*
* olarak yorumlayabilir.
*
* Burada ECURRENCY alanı maaş değerini tutmaz.
*
* ECURRENCY yalnızca SALARY alanındaki tutarın hangi para
* birimine ait olduğunu belirtir.
*
*---------------------------------------------------------------------*
* 5. VERİ TİPLERİ ARASINDAKİ İLİŞKİ
*---------------------------------------------------------------------*
*
* SALARY
*   |
*   |-- Veri Tipi: CURR
*   |
*   |-- Reference Table: ZEMPLOYEES2
*   |
*   |-- Reference Field: ECURRENCY
*
* ECURRENCY
*   |
*   |-- Veri Tipi: CUKY
*   |
*   |-- TRY, EUR ve USD gibi para birimi anahtarlarını saklar.
*
*---------------------------------------------------------------------*
* 6. DERSİN ÖZETİ
*---------------------------------------------------------------------*
*
* Bu derste:
*
* - Mevcut bir SAP veritabanı tablosunun nasıl kopyalandığını,
* - ZEMPLOYEES tablosundan ZEMPLOYEES2 tablosunun nasıl oluşturulduğunu,
* - Kopyalanan tabloya yeni alanların nasıl eklendiğini,
* - INITIALS alanının nasıl eklendiğini,
* - GENDER alanının nasıl eklendiğini,
* - SALARY alanının CURR veri tipi ile nasıl oluşturulduğunu,
* - ECURRENCY alanının CUKY veri tipi ile nasıl oluşturulduğunu,
* - SALARY ile ECURRENCY arasında nasıl referans kurulduğunu,
* - Parasal alanlarda neden para birimi referansına ihtiyaç olduğunu
*   öğrendik.
*
* Bu dersteki en önemli bağlantı:
*
* SALARY -> ZEMPLOYEES2 -> ECURRENCY
*
* SALARY parasal tutarı saklar.
* ECURRENCY ise bu tutarın para birimini saklar.
*
*---------------------------------------------------------------------*