import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocking_dependencies_on_widget_testing/src/secundary_page.dart';
import 'package:mocking_dependencies_on_widget_testing/src/stream_based_logic.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';

class MockStreamBasedLogic extends Mock implements StreamBasedLogic {}

StreamBasedLogic mockStreamBasedLogic;
StreamController<ResultState> streamController;

void main() {
  setUp(() {
    streamController = StreamController<ResultState>();
    mockStreamBasedLogic = MockStreamBasedLogic();

    when(mockStreamBasedLogic.state).thenAnswer((_) => streamController.stream);
  });

  tearDown(() {
    streamController.close();
  });

  testWidgets(
    'When ResultState is fail '
    'Should find the success false and errorMessage',
    (tester) async {
      streamController.add(
        ResultState(false, 'errorMessage'),
      );

      await _createWidget(tester);

      await tester.pump();

      expect(find.text('Success false'), findsOneWidget);
      expect(find.text('Error Message: errorMessage'), findsOneWidget);
    },
  );

  testWidgets(
    'When ResultState is success '
    'Should find the success true and nothing in errorMessage',
    (tester) async {
      streamController.add(
        ResultState(true, ''),
      );

      await _createWidget(tester);

      await tester.pump();

      expect(find.text('Success true'), findsOneWidget);
      expect(find.text('Error Message: '), findsOneWidget);
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
      home: Provider<StreamBasedLogic>(
        create: (_) => mockStreamBasedLogic,
        child: SecundaryPage(),
      ),
    ),
  );

  await tester.pump();
}
