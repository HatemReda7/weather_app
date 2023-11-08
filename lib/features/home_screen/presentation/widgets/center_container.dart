import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../../../core/Provider/my_provider.dart';
import '../../../../core/api_manager/api_functions.dart';
import '../../../../core/utils/assets.dart';
import '../../../../core/utils/styles.dart';

class CenterContainer extends StatelessWidget {
  const CenterContainer({super.key});

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
        var currentHumidity=snapshot.data?.current?.humidity ??[];
        var currentPerc=snapshot.data?.current?.precipIn ??[];
        var currentWind=snapshot.data?.current?.windKph ??[];
        var feelsLike=snapshot.data?.current?.feelslikeC ??[];
        var gust=snapshot.data?.current?.gustKph ??[];
        var windDir=snapshot.data?.current?.windDir ??[];
        return Center(
          child: Container(
            height: 230.h,
            width: 370.w,
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(horizontal: 12.w,vertical: 16.h),
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(12)),
                color: Colors.white),
            child: Column(
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(Icons.water_drop,color: Colors.blue,size: 30.r,),
                        Text(
                          "Humidity",
                          style: smallText,
                        ),
                        Text("$currentHumidity %",style: smallText2,),
                      ],
                    ),
                    SizedBox(
                      width: 30.w,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ImageIcon(AssetImage(umbrella),size: 30.r,color: Colors.pinkAccent,),
                        Text("Perception", style: smallText,),
                        Text("$currentPerc %",style: smallText2),
                      ],
                    ),
                    SizedBox(
                      width: 30.w,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ImageIcon(AssetImage(wind),size: 30.r,color: Colors.lightBlue,),
                        Text("Wind", style: smallText,),
                        Text("$currentWind Km/H",style: smallText2),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 20.h,),
                Divider(color: Colors.blue,thickness: 2,endIndent: 20,indent: 20,),
                SizedBox(height: 20.h,),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ImageIcon(AssetImage(temp),size: 30.r,color: Colors.amber,),
                        Text(
                          "Feels like",
                          style: smallText,
                        ),
                        Text("$feelsLike C",style: smallText2,),
                      ],
                    ),
                    SizedBox(
                      width: 30.w,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ImageIcon(AssetImage(direction),size: 30.r,color: Colors.red,),
                        Text("Wind Direction", style: smallText,),
                        Text("$windDir",style: smallText2),
                      ],
                    ),
                    SizedBox(
                      width: 30.w,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ImageIcon(AssetImage(gustIcon),size: 30.r),
                        Text("Gust", style: smallText,),
                        Text("$gust Km/H",style: smallText2),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
