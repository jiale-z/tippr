import 'package:flutter/material.dart';
import './home_page.dart';
import './customer_page.dart';
import './server_page.dart';
import './restaurant_rep.dart';
import 'package:flutter/widgets.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();

  // const AuthPage({
  //   Key? key,
  //   required this.data,
  // }) : super(key: key);
}

class _RegistrationPageState extends State<RegistrationPage> {
  List<String> _userroles = ["Customer", "Server", "Restaurant Representative"];
  String _selectedrole = "Customer";
  String? _chosenValue;

  @override
  void initState() {
    super.initState();
    // Provider.of<HomeViewModel>(context, listen: false).fetchUserData();
  }

  @override
  Widget build(BuildContext context) {
    // List<ListItem> _userroles = [
    //   ListItem(id: 1, name: 'Customer'),
    //   ListItem(id: 2, name: 'Server'),
    //   ListItem(id: 3, name: 'Restaurant Representative')
    // ];
    // List<Object?> _selecteduserroles;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Registration Page"),
        automaticallyImplyLeading: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 60.0),
              child: Center(
                child: Container(
                  width: MediaQuery.of(context).size.width * 1,
                  height: MediaQuery.of(context).size.height * 0.20,
                  child: Text(
                    'Register for TIPPR',
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
                    labelText: 'Email',
                    hintText: 'Enter valid email id as abc@gmail.com'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15, bottom: 0),
              //padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                    hintText: 'Enter secure password'),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.10,
              width: MediaQuery.of(context).size.width * 1,
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
              child: DropdownButton<String>(
                alignment: Alignment.center,
                value: _chosenValue,
                //elevation: 5,
                style: TextStyle(color: Colors.black),
                items: <String>[
                  'Customer',
                  'Server',
                  'Restaurant Representative',
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                hint: Text(
                  "Please select your role",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.w600),
                ),
                onChanged: (String? value) {
                  setState(() {
                    _chosenValue = value;
                  });
                },
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.10,
              width: MediaQuery.of(context).size.width * 1,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(20)),
              child: TextButton(
                onPressed: () {
                  registration();
                  // Navigator.push(
                  //     context, MaterialPageRoute(builder: (_) => HomePage()));
                },
                child: Text(
                  'Register',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  registration() {
    //call viewmodel here _selecteduserroles has data

    //need to change paths later
    if (_chosenValue != null) {
      if (_chosenValue == "Customer") {
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => CustomerPage()));
      } else if (_chosenValue == "Server") {
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => ServerPage()));
      } else {
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => RestaurantRepPage()));
      }
    }
  }
}

class ListItem {
  final int id;
  final String name;

  ListItem({
    required this.id,
    required this.name,
  });
}
