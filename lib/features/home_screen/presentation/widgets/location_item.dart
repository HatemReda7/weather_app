import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:weather/core/api_manager/api_functions.dart';
import 'package:weather/core/utils/styles.dart';

import '../../../../core/Provider/my_provider.dart';

class LocationItem extends StatelessWidget {
  String search;
  LocationItem(this.search,{super.key});

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
        var locationName =snapshot.data?.location?.name ?? "";
        var locationCountry =snapshot.data?.location?.country ?? "";
        var date =snapshot.data?.location?.localtime ?? "";
        var dateEpoch =snapshot.data?.location?.localtimeEpoch ??0;
        var dt = DateTime.fromMillisecondsSinceEpoch(dateEpoch);
        var d12 = DateFormat('hh:mm a').format(dt);
        return Container(
          width: 330,
          padding: EdgeInsets.all(12.r),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(12.r))
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Location:  $locationName, $locationCountry",style: smallText,),
              Text("Local Time:  ${date.toString().substring(0,10)}  $d12",style: smallText,)
            ],
          ),
        );
      },
    );
  }
}
