import 'package:flutter/material.dart';

class AttentionWidget extends StatefulWidget {
  const AttentionWidget({Key? key}) : super(key: key);

  @override
  _AttentionWidgetState createState() => _AttentionWidgetState();
}

class _AttentionWidgetState extends State<AttentionWidget> {
  /* bool _isFavorited = true;
  int _favoriteCount = 41;

  void _toggleFavorite() {
    setState(() {
      if (_isFavorited) {
        _favoriteCount -= 1;
        _isFavorited = false;
      } else {
        _favoriteCount += 1;
        _isFavorited = true;
      }
    });
  } */
  bool _active = false;

  void _handleTap() {
    setState(() {
      _active = !_active;
    });
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

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      child: Container(
        child: Center(
          child: Text(
            _active ? 'Assistance' : 'Dining:)',
            style: const TextStyle(fontSize: 32.0, color: Colors.white),
          ),
        ),
        width: MediaQuery.of(context).size.width * 0.99,
        height: MediaQuery.of(context).size.height * 0.99,
        decoration: BoxDecoration(
          color: _active ? Colors.red[700] : Colors.grey[600],
        ),
      ),
    );

    /* return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Positioned(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.5,
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
        Positioned(
          child: Container(
            padding: const EdgeInsets.all(0),
            child: IconButton(
              padding: const EdgeInsets.all(0),
              alignment: Alignment.centerRight,
              icon: (_isFavorited
                  ? const Icon(Icons.star)
                  : const Icon(Icons.star_border)),
              color: Colors.red[500],
              onPressed: _toggleFavorite,
            ),
          ),
        ),
        SizedBox(
          width: 18,
          child: SizedBox(
            child: Text('$_favoriteCount'),
          ),
        ),
      ],
    ); */
  }
}
