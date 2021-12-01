import 'package:flutter/material.dart';
import './home_page.dart';
import './dining_page.dart';
import 'package:multiselect/multiselect.dart';

class CustomerPage extends StatefulWidget {
  @override
  _CustomerPageState createState() => _CustomerPageState();

  // const AuthPage({
  //   Key? key,
  //   required this.data,
  // }) : super(key: key);
}

class _CustomerPageState extends State<CustomerPage> {
  double level = 1;
  double newLevel = 1;
  List<String> selected = [];

  @override
  void initState() {
    super.initState();
    // Provider.of<HomeViewModel>(context, listen: false).fetchUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Customer Registration'),
        automaticallyImplyLeading: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: Center(
                child: Container(
                  width: MediaQuery.of(context).size.width * 1,
                  height: MediaQuery.of(context).size.height * 0.20,
                  child: Text(
                    'Enter Customer Information',
                    style: TextStyle(fontSize: 50),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            Padding(
              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
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
            Container(
              height: MediaQuery.of(context).size.height * 0.10,
              width: MediaQuery.of(context).size.width * .75,
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
                  'Sesame',
                  'Other'
                ],
                selectedValues: selected,
                whenEmpty: 'Select the foods that you are allergic to.',
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
            Container(
              child: Text(
                'Communication Level:',
                style: TextStyle(
                    color: Colors.black.withOpacity(1.00), fontSize: 18),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              child: Text(
                '1- Less Convo',
                style: TextStyle(
                    color: Colors.black.withOpacity(1.00), fontSize: 12),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              child: Text(
                '5- More Convo',
                style: TextStyle(
                    color: Colors.black.withOpacity(1.00), fontSize: 12),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.10,
              width: MediaQuery.of(context).size.width * 1,
              child: Slider(
                value: level,
                min: 1,
                max: 3,
                divisions: 2,
                label: level.round().toString(),
                onChanged: (newLevel) {
                  setState(() => level = newLevel);
                },
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
                    login();
                    // Navigator.push(
                    //     context, MaterialPageRoute(builder: (_) => HomePage()));
                  },
                  child: Text(
                    'Continue',
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

  login() {
    //call viewmodel here

    //would need to check roles on each page (customer, server, and rest rep)
    //to determine what the next page should be
    //would have to retrieve roles from aws
    //check both server and rep here

    Navigator.push(context, MaterialPageRoute(builder: (_) => DiningPage()));
  }
}
