import 'package:flutter/material.dart';
import './preferences_page.dart';
import './linkPage.dart';
import './bioPage.dart';
import 'package:provider/provider.dart';
import 'package:prototype_1/view_model/home_view_model.dart';

class HomePage extends StatefulWidget {
  //const HomePage({Key? key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: Text('Home'),
  //     ),
  //     body: Center(
  //       child: Column(
  //         mainAxisSize: MainAxisSize.min,
  //         children: <Widget>[
  //           Text(
  //             'p1 Home Page',
  //             style: TextStyle(fontSize: 50),
  //           ),
  //           ElevatedButton(
  //             child: Text('Preferences'),
  //             onPressed: () {
  //               Navigator.of(context)
  //                   .pushNamed('/pref', arguments: "hello from @homepage");
  //             },
  //           ),
  //           ElevatedButton(
  //             child: Text('Link'),
  //             onPressed: () {
  //               Navigator.of(context)
  //                   .pushNamed('/link', arguments: "hello from @homepage");
  //             },
  //           ),
  //           ElevatedButton(
  //             child: Text('Server Bio'),
  //             onPressed: () {
  //               Navigator.of(context)
  //                   .pushNamed('/bio', arguments: "hello from @homepage");
  //             },
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }
}
class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    Provider.of<HomeViewModel>(context, listen: false).fetchUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomePage'),
      ),
      body: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          //Reading the value of the user directly from the viewmodel using Provider
          (Provider.of<HomeViewModel>(context).user != null)
            ? Text("Welcome " + Provider.of<HomeViewModel>(context).user!.name)
            : Text("Welcome"),
          ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/3');
              },
              child: const Text('Dining Preferences')),
          ElevatedButton(
              onPressed: () {
                (Provider.of<HomeViewModel>(context, listen: false).serverBio != null)
                ? Provider.of<HomeViewModel>(context, listen: false)
                    .deleteServerLink()
                : Provider.of<HomeViewModel>(context, listen: false)
                    .createServerLink('123abc');
              },
              child: (Provider.of<HomeViewModel>(context).serverBio != null)
                ? Text('Done Dining!')
                : Text("Link to Server!")),
          //Using ternary operators to change the content of the screen based on the data
          // available. In this case,
          (Provider.of<HomeViewModel>(context).serverBio != null)
              ? Text(Provider.of<HomeViewModel>(context).server!.name + ": " + Provider.of<HomeViewModel>(context).serverBio!.bio!)
              : Text('Click Link to Connect to your Server!')
        ],
      ),
    ]),
    );
  }

}
