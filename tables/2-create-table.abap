* ==============================================================================
* TOPIC: CREATING A DATABASE TABLE - DELIVERY & MAINTENANCE (SE11)
* ==============================================================================

* 1. GENERAL INFORMATION
* ------------------------------------------------------------------------------
* Screen Title     : Dictionary: Change Table (or Create Table)
* Table Name       : ZEMPLOYEES (Status: New)
* Short Description: 'Employees' (A mandatory short text describing the table's purpose).

* 2. DELIVERY AND MAINTENANCE TAB
* ------------------------------------------------------------------------------
* This tab defines how the table's data will be handled during system upgrades 
* and whether the data can be manually maintained by users.

* a) Delivery Class (Teslimat Sınıfı)
* -----------------------------------
* Value Selected   : 'A' - Application table (master and transaction data).
* Purpose          : The Delivery Class controls the transport of table data for 
*                    installations, upgrades, and client copies. 
*                    Class 'A' is the most common for custom tables holding 
*                    business data (master or transaction data). It means the 
*                    customer, not SAP, is responsible for maintaining this data.

* b) Data Browser/Table View Editing (Veri Görüntüleme/Bakım İzni)
* -----------------------------------
* Value Selected   : 'Display/Maintenance Allowed'
* Purpose          : This setting controls whether users can view or edit the 
*                    table's records directly using standard tools like SE16 
*                    (Data Browser), SE16N, or SM30 (Table Maintenance).
*                    Setting it to "Allowed" means you can freely insert, update, 
*                    or view records in the table without writing a custom ABAP program.
* ==============================================================================

**TR
* ==============================================================================
* KONU: VERİTABANI TABLOSU OLUŞTURMA - TESLİMAT VE BAKIM (SE11)
* ==============================================================================

* 1. GENEL BİLGİLER
* ------------------------------------------------------------------------------
* Ekran Başlığı    : Dictionary: Change Table (Sözlük: Tablo Değiştir/Oluştur)
* Tablo Adı        : ZEMPLOYEES (Durum: New / Yeni)
* Short Description: 'Employees' (Tablonun amacını açıklayan zorunlu kısa metin).

* 2. DELIVERY AND MAINTENANCE (TESLİMAT VE BAKIM) SEKMESİ
* ------------------------------------------------------------------------------
* Bu sekme, sistem güncellemeleri sırasında tablo verilerinin nasıl davranacağını 
* ve verilerin kullanıcılar tarafından manuel olarak düzenlenip düzenlenemeyeceğini belirler.

* a) Delivery Class (Teslimat Sınıfı)
* -----------------------------------
* Seçilen Değer    : 'A' - Uygulama tablosu (Ana veri ve işlem verisi / master and transaction data).
* Amaç             : Tablo verilerinin kurulum, güncelleme (upgrade) ve client 
*                    kopyalama işlemlerinde nasıl taşınacağını kontrol eder. 
*                    'A' sınıfı, iş verilerini tutan özel tablolar için en sık 
*                    kullanılan sınıftır. Bu verilerin bakımından SAP'nin değil, 
*                    müşterinin (kurumun) sorumlu olduğunu ifade eder.

* b) Data Browser/Table View Editing (Veri Görüntüleme/Bakım İzni)
* -----------------------------------
* Seçilen Değer    : 'Display/Maintenance Allowed' (Görüntüleme/Bakım İzinli)
* Amaç             : Kullanıcıların SE16 (Data Browser), SE16N veya SM30 (Tablo Bakımı) 
*                    gibi standart SAP araçlarını kullanarak tablo içindeki kayıtları 
*                    görüntüleyip görüntüleyemeyeceğini veya değiştiremeyeceğini kontrol eder.
*                    Bunun "Allowed" (İzin verildi) olarak seçilmesi, tabloya veri 
*                    eklemek veya verileri okumak için özel bir ABAP programı yazmanıza 
*                    gerek kalmadan doğrudan müdahale edebileceğiniz anlamına gelir.
* ==============================================================================