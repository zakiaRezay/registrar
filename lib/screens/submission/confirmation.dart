import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:registrar/constants/app_colors.dart';
import 'package:registrar/screens/details_screen.dart';
import 'package:registrar/screens/register_screen.dart';
import 'package:registrar/widgets/snackbar_widget.dart';

import '../../widgets/tcustom_text.dart';


class Confirmation extends StatefulWidget {
  String name = '',cnic = '',number = '',dob='',address='',vt ='',gender = '',dose= '';
   Confirmation({Key? key,required this.name,required this.cnic,required this.number,
     required this.dob,required this.address,required this.vt,required this.gender,required this.dose

   }) : super(key: key);

  @override
  _ConfirmationState createState() => _ConfirmationState();
}

class _ConfirmationState extends State<Confirmation> {
  @override
  Widget build(BuildContext context) {
    CollectionReference uploadPatientInfo = FirebaseFirestore.instance.collection('patientDetails');
    return Scaffold(
        appBar: AppBar(title: customText("Confirmation",18,FontWeight.bold,Colors.white),centerTitle: true,),
        body: Stack(
          children: [
            Positioned.fill(
                child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.5),
                        image: DecorationImage(
                            colorFilter: ColorFilter.mode(
                                Colors.white.withOpacity(0.2), BlendMode.dstATop),
                            image:
                            const AssetImage("assets/images/covid.png"))))),
            Padding(
              padding: const EdgeInsets.all(10),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const SizedBox(height: 50,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                      customText('CNIC:', 20, FontWeight.bold, AppColors.primaryColor),
                      customText(widget.cnic, 20, FontWeight.normal, AppColors.primaryColor),
                    ],),
                    const SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                      customText('Patient Name:', 20, FontWeight.bold, AppColors.primaryColor),
                      customText(widget.name, 20, FontWeight.normal, AppColors.primaryColor),
                    ],),
                    const SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                      customText('Contact:', 20, FontWeight.bold, AppColors.primaryColor),
                      customText(widget.number, 20, FontWeight.normal, AppColors.primaryColor),
                    ],),
                    const SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                      customText('DOB:', 20, FontWeight.bold, AppColors.primaryColor),
                      customText(widget.dob, 20, FontWeight.normal, AppColors.primaryColor),
                    ],),
                    const SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                      customText('Address:', 20, FontWeight.bold, AppColors.primaryColor),
                      customText(widget.address, 20, FontWeight.normal, AppColors.primaryColor),
                    ],),
                    const SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                      customText('Vaccine Type:', 20, FontWeight.bold, AppColors.primaryColor),
                      customText(widget.vt, 20, FontWeight.normal, AppColors.primaryColor),
                    ],),
                    const SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                      customText('Vaccine Dose:', 20, FontWeight.bold, AppColors.primaryColor),
                      customText(widget.dose, 20, FontWeight.normal, AppColors.primaryColor),
                    ],),
                    const SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                      customText('Gender:', 20, FontWeight.bold, AppColors.primaryColor),
                      customText(widget.gender, 18, FontWeight.normal, AppColors.primaryColor),
                    ],),
                    const SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ElevatedButton(onPressed: () {
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>  RegistrarForm()));

                        },
                          child: customText('Cancel',12,FontWeight.normal,Colors.white),),
                        ElevatedButton(onPressed: () {
                          try{
                          uploadPatientInfo.add({
                            'cnic':widget.cnic,
                            'patientName':widget.name,
                            'phone':widget.number,
                            'dob':widget.dob,
                            'address': widget.address,
                            'vaccineType' : widget.vt,
                            'dose': widget.dose,
                            'gender': widget.gender
                          });
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>  RegisteredPatient()));

                          } catch(e){
                            defaultSnackBar(e.toString(), context);
                          }
                        },
                        child:  customText('Confirm',12,FontWeight.normal,Colors.white),),

                      ],
                    )
                  ],
                ),
              ))],
        )
    );
  }
}



