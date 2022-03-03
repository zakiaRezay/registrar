
import 'package:flutter/material.dart';
import 'package:registrar/submition/confirmation.dart';


void main() {
  runApp(const MyApp());
}


final int newCnicPassport=0;
final int prvCnicPassport=0;
final int vaccinDose=0;
final int FirstDose=0;
final int SecondDose=0;
 var getVaccinated= 0;

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    final appTitle='Registration Form';
  return MaterialApp(
    title: appTitle,
    home: Scaffold(
      appBar: AppBar(
        title: Text(appTitle),
      ),
      body: RegistrarForm(),
    ),
  );
  }
}

class RegistrarForm extends StatefulWidget {
  const RegistrarForm({Key? key}) : super(key: key);

  @override
  _RegistrarFormState createState() => _RegistrarFormState();
}

class _RegistrarFormState extends State<RegistrarForm> {
String? value;
  // void validateMobile(String value) {
  //   String patttern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
  //   RegExp regExp = new RegExp(patttern);
  //   if (value.length == 0) {
  //     print; 'Please enter mobile number';
  //   }
  //   else if (!regExp.hasMatch(value)) {
  //     print; 'Please enter valid mobile number';
  //   }
  //   nullptr;
  // }

  final _formKey=GlobalKey<FormState>();
  final CnicPassportEditingController = TextEditingController();
 late String _selectedGender = 'male';


  @override
  Widget build(BuildContext context) {

    return Form(
      key: _formKey,

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            onChanged: (String _value){
              bool _IsValidCNIC(String CnicPassport)
              {
                RegExp check = new RegExp("^[0-9]{5}-[0-9]{7}-[0-9]{1}");
                bool valid = false;
                valid = check.hasMatch(CnicPassport);
                return valid;
              }

              if(_value!=null){
                setState(() {
                  if(newCnicPassport==prvCnicPassport &&vaccinDose==FirstDose ){
                    print('Sorry! You already got your first Dose');
                  }else if(newCnicPassport==prvCnicPassport &&vaccinDose==SecondDose){
                    getVaccinated=newCnicPassport;

                    print('Successfuly completed your vaccination');
                  }
                  else if(newCnicPassport==getVaccinated){

                    print('Sorry! you have vaccinated');
                  }
                });
              }
            },
            decoration: const InputDecoration(
              icon:const Icon(Icons.perm_identity),
              hintText: 'Enter CNIC/PASSPORT',
              labelText: 'CNIC/Passport',

            ),
          ),
          TextFormField(
            decoration: const InputDecoration(
              icon: Icon(Icons.person),
              hintText: 'Enter Patient Name',
              labelText: 'Name',

            ),
          ),
          TextFormField(

            decoration: const InputDecoration(
              icon: Icon(Icons.phone),
              hintText: 'Patent Telephone Number',
              labelText: 'Telephone',

            ),
          ),
          TextFormField(
            decoration: const InputDecoration(
              icon: Icon(Icons.calendar_today),
              hintText: 'Patient Date Of Birth',
              labelText: 'Dob',
            ),
          ),
          TextFormField(
            decoration: const InputDecoration(
              icon: Icon(Icons.location_city),
              hintText: 'Resident Address',
              labelText: 'Address',
            ),
          ),
          TextFormField(
            decoration: const InputDecoration(
              icon: Icon(Icons.coronavirus),
              hintText: 'Vaccin Type',
              labelText: 'Vaccin Type',
            ),
          ),
          ListTile(
    leading: Radio<String>(
    value: 'male',
    groupValue: _selectedGender,
    onChanged: (value) {
    setState(() {
    _selectedGender = value!;
    });
    },
    ),
    title: const Text('Male'),
    ),
    ListTile(
    leading: Radio<String>(
    value: 'female',
    groupValue: _selectedGender,
    onChanged: (value) {
    setState(() {
    _selectedGender = value!;
    });
    },
    ),
    title: const Text('Female'),
    ),
    const SizedBox(height: 25),

          Container(

            child:  RaisedButton(
                child: const Text('Save',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 20, color: Colors.redAccent, fontWeight: FontWeight.bold),
                ),

                onPressed: (){
                  Navigator.push(
                  context, MaterialPageRoute(
                  builder:(context)=>confirmation(value:value),
                  )
                  );
                }),
          )
        ],
      ),
    );
  }
}
class Gender {
  String name;
  IconData icon;
  bool isSelected;

  Gender(this.name, this.icon, this.isSelected);
}