import 'package:flutter/material.dart';
import 'attention_widget.dart';
import 'package:provider/provider.dart';
import '../view_model/dining_view_model.dart';
import '../models/Server.dart';
import 'package:url_launcher/url_launcher.dart';

class TEMPDiningPage extends StatefulWidget {
  @override
  _TEMPDiningPageState createState() => _TEMPDiningPageState();

  // const AuthPage({
  //   Key? key,
  //   required this.data,
  // }) : super(key: key);
}

class _TEMPDiningPageState extends State<TEMPDiningPage> {
  @override
  void initState() {
    super.initState();
    // Provider.of<HomeViewModel>(context, listen: false).fetchUserData();
  }

  Widget buildIconColumn(BuildContext context) {
    List<bool> allergens =
        Provider.of<DiningViewModel>(context).customer!.allergens!;
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          (allergens[0])
              ? Column(
                  children: [
                    Container(
                      child: Image.asset('assets/milk.png'),
                      height: MediaQuery.of(context).size.height * .08,
                      width: MediaQuery.of(context).size.width * .2,
                    ),
                    SizedBox(height: 5)
                  ],
                )
              : Container(),
          (allergens[1])
              ? Column(
                  children: [
                    Container(
                      child: Image.asset('assets/eggs.png'),
                      height: MediaQuery.of(context).size.height * .07,
                      width: MediaQuery.of(context).size.width * .2,
                    ),
                    SizedBox(height: 5),
                  ],
                )
              : Container(),
          (allergens[2])
              ? Column(
                  children: [
                    Container(
                      child: Image.asset('assets/fish.png'),
                      height: MediaQuery.of(context).size.height * .05,
                      width: MediaQuery.of(context).size.width * .12,
                    ),
                    SizedBox(height: 5),
                  ],
                )
              : Container(),
          (allergens[3])
              ? Column(
                  children: [
                    Container(
                      child: Image.asset('assets/shellfish.png'),
                      height: MediaQuery.of(context).size.height * .05,
                      width: MediaQuery.of(context).size.width * .15,
                    ),
                    SizedBox(height: 6),
                  ],
                )
              : Container(),
          (allergens[4])
              ? Column(
                  children: [
                    Container(
                      child: Image.asset('assets/treenuts.png'),
                      height: MediaQuery.of(context).size.height * .05,
                      width: MediaQuery.of(context).size.width * .2,
                    ),
                    SizedBox(height: 6),
                  ],
                )
              : Container(),
          (allergens[5])
              ? Column(
                  children: [
                    Container(
                      child: Image.asset('assets/peanuts.png'),
                      height: MediaQuery.of(context).size.height * .05,
                      width: MediaQuery.of(context).size.width * .15,
                    ),
                    SizedBox(height: 6),
                  ],
                )
              : Container(),
          (allergens[6])
              ? Column(
                  children: [
                    Container(
                      child: Image.asset('assets/wheat.png'),
                      height: MediaQuery.of(context).size.height * .05,
                      width: MediaQuery.of(context).size.width * .2,
                    ),
                    SizedBox(height: 6),
                  ],
                )
              : Container(),
          (allergens[7])
              ? Column(
                  children: [
                    Container(
                      child: Image.asset('assets/soy.png'),
                      height: MediaQuery.of(context).size.height * .05,
                      width: MediaQuery.of(context).size.width * .2,
                    ),
                    SizedBox(height: 9),
                  ],
                )
              : Container(),
          (allergens[8])
              ? Container(
                  child: Image.asset('assets/sesame.png'),
                  height: MediaQuery.of(context).size.height * .05,
                  width: MediaQuery.of(context).size.width * .12,
                )
              : Container(),
        ],
      ),
    );
  }

  final ButtonStyle defaultBtn = ElevatedButton.styleFrom(
    onPrimary: Colors.black87,
    primary: Colors.blue[100],
    minimumSize: Size(130, 50),
    padding: EdgeInsets.symmetric(horizontal: 16),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(2)),
    ),
  );

  final ButtonStyle allergens = ElevatedButton.styleFrom(
    onPrimary: Colors.black87,
    primary: Colors.grey[500],
    minimumSize: Size(30, 470),
    padding: EdgeInsets.symmetric(horizontal: 16),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(2)),
    ),
  );

  final ButtonStyle indicators = ElevatedButton.styleFrom(
    onPrimary: Colors.black87,
    primary: Colors.green[100],
    minimumSize: Size(50, 500),
    padding: EdgeInsets.symmetric(horizontal: 16),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(2)),
    ),
  );

  generateListTiles() {
    List<Server> servers = Provider.of<DiningViewModel>(context).servers!;
    return servers
        .map((server) => ListTile(
              leading: Icon(Icons.input),
              title: Text(server.user.name!),
              onTap: () => {
                showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                          title: Text(server.user.name!),
                          content: SingleChildScrollView(
                            child: ListBody(
                              children: <Widget>[
                                Text(server.bio!),
                              ],
                            ),
                          ),
                          actions: <Widget>[
                            TextButton(
                              child: const Text('Close'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        ))
              },
            ))
        .toList();
  }

  _openMenu() async {
    String url = Provider.of<DiningViewModel>(context).restaurant!.menu!;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TIPPR_S4 demo',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0x44000000),
          elevation: 0,
          title: const Text('Dine_TEMP'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            tooltip: 'Back',
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        drawer: Drawer(
            child: ListView(padding: EdgeInsets.zero, children: <Widget>[
          DrawerHeader(
              child: Text(
                'Servers',
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
              decoration: BoxDecoration(
                color: Colors.blue,
              )),
          (Provider.of<DiningViewModel>(context).servers == null)
              ? Text("No Restaurant Connected")
              : generateListTiles(),
        ])),
        body: Container(
          margin: EdgeInsets.only(top: 1, left: 1, right: 1, bottom: 1),
          //width: MediaQuery.of(context).size.width /* * .99 */,
          //height: MediaQuery.of(context).size.height /* * .95 */,
          //add functionality to change the color of this background container
          color: Colors.grey,
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              // Attention Widget
              Positioned(
                //bottom: 0,
                child: Container(
                  /* width: 150,
                  height: 150, */
                  color: Colors.blue,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const AttentionWidget(),
                    ],
                  ),
                ),
              ),
              // Restaurant Buttons
              Positioned(
                top: 0,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.125,
                  //color: Color.fromARGB(255, 14, 13, 13),
                  color: Color(0x44000000),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      (Provider.of<DiningViewModel>(context).restaurant == null)
                          ? Text("Menu")
                          : ElevatedButton(
                              onPressed: () {
                                _openMenu();
                              },
                              child: const Text('Menu'),
                              style: defaultBtn,
                            ),
                      const SizedBox(width: 36),
                      (Provider.of<DiningViewModel>(context).servers == null)
                          ? Text("Servers")
                          : ElevatedButton(
                              onPressed: () {},
                              child: const Text('Servers'),
                              style: defaultBtn,
                            ),
                    ],
                  ),
                ),
              ),
              /* // User buttons
              Positioned(
                bottom: 0,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.125,
                  color: Colors.blue,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      ElevatedButton(
                        onPressed: () {},
                        child: const Text('Assist'),
                        style: defaultBtn,
                      ),
                      const SizedBox(width: 36),
                      ElevatedButton(
                        onPressed: () {},
                        child: const Text('Do not Disturb'),
                        style: defaultBtn,
                      ),
                    ],
                  ),
                ),
              ),
               */
              // Icon column
              Positioned(
                left: 0,
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.22,
                  height: MediaQuery.of(context).size.height * 0.6,
                  //color: Colors.grey,
                  decoration: BoxDecoration(
                    color: Color(0x44000000),
                    border: Border.all(
                      color: Colors.grey,
                      width: 3,
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      buildIconColumn(context),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
