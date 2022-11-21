import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class AddNote extends StatefulWidget {
  const AddNote({Key? key}) : super(key: key);

  @override
  State<AddNote> createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {

  late String title;
  late String des;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(12),
            child: Column(
              children: [
                
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: (){
                        Navigator.of(context).pop();
                      }, 
                      child: Icon(
                        Icons.arrow_back_ios_new_outlined,
                        size: 24,
                      ),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 92, 149, 247),),
                        padding: MaterialStateProperty.all(EdgeInsets.symmetric(
                          horizontal: 25,
                          vertical: 8,
                        )),
                      ),
                    ),

                    ElevatedButton(
                      onPressed: add,
                      child: Text(
                        "Save",
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: "lato",
                          color: Colors.white
                        ),
                      ), 
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          Color.fromARGB(255, 92, 149, 247),
                        ),
                        padding: MaterialStateProperty.all(EdgeInsets.symmetric(
                          horizontal: 25,
                          vertical: 8,
                        )),
                      ),

                    ),

                  ]
                ),

                SizedBox(height: 12,),

                Form(
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration.collapsed(
                          hintText: "Title"
                        ),
                        style: TextStyle(
                          fontSize: 30,
                          fontFamily: "lato",
                          fontWeight: FontWeight.bold,
                          color: Colors.blueGrey
                        ),
                        onChanged: (_val){
                          title = _val;
                        },
                      ),
//description        
                      Container(
                        height: MediaQuery.of(context).size.height*0.75,
                        padding: const EdgeInsets.only(top: 15),
                        child: TextFormField(
                          decoration: InputDecoration.collapsed(
                            hintText: "Note description", 
                          ),
                          style: TextStyle(
                            fontSize: 22,
                            fontFamily: "lato",
                            color: Colors.blueGrey
                          ),
                          onChanged: (_val){
                            des = _val;
                          },
                          maxLines: 20,
                        ),
                      ), 
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void add() async {
    //save to db
    CollectionReference ref = FirebaseFirestore.instance
      .collection('users')
      .doc(FirebaseAuth.instance.currentUser?.uid)
      .collection("notes");

    var data = {
      'title' : title,
      'description' : des,
      'created' : DateTime.now(),
    };

    ref.add(data);

    Navigator.pop(context);
  }
}