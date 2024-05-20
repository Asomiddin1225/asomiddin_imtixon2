import 'package:flutter/material.dart';

void baxolash(BuildContext context) {
  int _yulduzSoni = 0;

  void _rate(int star) {
    _yulduzSoni = star;

    (context as Element).markNeedsBuild();
  }

  void _sendyulduzSoni() {
    Navigator.of(context).pop();
  }

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            title: Text('Rate recipe'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(5, (index) {
                    return IconButton(
                      icon: Icon(
                        index < _yulduzSoni ? Icons.star : Icons.star_border,
                        color: index < _yulduzSoni
                            ? Color(0xFFFFAD30)
                            : Color(0xFFFFAD30),
                        size: 35,
                      ),
                      onPressed: () {
                        setState(() {
                          _rate(index + 1);
                        });
                      },
                    );
                  }),
                ),
                SizedBox(height: 20),
                TextButton(
                  onPressed: _sendyulduzSoni,
                  child: Container(
                    width: 90,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xFFFFAD30),
                    ),
                    child: Center(
                      child: Text(
                        'Send',
                        style: TextStyle(fontSize: 30, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      );
    },
  );
}
