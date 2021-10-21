import 'package:flutter/material.dart';
//import 'package:mvvm_flutter_app/model/apis/api_response.dart';
import 'package:mvvm_flutter_app/model/media.dart';
import 'package:mvvm_flutter_app/view/widgets/player_list_widget.dart';
import 'package:mvvm_flutter_app/view/widgets/player_widget.dart';
import 'package:mvvm_flutter_app/view_model/media_view_model.dart';

import 'package:provider/provider.dart';

class Dummy extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<Dummy> {
  @override
  Widget build(BuildContext context) {
    final _inputController = TextEditingController();
    ApiResponse apiResponse = Provider.of<MediaViewModel>(context).response;
    return Scaffold(
      appBar: AppBar(
        title: Text('Media Player'),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 20.0),
                    decoration: BoxDecoration(
                      color: Theme.of(context).accentColor.withAlpha(50),
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    child: TextField(
                        style: TextStyle(
                          fontSize: 15.0,
                          color: Colors.grey,
                        ),
                        controller: _inputController,
                        onChanged: (value) {},
                        onSubmitted: (value) {
                          if (value.isNotEmpty) {
                            Provider.of<MediaViewModel>(context, listen: false)
                                .setSelectedMedia(null);
                            Provider.of<MediaViewModel>(context, listen: false)
                                .fetchMediaData(value);
                          }
                        },
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          prefixIcon: Icon(
                            Icons.search,
                            color: Colors.grey,
                          ),
                          hintText: 'Enter Artist Name',
                        )),
                  ),
                ),
              ],
            ),
          ),
          Expanded(child: getMediaWidget(context, apiResponse)),
        ],
      ),
    );
  }
}
