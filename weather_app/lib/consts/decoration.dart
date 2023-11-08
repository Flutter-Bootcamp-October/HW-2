import 'package:flutter/material.dart';

const InputDecoration searchBarDec = InputDecoration(
    fillColor: Colors.white,
    filled: true,
    prefixIcon: Icon(Icons.search),
    border:
        OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
    hintText: "Enter City Name");
