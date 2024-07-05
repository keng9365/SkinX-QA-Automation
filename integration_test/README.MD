How to run test :
1. Go to application folder (todo_list_app-main)
2. Run command $ flutter test -r expanded integration_test/feature/test_todoList.dart

Test Scenario:
1. [TC001] Able to add new to-do list
    Objective: To check functional adding the to-do task into list
    Test step:  1. Open application
                2. Enter text into text field
                3. Press at adding button (icon +)
    Expected: Able to add new to-do list

2. [TC002] Able to press on checkbox to done task
    Objective: To check checkbox function when pressing on the checkbox and text display
    Test step:   1. Open application
                 2. Enter text into text field
                 3. Press at adding button (icon +)
                 4. Press on checkbox in to-do list
    Expected: When press on the checkbox, the checkbox will be selected and the text will be crossed out


3. [TC003] Able to delete to-do list
   Objective: To check functional deleting the to-do task into list
   Test step:   1. Open application
                2. Enter text into text field
                3. Press at adding button (icon +)
                4. Press at delete icon
   Expected: Able to delete to-do list