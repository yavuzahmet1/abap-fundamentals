************************************************************************
* LESSON: APPEND STRUCTURES IN SAP ABAP DICTIONARY
************************************************************************
*
* ENGLISH VERSION
*
************************************************************************
* 1. WHAT IS AN APPEND STRUCTURE?
************************************************************************
*
* An Append Structure is used to add additional fields to an existing
* SAP Dictionary table or structure without directly changing the
* original field definition.
*
* In simple terms:
*
*     Existing Table
*           +
*     Append Structure
*           =
*     Extended Table
*
* The additional fields become part of the table after the Append
* Structure is activated.
*
*
************************************************************************
* 2. EXAMPLE USED IN THIS LESSON
************************************************************************
*
* In this lesson, the existing database table is:
*
*     ZEMPLOYEES2
*
* The Append Structure created for this table is:
*
*     ZAZEMPLOYEES2
*
* Short Description:
*
*     Extra Fields For Employees
*
* After the Append Structure was created and activated, SAP displayed
* the following entry at the bottom of the Fields tab:
*
*     .APPEND     ZAZEMPLOYEES2
*
* This means that ZAZEMPLOYEES2 is now connected to ZEMPLOYEES2.
*
*
************************************************************************
* 3. BEFORE USING AN APPEND STRUCTURE
************************************************************************
*
* The original ZEMPLOYEES2 table contained fields such as:
*
*     CLIENT
*     EMPLOYEE
*     SURNAME
*     FORENAME
*     TITLE
*     DOB
*     INITIALS
*     GENDER
*     SALARY
*     ECURRENCY
*
* These fields belong directly to the original table definition.
*
*
************************************************************************
* 4. WHY DO WE USE AN APPEND STRUCTURE?
************************************************************************
*
* An Append Structure allows us to extend a table separately from the
* original table definition.
*
* This is especially important when working with SAP standard tables.
*
* We should normally avoid directly modifying SAP standard objects.
*
* Instead of changing the original SAP table, we can create an
* Append Structure and add our own custom fields there.
*
* Example:
*
*     SAP STANDARD TABLE
*             |
*             |
*             +---- APPEND STRUCTURE
*                       |
*                       +---- Custom Field 1
*                       +---- Custom Field 2
*                       +---- Custom Field 3
*
* This keeps the custom extension separated from the original SAP
* definition.
*
*
************************************************************************
* 5. APPEND STRUCTURE WITH A CUSTOM Z TABLE
************************************************************************
*
* ZEMPLOYEES2 starts with the letter Z.
*
* Objects beginning with Z or Y normally belong to the customer
* namespace in SAP.
*
* Because ZEMPLOYEES2 is our own custom table, we could also add fields
* directly to the table.
*
* However, using an Append Structure is still useful for learning how
* SAP table extensions work.
*
* It also helps keep additional fields logically separated from the
* original table definition.
*
*
************************************************************************
* 6. HOW THE APPEND STRUCTURE WAS CREATED
************************************************************************
*
* STEP 1:
*
* Open transaction SE11.
*
*
* STEP 2:
*
* Open the database table:
*
*     ZEMPLOYEES2
*
*
* STEP 3:
*
* Switch to Change mode.
*
*
* STEP 4:
*
* Choose:
*
*     Append Structure...
*
*
* STEP 5:
*
* Create a new Append Structure.
*
* In this example:
*
*     Append Structure Name: ZAZEMPLOYEES2
*
*
* STEP 6:
*
* Enter a Short Description.
*
* Example:
*
*     Extra Fields For Employees
*
*
* STEP 7:
*
* Add the required new fields to the Append Structure.
*
* These fields are defined inside ZAZEMPLOYEES2 instead of being
* defined directly inside ZEMPLOYEES2.
*
*
* STEP 8:
*
* Save the Append Structure.
*
*
* STEP 9:
*
* Activate the Append Structure.
*
* Shortcut:
*
*     CTRL + F3
*
*
* STEP 10:
*
* SAP adjusts the original database table.
*
* After activation, the Append Structure becomes part of the table.
*
*
************************************************************************
* 7. WHAT DOES .APPEND MEAN?
************************************************************************
*
* After activation, the following line appeared in ZEMPLOYEES2:
*
*     .APPEND     ZAZEMPLOYEES2
*
* The ".APPEND" entry is created and displayed by SAP.
*
* We do not manually create this line as a normal table field.
*
* It tells us that an Append Structure has been attached to the table.
*
* In our example:
*
*     ZEMPLOYEES2
*          |
*          +---- .APPEND
*                    |
*                    +---- ZAZEMPLOYEES2
*
*
************************************************************************
* 8. WHAT HAPPENS TO THE FIELDS INSIDE THE APPEND STRUCTURE?
************************************************************************
*
* The fields defined inside the Append Structure become part of the
* table after activation.
*
* Conceptually:
*
*     ZEMPLOYEES2
*     |
*     +---- CLIENT
*     +---- EMPLOYEE
*     +---- SURNAME
*     +---- FORENAME
*     +---- TITLE
*     +---- DOB
*     +---- INITIALS
*     +---- GENDER
*     +---- SALARY
*     +---- ECURRENCY
*     |
*     +---- .APPEND -> ZAZEMPLOYEES2
*                         |
*                         +---- Additional Field
*                         +---- Additional Field
*
* From an ABAP program, the appended fields can be used as fields of
* the table.
*
*
************************************************************************
* 9. IMPORTANT: APPEND FIELDS ARE ADDED AT THE END
************************************************************************
*
* Append Structure fields are appended to the end of the existing
* table structure.
*
* Therefore, the original fields remain in their original order and
* the additional fields are placed after them.
*
*
************************************************************************
* 10. APPEND STRUCTURE AND DATABASE TABLE
************************************************************************
*
* An Append Structure is not only a visual grouping in SE11.
*
* After activation, SAP adjusts the database definition of the table
* so that the appended fields are physically included in the database
* table as well.
*
* This is why, during activation, we saw a message similar to:
*
*     TABL ZEMPLOYEES2 was adjusted
*
* This means SAP adjusted the table after activating the Append
* Structure.
*
*
************************************************************************
* 11. ACTIVATION STATUS
************************************************************************
*
* When the Append Structure was first created, its status appeared as:
*
*     New
*
* This meant that the object existed but had not yet been completely
* activated.
*
* After saving and activating it, SAP successfully connected it to
* ZEMPLOYEES2.
*
* The activation log showed:
*
*     TABL ZAZEMPLOYEES2 activated
*
* and:
*
*     TABL ZEMPLOYEES2 was adjusted
*
* This confirmed that the Append Structure had been activated
* successfully.
*
*
************************************************************************
* 12. ENHANCEMENT CATEGORY WARNING
************************************************************************
*
* During activation, SAP displayed warnings such as:
*
*     Enhancement category for table missing
*
*     Enhancement category for include or subtype missing
*
* These were warnings, not activation errors.
*
* The table and Append Structure were still activated successfully.
*
* Enhancement Category tells SAP what kinds of enhancements are
* allowed for a table or structure.
*
* It is good practice to define the appropriate Enhancement Category
* for Dictionary objects.
*
*
************************************************************************
* 13. APPEND STRUCTURE VS DIRECTLY ADDING A FIELD
************************************************************************
*
* METHOD 1:
* Add the field directly to the table.
*
*     ZEMPLOYEES2
*         |
*         +---- Existing Fields
*         +---- New Field
*
*
* METHOD 2:
* Add the fields through an Append Structure.
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
* With an Append Structure, the extension is maintained separately
* from the original field list.
*
*
************************************************************************
* 14. WHY IS THIS IMPORTANT FOR SAP STANDARD TABLES?
************************************************************************
*
* Imagine that SAP provides a standard employee table.
*
* Our company wants to add a company-specific field:
*
*     ZZPERSONNEL_CARD
*
* Directly modifying the SAP standard table would change the original
* SAP object.
*
* A better approach is to use an Append Structure:
*
*     SAP STANDARD TABLE
*             |
*             +---- APPEND STRUCTURE
*                       |
*                       +---- ZZPERSONNEL_CARD
*
* In this way, the custom field is separated from the SAP standard
* definition.
*
*
************************************************************************
* 15. APPEND STRUCTURE FIELDS AND ABAP PROGRAMS
************************************************************************
*
* After an Append Structure is activated, its fields can be accessed
* from ABAP just like the other fields of the table.
*
* Conceptual example:
*
* SELECT *
*   FROM zemployees2
*   INTO TABLE @DATA(lt_employees).
*
* The resulting internal table structure also contains the active
* appended fields.
*
*
************************************************************************
* 16. IMPORTANT RULES TO REMEMBER
************************************************************************
*
* 1. An Append Structure extends an existing table or structure.
*
* 2. It does not replace the original table.
*
* 3. Its fields are added to the end of the original structure.
*
* 4. The Append Structure must be saved and activated.
*
* 5. After activation, SAP adjusts the related database table.
*
* 6. The ".APPEND" line shows that an Append Structure is connected.
*
* 7. The ".APPEND" line is managed by SAP and is not a normal field.
*
* 8. Append Structures are particularly useful for extending
*    SAP standard tables without directly modifying their original
*    definition.
*
* 9. For our own Z/Y tables, fields can also be added directly, but
*    Append Structures can still be used to separate extensions.
*
*
************************************************************************
* 17. OUR EXAMPLE IN SUMMARY
************************************************************************
*
* Original Table:
*
*     ZEMPLOYEES2
*
* Append Structure:
*
*     ZAZEMPLOYEES2
*
* Description:
*
*     Extra Fields For Employees
*
* Relationship:
*
*     ZEMPLOYEES2
*          |
*          +---- .APPEND
*                    |
*                    +---- ZAZEMPLOYEES2
*
* Result:
*
* The additional fields defined in ZAZEMPLOYEES2 become part of
* ZEMPLOYEES2 after activation.
*
*
************************************************************************
* 18. SHORT DEFINITION
************************************************************************
*
* APPEND STRUCTURE:
*
* An Append Structure is an SAP Dictionary object used to extend an
* existing table or structure with additional fields without defining
* those fields directly in the original field list.
*
************************************************************************
************************************************************************
*
* TÜRKÇE VERSİYON
*
************************************************************************
* DERS: SAP ABAP DICTIONARY APPEND STRUCTURE
************************************************************************
*
************************************************************************
* 1. APPEND STRUCTURE NEDİR?
************************************************************************
*
* Append Structure, SAP Dictionary içerisinde mevcut bir tabloya veya
* structure'a, orijinal alan listesini doğrudan değiştirmeden yeni
* alanlar eklemek için kullanılan bir yapıdır.
*
* Basit olarak:
*
*     Mevcut Tablo
*          +
*     Append Structure
*          =
*     Genişletilmiş Tablo
*
* Append Structure aktive edildikten sonra içerisindeki alanlar ana
* tablonun bir parçası haline gelir.
*
*
************************************************************************
* 2. BU DERSTE KULLANDIĞIMIZ ÖRNEK
************************************************************************
*
* Bu derste mevcut database tablomuz:
*
*     ZEMPLOYEES2
*
* Bu tablo için oluşturduğumuz Append Structure:
*
*     ZAZEMPLOYEES2
*
* Short Description:
*
*     Extra Fields For Employees
*
* Append Structure oluşturulup aktive edildikten sonra ZEMPLOYEES2
* tablosunun Fields ekranının altında şu satır görüntülendi:
*
*     .APPEND     ZAZEMPLOYEES2
*
* Bu satır, ZAZEMPLOYEES2 Append Structure'ının artık ZEMPLOYEES2
* tablosuna bağlı olduğunu gösterir.
*
*
************************************************************************
* 3. APPEND STRUCTURE OLUŞTURMADAN ÖNCE
************************************************************************
*
* ZEMPLOYEES2 tablomuzda şu alanlar bulunuyordu:
*
*     CLIENT
*     EMPLOYEE
*     SURNAME
*     FORENAME
*     TITLE
*     DOB
*     INITIALS
*     GENDER
*     SALARY
*     ECURRENCY
*
* Bu alanlar doğrudan ZEMPLOYEES2 tablosunun kendi tanımına aittir.
*
*
************************************************************************
* 4. APPEND STRUCTURE'I NEDEN KULLANIYORUZ?
************************************************************************
*
* Append Structure sayesinde mevcut bir tabloyu, ana tablonun alan
* tanımından ayrı şekilde genişletebiliriz.
*
* Bu özellik özellikle SAP Standard tablolarında çok önemlidir.
*
* Normal şartlarda SAP tarafından oluşturulan standard objeleri
* doğrudan değiştirmek istemeyiz.
*
* Bunun yerine kendi Append Structure'ımızı oluşturup şirketimize özel
* alanları bu yapının içerisine ekleyebiliriz.
*
* Örneğin:
*
*     SAP STANDARD TABLE
*             |
*             |
*             +---- APPEND STRUCTURE
*                       |
*                       +---- Özel Alan 1
*                       +---- Özel Alan 2
*                       +---- Özel Alan 3
*
* Böylece bizim geliştirmemiz SAP'nin orijinal tablo tanımından ayrı
* şekilde tutulmuş olur.
*
*
************************************************************************
* 5. Z TABLODA APPEND STRUCTURE KULLANMAK
************************************************************************
*
* Bizim tablomuzun adı ZEMPLOYEES2.
*
* SAP'te Z veya Y ile başlayan objeler genellikle müşteri tarafından
* oluşturulan Custom objelerdir.
*
* Dolayısıyla ZEMPLOYEES2 bizim kendi tablomuz olduğu için istersek
* yeni alanları doğrudan tablonun içine de ekleyebiliriz.
*
* Ancak Append Structure kullanarak SAP'te tablo genişletmenin nasıl
* yapıldığını öğrenmiş oluyoruz.
*
* Ayrıca sonradan eklenen alanları ana tablo tanımından mantıksal
* olarak ayrı tutabiliriz.
*
*
************************************************************************
* 6. APPEND STRUCTURE'I NASIL OLUŞTURDUK?
************************************************************************
*
* ADIM 1:
*
* SE11 transaction'ını açtık.
*
*
* ADIM 2:
*
* Database tablomuzu açtık:
*
*     ZEMPLOYEES2
*
*
* ADIM 3:
*
* Change moduna geçtik.
*
*
* ADIM 4:
*
* Üst bölümden:
*
*     Append Structure...
*
* seçeneğine tıkladık.
*
*
* ADIM 5:
*
* Yeni bir Append Structure oluşturduk.
*
* Bizim örneğimizde:
*
*     Append Structure Name: ZAZEMPLOYEES2
*
*
* ADIM 6:
*
* Short Description girdik.
*
* Örneğin:
*
*     Extra Fields For Employees
*
*
* ADIM 7:
*
* Eklemek istediğimiz yeni alanları Append Structure içerisinde
* tanımladık.
*
* Böylece bu alanlar doğrudan ZEMPLOYEES2 içerisine değil,
* ZAZEMPLOYEES2 Append Structure'ı içerisine tanımlanmış oldu.
*
*
* ADIM 8:
*
* Append Structure'ı Save ettik.
*
*
* ADIM 9:
*
* Append Structure'ı Activate ettik.
*
* Kısayol:
*
*     CTRL + F3
*
*
* ADIM 10:
*
* SAP ana database tablosunu yeni yapıya göre ayarladı.
*
* Aktivasyondan sonra Append Structure ana tablonun bir parçası haline
* geldi.
*
*
************************************************************************
* 7. .APPEND NE ANLAMA GELİYOR?
************************************************************************
*
* Aktivasyondan sonra ZEMPLOYEES2 tablomuzda şu satırı gördük:
*
*     .APPEND     ZAZEMPLOYEES2
*
* ".APPEND" satırını bizim normal bir field gibi elle oluşturmamız
* gerekmez.
*
* SAP bunu kendisi gösterir.
*
* Bu satır, ana tabloya bir Append Structure bağlandığını belirtir.
*
* Bizim örneğimiz:
*
*     ZEMPLOYEES2
*          |
*          +---- .APPEND
*                    |
*                    +---- ZAZEMPLOYEES2
*
*
************************************************************************
* 8. APPEND STRUCTURE İÇERİSİNDEKİ ALANLARA NE OLUR?
************************************************************************
*
* Append Structure'ın içerisine tanımlanan alanlar, aktivasyondan
* sonra ana tablonun alanları haline gelir.
*
* Yapıyı kavramsal olarak şöyle düşünebiliriz:
*
*     ZEMPLOYEES2
*     |
*     +---- CLIENT
*     +---- EMPLOYEE
*     +---- SURNAME
*     +---- FORENAME
*     +---- TITLE
*     +---- DOB
*     +---- INITIALS
*     +---- GENDER
*     +---- SALARY
*     +---- ECURRENCY
*     |
*     +---- .APPEND -> ZAZEMPLOYEES2
*                         |
*                         +---- Yeni Alan
*                         +---- Yeni Alan
*
* Append Structure içerisinde oluşturulan alanlara daha sonra ABAP
* programlarından normal tablo alanları gibi erişebiliriz.
*
*
************************************************************************
* 9. APPEND ALANLARI TABLONUN SONUNA EKLENİR
************************************************************************
*
* Append Structure içerisindeki alanlar mevcut yapının sonuna eklenir.
*
* Yani tablonun eski alanlarının sırası korunur.
*
* Yeni alanlar mevcut alanların arkasına gelir.
*
*
************************************************************************
* 10. APPEND STRUCTURE DATABASE TABLOSUNU DA ETKİLER
************************************************************************
*
* Append Structure sadece SE11 içerisinde görünen görsel bir yapı
* değildir.
*
* Append Structure aktive edildiğinde SAP database tablosunu da yeni
* alanlara göre ayarlar.
*
* Aktivasyon sırasında gördüğümüz:
*
*     TABL ZEMPLOYEES2 was adjusted
*
* mesajının anlamı budur.
*
* SAP, Append Structure nedeniyle ZEMPLOYEES2 database tablosunun
* yapısını güncellemiştir.
*
*
************************************************************************
* 11. ACTIVATION STATUS
************************************************************************
*
* Append Structure'ı ilk oluşturduğumuzda Status alanında:
*
*     New
*
* yazıyordu.
*
* Bu, objenin oluşturulduğunu ancak henüz tam olarak aktive
* edilmediğini gösteriyordu.
*
* Save ve Activate işlemlerinden sonra activation log içerisinde:
*
*     TABL ZAZEMPLOYEES2 activated
*
* mesajını gördük.
*
* Ayrıca:
*
*     TABL ZEMPLOYEES2 was adjusted
*
* mesajını gördük.
*
* Böylece Append Structure'ın başarıyla aktive edildiğini ve
* ZEMPLOYEES2 tablosuna bağlandığını doğrulamış olduk.
*
*
************************************************************************
* 12. ENHANCEMENT CATEGORY UYARISI
************************************************************************
*
* Aktivasyon sırasında şu uyarıları gördük:
*
*     Enhancement category for table missing
*
*     Enhancement category for include or subtype missing
*
* Bunlar Error değil Warning mesajlarıydı.
*
* Bu nedenle Append Structure ve tablo yine de başarıyla aktive edildi.
*
* Enhancement Category, bir Dictionary objesinin gelecekte ne tür
* genişletmelere izin verdiğini SAP'e bildirir.
*
* Dictionary objelerinde uygun Enhancement Category tanımlamak iyi bir
* uygulamadır.
*
*
************************************************************************
* 13. DOĞRUDAN ALAN EKLEMEK İLE APPEND STRUCTURE ARASINDAKİ FARK
************************************************************************
*
* YÖNTEM 1:
* Yeni alanı doğrudan tabloya eklemek.
*
*     ZEMPLOYEES2
*         |
*         +---- Mevcut Alanlar
*         +---- Yeni Alan
*
*
* YÖNTEM 2:
* Yeni alanları Append Structure ile eklemek.
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
* Append Structure kullandığımızda ek geliştirmeler ana field
* listesinden ayrı olarak yönetilmiş olur.
*
*
************************************************************************
* 14. SAP STANDARD TABLOLARINDA NEDEN ÖNEMLİDİR?
************************************************************************
*
* SAP tarafından oluşturulmuş standard bir çalışan tablomuz olduğunu
* düşünelim.
*
* Şirketimiz bu tabloya kendine özel bir alan eklemek istiyor:
*
*     ZZPERSONNEL_CARD
*
* SAP standard tablosunu doğrudan değiştirmek, SAP'nin orijinal
* objesinde değişiklik yapmak anlamına gelir.
*
* Bunun yerine bir Append Structure oluşturabiliriz:
*
*     SAP STANDARD TABLE
*             |
*             +---- APPEND STRUCTURE
*                       |
*                       +---- ZZPERSONNEL_CARD
*
* Böylece şirketimize özel geliştirme SAP standard tablo tanımından
* ayrı tutulur.
*
*
************************************************************************
* 15. ABAP PROGRAMLARINDA APPEND ALANLARINI KULLANMA
************************************************************************
*
* Append Structure aktive edildikten sonra içerisindeki alanlar ABAP
* programlarında tablonun diğer alanları gibi kullanılabilir.
*
* Örnek mantık:
*
* SELECT *
*   FROM zemployees2
*   INTO TABLE @DATA(lt_employees).
*
* Eğer Append Structure içerisinde aktif ek alanlarımız varsa,
* lt_employees yapısında bu alanlar da bulunur.
*
*
************************************************************************
* 16. AKILDA TUTULMASI GEREKEN ÖNEMLİ NOKTALAR
************************************************************************
*
* 1. Append Structure mevcut bir tabloyu veya structure'ı genişletir.
*
* 2. Ana tablonun yerine geçmez.
*
* 3. Yeni alanlar mevcut yapının sonuna eklenir.
*
* 4. Append Structure Save ve Activate edilmelidir.
*
* 5. Aktivasyon sonrasında SAP ilgili database tablosunu ayarlar.
*
* 6. ".APPEND" satırı tabloya Append Structure bağlı olduğunu gösterir.
*
* 7. ".APPEND" normal bir database field değildir.
*
* 8. ".APPEND" satırı SAP tarafından yönetilir.
*
* 9. Append Structure özellikle SAP standard tablolarını doğrudan
*    değiştirmeden genişletmek için önemlidir.
*
* 10. Kendi Z/Y tablolarımızda alanları doğrudan ekleyebiliriz.
*
* 11. Buna rağmen Append Structure kullanarak ek alanları ayrı bir
*     yapı içerisinde düzenleyebiliriz.
*
*
************************************************************************
* 17. BİZİM ÖRNEĞİMİZİN ÖZETİ
************************************************************************
*
* Ana Tablo:
*
*     ZEMPLOYEES2
*
* Append Structure:
*
*     ZAZEMPLOYEES2
*
* Açıklama:
*
*     Extra Fields For Employees
*
* Bağlantı:
*
*     ZEMPLOYEES2
*          |
*          +---- .APPEND
*                    |
*                    +---- ZAZEMPLOYEES2
*
* Sonuç:
*
* ZAZEMPLOYEES2 içerisinde tanımladığımız yeni alanlar aktivasyondan
* sonra ZEMPLOYEES2 tablosunun bir parçası haline gelir.
*
*
************************************************************************
* 18. KISA TANIM
************************************************************************
*
* APPEND STRUCTURE:
*
* Mevcut bir SAP Dictionary tablosunu veya structure'ını, yeni alanları
* doğrudan ana field listesine tanımlamadan genişletmek için kullanılan
* SAP Dictionary objesidir.
*
************************************************************************