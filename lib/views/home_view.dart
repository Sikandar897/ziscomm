import 'package:flutter/material.dart';
import 'package:ziscomm/utils/app_constant.dart';

import '../widgets/custom_drawer.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        foregroundColor: AppConstant.appTextColor,
        backgroundColor: AppConstant.appMainColor,
        title: const Text('Home Screen'),
      ),
      drawer: const CustomDrawer(), 
    );
  }
}
