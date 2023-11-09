import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:weather/core/utils/assets.dart';
import '../../../../core/Provider/my_provider.dart';
import '../../../../core/api_manager/api_functions.dart';
import '../../../../core/utils/styles.dart';

class ConditionItem extends StatelessWidget {
  const ConditionItem({super.key});

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
        var currentCondition=snapshot.data?.current?.condition?.text ??[];
        var currentTemp=snapshot.data?.current?.tempC ??[];
        return Column(
          children: [
            checkWeather(currentCondition.toString()),
            SizedBox(
              height: 5.h,
            ),
            Text(
              "${currentTemp.toString().substring(0, 2)} C",
              style: largeText,
            ),
            SizedBox(
              height: 5.h,
            ),
            Text(
              currentCondition.toString(),
              style: mediumText,
            ),
          ],
        );
      },
    );
  }

  Widget checkWeather(String weatherCondition){
    if(weatherCondition=="Sunny"){
      return Image.asset(sunny);
    }else if(weatherCondition=="Light rain" || weatherCondition=="Rain" || weatherCondition=="Patchy rain possible"){
      return Image.asset(rainy);
    }else if(weatherCondition=="Overcast" || weatherCondition=="Partly cloudy" ){
      return Image.asset(cloudy);
    }else{
      return Icon(
        Icons.wb_cloudy,
        size: 150.r,
        color: Colors.white,
      );
    }
  }
}
