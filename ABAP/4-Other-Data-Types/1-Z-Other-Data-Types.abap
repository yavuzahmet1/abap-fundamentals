*&---------------------------------------------------------------------*
*& Report Z_OTHER_DATA_TYPE
*&---------------------------------------------------------------------*
REPORT z_other_data_type.

TABLES: zemployees2.

* Date and Time Fields

* Date internal format: YYYYMMDD
DATA lv_date TYPE d VALUE '20120101'.

* Same data type as system date
DATA lv_date2 LIKE sy-datum.

* Time internal format: HHMMSS
DATA lv_time TYPE t VALUE '111005'.

* Same data type as system time
DATA lv_time2 LIKE sy-uzeit.


* Assign current system date and time
lv_date2 = sy-datum.
lv_time2 = sy-uzeit.


* Test Date and Time Fields
WRITE: / 'Fixed Date   :', lv_date,
       / 'System Date  :', lv_date2,
       / 'Fixed Time   :', lv_time,
       / 'System Time  :', lv_time2.

ULINE.

*&---------------------------------------------------------------------*
*& Date Calculation Example 1
*&---------------------------------------------------------------------*

DATA: lv_date3 TYPE d VALUE '20260901',
      lv_date4 TYPE d VALUE '20260916',
      lv_days  TYPE i.

* Calculate the difference between two dates.
* The result is returned as number of days.
lv_days = lv_date4 - lv_date3.

WRITE: / 'First Date :', lv_date3,
       / 'Second Date:', lv_date4,
       / 'Difference :', lv_days, 'days'.

ULINE.

*&---------------------------------------------------------------------*
*& Date Calculation Example 2
*&---------------------------------------------------------------------*

DATA lv_todays_date LIKE sy-datum.
DATA lv_days_count TYPE i VALUE 20.
DATA lv_future_date TYPE d.

lv_todays_date = sy-datum.
lv_future_date = lv_todays_date + lv_days_count.

WRITE: / 'Today       :', lv_todays_date DD/MM/YYYY,
 / 'After 20 Days:', lv_future_date DD/MM/YYYY.

ULINE.

*&---------------------------------------------------------------------*
*& Employee Working Time Calculation
*&---------------------------------------------------------------------*

* Time format: HHMMSS
DATA lv_entry_time TYPE t VALUE '083000'.
DATA lv_exit_time  TYPE t VALUE '174500'.

DATA lv_work_seconds TYPE i.
DATA lv_work_hours   TYPE i.
DATA lv_work_minutes TYPE i.

* Calculate the difference between exit and entry time.
* For TYPE t fields, the difference is calculated in seconds.
lv_work_seconds = lv_exit_time - lv_entry_time.

* Convert total seconds into hours.
lv_work_hours = lv_work_seconds DIV 3600.

* Calculate the remaining minutes.
lv_work_minutes = ( lv_work_seconds MOD 3600 ) DIV 60.

WRITE: / 'Entry Time   :', lv_entry_time,
       / 'Exit Time    :', lv_exit_time,
       / 'Work Seconds :', lv_work_seconds,
       / 'Work Time    :', lv_work_hours, 'hours',
                            lv_work_minutes, 'minutes'.

ULINE.

*&---------------------------------------------------------------------*
*& Employee Working Time Calculation with Break
*&---------------------------------------------------------------------*

DATA lv_entry_time2 TYPE t VALUE '083000'.
DATA lv_exit_time2  TYPE t VALUE '174500'.

DATA lv_break_minutes TYPE i VALUE 45.
DATA lv_total_seconds TYPE i.
DATA lv_break_seconds TYPE i.
DATA lv_net_seconds   TYPE i.
DATA lv_net_hours     TYPE i.
DATA lv_net_minutes   TYPE i.

* Calculate total working time in seconds.
lv_total_seconds = lv_exit_time2 - lv_entry_time2.

* Convert break minutes into seconds.
lv_break_seconds = lv_break_minutes * 60.

* Subtract break time from total working time.
lv_net_seconds = lv_total_seconds - lv_break_seconds.

* Convert net working seconds into hours and minutes.
lv_net_hours = lv_net_seconds DIV 3600.
lv_net_minutes = ( lv_net_seconds MOD 3600 ) DIV 60.

WRITE: / 'Entry Time       :', lv_entry_time2,
       / 'Exit Time        :', lv_exit_time2,
       / 'Break            :', lv_break_minutes, 'minutes',
       / 'Net Working Time :', lv_net_hours, 'hours',
                                lv_net_minutes, 'minutes'.

ULINE.

*&---------------------------------------------------------------------*
*& Currency Calculation
*&---------------------------------------------------------------------*

* Tax percentage = 20%
DATA lv_tax_perc TYPE p DECIMALS 2 VALUE '0.20'.

* Tax amount and net salary have the same type as salary.
DATA lv_tax_amt LIKE zemployees2-salary.
DATA lv_net_pay LIKE zemployees2-salary.

SELECT * FROM zemployees2.

  " Display employee surname, gross salary and currency.
  WRITE: / 'Surname      :', zemployees2-surname,
         / 'Gross Salary :', zemployees2-salary,
                              zemployees2-ecurrency.

  " Calculate 20% tax.
  lv_tax_amt = lv_tax_perc * zemployees2-salary.

  " Calculate net salary.
  lv_net_pay = zemployees2-salary - lv_tax_amt.

  WRITE: / 'Tax Amount   :', lv_tax_amt,
                              zemployees2-ecurrency,
         / 'Net Salary   :', lv_net_pay,
                              zemployees2-ecurrency.

  SKIP.

ENDSELECT.