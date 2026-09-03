# 🚀 abap-fundamentals

A collection of fundamental SAP ABAP programs, exercises, and syntax examples from my learning journey.

## 📖 About This Repository

As a Full Stack Developer, I am expanding my technical skill set into the SAP ecosystem. This repository serves as my personal code archive and learning diary for **SAP ABAP** development. The codes and projects here are actively being developed while following a structured ABAP training curriculum.

## 🗂️ Course Structure & Contents

The repository is currently organized with the following modules:

* **[01-basic-introduction](./01-basic-introduction)**: Fundamentals of ABAP programming.
  * `ZBK_TRAINING_0001.abap`: Data types, variable declarations, and the WRITE command.
  * `ZBK_TRAINING_0002.abap`: Mathematical operations, conditions (IF/CASE), loops (DO/WHILE), and logical operators.
  * `ZBK_TRAIN_0003_ASSIGN_0001.abap`: Practice assignment for finding even and odd numbers using WHILE loop and MOD operator.
  * `ZBK_TRAIN_0003_ASSIGN_0002.abap`: Practice assignment for finding divisible numbers (2, 3, 5). Introduces string concatenation (`&&`), `CONDENSE` command, and `IS INITIAL` checks.
  * `ZBK_TRAINING_0004.abap`: Basic Open SQL operations (`SELECT`, `INSERT`, `UPDATE`, `DELETE`, `MODIFY`) for database interaction using variables, work areas, and internal tables.
  * `ZBK_TRAINING_0005.abap`: User Data Entry Form & Selection Screen Design. Demonstrates the use of `PARAMETERS`, `SELECT-OPTIONS`, Checkboxes, and Radio Button groups within framed blocks. Introduces **Text Symbols** (`text-001`) for multi-language support and UI text management.
  * `ZBK_TRAIN_0005_ASSIGN_0001.abap`: Practice assignment using `IF/ELSEIF` conditions to determine which specific range a user-entered number falls into.
  * `ZBK_TRAIN_0005_ASSIGN_0002.abap`: Letter grade calculator. Demonstrates data validation using the `MESSAGE` command (Type 'I') to ensure inputs are within a valid range before processing.
  * `ZBK_TRAIN_0005_ASSIGN_0003.abap`: Logic practice to find the middle number among three inputs. Showcases complex logical grouping (`AND`/`OR` within parentheses) and modern ABAP **String Templates** (`|...|`) for dynamic screen output.
  * `ZBK_TRAINING_0005_ASSIGN_0004.abap`: Practice assignment using the `CASE WHEN` structure to create a basic calculator. Takes two numbers and an operator as selection screen parameters to perform dynamic mathematical operations.
  * `ZBK_TRAINING_0005_ASSIGN_0005.abap`: Checkbox operations practice. Calculates a final result by adding specific values to a default variable based on user-selected checkboxes.
  * `ZBK_TRAINING_0005_ASSIGN_0006.abap`: Radiobutton operations practice. Acts as a basic calculator applying addition, subtraction, multiplication, or division to two numbers based on the selected radio button using a `CASE` statement.
  * `ZBK_TRAINING_0005_ASSIGN_0007.abap`: Advanced selection screen practice combining Radiobuttons and Checkboxes. Introduces `FORM` routines (`PERFORM`, `USING`, `CHANGING`) for modularizing arithmetic logic.
  * `ZBK_TRAINING_0006.abap`: Demonstration of the ABAP program lifecycle using **Event Blocks** (`INITIALIZATION`, `START-OF-SELECTION`, etc.), modularizing code with **Subroutines** (`FORM`/`PERFORM`), and an introductory guide to **INCLUDE** programs for better code organization.
  * `ZBK_TRAINING_0006_ASSIGN_0001.abap`: Practice assignment for passing parameters to subroutines (`USING`). Calculates the ratio of two numbers with division-by-zero validation and decimal formatting.
  * `ZBK_TRAINING_0006_ASSIGN_0002.abap`: Practice assignment for sequential subroutine calls. Constructs dynamic sentences by executing multiple specific `FORM` routines in a predefined order.
  * `ZBK_TRAINING_0006_ASSIGN_0003.abap`: Practice assignment demonstrating the manipulation of a global variable within subroutines (`FORM`). Solves a mathematical puzzle to reach a target value by calling specific arithmetic forms.
  * `ZBK_TRAINING_0006_ASSIGN_0004.abap`: Practice assignment for creating a Login Screen. Introduces selection screen modification using `AT SELECTION-SCREEN OUTPUT`, the `LOOP AT SCREEN` statement to mask password inputs with asterisks (`screen-invisible = 1`), and handling case-sensitive inputs (`LOWER CASE`).
  * `ZBK_TRAINING_0006_ASSIGN_0005.abap`: Practice assignment for building a temperature converter (Celsius to Fahrenheit/Kelvin). Demonstrates passing values to subroutines with `USING` and returning calculated results to the main program with `CHANGING`.

