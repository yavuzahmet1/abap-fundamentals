REPORT z_screens_1.

TABLES: zemployees.

DATA: wa_employee LIKE zemployees-employee.

PARAMETERS: my_ee    LIKE zemployees-employee DEFAULT '4234234234' OBLIGATORY,
            my_syn   LIKE zemployees-surname DEFAULT 'BORGES' LOWER CASE,
            my_box1  AS CHECKBOX,
            wa_green RADIOBUTTON GROUP grp1,
            wa_blue  RADIOBUTTON GROUP grp1,
            wa_red   RADIOBUTTON GROUP grp1.

SELECT-OPTIONS my_dob FOR zemployees-dob.

*SIGN = e
*OPTION
*LOW
*HIGH

INITIALIZATION.
  " Seçim ekranı gelmeden önce veritabanındaki son numarayı buluyoruz
  SELECT * FROM zemployees.
    wa_employee = zemployees-employee.
  ENDSELECT.

AT SELECTION-SCREEN ON my_ee.
  " Artık wa_employee dolu olduğu için kontrol doğru çalışacaktır
  IF my_ee > wa_employee.
    MESSAGE 'Wrong enter number' TYPE 'E'.
  ENDIF.

START-OF-SELECTION.
  " Ekrana yazdırma işlemleri
  SELECT * FROM zemployees.
    wa_employee = zemployees-employee.
    WRITE: / wa_employee.
    WRITE: / zemployees-employee, zemployees-surname.
  ENDSELECT.

*TABLES

*  sign - I & E

*  OPTION - EQ, NE, GT, LE, LT, CP & NP (* OR +)

*  LOW

*  HIGH