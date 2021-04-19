import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:world_time/services/world_time.dart';

class LoadingPage extends StatefulWidget {
  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  void setUpWorldTime() async {
    WorldTime i = WorldTime(
      location: "Kolkata",
      flag: 'india.png',
      url: "Asia/kolkata",
    );
    await i.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': i.location,
      'flag': i.flag,
      'time': i.time,
      'isDayTime': i.isDayTime,
    });
  }

  @override
  void initState() {
    super.initState();
    setUpWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Center(
        child: SpinKitPulse(
          color: Colors.white,
          size: 50.0,
        ),
      ),
    );
  }
}
