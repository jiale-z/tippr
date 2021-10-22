//Default Imports
import 'package:amplify_api/amplify_api.dart';
import 'package:flutter/material.dart';
//Amplify Imports from pubspec.yaml
import 'package:amplify_flutter/amplify.dart';
import 'package:amplify_datastore/amplify_datastore.dart';
import 'amplifyconfiguration.dart';
import 'models/ModelProvider.dart';

import 'package:provider/provider.dart';

import 'view_model/home_view_model.dart';
import 'view_model/preference_view_model.dart';
import 'view/dummy.dart';
import 'view/dummy_2.dart';

import 'package:prototype_1/models/User.dart';
import "dart:async";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _loading = true;
  late StreamSubscription _subscription;

  @override
  void initState() {
    //super.initState();
    _initializeApp();
    super.initState();
    /*
    while (_loading) {
      print("porblem");
    }

     */
    //_testAmplify();
  }

  Future<void> _initializeApp() async {
    await _configureAmplify();
  }

  void _testAmplify() async {
    //_configureAmplify();
    //var list = await Amplify.DataStore.query(User.classType);
    //print(list.toString());
    User newUser = User(name: "TestUser");
    print("ABC");
    await Amplify.DataStore.save(newUser);
    print("ABD");
    try {
      List<User> users = await Amplify.DataStore.query(User.classType);
      print("HEEYYYYYY" + users.toString());
    } catch (e) {
      print("HEY" + e.toString());
    }
  }

  Future<void> _configureAmplify() async {
    // Add the following lines to your app initialization to add the DataStore plugin
    AmplifyDataStore datastorePlugin =
        AmplifyDataStore(modelProvider: ModelProvider.instance);
    Amplify.addPlugin(datastorePlugin);
    Amplify.addPlugin(AmplifyAPI());
    try {
      await Amplify.configure(amplifyconfig);
    } on AmplifyAlreadyConfiguredException {
      print(
          "Tried to reconfigure Amplify; this can occur when your app restarts on Android.");
    }
    setState(() {
      _loading = false;
    });
    //_loading = false;
    //_testAmplify();
  }

  @override
  Widget build(BuildContext context) {
    return _loading
        ? /*Text("Loading")*/ Scaffold()
        : MultiProvider(
            providers: [
              ChangeNotifierProvider(
                create: (_) => HomeViewModel(),
              ),
              ChangeNotifierProvider(
                create: (_) => PreferenceViewModel(),
              )
            ],
            child: MaterialApp(
                title: 'Tippr',
                theme: ThemeData(
                  primarySwatch: Colors.blue,
                ),
                initialRoute: '/',
                routes: {
                  '/': (context) => Dummy(),
                  '/2': (context) => Dummy2(),
                }),
          );
  }

  /*
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
  */
}
