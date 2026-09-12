
" - DEBUGGING YOUR PROGRAM
"----------------------------------------------------------------------
" 1. WHAT IS DEBUGGING?
"----------------------------------------------------------------------
"
" Debugging is the process of running a program step by step.
"
" It helps us:
"
" - Understand how the program works
" - Find programming errors
" - Check variable values
" - Check system variables
" - Inspect internal tables
" - Follow loops step by step
" - Stop the program at a specific point
"
" Example:
"
DATA: lv_number1 TYPE i VALUE 10,
      lv_number2 TYPE i VALUE 5,
      lv_result  TYPE i.

lv_result = lv_number1 + lv_number2.

WRITE: / 'Result:', lv_result.

" During debugging:
"
" lv_number1 = 10
" lv_number2 = 5
" lv_result  = 15
"
" The debugger allows us to see how lv_result becomes 15.


"----------------------------------------------------------------------
" 2. DEBUGGING YOUR PROGRAM - PART 1
"----------------------------------------------------------------------
"
" The debugger allows us to stop a running program
" and inspect the current values of variables.
"
" Example:
"
DATA: lv_a     TYPE i VALUE 10,
      lv_b     TYPE i VALUE 20,
      lv_total TYPE i.

" Before the following line is executed:
"
" lv_total = 0
"
lv_total = lv_a + lv_b.

" After the line is executed:
"
" lv_total = 30
"
WRITE: / 'Total:', lv_total.

" This is one of the main purposes of debugging:
"
" We can see the value of a variable BEFORE and AFTER
" a statement is executed.


"----------------------------------------------------------------------
" 3. DEBUGGING YOUR PROGRAM - PART 2
"----------------------------------------------------------------------
"
" In the ABAP Debugger, we can execute the program step by step.
"
" Common debugger keys:
"
" F5 = Single Step
"      Executes the next statement.
"
" F6 = Execute
"      Executes the current procedure/block without entering it.
"
" F7 = Return
"      Finishes the current routine and returns to the caller.
"
" F8 = Continue
"      Continues program execution until the next breakpoint.
"
" Example:
"
DATA lv_value TYPE i VALUE 5.

" Initial value:
" lv_value = 5

lv_value = lv_value + 1.

" After this line:
" lv_value = 6

lv_value = lv_value * 2.

" After this line:
" lv_value = 12

lv_value = lv_value - 3.

" After this line:
" lv_value = 9

WRITE: / 'Final Value:', lv_value.


"----------------------------------------------------------------------
" 4. DEBUGGING YOUR PROGRAM - PART 3
"----------------------------------------------------------------------
"
" Debugging is especially useful when working with loops.
"
" We can follow the value of a variable during every iteration.
"
DATA lv_counter TYPE i VALUE 1.

WHILE lv_counter <= 5.

  " During the loop, lv_counter will have these values:
  "
  " 1
  " 2
  " 3
  " 4
  " 5
  "
  WRITE: / 'Counter:', lv_counter.

  lv_counter = lv_counter + 1.

ENDWHILE.

" After the last iteration:
"
" lv_counter = 6
"
" The WHILE condition is:
"
" lv_counter <= 5
"
" 6 <= 5 is FALSE.
"
" Therefore, the WHILE loop ends.


"----------------------------------------------------------------------
" 5. SYSTEM VARIABLES
"----------------------------------------------------------------------
"
" ABAP provides special system variables.
"
" These variables contain information about the current
" state of the program.
"
" Most system variables start with:
"
" SY-
"
" Important examples:
"
" sy-subrc = Return code of the previous operation
" sy-tabix = Current index of an internal table
" sy-index = Current iteration number of certain loops
" sy-dbcnt = Number of database records processed
" sy-ucomm = User command


"----------------------------------------------------------------------
" 5.1 SY-SUBRC
"----------------------------------------------------------------------
"
" sy-subrc is one of the most important ABAP system variables.
"
" In many ABAP statements:
"
" sy-subrc = 0
"
" usually means that the operation was successful.
"
" A value different from 0 usually means that the requested
" operation did not produce the expected result.
"
DATA lv_text TYPE string VALUE 'SAP ABAP'.

FIND 'ABAP' IN lv_text.

" Because 'ABAP' exists in lv_text:
"
" sy-subrc = 0
"
IF sy-subrc = 0.

  WRITE: / 'Text found'.

ELSE.

  WRITE: / 'Text not found'.

ENDIF.


"----------------------------------------------------------------------
" 5.2 SY-TABIX
"----------------------------------------------------------------------
"
" sy-tabix contains the current table index for relevant
" internal table operations.
"
DATA: lt_numbers TYPE TABLE OF i,
      lv_table_number TYPE i.

