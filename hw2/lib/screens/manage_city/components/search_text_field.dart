import 'package:flutter/material.dart';
import 'package:hw2/data/colors.dart';
import 'package:hw2/extentions/size_extention.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({
    super.key,
    required this.controller,
    required this.isEnabled,
    this.onChangedFunc,
  });

  final TextEditingController controller;
  final bool isEnabled;
  final Function(String)? onChangedFunc;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SizedBox(
        height: 40,
        width: context.getWidth() * .9,
        child: TextField(
          onChanged: onChangedFunc,
          enabled: isEnabled,
          keyboardType: TextInputType.text,
          textAlign: TextAlign.start,
          style: const TextStyle(color: Colors.black),
          textAlignVertical: TextAlignVertical.bottom,
          cursorColor: colorsSwatch[2],
          decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(color: Colors.transparent),
              ),
              suffixIcon: Icon(
                Icons.search_outlined,
                color: colorsSwatch[1],
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(color: Colors.transparent),
              ),
              filled: true,
              hintText: "Search",
              hintStyle: TextStyle(
                  color: colorsSwatch[1],
                  fontSize: 16,
                  fontWeight: FontWeight.w400),
              fillColor: colorsSwatch[5],
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(color: Colors.transparent))),
        ),
      ),
    );
  }
}
