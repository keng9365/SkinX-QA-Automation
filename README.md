# How to run test
1. Download this project to your computer
   
   > <img width="50%" src="https://github.com/keng9365/SkinX-QA-Automation/assets/51193776/8a714878-2c72-4941-911d-d5308ea221e8"/>

4. Extract zip file & New terminal at folder
   
   > <img width="50%" src="https://github.com/keng9365/SkinX-QA-Automation/assets/51193776/23e8784a-c2b4-4079-88b6-2abdb46a8d7f"/>

6. Make sure the device is starting already
7. Run command
- Android :  ```flutter test -r expanded -d 'device-name' integration_test/feature/test_todoList.dart```
- iOS :  ```flutter test -r expanded -d 'device-id' integration_test/feature/test_todoList.dart```
  
  > <img width="50%" src="https://github.com/keng9365/SkinX-QA-Automation/assets/51193776/4e0b8991-d548-4bb5-aa54-600684614679"/>

# Test Scenario

### 1. [TC001] Verify the function of adding the new to-do list
- **Objective:** To check the function when pressing adding the new to-do task to the list
- **Test step :**
  1. Open application
  2. Enter text into text field
  3. Press at adding button (icon +)
- **Expected:** Able to add new to-do list

### 2. [TC002] Verify the display of the to-do list screen when pressing the checkbox
- **Objective:** To check the checkbox function after pressing on the checkbox and text display
- **Test step:**
  1. Open application
  2. Enter text into text field
  3. Press at adding button (icon +)
  4. Press on checkbox in to-do list
- **Expected:** When press on the checkbox, the checkbox will be selected and the text will be crossed out


### 3. [TC003] Verify the function of deleting the to-do list
- **Objective:** To check the function and screen display when pressing the delete icon to delete the to-do list
- **Test step:**
  1. Open application
  2. Enter text into text field
  3. Press at adding button (icon +)
  4. Press at delete icon
- **Expected:** Able to delete to-do list and it missing 
