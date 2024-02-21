import 'package:flutter/material.dart';
import 'package:ziscomm/utils/app_constant.dart';

class ContactUsView extends StatelessWidget {
  const ContactUsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppConstant.appMainColor,
        foregroundColor: AppConstant.appTextColor,
        title: const Text('Contact Us'),
      ),
      //backgroundColor: Colors.grey.shade100,
      body: Card(
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
                  image: AssetImage('assets/images/contcatus.jpg'),
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
                    'Get in Touch',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      color: AppConstant.appTextColor,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    "Feel free to reach out to us for any inquiries or information. We are here to assist you.\n\n"
                    "Address: Near IJP Station, Rawalpindi \n"
                    "Phone: +92-3355640044\n"
                    "Email: sikandarafridi6@gmail.com",
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
    );
  }
}
