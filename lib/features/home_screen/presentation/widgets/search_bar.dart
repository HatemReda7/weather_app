// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../../../core/Provider/my_provider.dart';
import '../../../../core/utils/styles.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller= TextEditingController();
  CustomTextField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var pro=Provider.of<MyProvider>(context);
    return TextField(
      controller: controller,
      style: mediumText.copyWith(fontSize: 16,color: Colors.black,fontWeight: FontWeight.w300),
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.r),
            borderSide: const BorderSide(color: Colors.black)),
        filled: true,
        fillColor: Colors.white,
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.r),
            borderSide: const BorderSide(color: Colors.black)),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.r),
            borderSide: const BorderSide(color: Colors.black)),
        prefixIcon: const Icon(Icons.search, color: Colors.black),
        suffix: InkWell(
            onTap: () {
              controller.clear();
              pro.changeSearched("cairo");
            },
            child: const Text("Clear!",)),
        hintText: "Enter Location",
        hintStyle: smallText2.copyWith(fontSize: 18,color: Colors.black.withOpacity(.41)),
      ),
      onSubmitted: (value) {
        pro.changeSearched(controller.text);
      },
    );
  }
}