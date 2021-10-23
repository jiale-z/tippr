import 'package:flutter/material.dart';
import './preferences_page.dart';
import './linkPage.dart';
import './bioPage.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              'p1 Home Page',
              style: TextStyle(fontSize: 50),
            ),
            ElevatedButton(
              child: Text('Preferences'),
              onPressed: () {
                Navigator.of(context)
                    .pushNamed('/pref', arguments: "hello from @homepage");
              },
            ),
            ElevatedButton(
              child: Text('Link'),
              onPressed: () {
                Navigator.of(context)
                    .pushNamed('/link', arguments: "hello from @homepage");
              },
            ),
            ElevatedButton(
              child: Text('Server Bio'),
              onPressed: () {
                Navigator.of(context)
                    .pushNamed('/bio', arguments: "hello from @homepage");
              },
            ),
          ],
        ),
      ),
    );
  }
}
