import 'package:flutter/material.dart';
import 'package:flutter_awesome_buttons/flutter_awesome_buttons.dart';

class PreferencePage extends StatefulWidget {
  const PreferencePage({Key? key}) : super(key: key);

  @override
  _PreferencePageState createState() => _PreferencePageState();
}

class _PreferencePageState extends State<PreferencePage> {
  var currentFocus;

  bool _isEditingText = false;
  String initialText = "Initial Text";
  TextEditingController _editingController =
      TextEditingController(text: "Initial T");

  @override
  void initState() {
    super.initState();
    _editingController = TextEditingController(text: initialText);
  }

  @override
  void dispose() {
    _editingController.dispose();
    super.dispose();
  }

  Widget _buildBody() {
    // final List<String> navItems = <String>['Link', 'Preferences', 'Server Bio'];

    // return ListView.separated(
    //   padding: const EdgeInsets.all(8),
    //   // itemCount: navItems.length,
    //   itemBuilder: (BuildContext context, int index) {
    //     return Container(
    //       height: 50,
    //       color: Colors.lightBlue,
    //       // child: Center(
    //       //   child: Text('${navItems[index]}',
    //       //       style: TextStyle(color: Colors.white)),
    //       // ),
    //     );
    //   },
    //   separatorBuilder: (BuildContext context, int index) => const Divider(),
    // );

    final List<String> navItems = <String>['Link', 'Preferences', 'Server Bio'];

    return _buildContainer();
  }

  Widget _buildContainer() {
    var container = Container(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          // buildImageRow(context),
          buildAppEntryRow(context),
          ElevatedButton(
            onPressed: () {
              update();
            },
            child: Text('Update'),
          ),
          // buildButtonRow(context)
        ],
      ),
    );
    return container;
  }

  update() {
    currentFocus = FocusScope.of(context);

    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }

    //call viewmodel here
  }

  Widget getTextWidgets(List<String> strings) {
    return new Row(children: strings.map((item) => new Text(item)).toList());
  }

  void _userSettings() {
    /*
    Navigator.of(context).push(
    MaterialPageRoute()
    */
    //change onPressed for IconButton in build()
  }

  Widget buildAppEntryRow(BuildContext context) {
    String InitialText = "Initial Text Test";
    return new Row(
      children: <Widget>[
        new Flexible(
          child: new TextField(
            controller: TextEditingController(text: InitialText),
            maxLines: null,
            // decoration: const InputDecoration(helperText: "Waiting Style"),
            style: TextStyle(color: Colors.black),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Enter Your Waiting Style Preferences'),
        actions: <Widget>[
          IconButton(onPressed: null, icon: Icon(Icons.settings))
        ],
      ),
      body: _buildBody(),
    );
  }
}
