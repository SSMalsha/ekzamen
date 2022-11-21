import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(

        children: [
          Container(
            width: w,
            height: h*0.3,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  "img/logout.jpg"
                ),
                fit:BoxFit.cover
              )
            ),
            
          ),
          Container(
            margin: const EdgeInsets.only(top: 20, left: 20, right: 20 ) , //margin text in a container
            width: w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                
                SizedBox(height: 50,),

                Container(
                  //margin: const EdgeInsets.only( left: 5, right: 5 ) ,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 10,
                        spreadRadius: 5,
                        offset: Offset(1, 1),
                        color: Color.fromARGB(255, 96, 162, 220).withOpacity(0.4)
                      )
                    ]
                   ) ,
                  child:TextField(
                  decoration: InputDecoration(
                    hintText:"Email",
                    prefixIcon: Icon(Icons.email, color: Color.fromARGB(255, 128, 140, 170),),
                    //focus
                    focusedBorder:OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(
                        color: Colors.white,
                        width: 1.0
                        )
                     ),

                     enabledBorder:OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(
                        color: Colors.white,
                        width: 1.0
                        )
                     ),

                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30)
                    )
                  ),
                ) ,
                ),
                
                SizedBox(height: 20,),

                Container(
                  //margin: const EdgeInsets.only( left: 10, right: 10 ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 10,
                        spreadRadius: 5,
                        offset: Offset(1, 1),
                        color: Color.fromARGB(255, 96, 162, 220).withOpacity(0.4)
                      )
                    ]
                   ) ,
                  child:TextField(
                  decoration: InputDecoration(
                    hintText:"Password",
                    prefixIcon: Icon(Icons.password, color: Color.fromARGB(255, 128, 140, 170),),
                    //focus
                    focusedBorder:OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(
                        color: Colors.white,
                        width: 1.0
                        )
                     ),

                     enabledBorder:OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(
                        color: Colors.white,
                        width: 1.0
                        )
                     ),

                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30)
                    )
                  ),
                ) ,
                ),

                SizedBox(height: 20,),
                /*Row(
                  children: [
                    Expanded(child: Container(),),
                    Text(
                  "Forgot your Password?",
                  style: TextStyle(
                    fontSize: 18,
                    color: Color.fromARGB(255, 150, 171, 224)
                  ),
                ),
                  ],
                ),
                */
                
              ],
            ),
          ),

          SizedBox(height: 50,),
          Container(
            width: w*0.5,
            height: h*0.06, //h*0.08
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              image: DecorationImage(
                image: AssetImage(
                  "img/loginButton.jpg"
                ),
                fit:BoxFit.cover
              )
            ),

            child:Center(
              child: Text(
              "Sign up",
                  style: TextStyle(
                    fontSize: 22,
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontWeight: FontWeight.bold
                  ),
            ),
            ),
            
          ),
          
          /*SizedBox(height: w*0.2,),
          RichText(text: TextSpan(
            text: "Don't have an account?",
            style: TextStyle(
              color: Colors.grey[500],
              fontSize: 18
            ),
            children: [
              TextSpan(
              text: " Create",
              style: TextStyle(
                color: Color.fromARGB(255, 75, 100, 197),
                fontSize: 18,
                fontWeight: FontWeight.bold
            )
            )
            ]
          ) 
          )*/
      ],
      ),

    ); 
  }
}