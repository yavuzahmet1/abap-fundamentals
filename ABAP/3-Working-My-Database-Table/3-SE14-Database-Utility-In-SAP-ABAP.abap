************************************************************************
* LESSON: SE14 - DATABASE UTILITY IN SAP ABAP
************************************************************************
*
* ENGLISH VERSION
*
************************************************************************
* 1. WHAT IS SE14?
************************************************************************
*
* SE14 is the SAP transaction used for the Database Utility.
*
* It is mainly used to synchronize the definition of a table in
* the ABAP Dictionary with the actual table in the database.
*
* In simple terms:
*
*     SE11
*       |
*       | Defines the table structure
*       v
*     ABAP Dictionary
*       |
*       | SE14
*       v
*     Physical Database Table
*
* SE11 defines how the table SHOULD look.
*
* SE14 helps make sure that the actual database table matches
* that definition.
*
*
************************************************************************
* 2. SE11 VS SE14
************************************************************************
*
* SE11:
*
*     Used to create and maintain Dictionary objects.
*
* Examples:
*
*     - Tables
*     - Structures
*     - Data Elements
*     - Domains
*     - Views
*
*
* SE14:
*
*     Used to work with the database representation of a table.
*
* It is mainly used when the ABAP Dictionary definition and the
* physical database table need to be synchronized.
*
*
* Simple comparison:
*
*     SE11 = Define the table
*
*     SE14 = Adjust/manage the database table
*
*
************************************************************************
* 3. WHY DO WE NEED SE14?
************************************************************************
*
* Imagine that we already have this table:
*
*     ZEMPLOYEES2
*
* Initially:
*
*     ZEMPLOYEES2
*     |
*     +---- CLIENT
*     +---- EMPLOYEE
*     +---- SURNAME
*     +---- FORENAME
*
*
* Later, we change the Dictionary definition.
*
* For example, we add:
*
*     INITIALS
*     GENDER
*     SALARY
*     ECURRENCY
*
* Or we add an Append Structure:
*
*     ZAZEMPLOYEES2
*
* The Dictionary definition has now changed.
*
* SAP may need to adjust the physical database table so that
* the database also contains the new structure.
*
* SE14 is the utility used for this type of database adjustment.
*
*
************************************************************************
* 4. CONNECTION WITH OUR APPEND STRUCTURE EXAMPLE
************************************************************************
*
* In our previous lesson, we created:
*
*     Main Table:
*
*         ZEMPLOYEES2
*
*     Append Structure:
*
*         ZAZEMPLOYEES2
*
*
* After activating the Append Structure, SAP displayed a message:
*
*     TABL ZEMPLOYEES2 was adjusted
*
*
* This means that SAP also adjusted the physical database table
* according to the new Dictionary definition.
*
*
* Conceptually:
*
*     BEFORE
*
*     ZEMPLOYEES2
*         |
*         +---- Existing Fields
*
*
*     AFTER APPEND STRUCTURE
*
*     ZEMPLOYEES2
*         |
*         +---- Existing Fields
*         |
*         +---- .APPEND
*                   |
*                   +---- ZAZEMPLOYEES2
*                             |
*                             +---- New Fields
*
*
* SAP must make sure that the database representation is updated.
*
* SE14 gives us tools to perform or control this adjustment.
*
*
************************************************************************
* 5. HOW TO OPEN SE14
************************************************************************
*
* We can open the Database Utility by entering:
*
*     SE14
*
* in the SAP command field.
*
*
* Then we enter the table name.
*
* Example:
*
*     ZEMPLOYEES2
*
*
* After that, we can examine the database status and perform
* database-related operations.
*
*
************************************************************************
* 6. IMPORTANT FUNCTIONS IN SE14
************************************************************************
*
* SE14 contains several important database utility functions.
*
* Some of the most common ones are:
*
*     Activate and Adjust Database
*
*     Activate Database Table
*
*     Delete Database Table
*
*     Database Object
*
*     Processing Type
*
*
* The exact buttons and names can vary slightly depending on the
* SAP release.
*
*
************************************************************************
* 7. ACTIVATE AND ADJUST DATABASE
************************************************************************
*
* One of the most important functions in SE14 is:
*
*     Activate and Adjust Database
*
*
* This is used when the Dictionary definition of a table has changed
* and the database table must be adapted to the new definition.
*
*
* Example:
*
* Original table:
*
*     EMPLOYEE
*     SURNAME
*     FORENAME
*
*
* New definition:
*
*     EMPLOYEE
*     SURNAME
*     FORENAME
*     SALARY
*
*
* The Dictionary knows that SALARY exists.
*
* But the physical database table must also be updated.
*
* SE14 can perform this adjustment.
*
*
************************************************************************
* 8. WHAT DOES "ADJUST DATABASE" MEAN?
************************************************************************
*
* "Adjust Database" means:
*
* Make the physical database table compatible with the current
* ABAP Dictionary definition.
*
*
* In simple form:
*
*     ABAP Dictionary Definition
*              |
*              | Compare / Adjust
*              v
*     Physical Database Table
*
*
* If both structures already match, no major adjustment is required.
*
* If they are different, SAP may modify the database table.
*
*
************************************************************************
* 9. EXAMPLE
************************************************************************
*
* Suppose the Dictionary definition is:
*
*     ZEMPLOYEES2
*
*     CLIENT
*     EMPLOYEE
*     SURNAME
*     FORENAME
*     SALARY
*
*
* But the physical database table still contains:
*
*     CLIENT
*     EMPLOYEE
*     SURNAME
*     FORENAME
*
*
* There is a difference:
*
*     SALARY
*
* exists in the Dictionary but not yet in the physical table.
*
*
* SE14 can adjust the database so that the physical table becomes:
*
*     CLIENT
*     EMPLOYEE
*     SURNAME
*     FORENAME
*     SALARY
*
*
************************************************************************
* 10. WHAT IS A DATABASE OBJECT?
************************************************************************
*
* In SE14, we are working with the database representation of
* a Dictionary table.
*
* There are two important concepts:
*
*     Dictionary Object
*
* and
*
*     Database Object
*
*
* The Dictionary Object describes the table from the SAP side.
*
* The Database Object is the actual table created in the underlying
* database system.
*
*
* Example:
*
*     SE11 / Dictionary
*
*         ZEMPLOYEES2
*
*             |
*             v
*
*     Database
*
*         Physical table ZEMPLOYEES2
*
*
************************************************************************
* 11. DATABASE STATUS
************************************************************************
*
* SE14 can help us check whether the Dictionary definition and
* database definition are consistent.
*
*
* Ideally:
*
*     Dictionary Definition
*             =
*     Database Definition
*
*
* If there is a difference, a database adjustment may be necessary.
*
*
************************************************************************
* 12. WHEN WOULD WE USE SE14?
************************************************************************
*
* SE14 can be useful in situations such as:
*
* 1. Fields were added to a database table.
*
* 2. Fields were changed.
*
* 3. An Append Structure was added.
*
* 4. The Dictionary definition changed but the database table
*    was not adjusted correctly.
*
* 5. Activation produced database-related problems.
*
* 6. We need to inspect the database object.
*
* 7. We need to manually adjust the database table.
*
*
************************************************************************
* 13. DOES SE14 ALWAYS NEED TO BE USED MANUALLY?
************************************************************************
*
* No.
*
* In many normal situations, when a table is activated in SE11,
* SAP automatically performs the necessary database adjustment.
*
*
* Therefore:
*
*     SE11 Activate
*          |
*          v
*     SAP may automatically adjust the database
*
*
* SE14 is especially useful when:
*
*     - Automatic adjustment does not work
*     - There is an inconsistency
*     - We want to inspect the database status
*     - We need to perform an explicit database adjustment
*
*
************************************************************************
* 14. OUR APPEND STRUCTURE EXAMPLE
************************************************************************
*
* We created:
*
*     ZAZEMPLOYEES2
*
* and attached it to:
*
*     ZEMPLOYEES2
*
*
* After activation, the log showed:
*
*     TABL ZAZEMPLOYEES2 activated
*
* and:
*
*     TABL ZEMPLOYEES2 was adjusted
*
*
* The second message is directly related to the database adjustment.
*
* SAP updated the main table according to the new structure.
*
*
************************************************************************
* 15. IMPORTANT WARNING ABOUT SE14
************************************************************************
*
* SE14 is a powerful transaction.
*
* It must be used carefully.
*
* Some SE14 operations can change the physical database table.
*
* Incorrect operations may cause:
*
*     - Data loss
*     - Table deletion
*     - Database conversion
*     - Inconsistency
*
*
* For this reason, SE14 should not be used randomly in productive
* systems.
*
*
* Especially dangerous functions should only be used when we clearly
* understand their effect.
*
*
************************************************************************
* 16. DELETE DATABASE TABLE
************************************************************************
*
* SE14 may provide an option to delete the database table.
*
* This is very different from simply changing a Dictionary definition.
*
*
* Deleting a database table can remove the physically stored data.
*
*
* Therefore:
*
*     DELETE DATABASE TABLE
*
* must be treated with great care.
*
*
* Never use this function just to test what it does on an important
* system.
*
*
************************************************************************
* 17. STRUCTURAL CHANGES AND DATA
************************************************************************
*
* Some table changes are simple.
*
* Example:
*
* Adding a new CHAR field can often be handled without major problems.
*
*
* But some structural changes can be more complicated.
*
* Examples:
*
*     - Changing a field type
*     - Reducing field length
*     - Changing key fields
*     - Removing fields
*     - Changing incompatible data types
*
*
* These changes may require database conversion.
*
* They may also create a risk for existing data.
*
*
************************************************************************
* 18. SIMPLE WORKFLOW
************************************************************************
*
* A typical workflow can look like this:
*
*     STEP 1
*
*     Open SE11.
*
*
*     STEP 2
*
*     Change the table definition.
*
*
*     STEP 3
*
*     Save and activate the table.
*
*
*     STEP 4
*
*     SAP attempts to adjust the database automatically.
*
*
*     STEP 5
*
*     If there is a database inconsistency or adjustment problem,
*     use SE14 to inspect and adjust the database object.
*
*
************************************************************************
* 19. EASY WAY TO REMEMBER SE11 AND SE14
************************************************************************
*
* Remember:
*
*     SE11 = DESIGN
*
*     SE14 = DATABASE ADJUSTMENT
*
*
* Or:
*
*     SE11
*     "How should my table look?"
*
*
*     SE14
*     "Does the actual database table match this definition?"
*
*
************************************************************************
* 20. SE11 + SE14 RELATIONSHIP
************************************************************************
*
* Think of SE11 as an architectural drawing.
*
*     SE11
*       |
*       | Table Definition
*       v
*     Blueprint
*
*
* Think of the database as the actual building.
*
*     Database
*       |
*       v
*     Real Building
*
*
* SE14 helps make the actual building match the blueprint.
*
*
* Therefore:
*
*     SE11 = Blueprint
*
*     SE14 = Adjust the real database structure
*
*
************************************************************************
* 21. SUMMARY
************************************************************************
*
* SE14 is the SAP Database Utility transaction.
*
* Its main purpose is to manage and synchronize the relationship
* between:
*
*     ABAP Dictionary Table Definition
*
* and
*
*     Physical Database Table
*
*
* In our example:
*
*     ZEMPLOYEES2
*
* was changed by adding:
*
*     ZAZEMPLOYEES2
*
* as an Append Structure.
*
*
* After activation, SAP adjusted the physical database table.
*
*
* SE14 allows us to inspect and manually perform this type of database
* adjustment when necessary.
*
*
************************************************************************
* 22. SHORT DEFINITION
************************************************************************
*
* SE14:
*
* SE14 is the SAP Database Utility transaction used to activate,
* adjust, and manage the physical database representation of
* ABAP Dictionary tables.
*
************************************************************************
************************************************************************
*
* TÜRKÇE VERSİYON
*
************************************************************************
* DERS: SE14 - SAP DATABASE UTILITY
************************************************************************
*
************************************************************************
* 1. SE14 NEDİR?
************************************************************************
*
* SE14, SAP'teki Database Utility işlem kodudur.
*
* Temel amacı, ABAP Dictionary içerisinde tanımlanan bir database
* tablosu ile veritabanında fiziksel olarak bulunan gerçek tabloyu
* senkronize etmektir.
*
*
* Basit şekilde:
*
*     SE11
*       |
*       | Tablo yapısını tanımlarız
*       v
*     ABAP Dictionary
*       |
*       | SE14
*       v
*     Fiziksel Database Tablosu
*
*
* SE11 bize tablonun nasıl OLMASI GEREKTİĞİNİ söyler.
*
* SE14 ise gerçek database tablosunun bu tanıma uygun olup olmadığını
* kontrol etmek ve gerektiğinde ayarlamak için kullanılır.
*
*
************************************************************************
* 2. SE11 VE SE14 ARASINDAKİ FARK
************************************************************************
*
* SE11:
*
* Dictionary objelerini oluşturmak ve değiştirmek için kullanılır.
*
* Örneğin:
*
*     - Table
*     - Structure
*     - Data Element
*     - Domain
*     - View
*
*
* SE14:
*
* Database tablosunun fiziksel tarafıyla ilgilenir.
*
* Dictionary'deki tablo tanımı ile gerçek database tablosunun
* uyumlu hale getirilmesini sağlar.
*
*
* Kısaca:
*
*     SE11 = Tabloyu tanımlarız.
*
*     SE14 = Database tablosunu ayarlarız.
*
*
************************************************************************
* 3. SE14'E NEDEN İHTİYAÇ DUYARIZ?
************************************************************************
*
* Örneğin daha önce şu tablomuz olduğunu düşünelim:
*
*     ZEMPLOYEES2
*
*
* İlk durumda:
*
*     ZEMPLOYEES2
*     |
*     +---- CLIENT
*     +---- EMPLOYEE
*     +---- SURNAME
*     +---- FORENAME
*
*
* Daha sonra tablo tanımını değiştirdik.
*
* Örneğin şu alanları ekledik:
*
*     INITIALS
*     GENDER
*     SALARY
*     ECURRENCY
*
*
* Ya da bir Append Structure ekledik:
*
*     ZAZEMPLOYEES2
*
*
* Artık Dictionary tanımı değişti.
*
* SAP'in fiziksel database tablosunu da yeni yapıya göre güncellemesi
* gerekebilir.
*
* SE14 bu database adjustment işlemlerini yapmak için kullanılır.
*
*
************************************************************************
* 4. APPEND STRUCTURE DERSİMİZLE BAĞLANTISI
************************************************************************
*
* Önceki dersimizde:
*
*     Ana Tablo:
*
*         ZEMPLOYEES2
*
*
*     Append Structure:
*
*         ZAZEMPLOYEES2
*
*
* oluşturduk.
*
*
* Append Structure'ı aktive ettikten sonra activation log içerisinde
* şu mesajı gördük:
*
*     TABL ZEMPLOYEES2 was adjusted
*
*
* Bunun anlamı:
*
* SAP, Dictionary'deki yeni yapıya göre fiziksel database tablosunu
* da ayarladı.
*
*
* Mantık:
*
*     ÖNCE
*
*     ZEMPLOYEES2
*         |
*         +---- Mevcut Alanlar
*
*
*     APPEND STRUCTURE SONRASI
*
*     ZEMPLOYEES2
*         |
*         +---- Mevcut Alanlar
*         |
*         +---- .APPEND
*                   |
*                   +---- ZAZEMPLOYEES2
*                             |
*                             +---- Yeni Alanlar
*
*
* SAP'in database tarafını da buna göre güncellemesi gerekir.
*
* SE14 bu database adjustment işlemleri için kullanılan araçtır.
*
*
************************************************************************
* 5. SE14 NASIL AÇILIR?
************************************************************************
*
* SAP command alanına:
*
*     SE14
*
* yazılır.
*
*
* Daha sonra işlem yapmak istediğimiz tablo adı girilir.
*
* Örneğin:
*
*     ZEMPLOYEES2
*
*
* Buradan tablonun database durumunu inceleyebilir ve gerekli database
* işlemlerini gerçekleştirebiliriz.
*
*
************************************************************************
* 6. SE14 İÇERİSİNDEKİ ÖNEMLİ İŞLEMLER
************************************************************************
*
* SE14 içerisinde database ile ilgili farklı fonksiyonlar bulunur.
*
* Önemli işlemlerden bazıları:
*
*     Activate and Adjust Database
*
*     Activate Database Table
*
*     Delete Database Table
*
*     Database Object
*
*     Processing Type
*
*
* Kullanılan SAP sürümüne göre buton isimleri veya ekran görünümü
* küçük farklılıklar gösterebilir.
*
*
************************************************************************
* 7. ACTIVATE AND ADJUST DATABASE
************************************************************************
*
* SE14'ün en önemli işlemlerinden biri:
*
*     Activate and Adjust Database
*
*
* Dictionary'deki tablo yapısı değiştiğinde, fiziksel database
* tablosunu yeni tanıma uyarlamak için kullanılır.
*
*
* Örneğin eski tablomuz:
*
*     EMPLOYEE
*     SURNAME
*     FORENAME
*
*
* Yeni tablo tanımımız:
*
*     EMPLOYEE
*     SURNAME
*     FORENAME
*     SALARY
*
*
* Dictionary artık SALARY alanını biliyor.
*
* Ancak gerçek database tablosunun da SALARY alanını içermesi gerekir.
*
* SE14 database tablosunu yeni yapıya göre ayarlayabilir.
*
*
************************************************************************
* 8. "ADJUST DATABASE" NE DEMEKTİR?
************************************************************************
*
* Adjust Database demek:
*
* Fiziksel database tablosunu mevcut ABAP Dictionary tanımıyla
* uyumlu hale getirmek demektir.
*
*
* Basit mantık:
*
*     ABAP Dictionary Tanımı
*              |
*              | Karşılaştır / Ayarla
*              v
*     Fiziksel Database Tablosu
*
*
* Eğer iki yapı zaten aynıysa önemli bir değişiklik gerekmez.
*
* Eğer farklıysa SAP database tablosunu değiştirebilir.
*
*
************************************************************************
* 9. BASİT ÖRNEK
************************************************************************
*
* Dictionary tarafında tablomuz şöyle olsun:
*
*     ZEMPLOYEES2
*
*     CLIENT
*     EMPLOYEE
*     SURNAME
*     FORENAME
*     SALARY
*
*
* Fakat fiziksel database tablosunda sadece:
*
*     CLIENT
*     EMPLOYEE
*     SURNAME
*     FORENAME
*
* bulunduğunu düşünelim.
*
*
* Aradaki fark:
*
*     SALARY
*
*
* Dictionary'de SALARY mevcut ancak database tablosunda yok.
*
*
* SE14 ile database tablosu ayarlanarak yapı şu hale getirilebilir:
*
*     CLIENT
*     EMPLOYEE
*     SURNAME
*     FORENAME
*     SALARY
*
*
************************************************************************
* 10. DATABASE OBJECT NEDİR?
************************************************************************
*
* SE14 içerisinde bir Dictionary tablosunun database karşılığıyla
* çalışıyoruz.
*
* Burada iki kavram önemlidir:
*
*     Dictionary Object
*
* ve
*
*     Database Object
*
*
* Dictionary Object, SAP tarafında tanımladığımız tablo yapısıdır.
*
* Database Object ise altında çalışan database sisteminde fiziksel
* olarak oluşturulmuş gerçek tablodur.
*
*
* Örneğin:
*
*     SE11 / Dictionary
*
*         ZEMPLOYEES2
*
*             |
*             v
*
*     Database
*
*         Fiziksel ZEMPLOYEES2 tablosu
*
*
************************************************************************
* 11. DATABASE STATUS
************************************************************************
*
* SE14 sayesinde Dictionary'deki tanım ile database'deki gerçek
* tablonun uyumlu olup olmadığını kontrol edebiliriz.
*
*
* İdeal durumda:
*
*     Dictionary Definition
*             =
*     Database Definition
*
*
* Eğer iki taraf arasında fark varsa database adjustment gerekebilir.
*
*
************************************************************************
* 12. SE14 HANGİ DURUMLARDA KULLANILIR?
************************************************************************
*
* SE14 şu durumlarda kullanılabilir:
*
* 1. Database tablosuna yeni alanlar eklendiğinde.
*
* 2. Mevcut field tanımları değiştirildiğinde.
*
* 3. Append Structure eklendiğinde.
*
* 4. Dictionary yapısı değiştiği halde database doğru şekilde
*    güncellenmediğinde.
*
* 5. Activation sırasında database ile ilgili problem oluştuğunda.
*
* 6. Database object'i incelemek istediğimizde.
*
* 7. Database tablosunu manuel olarak adjust etmek gerektiğinde.
*
*
************************************************************************
* 13. HER DEĞİŞİKLİKTEN SONRA SE14 AÇMALI MIYIZ?
************************************************************************
*
* Hayır.
*
* Normal şartlarda SE11 içerisinde bir database tablosunu aktive
* ettiğimizde SAP gerekli database adjustment işlemlerini otomatik
* olarak yapmaya çalışır.
*
*
* Yani:
*
*     SE11 Activate
*          |
*          v
*     SAP Database'i otomatik olarak ayarlayabilir
*
*
* SE14 özellikle şu durumlarda önem kazanır:
*
*     - Otomatik adjustment başarısız olduğunda
*
*     - Dictionary ve Database arasında uyumsuzluk olduğunda
*
*     - Database durumunu kontrol etmek istediğimizde
*
*     - Manuel adjustment gerektiğinde
*
*
************************************************************************
* 14. BİZİM APPEND STRUCTURE ÖRNEĞİMİZ
************************************************************************
*
* Biz:
*
*     ZAZEMPLOYEES2
*
* Append Structure'ını oluşturduk.
*
*
* Bunu:
*
*     ZEMPLOYEES2
*
* tablosuna bağladık.
*
*
* Aktivasyondan sonra şu mesajları gördük:
*
*     TABL ZAZEMPLOYEES2 activated
*
*
* ve:
*
*     TABL ZEMPLOYEES2 was adjusted
*
*
* İkinci mesaj database adjustment ile ilgilidir.
*
* SAP ana tabloyu yeni Append Structure'a göre güncellemiştir.
*
*
************************************************************************
* 15. SE14 İLE İLGİLİ ÇOK ÖNEMLİ UYARI
************************************************************************
*
* SE14 güçlü bir transaction'dır.
*
* Dikkatli kullanılmalıdır.
*
* Çünkü bazı SE14 işlemleri fiziksel database tablosunu doğrudan
* değiştirebilir.
*
*
* Hatalı kullanım sonucunda:
*
*     - Veri kaybı
*
*     - Tablo silinmesi
*
*     - Database conversion
*
*     - Yapısal uyumsuzluk
*
* oluşabilir.
*
*
* Bu nedenle özellikle Production sistemlerinde SE14 işlemleri
* rastgele yapılmamalıdır.
*
*
************************************************************************
* 16. DELETE DATABASE TABLE
************************************************************************
*
* SE14 içerisinde database tablosunu silmeye yönelik işlemler
* bulunabilir.
*
*
* Bu işlem normal bir Dictionary değişikliğinden çok daha kritiktir.
*
* Çünkü fiziksel database tablosunun silinmesi mevcut verilerin de
* kaybolmasına neden olabilir.
*
*
* Bu yüzden:
*
*     DELETE DATABASE TABLE
*
* gibi işlemler çok dikkatli kullanılmalıdır.
*
*
* Önemli bir sistemde sadece deneme yapmak amacıyla bu tür işlemler
* kullanılmamalıdır.
*
*
************************************************************************
* 17. STRUCTURE DEĞİŞİKLİKLERİ VE VERİLER
************************************************************************
*
* Bazı tablo değişiklikleri basittir.
*
* Örneğin:
*
* Yeni bir CHAR field eklemek çoğu durumda kolay şekilde yapılabilir.
*
*
* Ancak bazı değişiklikler daha karmaşıktır.
*
* Örneğin:
*
*     - Field tipini değiştirmek
*
*     - Field uzunluğunu küçültmek
*
*     - Key field değiştirmek
*
*     - Field silmek
*
*     - Uyumlu olmayan veri tipleri arasında değişiklik yapmak
*
*
* Bu tür işlemlerde database conversion gerekebilir.
*
* Ayrıca mevcut veriler açısından risk oluşabilir.
*
*
************************************************************************
* 18. NORMAL ÇALIŞMA AKIŞI
************************************************************************
*
* Normal bir işlem sırası şöyle olabilir:
*
*     ADIM 1
*
*     SE11 açılır.
*
*
*     ADIM 2
*
*     Table definition değiştirilir.
*
*
*     ADIM 3
*
*     Save ve Activate yapılır.
*
*
*     ADIM 4
*
*     SAP database tablosunu otomatik olarak adjust etmeye çalışır.
*
*
*     ADIM 5
*
*     Eğer database uyumsuzluğu veya adjustment problemi varsa
*     SE14 kullanılarak database object kontrol edilir ve gerekirse
*     adjust edilir.
*
*
************************************************************************
* 19. SE11 VE SE14'Ü KOLAY HATIRLAMA YÖNTEMİ
************************************************************************
*
* Şöyle aklımızda tutabiliriz:
*
*     SE11 = DESIGN
*
*     SE14 = DATABASE ADJUSTMENT
*
*
* Başka bir ifadeyle:
*
*     SE11:
*
*     "Tablom nasıl görünmeli?"
*
*
*     SE14:
*
*     "Gerçek database tablom bu tanımla uyumlu mu?"
*
*
************************************************************************
* 20. SE11 VE SE14 İLİŞKİSİ
************************************************************************
*
* SE11'i bir binanın mimari projesi gibi düşünebiliriz.
*
*     SE11
*       |
*       | Table Definition
*       v
*     Mimari Proje
*
*
* Database'i ise gerçek bina gibi düşünebiliriz.
*
*     Database
*       |
*       v
*     Gerçek Bina
*
*
* SE14 ise gerçek binanın projeye uygun hale getirilmesine yardımcı
* olur.
*
*
* Yani:
*
*     SE11 = Proje
*
*     SE14 = Gerçek database yapısını projeye göre ayarlama
*
*
************************************************************************
* 21. ÖZET
************************************************************************
*
* SE14, SAP Database Utility transaction'ıdır.
*
* Temel amacı:
*
*     ABAP Dictionary Table Definition
*
* ile
*
*     Fiziksel Database Table
*
* arasındaki ilişkiyi yönetmek ve iki tarafı uyumlu hale getirmektir.
*
*
* Bizim örneğimizde:
*
*     ZEMPLOYEES2
*
* tablosuna:
*
*     ZAZEMPLOYEES2
*
* Append Structure'ını ekledik.
*
*
* Aktivasyondan sonra SAP fiziksel database tablosunu yeni yapıya
* göre adjust etti.
*
*
* Gerektiğinde bu database adjustment işlemlerini kontrol etmek veya
* manuel olarak gerçekleştirmek için SE14 kullanabiliriz.
*
*
************************************************************************
* 22. KISA TANIM
************************************************************************
*
* SE14:
*
* ABAP Dictionary'deki database tablo tanımı ile fiziksel database
* tablosunu kontrol etmek, aktive etmek, ayarlamak ve yönetmek için
* kullanılan SAP Database Utility transaction'ıdır.
*
************************************************************************