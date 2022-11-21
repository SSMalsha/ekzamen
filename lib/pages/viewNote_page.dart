import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ViewNote extends StatefulWidget {
  //const ViewNote({Key? key}) : super(key: key);

  final Map data;
  final DateTime time;
  final DocumentReference ref;

  ViewNote(this.data, this.time, this.ref);

  @override
  State<ViewNote> createState() => _ViewNoteState();
}

class _ViewNoteState extends State<ViewNote> {

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
                      onPressed: delete,
                      child: Icon(
                        Icons.delete_forever_outlined,
                        size: 24,
                      ),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          Color.fromARGB(255, 241, 108, 108),
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

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${widget.data['title']}",
                      style: TextStyle(
                        fontSize: 30,
                        fontFamily: "lato",
                        fontWeight: FontWeight.bold,
                        color: Colors.blueGrey
                      ),
                      
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top:12, bottom:12 ),
                      child: Text(
                        "${widget.data['created'].toDate()}",
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: "lato",
                          color: Colors.blueGrey
                        ),
                        
                      ),
                    ),
//description        
                    Container(
                      height: MediaQuery.of(context).size.height*0.75,
                      alignment: Alignment.topLeft,
                      child: Text(
                        "${widget.data['description']}",
                        style: TextStyle(
                          fontSize: 22,
                          fontFamily: "lato",
                          color: Colors.blueGrey
                        ),
                      ) 
                    ), 
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void delete() async {
    //delete from db
    await widget.ref.delete();

    Navigator.pop(context);
  }
}