import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:registrar/constants/app_colors.dart';
import 'package:registrar/screens/details_screen.dart';
import 'package:registrar/screens/register_screen.dart';
import 'package:registrar/widgets/tcustom_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double width = size.width;
    double height = size.height;
    return Scaffold(
      appBar: AppBar(title: Text('Dashoard'),centerTitle: true),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            InkWell(
              onTap: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>  const RegistrarForm()));
              },
              child: Container(
                width: width * 0.4,
                height: height * 0.2,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: AppColors.primaryColor,width: 2)
                ),
                child:  Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset('assets/images/covid.png'),
                      customText('Add New Patient', 15, FontWeight.bold, AppColors.primaryColor)
                    ],
                  ),
              ),
            ),
            InkWell(
              onTap: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>  const RegisteredPatient()));
              },
              child: Container(
                width: width * 0.4,
                height: height * 0.2,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: AppColors.primaryColor,width: 2),
                ),
                child:  Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/details.png'),
                    customText('Registered Patients', 15, FontWeight.bold, AppColors.primaryColor)
                  ],
                ),
              ),
            ),
          ],),
        ),
      ),
    );
  }
}
