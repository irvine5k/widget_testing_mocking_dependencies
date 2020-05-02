import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocking_dependencies_on_widget_testing/src/home_controller.dart';
import 'package:mocking_dependencies_on_widget_testing/src/home_page.dart';
import 'package:mocking_dependencies_on_widget_testing/src/home_repository.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';

class MockHomeRepository extends Mock implements HomeRepository {}

HomeRepository homeRepository;

final response = [
  TaskModel('test 1', false),
  TaskModel('test 2', false),
];

void main() {
  setUp(() {
    homeRepository = MockHomeRepository();

    when(homeRepository.getItems()).thenAnswer((_) => Future.value(response));
  });

  testWidgets(
    'When build page '
    'Should find the tasks',
    (tester) async {
      await _createWidget(tester);

      await tester.pump();

      expect(find.text('test 1'), findsOneWidget);
      expect(find.text('test 2'), findsOneWidget);
    },
  );
}

Future<void> _createWidget(WidgetTester tester) async {
  await tester.pumpWidget(
    MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChangeNotifierProvider<HomeController>(
        create: (_) => HomeController(homeRepository),
        child: HomePage(),
      ),
    ),
  );

  await tester.pump();
}
