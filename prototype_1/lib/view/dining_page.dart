import 'package:flutter/material.dart';

class DiningPage extends StatefulWidget {
  @override
  _DiningPageState createState() => _DiningPageState();

  // const AuthPage({
  //   Key? key,
  //   required this.data,
  // }) : super(key: key);
}

class _DiningPageState extends State<DiningPage> {
  @override
  void initState() {
    super.initState();
    // Provider.of<HomeViewModel>(context, listen: false).fetchUserData();
  }

  Widget buildIconColumn(BuildContext context) {
    return Container(
      //padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          //individual food allergen icons
          Container(
            child: Image.asset('assets/milk.png'),
            height: MediaQuery.of(context).size.height * .08,
            width: MediaQuery.of(context).size.width * .2,
          ),
          SizedBox(height: 5),
          Container(
            child: Image.asset('assets/eggs.png'),
            height: MediaQuery.of(context).size.height * .07,
            width: MediaQuery.of(context).size.width * .2,
          ),
          SizedBox(height: 5),
          Container(
            child: Image.asset('assets/fish.png'),
            height: MediaQuery.of(context).size.height * .05,
            width: MediaQuery.of(context).size.width * .12,
          ),
          SizedBox(height: 5),
          Container(
            child: Image.asset('assets/peanuts.png'),
            height: MediaQuery.of(context).size.height * .05,
            width: MediaQuery.of(context).size.width * .15,
          ),
          SizedBox(height: 5),
          Container(
            child: Image.asset('assets/sesame.png'),
            height: MediaQuery.of(context).size.height * .05,
            width: MediaQuery.of(context).size.width * .12,
          ),
          SizedBox(height: 5),
          Container(
            child: Image.asset('assets/shellfish.png'),
            height: MediaQuery.of(context).size.height * .05,
            width: MediaQuery.of(context).size.width * .15,
          ),
          SizedBox(height: 5),
          Container(
            child: Image.asset('assets/soy.png'),
            height: MediaQuery.of(context).size.height * .05,
            width: MediaQuery.of(context).size.width * .2,
          ),
          SizedBox(height: 5),
          Container(
            child: Image.asset('assets/treenuts.png'),
            height: MediaQuery.of(context).size.height * .05,
            width: MediaQuery.of(context).size.width * .2,
          ),
          SizedBox(height: 5),
          Container(
            child: Image.asset('assets/wheat.png'),
            height: MediaQuery.of(context).size.height * .05,
            width: MediaQuery.of(context).size.width * .2,
          ),
          SizedBox(height: 5),
        ],
      ),
    );
  }

/*   final displayColumn = Container(
    padding: const EdgeInsets.all(20),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        //commLevel indicator food allergen icons
      ],
    ),
  ); */

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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TIPPR_S4 demo',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Dine:)'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            tooltip: 'Back',
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: Container(
          margin: EdgeInsets.only(top: 8),
          //padding: EdgeInsets.all(36),
          child: ListView(
            physics: ClampingScrollPhysics(),
            children: <Widget>[
              // 1. Restaurant buttons
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text('Menu'),
                      style: defaultBtn,
                    ),
                    const SizedBox(width: 36),
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text('Servers'),
                      style: defaultBtn,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),

              // 2. Icon Column
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    /* Use below later: */
                    buildIconColumn(context),
                    //displayColumn,
                    /* ElevatedButton(
                      onPressed: () {},
                      child: const Text('Allergens'),
                      style: allergens,
                    ), */
                    ElevatedButton(
                      onPressed: () {},
                      //child: const Text('audio level + red/green background'),
                      child: const Text('                                   '),
                      style: indicators,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),

              // 3. User buttons
              Container(
                //dual button
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
            ],
          ),
        ),
      ),
    );
  }
}
