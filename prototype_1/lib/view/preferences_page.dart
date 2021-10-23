import 'package:flutter/material.dart';

import 'package:prototype_1/view_model/preference_view_model.dart';
import 'package:provider/provider.dart';
//import 'package:flutter_awesome_buttons/flutter_awesome_buttons.dart';

class PreferencePage extends StatefulWidget {
  //const PreferencePage({Key? key}) : super(key: key);

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
    Provider.of<PreferenceViewModel>(context, listen: false).fetchDiningPreferences();
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

    Provider.of<PreferenceViewModel>(context, listen: false).addDiningPreference(_editingController.text);

  }

  Widget getTextWidgets(List<String> strings) {
    return Row(children: strings.map((item) => Text(item)).toList());
  }

  void _userSettings() {
    /*
    Navigator.of(context).push(
    MaterialPageRoute()
    */
    //change onPressed for IconButton in build()
  }

  Widget buildAppEntryRow(BuildContext context) {
    String InitialText = "No Preferences yet!";
    _editingController = TextEditingController(text: (Provider.of<PreferenceViewModel>(context).preferences!.isEmpty)
        ? InitialText
        : Provider.of<PreferenceViewModel>(context, listen: false).preferences![0].value);
    return Row(
      children: <Widget>[
        Flexible(
          child: TextField(
            controller: _editingController,
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
