// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather/core/api_manager/api_functions.dart';
import '../../../../core/api_manager/api_models/WeatherModel.dart';
import '../../../../core/utils/styles.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  const CustomTextField({
    Key? key,
    required this.controller,
    required this.hint,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style: mediumText.copyWith(fontSize: 18,color: Colors.black,fontWeight: FontWeight.w300),
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.r),
            borderSide: BorderSide(color: Colors.black)),
        filled: true,
        fillColor: Colors.white,
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.r),
            borderSide: BorderSide(color: Colors.black)),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.r),
            borderSide: BorderSide(color: Colors.black)),
        prefixIcon: const Icon(Icons.search, color: Colors.black),
        hintText: hint,
        hintStyle: smallText2.copyWith(fontSize: 18,color: Colors.black.withOpacity(.41)),
      ),
      onChanged: (value) async{
        Location searchList = Location();
        // ApiFunction.searchWeather(q: controller.text);
        WeatherModel data = await ApiFunction.searchWeather(q: controller.text);
        searchList = data.location ?? Location();
      },
    );
  }
}