APPEND 10 TO lt_numbers.
APPEND 20 TO lt_numbers.
APPEND 30 TO lt_numbers.

LOOP AT lt_numbers INTO lv_table_number.

  " First iteration:
  " sy-tabix = 1
  " lv_table_number = 10
  "
  " Second iteration:
  " sy-tabix = 2
  " lv_table_number = 20
  "
  " Third iteration:
  " sy-tabix = 3
  " lv_table_number = 30
  "
  WRITE: / 'Index:', sy-tabix,
           'Value:', lv_table_number.

ENDLOOP.


"----------------------------------------------------------------------
" 5.3 SY-INDEX
"----------------------------------------------------------------------
"
" sy-index contains the current iteration number
" in certain loop structures such as DO.
"
DO 5 TIMES.

  " Iteration 1 -> sy-index = 1
  " Iteration 2 -> sy-index = 2
  " Iteration 3 -> sy-index = 3
  " Iteration 4 -> sy-index = 4
  " Iteration 5 -> sy-index = 5
  "
  WRITE: / 'Loop:', sy-index.

ENDDO.


"----------------------------------------------------------------------
" 6. TABLE MODE
"----------------------------------------------------------------------
"
" Internal tables are very common in ABAP.
"
" The ABAP Debugger provides Table Mode to inspect
" the contents of an internal table.
"
" With Table Mode we can check:
"
" - Number of rows
" - Row values
" - Field values
" - Table indexes
" - Changes in table data
"
" Table Mode is especially useful with:
"
" LOOP AT
" READ TABLE
" APPEND
" INSERT
" MODIFY
" DELETE
"
TYPES: BEGIN OF ty_employee,
         id   TYPE i,
         name TYPE string,
       END OF ty_employee.

DATA: lt_employees TYPE TABLE OF ty_employee,
      ls_employee  TYPE ty_employee.

ls_employee-id   = 1.
ls_employee-name = 'John'.

APPEND ls_employee TO lt_employees.

ls_employee-id   = 2.
ls_employee-name = 'Emma'.

APPEND ls_employee TO lt_employees.

" The internal table now contains:
"
" Index | ID | Name
" -----------------
"   1   |  1 | John
"   2   |  2 | Emma
"
" During debugging, we can open lt_employees
" in Table Mode and inspect these rows.


"----------------------------------------------------------------------
" 7. BREAKPOINTS
"----------------------------------------------------------------------
"
" A breakpoint stops program execution at a specific location.
"
" It tells the debugger:
"
" Stop the program when execution reaches this point.
"
DATA lv_break_result TYPE i.

lv_break_result = 10 + 20.

" At this point:
"
" lv_break_result = 30
"
BREAK-POINT.

" The debugger stops at the BREAK-POINT statement.
"
" We can now inspect:
"
" lv_break_result
" sy-subrc
" other variables
" internal tables
"
lv_break_result = lv_break_result * 2.

WRITE: / 'Breakpoint Result:', lv_break_result.

" Final value:
"
" lv_break_result = 60


"----------------------------------------------------------------------
" 8. WATCHPOINTS
"----------------------------------------------------------------------
"
" A watchpoint is different from a breakpoint.
"
" A breakpoint normally stops at a specific code location.
"
" A watchpoint stops when:
"
" - A variable changes
" - A variable receives a specific value
" - A defined condition becomes true
"
DATA lv_watch_counter TYPE i VALUE 0.

DO 10 TIMES.

  lv_watch_counter = lv_watch_counter + 1.

ENDDO.

" Example watchpoint condition:
"
" lv_watch_counter = 5
"
" If this watchpoint is created in the debugger,
" execution stops when lv_watch_counter becomes 5.
"
"
" BREAKPOINT vs WATCHPOINT
"
" Breakpoint:
"
" Stop when a specific line of code is reached.
"
" Example:
"
" Stop at line 25.
"
"
" Watchpoint:
"
" Stop when a variable reaches a certain value.
"
" Example:
"
" Stop when lv_watch_counter = 5.


"----------------------------------------------------------------------
" 9. ENDING A DEBUG SESSION
"----------------------------------------------------------------------
"
" After debugging, we can:
"
" - Continue program execution
" - Continue until the next breakpoint
" - Run until the program finishes
" - Exit the debugger
"
" Before ending the debug session, we can check:
"
" - Final variable values
" - sy-subrc
" - Internal table contents
" - Loop results
" - Program output
"
" If there are no additional breakpoints or watchpoints,
" the program continues normally until the end.


