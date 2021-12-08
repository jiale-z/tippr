import 'package:flutter/material.dart';
import './home_page.dart';
import './customer_page.dart';
import './server_page.dart';
import './restaurant_rep.dart';
import './dining_page.dart';
import 'package:multiselect/multiselect.dart';

// import './confirmation_page.dart';
import 'package:flutter/widgets.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:provider/provider.dart';
import 'package:prototype_1/view_model/login_view_model.dart';

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
  List<String> selected = [];

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _codeController = TextEditingController();
  final _nameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Provider.of<HomeViewModel>(context, listen: false).fetchUserData();
  }

  String codeDialog = "";
  String valueText = "";

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
              padding: const EdgeInsets.only(top: 30.0),
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
                controller: _nameController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Name',
                    hintText: 'Enter your name'),
              ),
            ),
            Padding(
              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: _emailController,
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
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                    hintText: 'Enter secure password'),
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.all(0.0),
            //   child: Center(
            //     child: Container(
            //       height: MediaQuery.of(context).size.height * 0.025,
            //     ),
            //   ),
            // ),
            // Container(
            //   height: MediaQuery.of(context).size.height * 0.10,
            //   width: MediaQuery.of(context).size.width * .65,
            //   child: MultiSelectDialogField(
            //     title: Text("Select User Roles"),
            //     items: _userroles
            //         .map((e) => MultiSelectItem<ListItem>(e, e.name))
            //         .toList(),
            //     listType: MultiSelectListType.CHIP,
            //     onConfirm: (values) {
            //       _selecteduserroles = values;
            //     },
            //   ),
            //   child: DropdownButton<String>(
            //     alignment: Alignment.center,
            //     value: _chosenValue,
            //     //elevation: 5,
            //     style: TextStyle(color: Colors.black),
            //     items: <String>[
            //       'Customer',
            //       'Server',
            //       'Restaurant Representative',
            //     ].map<DropdownMenuItem<String>>((String value) {
            //       return DropdownMenuItem<String>(
            //         value: value,
            //         child: Text(value),
            //       );
            //     }).toList(),
            //     hint: Text(
            //       "Please select your role",
            //       style: TextStyle(
            //           color: Colors.black,
            //           fontSize: 20,
            //           fontWeight: FontWeight.w600),
            //     ),
            //     onChanged: (String? value) {
            //       setState(() {
            //         _chosenValue = value;
            //       });
            //     },
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15, bottom: 0),
              child: DropDownMultiSelect(
                onChanged: (List<String> x) {
                  setState(() {
                    selected = x;
                  });
                },
                options: ['Customer', 'Server', 'Restaurant Representative'],
                selectedValues: selected,
                whenEmpty: 'Select your roles',
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.10,
              width: MediaQuery.of(context).size.width * 1,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(20)),
              child: MaterialButton(
                onPressed: () {
                  if (_emailController.text.isEmpty ||
                      _passwordController.text.isEmpty ||
                      _nameController.text.isEmpty ||
                      selected.isEmpty) {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                            title: Text(
                                'Name, Email, and Password Fields Cannot Be Empty'));
                      },
                    );
                  } else {
                    registration(_emailController.text,
                        _passwordController.text, _nameController.text);
                    showDialog(
                      context: context,
                      builder: (context) {
                        // return Dialog(
                        //   shape: RoundedRectangleBorder(
                        //       borderRadius: BorderRadius.circular(40)),
                        //   elevation: 16,
                        //   child: Container(
                        //     child: ListView(
                        //       shrinkWrap: true,
                        //       children: <Widget>[
                        //         AlertDialog(
                        //           title: Text('TextField in Dialog'),
                        //           content: TextField(
                        //             onChanged: (value) {},
                        //             decoration: InputDecoration(
                        //                 hintText: "Text Field in Dialog"),
                        //           ),
                        //         ),
                        //       ],
                        //     ),
                        //   ),
                        // );
                        return AlertDialog(
                          title: Text('Enter Confirmation Code Sent To Email'),
                          content: TextField(
                            controller: _codeController,
                            onChanged: (value) {},
                            decoration: InputDecoration(
                                hintText:
                                    "Enter Confirmation Code Sent To Email"),
                          ),
                          actions: <Widget>[
                            MaterialButton(
                              color: Colors.blue,
                              textColor: Colors.white,
                              child: Text('OK'),
                              onPressed: () {
                                setState(() {
                                  codeDialog = valueText;
                                  Navigator.pop(context);
                                  checkCode(_codeController.text);
                                });
                              },
                            ),
                          ],
                        );
                      },
                    );
                  }

                  //               showDialog(
                  //                 context:context,
                  //                 builder: (context) {
                  //                   return AlertDialog(
                  //     title: Text('TextField in Dialog'),
                  //     content: TextField(
                  //       onChanged: (value) { },
                  //       decoration: InputDecoration(hintText: "Text Field in Dialog"),
                  //     ),
                  // ),
                  //                 }

                  // registration();

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

  checkCode(String code) async {
    //check confirmation code here
    //if good continue to registration (just put registration()),
    //else write message saying wrong code
    bool confirmResults =
        await Provider.of<LoginViewModel>(context, listen: false)
            .confirmRegistration(code);

    if (confirmResults) {
      role_registration();
    }
  }

  registration(String email, String password, String name) async {
    print(email);
    await Provider.of<LoginViewModel>(context, listen: false)
        .register(email, password, name);
  }

  role_registration() {
    //call viewmodel here _selecteduserroles has data

    Navigator.push(context, MaterialPageRoute(builder: (_) => DiningPage()));

    //need to change paths later
    if (selected.isNotEmpty) {
      if (selected.contains("Customer")) {
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => CustomerPage()));
      }
      if (selected.contains("Server")) {
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => ServerPage()));
      }
      if (selected.contains("Restaurant Representative")) {
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
