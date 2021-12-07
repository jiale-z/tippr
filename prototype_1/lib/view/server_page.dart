import 'package:flutter/material.dart';
import './home_page.dart';
import './image_uploader.dart';
import 'package:image_picker/image_picker.dart';
import 'package:prototype_1/view_model/role_reg_view_model.dart';
import 'package:provider/provider.dart';

class ServerPage extends StatefulWidget {
  @override
  _ServerPageState createState() => _ServerPageState();

  // const AuthPage({
  //   Key? key,
  //   required this.data,
  // }) : super(key: key);
}

class _ServerPageState extends State<ServerPage> {
  final _codeController = TextEditingController();
  final _bioController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Provider.of<HomeViewModel>(context, listen: false).fetchUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Server Registration'),
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
                    'Enter Server Information',
                    style: TextStyle(fontSize: 50),
                    textAlign: TextAlign.center,
                  ),
                ),
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
              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: _codeController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Restaurant Code',
                    hintText: 'Enter your restaurant code',
                ),
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
              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: _bioController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Server Bio',
                    hintText: 'Enter your server bio'),
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
                    continue_to_image();
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

  continue_to_image() {
    //call viewmodel here

    //look at customer_page, check for rep here
    Provider.of<RoleRegViewModel>(context, listen: false).registerServer(_codeController.text, _bioController.text, null);

    Navigator.pop(context);
  }
}
