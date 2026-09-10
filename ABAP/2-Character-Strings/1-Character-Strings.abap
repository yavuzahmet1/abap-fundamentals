*&---------------------------------------------------------------------*
*& Report Z_CHARACTER_STRINGS
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_character_strings.

TABLES zemployees.

DATA lv_mychar(10) TYPE c.

DATA lv_zemployees1(40) TYPE c.

DATA lv_zemployees2 LIKE zemployees-surname.

data lv_num1 type n.