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

> **Note:** More modules (such as Data Dictionary, Functions, Classes, etc.) will be added as the training progresses.

## 💻 Technologies & Tools

* **Language:** SAP ABAP
* **Environment:** SAP GUI / ABAP Editor (SE38, SE11, SE16)
* **Version Control:** Git, GitHub & VS Code

## 👨‍💻 Author

### Ahmet YAVUZ

* GitHub: [@yavuzahmet1](https://github.com/yavuzahmet1)
* LinkedIn: [in/1yavuzahmet](https://www.linkedin.com/in/1yavuzahmet)

---
*Feel free to explore the codes. Feedback and suggestions are always welcome!*
