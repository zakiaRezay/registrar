import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:registrar/constants/app_colors.dart';
import 'package:registrar/screens/home_screen.dart';
import 'package:registrar/screens/register_screen.dart';
import 'package:registrar/widgets/snackbar_widget.dart';
import 'package:registrar/widgets/tcustom_text.dart';
import 'package:registrar/widgets/text_field.dart';

class EmailLogin extends StatefulWidget {
  const EmailLogin({Key? key}) : super(key: key);

  @override
  _EmailLoginState createState() => _EmailLoginState();
}

class _EmailLoginState extends State<EmailLogin> {
  final GlobalKey<FormState> emailLoginKey = GlobalKey<FormState>();
  final GlobalKey<FormState> passLoginKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool _success =false,isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login"),centerTitle: true,),
      body: Form(
        key: emailLoginKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('assets/images/covid.png',height: 150,width: 150,),
              customText('Corona Certification', 25, FontWeight.bold, AppColors.primaryColorDark),
              const SizedBox(height: 15,),
              Form(child: defaultTextFieldEmail(_emailController, 'Enter Email', Icon(Icons.mail))),
              const SizedBox(height: 15,),
              Form(key: passLoginKey,child: defaultTextFieldPassword(_passwordController, 'Enter Password', Icon(Icons.lock))),
              Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                  onPressed: () async {

                    if(passLoginKey.currentState!.validate()){
                      FocusScope.of(context).requestFocus( FocusNode());
                      setState(() {
                        isLoading = true;
                      });
                      await signInWithEmailAndPassword();
                      _success == true
                          ? Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const HomePage()))
                          : defaultSnackBar('Login Failed', context);
                    }

                  },
                  child: const Text('Submit'),
                ),
              ),
              isLoading == true ? CircularProgressIndicator() : SizedBox(height: 30,)
            ],
          ),
        ),
      ),
    );
  }


   signInWithEmailAndPassword() async {

    try{
      final User? user = (await _auth.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      )).user;
      if (user != null) {
        setState(() {
          _success = true;
          isLoading == false;
        });
      } 
      else {
        setState(() {
          _success = false;
          isLoading == false;
        });
      }
    }catch(e){
      defaultSnackBar(e.toString().substring(e.toString().lastIndexOf("] ")+1), context);
    }


  }
}