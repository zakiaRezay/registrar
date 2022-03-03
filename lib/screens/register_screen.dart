import 'package:flutter/material.dart';
import 'package:registrar/widgets/tcustom_text.dart';
import 'package:registrar/widgets/text_field.dart';

import '../submition/confirmation.dart';

class RegistrarForm extends StatefulWidget {
  const RegistrarForm({Key? key}) : super(key: key);

  @override
  _RegistrarFormState createState() => _RegistrarFormState();
}

class _RegistrarFormState extends State<RegistrarForm> {
  final int newCnicPassport = 0;
  final int prvCnicPassport = 0;
  final int vaccinDose = 0;
  final int FirstDose = 0;
  final int SecondDose = 0;
  var getVaccinated = 0;
  String? value;
  var dropDownValue = "1";
  var _selectedDate, _selectedMonth, _selectedYear;
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

  final dateKey = GlobalKey<FormState>();
  final cnicKey = GlobalKey<FormState>();
  final nameKey = GlobalKey<FormState>();
  final phoneKey = GlobalKey<FormState>();
  final addressKey = GlobalKey<FormState>();
  final vaccineKey = GlobalKey<FormState>();
  final TextEditingController cnicPassportEditingController = TextEditingController();
  final TextEditingController nameEditingController = TextEditingController();
  final TextEditingController phoneEditingController = TextEditingController();
  final TextEditingController dateEditingController = TextEditingController();
  final TextEditingController addressEditingController = TextEditingController();
  final TextEditingController vaccineEditingController = TextEditingController();
  late String _selectedGender = 'male';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:[
              Form(
                  key: cnicKey,
                  child: defaultTextFieldNumber(cnicPassportEditingController, 'Enter CNIC')),
              const SizedBox(height: 15,),
              Form(
                  key: nameKey,
                  child: defaultTextField(nameEditingController, 'Enter Patient Name')),
              const SizedBox(height: 15,),
              Form(
                  key: phoneKey,
                  child: defaultTextFieldNumber(phoneEditingController, 'Enter Number')),
              const SizedBox(height: 15,),
              Form(
              key: dateKey,
              child: InkWell(
                  onTap: () {
                    _showDatePicker();
                  },
                  child:
                      customTextDate(dateEditingController, 'Date of Birth')),
            ),
              const SizedBox(height: 15,),
              Form(
                  key: addressKey,
                  child: defaultTextField(addressEditingController, 'Add Address')),
              const SizedBox(height: 15,),
              Form(
                  key: vaccineKey,
                  child: defaultTextField(vaccineEditingController, 'Vaccine Type')),
          SizedBox(
            height: 80,
            child:  Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(10)
                ),

                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: dropDownValue,
                      isExpanded: true,
                      items: <String>['1', '2',].map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Padding(
                              padding: const EdgeInsets.all(5),
                              child: Text(value)),
                        );
                      }).toList(),
                      iconSize: 30,
                      onChanged: (String? val) {
                        setState(() {
                          dropDownValue = val!;
                        });
                      },
                    ),
                  ),
                ),
              ),
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

              ElevatedButton(
                  child: customText('Save', 15, FontWeight.normal, Colors.white),
                  onPressed: () {
                    if(cnicKey.currentState!.validate()){
                      if(nameKey.currentState!.validate()){
                        if(phoneKey.currentState!.validate()){
                          if(dateKey.currentState!.validate()){
                            if(addressKey.currentState!.validate()){
                              if(vaccineKey.currentState!.validate()){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => const Confirmation()));
                              }
                            }
                          }
                        }
                      }
                    }
                  })
            ],
          ),
        ),
    );
  }
  Future<void> _showDatePicker() async {
    final DateTime? result =
    await showDatePicker(context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2010),
        lastDate: DateTime(2050));
    if (result != null) {
      setState(() {
        _selectedDate = result.day;
        _selectedMonth = result.month;
        _selectedYear = result.year;
        dateEditingController.text =
        "${_selectedYear!.toString()}-${_selectedMonth!
            .toString()}-${_selectedDate!.toString()} ";
      });
    }
  }
}

class Gender {
  String name;
  IconData icon;
  bool isSelected;

  Gender(this.name, this.icon, this.isSelected);
}