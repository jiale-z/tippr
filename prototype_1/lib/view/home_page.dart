import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../view_model/home_view_model.dart';
import './dining_page.dart';
import 'customer_page.dart';
import 'server_page.dart';
import 'restaurant_rep.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();

  // const AuthPage({
  //   Key? key,
  //   required this.data,
  // }) : super(key: key);
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    Provider.of<HomeViewModel>(context, listen: false).fetchUserData();
  }

  void showRestaurantCode() {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text(
                  Provider.of<HomeViewModel>(context).restaurant!.title +
                      " Code"),
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    Text(Provider.of<HomeViewModel>(context)
                        .restaurant!
                        .restaurantCode),
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
            ));
  }

  void logout() {
    Provider.of<HomeViewModel>(context, listen: false).logout();
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text('Home Page!'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            (Provider.of<HomeViewModel>(context).customer != null)
                ? ElevatedButton(
                    onPressed: () => Navigator.push(context,
                        MaterialPageRoute(builder: (_) => DiningPage())),
                    child: Text("Dine Now"))
                : Container(),
            (Provider.of<HomeViewModel>(context).restaurant != null)
                ? ElevatedButton(
                    onPressed: () => showRestaurantCode(),
                    child: Text("Your Restaurant Code"))
                : Container(),
            (Provider.of<HomeViewModel>(context).customer == null)
                ? ElevatedButton(
                    onPressed: () => Navigator.push(context,
                        MaterialPageRoute(builder: (_) => CustomerPage())),
                    child: Text("Become a Customer!"))
                : Container(),
            (Provider.of<HomeViewModel>(context).server == null)
                ? ElevatedButton(
                    onPressed: () => Navigator.push(context,
                        MaterialPageRoute(builder: (_) => ServerPage())),
                    child: Text("Become a Server!"))
                : Container(),
            (Provider.of<HomeViewModel>(context).restaurant == null)
                ? ElevatedButton(
                    onPressed: () => Navigator.push(context,
                        MaterialPageRoute(builder: (_) => RestaurantRepPage())),
                    child: Text("Become a Restaurant Representative!"))
                : Container(),
            ElevatedButton(onPressed: () => logout(), child: Text("Logout"))
          ],
        ),
      ),
    );
  }
}
