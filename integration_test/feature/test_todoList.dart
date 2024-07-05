import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:todo_list_app/main.dart';
import '../resource/finder/finder_todoList.dart';
import '../resource/pages/page_todoList.dart';
import '../resource/data_set/data_toDoListDesc.dart' as data;
import '../resource/variables/var_todoList.dart' as variable;


void main() {

  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('[TC001] Verify the function of adding the new to-do list', (tester) async {
    await tester.pumpWidget(const MyApp());
    await verifyTitleName (tester, variable.titleName);
    await addTask (tester, data.toDoListsDesc);
    await verifyTodoListDesc (tester, data.toDoListsDesc);
    await verifyLengthOfTaskLists(3);

    find.byType(TaskTile).evaluate().toList().asMap().forEach((index, task) {
      final taskDesc = find.descendant(of: find.byWidget(task.widget), matching: lblTaskDesc);
      expect(tester.widget<Text>(taskDesc).data, data.toDoListsDesc[index],
          reason: 'Verify the do-to task description is match with test data');
    });
  });

  testWidgets('[TC002] Verify the display of the to-do list screen when pressing the checkbox', (tester) async {
    await tester.pumpWidget(const MyApp());
    await verifyTitleName (tester, variable.titleName);
    await addTask (tester, data.toDoListsDesc);
    await verifyTodoListDesc (tester, data.toDoListsDesc);
    await verifyLengthOfTaskLists(3);
    await pressOnCheckboxAll (tester);
    await verifyCheckboxValues (tester);

    find.byType(TaskTile).evaluate().toList().forEach((task) {
      final taskCheckbox = find.descendant(of: find.byWidget(task.widget), matching: chkCheckbox);
      final taskDesc = find.descendant(of: find.byWidget(task.widget), matching: lblTaskDesc);
      expect(tester.widget<Checkbox>(taskCheckbox).value, true,
          reason: 'Verify the checkbox is selected');
      expect(tester.widget<Text>(taskDesc).style!.decoration, equals(TextDecoration.lineThrough),
          reason: 'Verify the text will be crossed out');
    });
  });

  testWidgets('[TC003] Verify the function of deleting the to-do list', (tester) async {
    await tester.pumpWidget(const MyApp());
    await verifyTitleName (tester, variable.titleName);
    await addTask (tester, data.toDoListsDesc);
    await verifyTodoListDesc (tester, data.toDoListsDesc);
    await deleteTaskAll (tester);
    await verifyLengthOfTaskLists(0);

    expect(find.byType(TaskTile).evaluate(), [],
        reason: 'Verify the to-do task was deleted all');
  });

}
