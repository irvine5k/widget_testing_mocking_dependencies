import 'package:flutter/material.dart';
import 'package:mocking_dependencies_on_widget_testing/src/home_controller.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeController get _controller => Provider.of<HomeController>(context);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: _controller.items == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: _controller.items?.length ?? 0,
              itemBuilder: (context, index) => ListTile(
                title: Text(_controller.items[index].title),
              ),
            ),
    );
  }
}
