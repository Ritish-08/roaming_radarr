import 'package:flutter/material.dart';

const textInputDecoration = InputDecoration(

  labelStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.w400),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.white, width: 2),
  ),
  enabledBorder: UnderlineInputBorder(
    borderSide: BorderSide(color: Colors.black, width: 2),
  ),
  errorBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.black, width: 2),
  ),
);
