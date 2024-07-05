import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:todo_list_app/main.dart';


final titleName = find.descendant(of: find.byType(AppBar), matching: find.byType(Text));

final taskListsFinder = find.byType(TaskTile);

final txtEnterTaskDesc = find.byType(TextField);
final btnAddTaskDesc = find.byType(FloatingActionButton);


final chkCheckbox = find.byKey(const Key('chk_checkbox'));
final lblTaskDesc = find.byKey(const Key('chk_taskDesc'));
final btnDeleteTask = find.byKey(const Key('ico_delete'));