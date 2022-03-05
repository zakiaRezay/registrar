import 'package:flutter/material.dart';

import '../../widgets/tcustom_text.dart';


class Confirmation extends StatefulWidget {
  const Confirmation({Key? key}) : super(key: key);

  @override
  _ConfirmationState createState() => _ConfirmationState();
}

class _ConfirmationState extends State<Confirmation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: customText("Confirmation",18,FontWeight.bold,Colors.white),centerTitle: true,),
        body: Container()
    );
  }
}



