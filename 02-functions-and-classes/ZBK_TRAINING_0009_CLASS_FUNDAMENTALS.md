# ABAP Object Oriented (OOP) Temel Kavramları 🚀

Bu doküman, SAP ABAP'ta Nesne Yönelimli Programlamanın (OOP) temel yapı taşlarını anlamak için hazırlanmıştır. `SE24` (Class Builder) işlem kodunda karşılaştığımız sekmelerin ve kavramların açıklamalarını ve kullanım örneklerini içerir.

## 1. Class (Sınıf)

Sınıflar, nesneler (objects) yaratmak için kullanılan şablonlardır (taslaklardır). Bir sınıfın içinde veriler (`Attributes`) ve bu veriler üzerinde işlem yapan fonksiyonlar (`Methods`) bulunur. Sınıflar, `DEFINITION` (tanımlama) ve `IMPLEMENTATION` (uygulama) olmak üzere iki bölümden oluşur.

```abap
* Sınıf Tanımlaması
CLASS zcl_egitim_class DEFINITION.
  PUBLIC SECTION.
    " Herkese açık bileşenler
  PROTECTED SECTION.
    " Sadece bu sınıf ve miras alan sınıflara açık bileşenler
  PRIVATE SECTION.
    " Sadece bu sınıfa özel bileşenler
ENDCLASS.

* Sınıf Uygulaması (Metot içerikleri burada yazılır)
CLASS zcl_egitim_class IMPLEMENTATION.
  " Metotların kodları burada yer alır
ENDCLASS.
```

## 2. Attributes (Nitelikler / Özellikler)

Sınıfın sahip olduğu verileri veya durumları tutan değişkenlerdir. Normal ABAP programlarındaki `DATA` tanımlamalarının sınıf içindeki karşılığıdır.

* **Instance Attribute:** Her nesne için ayrı bir kopyası olur (`DATA` ile tanımlanır).
* **Static Attribute:** Sınıfın tüm nesneleri için ortaktır (`CLASS-DATA` ile tanımlanır).

```abap
CLASS zcl_egitim_class DEFINITION.
  PUBLIC SECTION.
    DATA: gv_isim TYPE string.         " Instance Attribute
    CLASS-DATA: gv_sayac TYPE i.       " Static Attribute
ENDCLASS.
```

## 3. Methods (Metotlar)

Metotlar, sınıfın yapabildiği eylemleri veya davranışları tanımlar. Form/Function modüllerinin sınıf içindeki karşılığıdır. Parametre (`IMPORTING`, `EXPORTING`, `CHANGING`, `RETURNING`) alabilirler.

```abap
CLASS zcl_egitim_class DEFINITION.
  PUBLIC SECTION.
    METHODS: sum_numbers
      IMPORTING iv_num1   TYPE i
                iv_num2   TYPE i
      EXPORTING ev_result TYPE i.
ENDCLASS.

CLASS zcl_egitim_class IMPLEMENTATION.
  METHOD sum_numbers.
    ev_result = iv_num1 + iv_num2.
  ENDMETHOD.
ENDCLASS.
```

## 4. Programda Kullanma (Consumption / Instantiation)

Yazdığımız bir sınıfı `SE38` ile oluşturduğumuz bir rapor (Executable Program) içerisinde kullanma işlemidir. Sınıftan bir nesne (Object) türetilir (`CREATE OBJECT` veya yeni sentaks ile `NEW`) ve metotları çağrılır.

```abap
REPORT z_egitim_raporu.

DATA: lo_egitim TYPE REF TO zcl_egitim_class, " Nesne referansı
      gv_sonuc  TYPE i.

START-OF-SELECTION.
  " Nesneyi yarat (Hafızada yer aç)
  CREATE OBJECT lo_egitim.
  " Yeni sentaks ile: lo_egitim = NEW zcl_egitim_class( ).

  " Metodu çağır
  lo_egitim->sum_numbers(
    EXPORTING
      iv_num1   = 10
      iv_num2   = 20
    IMPORTING
      ev_result = gv_sonuc
  ).

  WRITE: / 'Toplam:', gv_sonuc.
```

## 5. Types (Tipler)

Sınıf içerisinde kullanılmak üzere özel veri tipleri (Structure, Table Type vb.) tanımlanan bölümdür. Normal ABAP'taki `TYPES` komutunun aynısıdır ancak sınıfın kapsamında (scope) yaşar.

```abap
CLASS zcl_egitim_class DEFINITION.
  PUBLIC SECTION.
    TYPES: BEGIN OF ty_ogrenci,
             id   TYPE i,
             isim TYPE string,
           END OF ty_ogrenci.
           
    TYPES: tt_ogrenci TYPE TABLE OF ty_ogrenci.
ENDCLASS.
```

## 6. Interfaces (Arayüzler)

