import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:weather/core/api_manager/api_functions.dart';
import 'package:weather/core/utils/styles.dart';
import '../../../../core/Provider/my_provider.dart';

class LastUpdatedText extends StatelessWidget {
  const LastUpdatedText({super.key});

  @override
  Widget build(BuildContext context) {
    var pro=Provider.of<MyProvider>(context);
    return FutureBuilder(
      future: ApiFunction.getWeatherResults(q: pro.search),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return const Center(child: Text("Something went wrong!"));
        }
        var lastUpdatedEpoch=snapshot.data?.current?.lastUpdatedEpoch ?? 0;
        var lastUpdated=snapshot.data?.current?.lastUpdated ?? 0;
        var dt = DateTime.fromMillisecondsSinceEpoch(lastUpdatedEpoch);
        var d12 = DateFormat('hh:mm a').format(dt);
        return Container(
          width: 300,
          padding: EdgeInsets.all(12.r),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(12.r))
          ),
          child: Text("Last Updated: ${lastUpdated.toString().substring(0,10)} $d12",style: mediumText.copyWith(color: Colors.black),),
        );
      },
    );
  }
}