"======================================================================
" PRACTICE EXERCISE
"======================================================================
"
" Use the debugger with the following example.
"
DATA: lv_practice_number TYPE i VALUE 1,
      lv_practice_result TYPE i.

DO 5 TIMES.

  lv_practice_result = lv_practice_number * 2.

  WRITE: / 'Number:', lv_practice_number,
           'Result:', lv_practice_result.

  lv_practice_number = lv_practice_number + 1.

ENDDO.

" QUESTIONS:
"
" 1. What is the initial value of lv_practice_number?
"
" Answer:
"
"
" 2. What is the value of sy-index during the third iteration?
"
" Answer:
"
"
" 3. What is lv_practice_result when lv_practice_number = 4?
"
" Answer:
"
"
" 4. Add a breakpoint to:
"
" lv_practice_result = lv_practice_number * 2.
"
" Which values can you inspect?
"
" Answer:
"
"
" 5. Create a watchpoint:
"
" lv_practice_number = 4
"
" At which iteration does the debugger stop?
"
" Answer:

"TR

"----------------------------------------------------------------------
" 1. DEBUGGING NEDİR?
"----------------------------------------------------------------------
"
" Debugging, bir programı adım adım çalıştırarak
" programın nasıl çalıştığını anlamamızı sağlar.
"
" Debugger sayesinde:
"
" - Kodları satır satır çalıştırabiliriz
" - Değişkenlerin değerlerini kontrol edebiliriz
" - System Variable'ları inceleyebiliriz
" - Internal Table'ları inceleyebiliriz
" - Döngüleri adım adım takip edebiliriz
" - Programı belirli bir noktada durdurabiliriz
" - Hataların nerede oluştuğunu bulabiliriz
"
" Örneğin:
"
" lv_number1 = 10
" lv_number2 = 5
"
" işleminden sonra:
"
" lv_result = 15
"
" değerinin nasıl oluştuğunu debugger ile görebiliriz.


"----------------------------------------------------------------------
" 2. PROGRAMI DEBUG ETMEK
"----------------------------------------------------------------------
"
" Debugger çalışan programı belirli bir noktada durdurmamızı
" ve o andaki değişken değerlerini incelememizi sağlar.
"
" Örneğin:
"
" lv_total = lv_a + lv_b.
"
" satırı çalışmadan önce:
"
" lv_total = 0
"
" olabilir.
"
" Satır çalıştıktan sonra:
"
" lv_total = 30
"
" olabilir.
"
" Böylece değişkenin değerinin hangi kod satırında
" değiştiğini görebiliriz.


"----------------------------------------------------------------------
" 3. DEBUGGER İÇERİSİNDE İLERLEME
"----------------------------------------------------------------------
"
" ABAP Debugger içerisinde yaygın kullanılan tuşlar:
"
" F5 = Single Step
"
" Bir sonraki komutu çalıştırır.
"
"
" F6 = Execute
"
" Mevcut procedure veya kod bloğunu çalıştırır.
"
"
" F7 = Return
"
" Mevcut routine'den çıkarak çağıran bölüme döner.
"
"
" F8 = Continue
"
" Programı bir sonraki breakpoint'e kadar çalıştırır.


"----------------------------------------------------------------------
" 4. DÖNGÜLERİ DEBUG ETMEK
"----------------------------------------------------------------------
"
" Debugger özellikle WHILE, DO ve LOOP gibi
" döngü yapılarını anlamak için çok faydalıdır.
"
" Örneğin:
"
" lv_counter = 1
"
" ile başlayan bir WHILE döngüsünde debugger ile:
"
" lv_counter = 1
" lv_counter = 2
" lv_counter = 3
" lv_counter = 4
" lv_counter = 5
"
" değerlerini adım adım görebiliriz.
"
" Sonrasında:
"
" lv_counter = 6
"
" olur.
"
" Eğer koşul:
"
" lv_counter <= 5
"
" ise:
"
" 6 <= 5
"
" FALSE olur ve döngü sona erer.


"----------------------------------------------------------------------
" 5. SYSTEM VARIABLES
"----------------------------------------------------------------------
"
" ABAP'ta programın mevcut durumu hakkında bilgi veren
" özel sistem değişkenleri bulunur.
"
" Bu değişkenler genellikle:
"
" SY-
"
" ile başlar.
"
" Önemli örnekler:
"
" sy-subrc = Önceki işlemin sonuç kodu
" sy-tabix = Internal Table içerisindeki mevcut index
" sy-index = Döngünün mevcut tekrar numarası
" sy-dbcnt = İşlenen database kayıt sayısı
" sy-ucomm = Kullanıcı komutu


