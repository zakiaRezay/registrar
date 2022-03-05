import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'auth.dart';
import 'googlebutton_state.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}
class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 16.0,
            right: 16.0,
            bottom: 20.0,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      flex: 1,
                      child: Image.asset(
                        'assets/images/covid.png',
                        height: 160,
                      ),
                    ),
                    SizedBox(height: 20),
                    const Text(
                      'Covid-19',
                      style: TextStyle(
                        color:Colors.yellow,
                        fontSize: 40,
                      ),
                    ),
                    const Text(
                      'Certification',
                      style: TextStyle(
                        color:Colors.orange,
                        fontSize: 40,
                      ),
                    ),
                  ],
                ),
              ),
              FutureBuilder(
                future: Authentication.signInWithGoogle(context: context),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    print("error"+snapshot.error.toString());
                    return const Text('Error initializing Firebase');
                  } else if (snapshot.connectionState == ConnectionState.done) {
                    return GoogleSignInButton();
                  }
                  return const CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                      Colors.orange,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
