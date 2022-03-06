
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


Widget defaultTextFieldNumber(TextEditingController callback, String title,Widget widget) {
  return TextFormField(
    // inputFormatters: [
    //   FilteringTextInputFormatter.allow(RegExp(r"^(\d)"))
    // ],
    controller: callback,
    decoration: InputDecoration(
      border: const OutlineInputBorder(),
      filled: true,
      labelText: title,
      prefixIcon: widget,
      counterText: '',
      fillColor: Colors.transparent,
    ),
    // maxLength: length,
    keyboardType: TextInputType.number,
    validator: (value) {
      if (value == null) {
        return "Field can not be left empty";
      } else if (value.isEmpty) {
        return "Field can not be left empty";
      } else if (value.indexOf(' ')==0){
        return 'Can not contain whitespaces';
      }else {
        return null;
      }
    },
  );
}
Widget defaultTextField(TextEditingController callback, String title,Widget widget) {
  return TextFormField(
    // inputFormatters: [
    //   FilteringTextInputFormatter.allow(RegExp(r"^[0-9]{5}-[0-9]{7}-[0-9]{1}|\$"))
    // ],
    controller: callback,
    decoration: InputDecoration(
      border: const OutlineInputBorder(),
      filled: true,
      prefixIcon: widget,
      labelText: title,
      counterText: '',
      fillColor: Colors.transparent,
    ),
    // maxLength: length,
    keyboardType: TextInputType.name,
    validator: (value) {
      if (value == null) {
        return "Field can not be left empty";
      } else if (value.isEmpty) {
        return "Field can not be left empty";
      } else if (value.indexOf(' ')==0){
        return 'Can not contain whitespaces';
      }else {
        return null;
      }
    },
  );
}
Widget customTextDate(TextEditingController callback, String title,Widget widget) {
  return TextFormField(
    inputFormatters: [
      FilteringTextInputFormatter.allow(RegExp(r"[0-9]+|\S"))
    ],
    controller: callback,
    enableInteractiveSelection: false,
    enabled: false,
    decoration: InputDecoration(
      prefixIcon: widget,
      border: const OutlineInputBorder(),
      filled: true,
      labelText: title,
      counterText: '',
      fillColor: Colors.transparent,
    ),
    onTap: null,
    maxLines: 1,
    keyboardType: null,
    validator: (value) {
      if (value == null) {
        return "Field can not be left empty";
      } else if (value.isEmpty) {
        return "Field can not be left empty";
      } else if (value.indexOf(' ')==0){
        return 'Can not contain whitespaces';
      }else {
        return null;
      }
    },
  );
}
Widget defaultTextFieldEmail(TextEditingController callback, String title,Widget widget) {
  return TextFormField(
    // inputFormatters: [
    //   FilteringTextInputFormatter.allow(RegExp(r"^(\d)"))
    // ],
    controller: callback,
    decoration: InputDecoration(
      prefixIcon: widget,
      border: const OutlineInputBorder(),
      filled: true,
      labelText: title,
      counterText: '',
      fillColor: Colors.transparent,
    ),
    // maxLength: length,
    keyboardType: TextInputType.emailAddress,
    validator: (value) {
      if (value == null) {
        return "Field can not be left empty";
      } else if (value.isEmpty) {
        return "Field can not be left empty";
      } else if (value.indexOf(' ')==0){
        return 'Can not contain whitespaces';
      }else {
        return null;
      }
    },
  );
}
Widget defaultTextFieldPassword(TextEditingController callback, String title,Widget widget) {
  return TextFormField(
    // inputFormatters: [
    //   FilteringTextInputFormatter.allow(RegExp(r"^(\d)"))
    // ],
    controller: callback,
    decoration: InputDecoration(
      prefixIcon: widget,
      border: const OutlineInputBorder(),
      filled: true,
      labelText: title,
      counterText: '',
      fillColor: Colors.transparent,
    ),
    // maxLength: length,
    obscureText: true,
    keyboardType: TextInputType.emailAddress,
    validator: (value) {
      if (value == null) {
        return "Field can not be left empty";
      } else if (value.isEmpty) {
        return "Field can not be left empty";
      } else if (value.indexOf(' ')==0){
        return 'Can not contain whitespaces';
      }else {
        return null;
      }
    },
  );
}
