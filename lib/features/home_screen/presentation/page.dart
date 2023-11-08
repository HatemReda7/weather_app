import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather/features/home_screen/presentation/widgets/center_container.dart';
import 'package:weather/features/home_screen/presentation/widgets/condition_item.dart';
import 'package:weather/features/home_screen/presentation/widgets/last%20updated%20text.dart';
import 'package:weather/features/home_screen/presentation/widgets/location_item.dart';
import 'package:weather/features/home_screen/presentation/widgets/search_bar.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = "HomeScreen";

  HomeScreen({super.key});
  TextEditingController controller=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      extendBody: true,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        toolbarHeight: 100,
        title: CustomTextField(controller: controller,hint: "Search"),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            LocationItem(controller.text),
            ConditionItem(),
            SizedBox(
              height: 30.h,
            ),
            CenterContainer(),
            SizedBox(height: 20.h,),
            LastUpdatedText()
          ],
        ),
      )

    );
  }
}
