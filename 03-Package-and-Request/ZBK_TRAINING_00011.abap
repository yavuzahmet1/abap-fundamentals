*&---------------------------------------------------------------------*
*& Report ZBK_TRAINING_00011
*&---------------------------------------------------------------------*
*& BÖLÜM 3: PACKAGE VE REQUEST (TÜRKÇE - ENGLISH DÖKÜMANTASYON)
*& PART 3: PACKAGE AND REQUEST (TURKISH - ENGLISH DOCUMENTATION)
*&---------------------------------------------------------------------*

* ======================================================================
* [TÜRKÇE / TURKISH]
* ======================================================================
*
* 1. Neden Package (Paket) Oluştururuz? (Package)
* ----------------------------------------------------------------------
* SAP'de geliştirilen her nesnenin (program, tablo, sınıf vb.) mantıksal 
* olarak bir yerde gruplandırılması gerekir. Paketleri, bilgisayarımızdaki 
* "Klasörler" gibi düşünebiliriz. Paket oluşturmanın temel nedenleri:
* - Düzen ve Gruplama: Hangi programın hangi modüle/projeye ait olduğunu belirler.
* - Taşıma (Transport): Bir paketin içindeki nesneler, sistemler arasında 
*   (DEV -> QUA -> PROD) beraberce taşınabilir.
* - Yetkilendirme: Hangi yazılımcının hangi paketlerde değişiklik 
*   yapabileceği paket bazında yönetilebilir.
*
* 2. Local Package $TMP (Yerel Paket)
* ----------------------------------------------------------------------
* Başında "$" işareti olan paketler "Yerel (Local)" paketlerdir. 
* - $TMP içerisine kaydedilen hiçbir program, başka bir SAP sistemine 
*   (Test veya Canlıya) TAŞINAMAZ.
* - Genellikle eğitim amaçlı, deneme kodları yazarken veya geçici olarak 
*   çalıştırılacak raporlar için kullanılır.
*
* 3. DEV, QUA, PROD (3-Tier Landscape / 3'lü Sistem Mimarisi)
* ----------------------------------------------------------------------
* SAP'nin standart güvenli geliştirme döngüsüdür:
* - DEV (Development): Yazılımcıların kod yazdığı geliştirme sistemidir.
* - QUA (Quality): Kodların çalışıp çalışmadığının test edildiği sistemdir.
* - PROD (Production): Şirketin gerçek ticari verilerinin aktığı, gerçek 
*   kullanıcıların işlem yaptığı canlı sistemdir. PROD'da kod YAZILAMAZ.
*
* 4. Client (İstemci / Mantıksal Sistem)
* ----------------------------------------------------------------------
* Fiziksel bir SAP sunucusunun içindeki "mantıksal, izole odacıklardır". 
* Örneğin, DEV sistemine girerken "Client: 100", "Client: 200" gibi 
* girişler yaparsınız. 
* - ABAP kodları (programlar) Client bağımsızdır (Cross-client). Yani bir 
*   Client'ta yazdığınız kod, diğer Client'ta da görünür.
* - Ancak kullanıcılar, işlem verileri ve bazı ayarlar Client bağımlıdır. 
*   Client 100'deki deneme verisini, Client 200'de göremezsiniz.
*
* 5. Request (Transport Request / Taşıma Talebi)
* ----------------------------------------------------------------------
* DEV sisteminde yazdığımız kodları, QUA veya PROD sistemine aktarmak 
* için kullandığımız "Kargo" aracıdır.
* - Geliştirme yaptığınızda sistem size bir Request numarası verir 
*   (Örn: DEVK900123).
* - İşiniz bittiğinde bu Request'i onaylar (Release) ve yola çıkarırsınız. 
*   Böylece kodlar önce teste, sonra canlı sisteme güvenle taşınır.


* ======================================================================
* [ENGLISH / İNGİLİZCE]
* ======================================================================
*
* 1. Why do we create Packages? (Package)
* ----------------------------------------------------------------------
* Every object developed in SAP (program, table, class, etc.) must be 
* logically grouped somewhere. You can think of packages as "Folders" 
* on your computer. The main reasons for creating packages are:
* - Organization and Grouping: Determines which module/project a program belongs to.
* - Transport: Objects within a package can be transported together between 
*   systems (DEV -> QUA -> PROD).
* - Authorization: Controlling which developer can make changes in which 
*   packages can be managed at the package level.
*
* 2. Local Package $TMP
* ----------------------------------------------------------------------
* Packages starting with a "$" sign are "Local" packages.
* - Any program saved in $TMP CANNOT be transported to another SAP system 
*   (Quality or Production).
* - It is generally used for training purposes, writing trial codes, or 
*   for reports that will be executed temporarily.
*
* 3. DEV, QUA, PROD (3-Tier Landscape)
* ----------------------------------------------------------------------
* This is SAP's standard secure development lifecycle:
* - DEV (Development): The system where developers write code.
* - QUA (Quality): The system where the codes are tested to see if they work properly.
* - PROD (Production): The live system where the company's real commercial 
*   data flows and real users process transactions. You CANNOT write code in PROD.
*
* 4. Client
* ----------------------------------------------------------------------
* These are "logical, isolated compartments" within a physical SAP server. 
* For example, when logging into the DEV system, you might log in as 
* "Client: 100" or "Client: 200".
* - ABAP codes (programs) are Cross-client. This means the code you write 
*   in one client is also visible in another client.
* - However, users, transactional data, and some configurations are Client-dependent. 
*   You cannot see the test data from Client 100 in Client 200.
*
* 5. Request (Transport Request)
* ----------------------------------------------------------------------
* It is the "Cargo" vehicle we use to transfer the codes we write in the 
* DEV system to the QUA or PROD systems.
* - When you do development, the system assigns you a Request number 
*   (e.g., DEVK900123).
* - When you are finished, you Release this request. Thus, the codes are 
*   safely transported first to testing, and then to the live system.
*
*&---------------------------------------------------------------------*