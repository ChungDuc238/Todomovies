import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:todomovies/views/pages/home_page/home_page.dart';

void main() {
  runApp(DevicePreview(
    
    builder: (context) => const MyApp(), // Wrap your app
  ),);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo Movies',
      debugShowCheckedModeBanner: false,
       useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // initialRoute: '/',
      // routes: {
      //   '/': (context) => const HomePageScreen(),
      // },
      home: const HomePageScreen(),
    );
  }
}
