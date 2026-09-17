*---------------------------------------------------------------------*
* 3-Tier Client/Server Architecture
*---------------------------------------------------------------------*
* ENGLISH
*
* SAP uses a 3-tier architecture. This means the system is divided
* into three main layers:
*
* 1) Presentation Layer
*    - This is the user interface layer.
*    - Users interact with the system through SAP GUI.
*    - It is responsible for displaying screens and receiving user input.
*
* 2) Application Layer
*    - This is where the business logic runs.
*    - ABAP programs are processed in this layer.
*    - It receives requests from the Presentation Layer,
*      processes them, and communicates with the Database Layer.
*
* 3) Database Layer
*    - This is where the data is stored.
*    - Tables such as ZEMPLOYEES2 are stored in the database.
*    - The application server reads data from here and writes data here.
*
* Simple Flow:
* SAP GUI -> Application Server -> Database
*
* Example:
* When the user runs an ABAP program with a SELECT statement,
* the request starts in SAP GUI, then goes to the application server,
* and the application server fetches the data from the database.
* Finally, the result is sent back to the SAP GUI screen.
*
* In short:
* Presentation Layer = shows screens
* Application Layer  = processes ABAP logic
* Database Layer     = stores data
*
*---------------------------------------------------------------------*
* TURKISH
*
* SAP, 3 katmanlı bir mimari kullanır. Bu yapı sistemin üç ana
* katmana ayrılması anlamına gelir:
*
* 1) Presentation Layer (Sunum Katmanı)
*    - Kullanıcının gördüğü arayüz katmanıdır.
*    - Kullanıcılar sisteme SAP GUI üzerinden bağlanır.
*    - Ekranları gösterir ve kullanıcı girişlerini alır.
*
* 2) Application Layer (Uygulama Katmanı)
*    - İş mantığının çalıştığı katmandır.
*    - ABAP programları bu katmanda çalıştırılır.
*    - Presentation Layer'dan gelen istekleri alır,
*      işler ve Database Layer ile iletişim kurar.
*
* 3) Database Layer (Veritabanı Katmanı)
*    - Verilerin saklandığı katmandır.
*    - ZEMPLOYEES2 gibi tablolar veritabanında tutulur.
*    - Application Server verileri buradan okur ve buraya yazar.
*
* Basit Akış:
* SAP GUI -> Application Server -> Database
*
* Örnek:
* Kullanıcı SELECT komutu içeren bir ABAP programı çalıştırdığında,
* istek önce SAP GUI'den gelir, sonra application server'a gider,
* application server veriyi database'den alır.
* Son olarak sonuç tekrar SAP GUI ekranında kullanıcıya gösterilir.
*
* Kısaca:
* Presentation Layer = ekranı gösterir
* Application Layer  = ABAP mantığını çalıştırır
* Database Layer     = veriyi saklar
*---------------------------------------------------------------------*