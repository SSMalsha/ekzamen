import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class RegisterPage extends StatefulWidget {
  final VoidCallback showLoginPage;
  const RegisterPage({Key? key, required this.showLoginPage}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  //text controllers
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmpasswordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmpasswordController.dispose();
    super.dispose();
  }

  Future signUp() async{
    if(passwordConfirmed()){
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: _emailController.text.trim(), 
      password: _passwordController.text.trim()
      );
    }  
  }

  bool passwordConfirmed(){
    if(_passwordController.text.trim() == _confirmpasswordController.text.trim()){
      return true;
    }
    else{
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
      
          children: [
            Container(
              width: w,
              height: h*0.3,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    "img/edu1.jpg"
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
      
                  Text(
                    "HELLO THERE",
                    style: TextStyle(
                      fontSize: 36,
                      color: Color.fromARGB(255, 27, 55, 133),
                      fontWeight: FontWeight.bold
                    ),
                  ),

                  SizedBox(height: 10,),
      
                  Text(
                    "Register below with your details",
                    style: TextStyle(
                      fontSize: 18,
                      color: Color.fromARGB(255, 101, 99, 99)
                    ),
                  ),
      
                  SizedBox(height: 30,),
//email text field      
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
                      controller: _emailController,
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
//password text field      
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
                      obscureText: true,
                      controller: _passwordController,
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
//Confirm password text field
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
                      obscureText: true,
                      controller: _confirmpasswordController,
                      decoration: InputDecoration(
                        hintText:"Confirm Password",
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
                  
                  
                ],
              ),
            ),
      
            SizedBox(height: 40,),
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
      
              child:GestureDetector(
                onTap:signUp,
                child: Center(
                  child: Text(
                  "Sign Up",
                      style: TextStyle(
                        fontSize: 22,
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontWeight: FontWeight.bold
                      ),
                ),
                ),
              ),
              
            ),
            
            SizedBox(height: w*0.1,),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "I am a member! ",
                  style: TextStyle(
                  color: Colors.grey[500],
                  fontSize: 18
                ),
                ),

                GestureDetector(
                  onTap: widget.showLoginPage,
                  child: Text(
                    "Login now",
                    style: TextStyle(
                    color: Color.fromARGB(255, 77, 100, 193),
                    fontSize: 18,
                    fontWeight: FontWeight.bold
                )

                  ),
                )
              ],
            ),

        ],
        ),
      )

    );
  }
}