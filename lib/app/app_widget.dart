import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qualyfine/app/modules/categorias/categorias_page.dart';
import 'package:qualyfine/app/modules/home/home_module.dart';
import 'package:qualyfine/app/modules/home/home_page.dart';
import 'package:qualyfine/app/modules/logon/logon_bloc.dart';
import 'package:qualyfine/app/modules/logon/logon_page.dart';
import 'package:qualyfine/app/utils/routes.dart';


class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     routes: {
        Routes.home: (context) => HomePage(),
        Routes.categorias: (context) => CategoriasPage(),
       
      },
   title: 'Flutter Slidy',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: StreamBuilder<Object>(
          stream: FirebaseAuth.instance.onAuthStateChanged,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.active) {
              FirebaseUser user = snapshot.data;

              if (user == null) {
                return LogonPage();
              }

              return HomeModule();
            } else {
              return Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }
          }),
    );
  }
}
