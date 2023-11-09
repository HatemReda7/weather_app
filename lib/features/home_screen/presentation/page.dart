import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:weather/features/home_screen/presentation/widgets/center_container.dart';
import 'package:weather/features/home_screen/presentation/widgets/condition_item.dart';
import 'package:weather/features/home_screen/presentation/widgets/last_updated_text.dart';
import 'package:weather/features/home_screen/presentation/widgets/location_item.dart';
import 'package:weather/features/home_screen/presentation/widgets/search_bar.dart';

import '../../../core/Provider/my_provider.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = "HomeScreen";

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var pro=Provider.of<MyProvider>(context);
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      extendBody: true,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        toolbarHeight: 90,
        title: CustomTextField(),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 5.h,),
            LocationItem(pro.search),
            SizedBox(height: 10.h,),
            const ConditionItem(),
            SizedBox(
              height: 20.h,
            ),
            const CenterContainer(),
            SizedBox(height: 15.h,),
            const LastUpdatedText()
          ],
        ),
      )

    );
  }
}