Arayüzler, sınıfların uyması gereken kuralları (sözleşmeleri) belirler. İçinde metot tanımları (imzaları) bulunur ancak kodları (`IMPLEMENTATION`) bulunmaz. Kodlar, bu arayüzü kullanan (`INTERFACES`) sınıfların içinde yazılır. ABAP'ta çoklu kalıtım (multiple inheritance) olmadığı için bu eksikliği gidermek adına çok önemlidirler.

```abap
INTERFACE zif_egitim_arayuz.
  METHODS: hesapla. " Sadece tanım var, kod yok
ENDINTERFACE.

CLASS zcl_egitim_class DEFINITION.
  PUBLIC SECTION.
    INTERFACES zif_egitim_arayuz. " Arayüzü sınıfa ekledik
ENDCLASS.

CLASS zcl_egitim_class IMPLEMENTATION.
  METHOD zif_egitim_arayuz~hesapla. 
    " Hesaplama kodları bu kısma yazılır...
  ENDMETHOD.
ENDCLASS.
```

## 7. Aliases (Takma Adlar)

Bir arayüz (`Interface`) sınıfa eklendiğinde, arayüzün metotları veya nitelikleri `arayüz_adı~metot_adı` şeklinde uzun bir yazımla kullanılır (Örn: `zif_egitim_arayuz~hesapla`). Bu uzun isimlere daha kısa ve okunaklı takma adlar (`ALIASES`) vermek için kullanılır.

```abap
CLASS zcl_egitim_class DEFINITION.
  PUBLIC SECTION.
    INTERFACES zif_egitim_arayuz.
    
    " Uzun kullanım yerine kısa kullanım atıyoruz
    ALIASES: hesapla_kisa FOR zif_egitim_arayuz~hesapla.
ENDCLASS.
```

## 8. Events (Olaylar)

Nesneler arası haberleşmeyi sağlar. Bir nesnede belirli bir durum gerçekleştiğinde (örneğin bir buton tıklandığında veya veri değiştiğinde) bir "Olay" (Event) tetiklenir (`RAISE EVENT`). Bu olayı dinleyen (Handle eden) diğer nesneler ilgili aksiyonları alır.

```abap
CLASS zcl_buton_class DEFINITION.
  PUBLIC SECTION.
    " Olay tanımı
    EVENTS: buton_tiklandi.
    
    METHODS: tikla.
ENDCLASS.

CLASS zcl_buton_class IMPLEMENTATION.
  METHOD tikla.
    " Olayı tetikle
    RAISE EVENT buton_tiklandi.
  ENDMETHOD.
ENDCLASS.
```

## 9. Friends (Arkadaşlar)

Normalde bir sınıfın `PRIVATE` (gizli) veya `PROTECTED` (korumalı) bölümlerindeki değişkenlere ve metotlara dışarıdan ulaşılamaz. Ancak bir sınıf, başka bir sınıfı "Arkadaş" (`FRIENDS`) olarak ilan ederse, o arkadaş sınıf bu gizli bölümlere bile tam erişim hakkı kazanır. Veri kapsülleme (Encapsulation) kuralının kontrollü bir istisnasıdır.

```abap
CLASS zcl_gizli_class DEFINITION FRIENDS zcl_arkadas_class.
  PRIVATE SECTION.
    DATA: gizli_sifre TYPE string VALUE '1234'.
ENDCLASS.
" zcl_arkadas_class artık zcl_gizli_class'ın içindeki 'gizli_sifre' değişkenine doğrudan erişebilir.
```

## (EN) ABAP Object-Oriented Programming (OOP) Fundamentals 🚀

This document provides a foundational overview of Object-Oriented Programming (OOP) concepts in SAP ABAP. It explains the core components and tabs you will encounter in the `SE24` (Class Builder) transaction, along with usage examples.

## 1. Class

Classes are templates (blueprints) used to create objects. A class encapsulates data (`Attributes`) and the operations that can be performed on that data (`Methods`). Classes consist of two main parts: `DEFINITION` and `IMPLEMENTATION`.

```abap
* Class Definition
CLASS zcl_training_class DEFINITION.
  PUBLIC SECTION.
    " Components accessible from anywhere
  PROTECTED SECTION.
    " Components accessible only within this class and its subclasses
  PRIVATE SECTION.
    " Components accessible only within this specific class
ENDCLASS.

* Class Implementation (Method source codes go here)
CLASS zcl_training_class IMPLEMENTATION.
  " Method implementations
ENDCLASS.
```

## 2. Attributes

Attributes are variables that store the data or state of a class. They are the OOP equivalent of standard `DATA` declarations in ABAP programs.

* **Instance Attribute:** A separate copy exists for each object created (declared with `DATA`).
* **Static Attribute:** Shared across all instances of the class (declared with `CLASS-DATA`).