"----------------------------------------------------------------------
" 5.1 SY-SUBRC
"----------------------------------------------------------------------
"
" sy-subrc ABAP'taki en önemli system variable'lardan biridir.
"
" Birçok ABAP komutunda:
"
" sy-subrc = 0
"
" işlemin başarılı olduğunu gösterir.
"
" Sıfırdan farklı bir değer ise genellikle
" istenilen sonucun elde edilmediğini gösterir.
"
" Örneğin:
"
" FIND 'ABAP' IN lv_text.
"
" Eğer ABAP kelimesi bulunursa:
"
" sy-subrc = 0
"
" olur.
"
" Eğer bulunamazsa:
"
" sy-subrc sıfırdan farklı bir değer alır.


"----------------------------------------------------------------------
" 5.2 SY-TABIX
"----------------------------------------------------------------------
"
" sy-tabix, ilgili Internal Table işlemlerinde
" mevcut satırın index numarasını gösterir.
"
" Örneğin Internal Table şu değerleri içeriyorsa:
"
" 10
" 20
" 30
"
" LOOP sırasında:
"
" İlk kayıt:
"
" sy-tabix = 1
" değer = 10
"
" İkinci kayıt:
"
" sy-tabix = 2
" değer = 20
"
" Üçüncü kayıt:
"
" sy-tabix = 3
" değer = 30


"----------------------------------------------------------------------
" 5.3 SY-INDEX
"----------------------------------------------------------------------
"
" sy-index özellikle DO gibi bazı döngülerde
" kaçıncı tekrarda olduğumuzu gösterir.
"
" Örneğin:
"
" DO 5 TIMES.
"
" için:
"
" 1. döngü -> sy-index = 1
" 2. döngü -> sy-index = 2
" 3. döngü -> sy-index = 3
" 4. döngü -> sy-index = 4
" 5. döngü -> sy-index = 5


"----------------------------------------------------------------------
" 6. TABLE MODE
"----------------------------------------------------------------------
"
" ABAP programlarında Internal Table'lar çok sık kullanılır.
"
" Debugger içerisindeki Table Mode sayesinde
" Internal Table içerisindeki verileri inceleyebiliriz.
"
" Table Mode ile:
"
" - Kayıt sayısını
" - Satır değerlerini
" - Field değerlerini
" - Index numaralarını
" - Verilerdeki değişiklikleri
"
" görebiliriz.
"
" Özellikle şu işlemlerde faydalıdır:
"
" LOOP AT
" READ TABLE
" APPEND
" INSERT
" MODIFY
" DELETE


"----------------------------------------------------------------------
" 7. BREAKPOINT
"----------------------------------------------------------------------
"
" Breakpoint programın belirli bir kod satırında
" durmasını sağlar.
"
" Mantık:
"
" Program başlar
"       |
"       v
" Kod çalışır
"       |
"       v
" Breakpoint
"       |
"       v
" Program durur
"       |
"       v
" Değişkenler incelenir
"       |
"       v
" Program devam eder
"
" Örneğin:
"
" BREAK-POINT.
"
" komutuna gelindiğinde ABAP Debugger açılır.
"
" Bu noktada değişkenlerin mevcut değerlerini
" inceleyebiliriz.


"----------------------------------------------------------------------
" 8. WATCHPOINT
"----------------------------------------------------------------------
"
" Watchpoint bir değişkeni veya koşulu takip etmek
" için kullanılır.
"
" Breakpoint:
"
" Belirli bir kod satırına gelince durur.
"
"
" Watchpoint:
"
" Belirli bir değişken belirlediğimiz değere
" ulaştığında programı durdurur.
"
" Örneğin:
"
" lv_counter = 5
"
" şeklinde bir watchpoint oluşturursak,
" lv_counter değeri 5 olduğunda debugger durur.
"
"
" ÖZET:
"
" Breakpoint  = Kod satırına göre durur.
"
" Watchpoint  = Değişken/değere göre durur.


"----------------------------------------------------------------------
" 9. DEBUG SESSION'I SONLANDIRMA
"----------------------------------------------------------------------
"
" Debug işlemi tamamlandıktan sonra:
"
" - Programın çalışmasına devam edebiliriz
" - Bir sonraki breakpoint'e gidebiliriz
" - Programın sonuna kadar çalıştırabiliriz
" - Debugger'dan çıkabiliriz
"
" Debug session'ı bitirmeden önce kontrol edebileceğimiz şeyler:
"
" - Değişkenlerin son değerleri
" - sy-subrc
" - Internal Table içerikleri
" - Döngü sonuçları
" - Program çıktıları

