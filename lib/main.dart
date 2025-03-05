import 'package:flutter/material.dart';
import 'package:practice/app/module/Native%20Integration/device_battery_percentage.dart';
import 'package:practice/app/module/OAuth%20Feature/loginView.dart';
import 'package:practice/app/module/animation/tween_animation.dart';

import 'app/module/animation/animation Effact.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Map<String, dynamic>> screen = [
    {"screen": OAuthLoginView(), "name": "OAuth Login Screen"},
    {"screen": TweenAnimation(), "name": "Tween Animation"},
    {"screen": AnimationEffect(), "name": "Animation Effect"},
    {"screen": DeviceBatteryPercentage(), "name": "Device Battery Percentage"}
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(10),
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => screen[index]["screen"],
                        ),
                      ),
                      child: Container(
                        color: Colors.blue,
                        height: 100,
                        width: 100,
                        child: Center(child: Text(screen[index]["name"])),
                      ),
                    ),
                  );
                },
                childCount: screen.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
