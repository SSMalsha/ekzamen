import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class MapPage extends StatelessWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Column(
        
          children:[
            Container(
              width: w,
              height: h*0.3,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    "img/map.jpg"
                  ),
                  fit:BoxFit.cover
                )
              ),
            ),

            SizedBox(height: 70,),

            Text(
            "Enter your EXAM Hall Location and we will show the shortest way to go",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              color: Color.fromARGB(255, 22, 23, 28),
            ),
            ),

            SizedBox(height: 15,),

            Container(
                    margin: const EdgeInsets.only( left: 15, right: 15 ) ,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 10,
                          spreadRadius: 5,
                          offset: Offset(1, 1),
                          color: Color.fromARGB(255, 111, 181, 243).withOpacity(0.4)
                        )
                      ]
                     ) ,
      
                    child:TextField(
                    decoration: InputDecoration(
                      hintText:"Location",
                      prefixIcon: Icon(Icons.location_searching, color: Color.fromARGB(255, 128, 140, 170),),
                      //focus
                      focusedBorder:OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(
                          color: Colors.white,
                          width: 1.0
                          )
                       ),
      
                       enabledBorder:OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(
                          color: Colors.white,
                          width: 1.0
                          )
                       ),
      
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)
                      )
                    ),
                  ) ,
          ),

          SizedBox(height: 15,),

          MaterialButton(
            child: Text("Let's Go"),
            color: Color.fromARGB(255, 88, 139, 233).withOpacity(0.4), onPressed: () {  },
          ),
          ]
          
        ),
      
      );
    
  }
}