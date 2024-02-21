import 'package:flutter/material.dart';
import 'package:ziscomm/utils/app_constant.dart';
import 'package:ziscomm/views/about_us.dart';
import 'package:ziscomm/views/auth-view/login_view.dart';

import '../views/contact_us.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: const Color.fromARGB(
            255, 226, 104, 17), // Drawer background color
        child: ListView(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: AppConstant.appMainColor,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'ItsAlexender',
                    style: TextStyle(
                      color: AppConstant.appTextColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Version 1.0.1',
                    style: TextStyle(
                      color: AppConstant.appTextColor,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.contact_phone, color: Colors.white),
              trailing: const Icon(Icons.arrow_forward,
                  color: AppConstant.appTextColor),
              title: const Text(
                'Contact',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const ContactUsView()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.info, color: Colors.white),
              trailing: const Icon(Icons.arrow_forward,
                  color: AppConstant.appTextColor), 
              title: const Text(
                'About Us',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                 Navigator.push(context, MaterialPageRoute(builder: (context) => const AboutUsView(),));
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.white),
              trailing: const Icon(Icons.arrow_forward,
                  color: AppConstant.appTextColor), 
              title: const Text(
                'Logout',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginView(),));
              },
            ),
          ],
        ),
      ),
    );
  }
}
