import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final user = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Text('Signed in as : ' + user.email!),
          MaterialButton(onPressed: (){
            FirebaseAuth.instance.signOut();
          },
          color: Color.fromARGB(255, 201, 129, 126),
          child: Text('Sign Out'),
          )
        ],
        ),
        
      ),

      
      
    );
  }
}