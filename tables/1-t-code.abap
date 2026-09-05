* ==============================================================================
* TOPIC: ABAP DICTIONARY & DATABASE TABLES (SE11)
* FOLDER: tables / t-code.abap
* ==============================================================================

* 1. TRANSACTION OVERVIEW
* ------------------------------------------------------------------------------
* Transaction Code : SE11
* Title            : ABAP Dictionary: Initial Screen
* Purpose          : Central tool for managing all metadata definitions in SAP,
*                    including database tables, data elements, domains, and views.

* 2. OBJECT DEFINITION & NAMING CONVENTIONS
* ------------------------------------------------------------------------------
* Selected Object  : Database Table
* Object Name      : ZEMPLOYEES
* Prefix Rule      : Custom objects created by developers must begin with 'Z' or 'Y'.
*                    Standard SAP-delivered tables do not use these prefixes.
* Functionality    : A custom repository table meant to store employee records.

* 3. INITIAL SCREEN ACTIONS
* ------------------------------------------------------------------------------
* Display (F7)     : Opens an existing table definition in read-only mode.
* Change  (F6)     : Modifies fields, data types, technical settings, or keys
*                    of an existing database table.
* Create  (F5)     : Initializes the step-by-step definition for a new table.

* 4. WORKFLOW FOR CREATING A DATABASE TABLE
* ------------------------------------------------------------------------------
* Step 1: Provide Short Description and Delivery Class (e.g., 'A' for Application data).
* Step 2: Set Data Browser/Table View Maintenance settings.
* Step 3: Define fields, primary keys (MANDT for client-dependency), and data elements.
* Step 4: Configure Technical Settings (Data Class, Size Category, Buffering).
* Step 5: Save, Check syntax, and Activate (Ctrl + F3).
* ==============================================================================
**TR
* ==============================================================================
* KONU: ABAP SÖZLÜĞÜ (DICTIONARY) & VERİTABANI TABLOLARI (SE11)
* KLASÖR: tables / t-code.abap
* ==============================================================================

* 1. İŞLEM KODU (TRANSACTION) ÖZETİ
* ------------------------------------------------------------------------------
* İşlem Kodu       : SE11
* Başlık           : ABAP Sözlüğü: Başlangıç Ekranı (ABAP Dictionary: Initial Screen)
* Amaç             : SAP'deki veritabanı tabloları, veri elemanları (data elements), 
*                    alan adları (domains) ve görünümler (views) gibi tüm meta veri 
*                    tanımlarını yönetmek için kullanılan merkezi araçtır.

* 2. NESNE TANIMI VE İSİMLENDİRME KURALLARI
* ------------------------------------------------------------------------------
* Seçilen Nesne    : Veritabanı Tablosu (Database Table)
* Nesne Adı        : ZEMPLOYEES
* Ön Ek Kuralı     : Geliştiriciler tarafından oluşturulan özel (custom) nesneler 
*                    'Z' veya 'Y' harfi ile başlamak zorundadır. SAP'nin standart 
*                    tablolarında bu ön ekler bulunmaz.
* İşlev            : Çalışan kayıtlarını tutmak amacıyla tasarlanmış özel bir tablo.

* 3. BAŞLANGIÇ EKRANI AKSİYONLARI
* ------------------------------------------------------------------------------
* Display (F7)     : (Görüntüle) Var olan bir tabloyu salt okunur (read-only) modda açar.
* Change  (F6)     : (Değiştir) Var olan bir veritabanı tablosunun alanlarını, veri 
*                    tiplerini, teknik ayarlarını veya anahtarlarını değiştirir.
* Create  (F5)     : (Oluştur) Yeni bir tablo oluşturmak için yapılandırma sürecini başlatır.

* 4. VERİTABANI TABLOSU OLUŞTURMA İŞ AKIŞI
* ------------------------------------------------------------------------------
* Adım 1: Kısa Açıklama (Short Description) ve Teslimat Sınıfı (Delivery Class) girilir 
*         (Örn: Uygulama verisi için 'A').
* Adım 2: Tablo Görünümü Bakım (Table View Maintenance) izinleri ayarlanır.
* Adım 3: Alanlar (fields), birincil anahtarlar (Client bağımlılığı için MANDT alanı) 
*         ve veri elemanları (data elements) tanımlanır.
* Adım 4: Teknik Ayarlar (Technical Settings - Data Class, Size Category vb.) yapılandırılır.
* Adım 5: Kaydet (Save), Sözdizimi kontrolü (Check) ve Aktifleştirme (Activate - Ctrl + F3) 
*         işlemleri yapılır.
* ==============================================================================