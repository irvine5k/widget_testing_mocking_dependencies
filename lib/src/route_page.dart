import 'package:flutter/material.dart';
import 'package:mocking_dependencies_on_widget_testing/src/home_controller.dart';
import 'package:mocking_dependencies_on_widget_testing/src/home_page.dart';
import 'package:mocking_dependencies_on_widget_testing/src/home_repository.dart';
import 'package:mocking_dependencies_on_widget_testing/src/secundary_page.dart';
import 'package:mocking_dependencies_on_widget_testing/src/stream_based_logic.dart';
import 'package:provider/provider.dart';

class RoutePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RoutePage'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          FlatButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ChangeNotifierProvider<HomeController>(
                    create: (context) => HomeController(HomeRepository()),
                    child: HomePage(),
                  ),
                ),
              );
            },
            child: Container(
              padding: EdgeInsets.all(8),
              color: Colors.yellow,
              child: Text('HOME PAGE'),
            ),
          ),
          FlatButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => Provider<StreamBasedLogic>(
                    create: (context) => StreamBasedLogic(),
                    child: SecundaryPage(),
                  ),
                ),
              );
            },
            child: Container(
              padding: EdgeInsets.all(8),
              color: Colors.green,
              child: Text('SECUNDARY PAGE'),
            ),
          ),
        ],
      ),
    );
  }
}