```abap
CLASS zcl_training_class DEFINITION.
  PUBLIC SECTION.
    DATA: gv_name TYPE string.         " Instance Attribute
    CLASS-DATA: gv_counter TYPE i.     " Static Attribute
ENDCLASS.
```

## 3. Methods

Methods define the behaviors or actions a class can perform. They are the OOP equivalent of Form routines or Function Modules. They can accept parameters (`IMPORTING`, `EXPORTING`, `CHANGING`, `RETURNING`).

```abap
CLASS zcl_training_class DEFINITION.
  PUBLIC SECTION.
    METHODS: sum_numbers
      IMPORTING iv_num1   TYPE i
                iv_num2   TYPE i
      EXPORTING ev_result TYPE i.
ENDCLASS.

CLASS zcl_training_class IMPLEMENTATION.
  METHOD sum_numbers.
    ev_result = iv_num1 + iv_num2.
  ENDMETHOD.
ENDCLASS.
```

## 4. Consumption / Instantiation

This refers to using a defined class inside an ABAP report (Executable Program) created via `SE38`. An object is instantiated from the class (`CREATE OBJECT` or using the newer `NEW` syntax), and its methods are called.

```abap
REPORT z_training_report.

DATA: lo_training TYPE REF TO zcl_training_class, " Object reference
      gv_result   TYPE i.

START-OF-SELECTION.
  " Create the object (allocate memory)
  CREATE OBJECT lo_training.
  " With new syntax: lo_training = NEW zcl_training_class( ).

  " Call the method
  lo_training->sum_numbers(
    EXPORTING
      iv_num1   = 10
      iv_num2   = 20
    IMPORTING
      ev_result = gv_result
  ).

  WRITE: / 'Total:', gv_result.
```

## 5. Types

This section is used to define custom data types (Structures, Table Types, etc.) specifically for use within the class. It works exactly like the standard ABAP `TYPES` statement but lives within the scope of the class.

```abap
CLASS zcl_training_class DEFINITION.
  PUBLIC SECTION.
    TYPES: BEGIN OF ty_student,
             id   TYPE i,
             name TYPE string,
           END OF ty_student.
           
    TYPES: tt_student TYPE TABLE OF ty_student.
ENDCLASS.
```

## 6. Interfaces

Interfaces define a set of rules (a contract) that classes must follow. They contain method declarations (signatures) but no actual code (`IMPLEMENTATION`). The code is written inside the classes that implement (`INTERFACES`) the interface. Since ABAP does not support multiple inheritance, interfaces are crucial for overcoming this limitation.

```abap
INTERFACE zif_training_interface.
  METHODS: calculate. " Only definition, no code
ENDINTERFACE.

CLASS zcl_training_class DEFINITION.
  PUBLIC SECTION.
    INTERFACES zif_training_interface. " Implementing the interface
ENDCLASS.

CLASS zcl_training_class IMPLEMENTATION.
  METHOD zif_training_interface~calculate. 
    " The actual calculation logic goes here...
  ENDMETHOD.
ENDCLASS.
```

## 7. Aliases

When an `Interface` is implemented in a class, its components are accessed using a long prefix: `interface_name~component_name` (e.g., `zif_training_interface~calculate`). Aliases (`ALIASES`) allow you to define shorter, more readable names for these long interface components within your class.

```abap
CLASS zcl_training_class DEFINITION.
  PUBLIC SECTION.
    INTERFACES zif_training_interface.
    
    " Assigning a shorter name for easier usage
    ALIASES: calc FOR zif_training_interface~calculate.
ENDCLASS.
```

## 8. Events

Events provide a mechanism for communication between objects. When a specific state changes or an action occurs in one object (e.g., a button is clicked), an event is triggered (`RAISE EVENT`). Other objects that are listening (Handling) to this event can then react accordingly.

```abap
CLASS zcl_button_class DEFINITION.
  PUBLIC SECTION.
    " Define the event
    EVENTS: button_clicked.
    
    METHODS: click.
ENDCLASS.

CLASS zcl_button_class IMPLEMENTATION.
  METHOD click.
    " Trigger the event
    RAISE EVENT button_clicked.
  ENDMETHOD.
ENDCLASS.
```

## 9. Friends

By default, the `PRIVATE` and `PROTECTED` components of a class are strictly hidden from the outside world. However, if a class declares another class as its "Friend" (`FRIENDS`), that friend class bypasses encapsulation and gains full access even to these hidden sections. It is a controlled exception to the Encapsulation rule.

```abap
CLASS zcl_secret_class DEFINITION FRIENDS zcl_friend_class.
  PRIVATE SECTION.
    DATA: secret_password TYPE string VALUE '1234'.
ENDCLASS.
" zcl_friend_class can now directly access the 'secret_password' attribute.
```
