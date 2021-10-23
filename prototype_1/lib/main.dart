//Default Imports
import 'package:amplify_api/amplify_api.dart';
import 'package:flutter/material.dart';
//Amplify Imports from pubspec.yaml
import 'package:amplify_flutter/amplify.dart';
import 'package:amplify_datastore/amplify_datastore.dart';
import 'amplifyconfiguration.dart';
import 'models/ModelProvider.dart';
import 'view/homePage.dart';
import 'package:prototype_1/route_generator.dart';

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
  //Loading bool used to delay app initialization until Amplify has been connected
  bool _loading = true;
  // late StreamSubscription _subscription;

  @override
  void initState() {
    _initializeApp();
    super.initState();
  }

  //Connects Amplify to the AWS system in an async process
  Future<void> _initializeApp() async {
    await _configureAmplify();
  }

  //Configures the amplify plugins and settings to connect to proper services
  Future<void> _configureAmplify() async {
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

    //Set the loading state to false to allow the app to rebuild normally
    setState(() {
      _loading = false;
    });
  }

  // @override
  // Widget build(BuildContext context) {
  //   //Using loading bool to either return a dummy app (not sure if this works correctly)
  //   // or begin the actual app initialization when ready
  //   return _loading
  //       ? const MaterialApp(title: 'Loading')

  //       //These providers are what allow the ViewModels to be used and accessed from
  //       // any view within the app, and also what handles the event propogation to update
  //       // these views when the viewmodel changes
  //       : MultiProvider(
  //           providers: [
  //             ChangeNotifierProvider(
  //               create: (_) => HomeViewModel(),
  //             ),
  //             ChangeNotifierProvider(
  //               create: (_) => PreferenceViewModel(),
  //             )
  //           ],
  //           child: MaterialApp(
  //               title: 'Tippr',
  //               theme: ThemeData(
  //                 primarySwatch: Colors.blue,
  //               ),
  //               initialRoute: '/',
  //               routes: {
  //                 '/': (context) => Dummy(),
  //                 '/2': (context) => Dummy2(),
  //               }),
  //         );
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TIPPR Frontend Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/home',
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
