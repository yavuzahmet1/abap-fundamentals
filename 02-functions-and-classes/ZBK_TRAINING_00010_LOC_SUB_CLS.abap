*&---------------------------------------------------------------------*
*& Report ZBK_TRAINING_00010_LOC_SUB_CLS
*& Description: ABAP Object Oriented Programming (OOP) Example
*& Demonstrating Inheritance and Visibility Sections (Public, Protected, Private)
*&---------------------------------------------------------------------*
REPORT ZBK_TRAINING_00010_LOC_SUB_CLS.

*----------------------------------------------------------------------*
*       CLASS math_op DEFINITION
*----------------------------------------------------------------------*
* This is the Base (Super) Class
*----------------------------------------------------------------------*
CLASS math_op DEFINITION.

  PUBLIC SECTION.
    " Public attributes: Can be accessed from ANYWHERE (inside the class, 
    " inside subclasses, and outside the class via object reference).
    DATA: lv_num1   TYPE i,
          lv_num2   TYPE i,
          lv_result TYPE i.

    DATA: lv_public TYPE i.

    " Public method
    METHODS: sum_numbers.


  PROTECTED SECTION.
    " Protected attributes: Can be accessed ONLY inside this class 
    " and its subclasses (inherited classes). Cannot be accessed from outside.
    DATA: lv_protected TYPE i.


  PRIVATE SECTION.
    " Private attributes: Can be accessed ONLY inside this specific class.
    " Even subclasses cannot access private attributes.
    DATA: lv_private TYPE i.
ENDCLASS.

*----------------------------------------------------------------------*
*       CLASS math_op IMPLEMENTATION
*----------------------------------------------------------------------*
CLASS math_op IMPLEMENTATION.

  METHOD sum_numbers.
    " The class itself can access ALL of its own attributes (Public, Protected, Private)
    lv_result = lv_num1 + lv_num2.

    lv_public    = 2.
    lv_protected = 5.
    lv_private   = 7.
  ENDMETHOD.
ENDCLASS.

*----------------------------------------------------------------------*
*       CLASS math_op_diff DEFINITION
*----------------------------------------------------------------------*
* This is the Subclass inheriting from the 'math_op' base class.
*----------------------------------------------------------------------*
CLASS math_op_diff DEFINITION INHERITING FROM math_op.

  PUBLIC SECTION.
    METHODS: number_diff.
ENDCLASS.

*----------------------------------------------------------------------*
*       CLASS math_op_diff IMPLEMENTATION
*----------------------------------------------------------------------*
CLASS math_op_diff IMPLEMENTATION.

  METHOD number_diff.
    " The subclass can access its own attributes and the Public/Protected 
    " attributes of its superclass.
    lv_result = lv_num1 - lv_num2.

    lv_public    = 2.
    lv_protected = 5.
    
    " NOTE: The subclass CANNOT access the private attributes of the superclass.
    " That is why the following line must remain commented out:
*    lv_private = 7. 

  ENDMETHOD.
ENDCLASS.


*----------------------------------------------------------------------*
*       Global Data Declarations for Objects
*----------------------------------------------------------------------*
DATA: go_math_op      TYPE REF TO math_op,
      go_math_op_diff TYPE REF TO math_op_diff.


*----------------------------------------------------------------------*
*       START-OF-SELECTION (Main Program Execution)
*----------------------------------------------------------------------*
START-OF-SELECTION.

  " 1. Create an instance of the base class
  CREATE OBJECT go_math_op.

  " We can access Public attributes from outside the class
  go_math_op->lv_num1 = 123.
  go_math_op->lv_num2 = 1345.
  
  " Call the public method
  go_math_op->sum_numbers( ).

  " Valid: Accessing a public attribute from outside
  go_math_op->lv_public = 3.
  
  " INVALID: Cannot access Protected or Private attributes from outside the class!
  " These lines must remain commented out to prevent syntax errors:
*  go_math_op->lv_protected = 4.
*  go_math_op->lv_private = 7.

  " Output the result of the base class method
  WRITE: 'Sum Result:', go_math_op->lv_result.


  " 2. Create an instance of the subclass
  CREATE OBJECT go_math_op_diff.

  " The subclass inherited these public attributes from the base class
  go_math_op_diff->lv_num1 = 16.
  go_math_op_diff->lv_num2 = 81.

  " Call the subclass's own method
  go_math_op_diff->number_diff( ).

  " Output the result of the subclass method ( '/' means new line)
  WRITE: / 'Diff result:', go_math_op_diff->lv_result.