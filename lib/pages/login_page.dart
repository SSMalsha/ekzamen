import 'package:ekzamen/auth/main_page.dart';
import 'package:ekzamen/pages/forgot_pw_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class LoginPage extends StatefulWidget {
  final VoidCallback showRegisterPage;
  const LoginPage({Key? key, required this.showRegisterPage}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  //text controllers
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  Future signIn() async{
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: _emailController.text.trim(), 
      password: _passwordController.text.trim(),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
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
                    "img/login.jpg"
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
                    "Welcome to ekzamen",
                    style: TextStyle(
                      fontSize: 36,
                      color: Color.fromARGB(255, 27, 55, 133),
                      fontWeight: FontWeight.bold
                    ),
                  ),
      
                  Text(
                    "Sign into your account",
                    style: TextStyle(
                      fontSize: 18,
                      color: Color.fromARGB(255, 145, 144, 144)
                    ),
                  ),
      
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
      //email text field
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
      //password text field
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
//Forgot password        
                  Row(
                    children: [
                      Expanded(child: Container(),),
                      GestureDetector(
                        onTap: (() {
                          Navigator.push(context, MaterialPageRoute(builder: (context){
                            return ForgotPasswordpage();
                          },
                        ),);
                        }),
                        child: Text(
                          "Forgot your Password?",
                          style: TextStyle(
                            fontSize: 18,
                            color: Color.fromARGB(255, 104, 138, 223)
                          ),
                        ),
                      ),
                    ],
                  ),
                  
                  
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
      
              child:GestureDetector(
                onTap:signIn,
                child: Center(
                  child: Text(
                  "Sign in",
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
                  "Don't have an account?",
                  style: TextStyle(
                  color: Colors.grey[500],
                  fontSize: 18
                ),
                ),

                GestureDetector(
                  onTap: widget.showRegisterPage,
                  child: Text(
                    "Create",
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