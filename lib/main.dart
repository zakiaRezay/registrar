import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:registrar/constants/app_colors.dart';
import 'package:registrar/screens/register_screen.dart';


main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: AppColors.primaryColor,
          ),),
        home:    const RegistrarForm()//LoginScreen(),
    );
  }
}
