import 'package:ekzamen/auth/auth_page.dart';
import 'package:ekzamen/pages/home_page.dart';
import 'package:ekzamen/pages/nav_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar:AppBar(title: Text("Home Page"),),
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if(snapshot.hasData){
            return NavPage();
          }
          else{
            return AuthPage();
          }
        },

      ),

    );
  }
}