import 'package:asomiddin_imtixon/kerakli/link_olish.dart';
import 'package:asomiddin_imtixon/kerakli/yulduz.dart';
import 'package:asomiddin_imtixon/pages/homePage5.dart';
import 'package:flutter/material.dart';

class PopupMenu extends StatelessWidget {
  final BuildContext parentContext;

  PopupMenu({required this.parentContext});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      icon: Icon(
        Icons.more_horiz_outlined,
        size: 40,
      ),
      onSelected: (String value) {
        if (value == "share") {
          yuborish(parentContext);
        } else if (value == "rate") {
          baxolash(parentContext);
        } else if (value == "unsave") {
          Navigator.push(
            parentContext,
            MaterialPageRoute(builder: (context) => HomePage5()),
          );
        }
      },
      itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
        PopupMenuItem<String>(
          value: 'share',
          child: ListTile(
            leading: Image.asset("assets/icon/yubor.png"),
            title: Text(
              'Share',
              style: TextStyle(fontSize: 20),
            ),
          ),
        ),
        const PopupMenuItem<String>(
          value: 'rate',
          child: ListTile(
            leading: Icon(
              Icons.star,
              color: Colors.black,
              size: 40,
            ),
            title: Text(
              'Rate Recipe',
              style: TextStyle(fontSize: 20),
            ),
          ),
        ),
        PopupMenuItem<String>(
          value: 'review',
          child: ListTile(
            leading: Image.asset("assets/icon/chat.png"),
            title: Text('Review', style: TextStyle(fontSize: 20)),
          ),
        ),
        const PopupMenuItem<String>(
          value: 'unsave',
          child: ListTile(
            leading: Icon(
              Icons.bookmark_remove,
              size: 40,
              color: Colors.black,
            ),
            title: Text('Unsave', style: TextStyle(fontSize: 20)),
          ),
        ),
      ],
    );
  }
}