* **[02-functions-and-classes](./02-functions-and-classes)**: Modularization using Function Modules and Classes.
  * `ZBK_TRAINING_0007.abap`: Creation of a custom Function Module via Function Builder (SE37). Demonstrates the use of `IMPORTING`, `EXPORTING`, and `CHANGING` parameters, as well as handling custom `EXCEPTIONS` (e.g., division by zero).
  * `ZBK_TRAINING_0008.abap`: An executable report demonstrating how to call a custom Function Module (`CALL FUNCTION`). Includes parameter mapping and error handling using system return codes (`sy-subrc`) to prevent runtime dumps.
  * `ZBK_TRAINING_0008_ASSIGN_RAND.abap`: Practice assignment creating a custom Function Module in SE37 to generate a random number by encapsulating the standard `QF05_RANDOM_INTEGER` function.
  * `ZBK_TRAINING_0008_ASSIGN_1_RND.abap`: Executable report that calls the custom random number Function Module and uses `IF/ELSEIF` statements to evaluate and print the range in which the generated number falls.
  * `ZBK_TRAINING_0009_CLASS_FUNDAMENTALS.md`: A comprehensive cheat sheet and guide explaining the core concepts of Object-Oriented Programming (OOP) in ABAP (Classes, Attributes, Methods, Interfaces, Events, etc.).
  * `ZBK_TRAINING_0009_CLASS_SE24.abap`: Source code representation of a global ABAP class created using the Class Builder (SE24). Demonstrates class definitions, attributes, and method implementations.
  * `ZBK_TRAINING_0009_CLASS_SE38.abap`: An executable report demonstrating how to consume a global class. Covers object instantiation (`CREATE OBJECT` / `NEW`) and calling class methods.
  * `ZBK_TRAINING_00010_LOC_SUB_CLS.abap`: Demonstrates ABAP Object-Oriented Programming (OOP) using **Local Classes**. Covers core concepts such as **Inheritance** (`INHERITING FROM`), creating Subclasses, Object Instantiation, and understanding **Visibility Sections** (`PUBLIC`, `PROTECTED`, `PRIVATE`).

* **[03-Package-and-Request](./03-Package-and-Request)**: Understanding SAP system architecture and transport mechanics.
  * `ZBK_TRAINING_00011.abap`: Comprehensive bilingual (Turkish/English) documentation explaining SAP Packages, the Local `$TMP` package, the 3-Tier System Landscape (DEV, QUA, PROD), Clients, and Transport Requests.

> **Note:** More modules (such as Data Dictionary, Advanced OOP, etc.) will be added as the training progresses.

## 💻 Technologies & Tools

* **Language:** SAP ABAP
* **Environment:** SAP GUI / ABAP Workbench
  * `SE80` - **Object Navigator:** Advanced IDE for managing packages and all development objects.
  * `SE10` - **Transport Organizer:** Managing and releasing Transport Requests (DEV -> QUA -> PROD).
  * `SE38` - **ABAP Editor:** Standard editor for developing ABAP reports and programs.
  * `SE37` - **Function Builder:** Creating, editing, and testing Function Modules.
  * `SE24` - **Class Builder:** Developing global ABAP Classes and Interfaces (OOP).
  * `SE11` - **ABAP Dictionary:** Managing database tables, data types, and domains.
  * `SE16` - **Data Browser:** Viewing and querying database table contents.
* **Version Control:** Git, GitHub & VS Code

## 👨‍💻 Author

### Ahmet YAVUZ

* GitHub: [@yavuzahmet1](https://github.com/yavuzahmet1)
* LinkedIn: [in/1yavuzahmet](https://www.linkedin.com/in/1yavuzahmet)

---
*Feel free to explore the codes. Feedback and suggestions are always welcome!*
