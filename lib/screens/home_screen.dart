 import 'package:flutter/material.dart';
 import 'package:flutter_application_5/widgets/myscaffold.dart';
 class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<StatefulWidget> createState() {
    return _HomeScreen();
  }
 }
 class _HomeScreen extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      name: 'Home',
      body: Center(),
    );
  }
 }