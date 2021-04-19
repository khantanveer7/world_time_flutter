import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String location;
  String time;
  String flag;
  String url;
  bool isDayTime;

  WorldTime({
    this.location,
    this.url,
    this.flag,
    this.isDayTime,
  });

  Future<void> getTime() async {
    try {
      var baseUrl = Uri.parse('https://worldtimeapi.org/api/timezone/$url');
      Response response = await get(baseUrl);
      Map data = await jsonDecode(response.body);
      // print(data);

      String dateTime = data['utc_datetime'];
      String offSetHour = data['utc_offset'].substring(1, 3);
      String offSetMin = data['utc_offset'].substring(4, 6);
      DateTime now = DateTime.parse(dateTime);
      now = now.add(Duration(hours: int.parse(offSetHour)));
      offSetMin != "00"
          ? now = now.add(Duration(minutes: int.parse(offSetMin)))
          : null;

      // set time prop
      isDayTime = now.hour > 6 && now.hour < 19 ? true : false;
      time = DateFormat.jm().format(now);
    } catch (e) {
      time = "Something went wrong 🙁 ";
    }
  }
}

WorldTime i = WorldTime(
  location: "Kolkata",
  flag: 'india.png',
  url: "Asia/kolkata",
);
