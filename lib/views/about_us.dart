import 'package:flutter/material.dart';
import 'package:ziscomm/utils/app_constant.dart';

import '../widgets/custom_drawer.dart';

class AboutUsView extends StatelessWidget {
  const AboutUsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        foregroundColor: AppConstant.appTextColor,
        backgroundColor: AppConstant.appMainColor,
        title: const Text('About Us'),
      ),
      drawer: const CustomDrawer(),
      backgroundColor: Colors.grey.shade100,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          color: AppConstant.appSecondoryColor,
          elevation: 5.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 200.0,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15.0),
                    topRight: Radius.circular(15.0),
                  ),
                  image: DecorationImage(
                    image: AssetImage('assets/images/aboutus.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Our Story',
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                        color: AppConstant.appTextColor,
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      "Ziscomm is a prominent Business Processing Outsourcing (BPO) entity, enriching businesses with cutting-edge communication solutions. Our mission is to empower enterprises, fostering connections, collaboration, and success in today’s fiercely competitive landscape.\n\n"
                      "We are headquartered in Rawalpindi, Pakistan, and serve as the nucleus for a range of specialized services encompassing provisioning, Information Technology, Human Resources, Customer Care, and Finance. Our team is a harmonious blend of skilled experts who bring with them a wealth of experience from diverse national and international portfolios.",
                      style: TextStyle(
                        fontSize: 16.0,
                        color: AppConstant.appTextColor,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
