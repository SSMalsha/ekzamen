import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ekzamen/pages/addNote_page.dart';
import 'package:ekzamen/pages/viewNote_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class FilePage extends StatefulWidget {
  const FilePage({Key? key}) : super(key: key);

  @override
  State<FilePage> createState() => _FilePageState();
}

class _FilePageState extends State<FilePage> {

   CollectionReference ref = FirebaseFirestore.instance
      .collection('users')
      .doc(FirebaseAuth.instance.currentUser?.uid)
      .collection("notes");

  List<Color> myColors = [
    Color.fromARGB(255, 97, 36, 117),
    Color.fromARGB(255, 165, 42, 142),
    Color.fromARGB(255, 80, 86, 88),
    Color.fromARGB(255, 73, 134, 112),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => AddNote(),
            ),
          ).then((value) {
            print("Calling set state! ");
            setState(() {});
          });
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
          ),
          backgroundColor: Color.fromARGB(255, 57, 153, 227), 
      ),

      appBar: AppBar(
        title: Text(
          "Notes",

          style: TextStyle(
            fontSize: 25,
            fontFamily: "lato",
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 28, 100, 171),
            
          ),
         
        ),
        elevation: 0,
         backgroundColor: Colors.white,
      ),

      body: FutureBuilder<QuerySnapshot>(
        future: ref.get(),

        builder: (context, snapshot){
          if(snapshot.hasData){

            return ListView.builder(
              itemCount: snapshot.data!.docs.length, //snapshot.data.docs.length
              itemBuilder: (context, index){

                Random random = new Random();
                Color bg = myColors[random.nextInt(4)];
                Map data = snapshot.data!.docs[index].data() as Map;
                DateTime myDateTime = data['created'].toDate();
                //String formattedTime = DateTime;

                return InkWell(
                  onTap:() {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ViewNote(
                          data, 
                          data['created'].toDate(), 
                          snapshot.data!.docs[index].reference),
                      ),
                    ).then((value) {
                      setState(() {
                        
                      });
                    });
                  },
                  child: Card(
                    color: bg,
                
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        crossAxisAlignment:CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${data['title']}",
                            style: TextStyle(
                              fontSize: 22,
                              fontFamily: "lato",
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 247, 248, 249)
                            ),
                          ),
                
                          Container(
                            alignment: Alignment.centerRight,
                            child: Text(
                              myDateTime.toString(),
                              //DateFormat.yMMMd().add_jm().format(myDateTime),
                              style: TextStyle(
                                fontSize: 18,
                                fontFamily: "lato",
                                color: Color.fromARGB(255, 248, 249, 249)
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              }
            );
          }else{
            return Center(
              child: Text('Loading...'),
            );
          }
        }
      ), 

    );
  }
}
