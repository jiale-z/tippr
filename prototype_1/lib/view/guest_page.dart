import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dining_page.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:multiselect/multiselect.dart';
import 'temp.dart';

class GuestPage extends StatefulWidget {
  @override
  _GuestPageState createState() => _GuestPageState();

  // const AuthPage({
  //   Key? key,
  //   required this.data,
  // }) : super(key: key);
}

class _GuestPageState extends State<GuestPage> {
  double level = 1;
  double newLevel = 1;
  List<String> selected = [];
  final _nameController = TextEditingController();

  var currValue;

  @override
  void initState() {
    super.initState();
    // Provider.of<HomeViewModel>(context, listen: false).fetchUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Guest'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            // Page Title
            Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: Center(
                child: Container(
                  width: MediaQuery.of(context).size.width * 1,
                  height: MediaQuery.of(context).size.height * 0.20,
                  child: Text(
                    'Hey there!',
                    style: TextStyle(fontSize: 50),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            // Name
            // Container(
            //   width: MediaQuery.of(context).size.width * .85,
            //   child: const Padding(
            //     padding: EdgeInsets.symmetric(horizontal: 8),
            //     child: TextField(
            //       decoration: InputDecoration(
            //           border: OutlineInputBorder(),
            //           labelText: 'Preferred Name',
            //           hintText: 'What should we call ya:)'),
            //     ),
            //   ),
            // ),
            Padding(
              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: _nameController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Preferred Name',
                    hintText: 'Enter your preferred name'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(0.0),
              child: Center(
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.025,
                ),
              ),
            ),
            // Allergens
            Container(
              height: MediaQuery.of(context).size.height * 0.10,
              width: MediaQuery.of(context).size.width * .8,
              // child: MultiSelectDialogField(
              //   title: Text("Select User Roles"),
              //   items: _userroles
              //       .map((e) => MultiSelectItem<ListItem>(e, e.name))
              //       .toList(),
              //   listType: MultiSelectListType.CHIP,
              //   onConfirm: (values) {
              //     _selecteduserroles = values;
              //   },
              // ),
              child: DropDownMultiSelect(
                onChanged: (List<String> x) {
                  setState(() {
                    selected = x;
                  });
                },
                options: [
                  'Milk',
                  'Eggs',
                  'Fish',
                  'Shellfish',
                  'Tree Nuts',
                  'Peanuts',
                  'Wheat',
                  'Soy',
                  'Sesame'
                ],
                selectedValues: selected,
                whenEmpty: 'Any Allergies?',
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(0.0),
              child: Center(
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.025,
                ),
              ),
            ),
            // Slider Title
            Container(
              child: Text(
                'How much Convo?',
                style: TextStyle(
                    color: Colors.black.withOpacity(1.00), fontSize: 18),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 5),
            // Slider Labels
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                // Less Convo
                Container(
                  child: Text(
                    '1 - Less',
                    style: TextStyle(
                        color: Colors.black.withOpacity(1.00), fontSize: 14),
                    textAlign: TextAlign.center,
                  ),
                ),
                // More Convo
                Container(
                  child: Text(
                    '3 - More',
                    style: TextStyle(
                        color: Colors.black.withOpacity(1.00), fontSize: 14),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            // Slider
            Container(
              height: MediaQuery.of(context).size.height * 0.10,
              width: MediaQuery.of(context).size.width * .85,
              child: Slider(
                value: level,
                min: 1,
                max: 3,
                divisions: 2,
                label: level.round().toString(),
                onChanged: (newLevel) {
                  setState(() => level = newLevel);
                },
                activeColor: Colors.blueAccent,
                thumbColor: Colors.lightBlue,
              ),
            ),
            SizedBox(height: 30),
            // To -> Dining Page
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.125,
                width: MediaQuery.of(context).size.width * 1,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(20)),
                child: MaterialButton(
                  onPressed: () {
                    dining();
                    // Navigator.push(
                    //     context, MaterialPageRoute(builder: (_) => HomePage()));
                  },
                  child: Text(
                    'Continue as Guest',
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  dining() {
    //call viewmodel here

    Navigator.push(
        context, MaterialPageRoute(builder: (_) => TEMPDiningPage()));
  }
}
