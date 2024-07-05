import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:todo_list_app/main.dart';
import '../finder/finder_todoList.dart';
import '../utils/extension.dart';


Future<void> press(WidgetTester tester, Finder point) async {
    await Future.delayed(const Duration(milliseconds: 200));
    await tester.tap(point);
    await tester.pumpAndSettle();
}

Future<void> addTask(WidgetTester tester, data) async {
  await tester.pumpUntilFound(tester, txtEnterTaskDesc);
  for (var i=0; i < data.length; i++){
    await tester.enterText(txtEnterTaskDesc, data[i]);
    await tester.pump();
    await press(tester, btnAddTaskDesc.first);
  }
}

Future<void> deleteTaskAll(WidgetTester tester) async {
  await tester.pumpUntilFound(tester, taskListsFinder);
  final taskLists = find.byType(TaskTile).evaluate().toList();
  var taskList = taskLists.length;
  for(var i=0; i < taskList; i++){
    await press(tester, btnDeleteTask.first);
  }
}

Future<void> pressOnCheckboxAll(WidgetTester tester) async {
  await tester.pumpUntilFound(tester, chkCheckbox);
  final taskLists = find.byType(TaskTile).evaluate().toList();
  var taskList = taskLists.length;
  for(var i=0; i < taskList; i++){
    final checkboxWithIndex = find.descendant(of: find.byKey(Key('TaskTile_$i')), matching: chkCheckbox);
    await press(tester, checkboxWithIndex);
  }
}

Future<void> verifyTitleName(WidgetTester tester, data) async {
  await tester.pumpUntilFound(tester, titleName);
  var text = titleName.evaluate().single.widget as Text;
  expect(text.data, data);
}

Future<void> verifyLengthOfTaskLists(number) async {
  var taskLength = find.byType(TaskTile).evaluate().toList().length;
  expect(taskLength, number);
}

Future<void> verifyTodoListDesc(WidgetTester tester, data) async {
  final taskLists = find.byType(TaskTile).evaluate().toList();
  for (var i = 0; i < taskLists.length; i++) {
    final taskList = find.byWidget(taskLists[i].widget);
    final taskDesc = find.descendant(of: taskList, matching: lblTaskDesc); //.evaluate().single.widget as Text >> taskDesc.data;
    expect(tester.widget<Text>(taskDesc).data, data[i]);
  }
}

Future<void> verifyCheckboxValues(WidgetTester tester) async {
  final taskLists = find.byType(TaskTile).evaluate().toList();
  for (var i = 0; i < taskLists.length; i++) {
    final taskList = find.byWidget(taskLists[i].widget);
    final taskDesc = find.descendant(of: taskList, matching: chkCheckbox);
    expect(tester.widget<Checkbox>(taskDesc).value, true);
    ;
  }
}