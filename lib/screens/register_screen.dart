import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:registrar/constants/app_colors.dart';
import 'package:registrar/screens/submission/confirmation.dart';
import 'package:registrar/widgets/tcustom_text.dart';
import 'package:registrar/widgets/text_field.dart';


class RegistrarForm extends StatefulWidget {
  const RegistrarForm({Key? key}) : super(key: key);

  @override
  _RegistrarFormState createState() => _RegistrarFormState();
}

class _RegistrarFormState extends State<RegistrarForm> {

  String? value;
  var dropDownValue = "1";
  var _selectedDate, _selectedMonth, _selectedYear;
  final dateKey = GlobalKey<FormState>();
  final cnicKey = GlobalKey<FormState>();
  final nameKey = GlobalKey<FormState>();
  final phoneKey = GlobalKey<FormState>();
  final addressKey = GlobalKey<FormState>();
  final emailKey = GlobalKey<FormState>();
  final vaccineKey = GlobalKey<FormState>();
  final TextEditingController cnicPassportEditingController = TextEditingController();
  final TextEditingController nameEditingController = TextEditingController();
  final TextEditingController phoneEditingController = TextEditingController();
  final TextEditingController dateEditingController = TextEditingController();
  final TextEditingController addressEditingController = TextEditingController();
  final TextEditingController vaccineEditingController = TextEditingController();
  final TextEditingController emailEditingController = TextEditingController();
  late String _selectedGender = 'male';


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double width =  size.width;
    double height = size.height;
    return Scaffold(
      appBar: AppBar(title: customText("Add Patient Details",18,FontWeight.bold,Colors.white),centerTitle: true,),
        body: Stack(
          children: [
            Positioned.fill(child: Container(
                decoration: BoxDecoration(color: Colors.white.withOpacity(0.5),
                    image: DecorationImage(
              colorFilter:  ColorFilter.mode(Colors.white.withOpacity(0.2), BlendMode.dstATop),
              image: const AssetImage("assets/images/covid.png")
            )))),
            Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:[
                  const SizedBox(height: 10,),
                  Form(
                      key: cnicKey,
                      child: defaultTextFieldNumber(cnicPassportEditingController, 'Enter CNIC',const Icon(Icons.credit_card))),
                  const SizedBox(height: 15,),
                  Form(
                      key: nameKey,
                      child: defaultTextField(nameEditingController, 'Enter Patient Name',const Icon(Icons.person))),
                  const SizedBox(height: 15,),
                  IntlPhoneField(
                    decoration: const InputDecoration(
                      labelText: 'Phone Number',
                      counterText: "",
                      border: OutlineInputBorder(
                        borderSide: BorderSide(),
                      ),
                    ),
                    initialCountryCode: 'PK',
                    onChanged: (phone) {
                      // print(phone.completeNumber);
                    },
                  ),

                  const SizedBox(height: 10,),
                  Form(
                      key: emailKey,
                      child: defaultTextFieldEmail(emailEditingController, 'Enter Email',const Icon(Icons.email))),
                  const SizedBox(height: 15,),
                  Form(
                  key: dateKey,
                  child: InkWell(
                      onTap: () {
                        _showDatePicker();
                      },
                      child:
                          customTextDate(dateEditingController, 'Date of Birth',const Icon(Icons.calendar_today_sharp))),
                ),
                  const SizedBox(height: 15,),
                  Form(
                      key: addressKey,
                      child: defaultTextField(addressEditingController, 'Add Address',const Icon(Icons.dehaze_outlined))),
                  const SizedBox(height: 15,),
                  Form(
                      key: vaccineKey,
                      child: defaultTextField(vaccineEditingController, 'Vaccine Type',const ImageIcon(AssetImage("assets/images/covid.png")))),
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
                contentPadding: EdgeInsets.zero,
                    leading: Radio<String>(
                      value: 'male',
                      activeColor: AppColors.primaryColor,
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
                    contentPadding: EdgeInsets.zero,
                    leading: Radio<String>(
                      activeColor: AppColors.primaryColor,
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
                  const SizedBox(height: 10),

                  SizedBox(
                    width: width,
                    child: ElevatedButton(
                        child: customText('Save', 15, FontWeight.normal, Colors.white),
                        onPressed: () {
                          // if(cnicKey.currentState!.validate()){
                          //   if(nameKey.currentState!.validate()){
                          //     if(phoneKey.currentState!.validate()){
                          //       if(dateKey.currentState!.validate()){
                          //         if(addressKey.currentState!.validate()){
                          //           if(vaccineKey.currentState!.validate()){
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => const Confirmation()));
                          //           }
                          //         }
                          //       }
                          //     }
                          //   }
                          // }
                        }),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          )],
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