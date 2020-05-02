import 'package:flutter/material.dart';
import 'package:mocking_dependencies_on_widget_testing/src/stream_based_logic.dart';
import 'package:provider/provider.dart';

class SecundaryPage extends StatefulWidget {
  @override
  _SecundaryPageState createState() => _SecundaryPageState();
}

class _SecundaryPageState extends State<SecundaryPage> {
  StreamBasedLogic get _logic =>
      Provider.of<StreamBasedLogic>(context, listen: false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Secundary Page'),
      ),
      body: StreamBuilder<ResultState>(
        stream: _logic.state,
        initialData: ResultState(false, ''),
        builder: (context, snapshot) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Success ${snapshot.data.success}'),
                Text('Error Message: ${snapshot.data.errorMessage}'),
                FlatButton(
                  onPressed: () {
                    _logic.addState(
                      ResultState(false, 'error message'),
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.all(8),
                    color: Colors.red,
                    child: Text('ADD ERROR'),
                  ),
                ),
                FlatButton(
                  onPressed: () {
                    _logic.addState(
                      ResultState(true, ''),
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.all(8),
                    color: Colors.green,
                    child: Text('ADD SUCCESS'),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
