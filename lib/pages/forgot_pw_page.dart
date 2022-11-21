import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ForgotPasswordpage extends StatefulWidget {
  const ForgotPasswordpage({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordpage> createState() => _ForgotPasswordpageState();
}

class _ForgotPasswordpageState extends State<ForgotPasswordpage> {

  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  Future passwordReset() async {
    try{
      await FirebaseAuth.instance.sendPasswordResetEmail(
      email: _emailController.text.trim()
    );
    showDialog(context: context, builder: (context){
        return AlertDialog(
          content: Text('Password reset link sent! check your email.'),
        );
      });
    }on FirebaseAuthException catch (e){
      print(e);
      showDialog(context: context, builder: (context){
        return AlertDialog(
          content: Text(e.message.toString()),
        );
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 117, 202, 245),
        elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Container(
              width: 120,
              height: 150,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    "img/forgot1.png"
                  ),
                  fit:BoxFit.cover
                )
              ),
            ),

            SizedBox(height: 20,),

          Text(
            "Enter your email and we will send you a password reset link",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              color: Color.fromARGB(255, 22, 23, 28),
            ),
            ),

            SizedBox(height: 15,),


//email
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
                      controller: _emailController,
                    decoration: InputDecoration(
                      hintText:"Email",
                      prefixIcon: Icon(Icons.email, color: Color.fromARGB(255, 128, 140, 170),),
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
            onPressed: passwordReset,
            child: Text("Reset Password"),
            color: Color.fromARGB(255, 88, 139, 233).withOpacity(0.4),
          ),

        ],
      ),
    );
  }
}