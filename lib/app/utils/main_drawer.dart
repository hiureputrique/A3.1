
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qualyfine/app/utils/routes.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          _addDrwerItem(Icons.home,
           'home',
            () => Navigator.pushReplacementNamed(context, Routes.home)
          ),
            _addDrwerItem(Icons.work,
           'Categorias',
            () => Navigator.pushReplacementNamed(context, Routes.categorias),
            ),
            _addDrwerItem(Icons.art_track,
           'Page2',
            null,
            ),
      ],
     ), 
    );
  }
}


  Widget _addDrwerItem(_icon, _text, _onTap) {
    return ListTile(
      title: Row(
        children: <Widget>[
          Icon(_icon),
          Padding(
            padding: EdgeInsets.only(left:8),
            child: Text(_text),
        ),
      ],
    ),
    onTap:_onTap ,
          );
  }
