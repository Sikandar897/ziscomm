// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import '../../repository/auth_repository.dart';
import '../../utils/app_constant.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_textfield.dart';
import 'login_view.dart';

class RegistrationView extends StatefulWidget {
  const RegistrationView({Key? key}) : super(key: key);

  @override
  RegistrationViewState createState() => RegistrationViewState();
}

class RegistrationViewState extends State<RegistrationView> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final AuthRepository authRepository = AuthRepository();
  bool isPasswordVisible = false;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 226, 104, 17),
      body: Center(
        child: SingleChildScrollView(
          child: SizedBox(
            width: 400,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/ZiscommLogo.png',
                  height: 200,
                  width: 200,
                ),
                const SizedBox(height: 20),
                CustomTextField(
                  controller: nameController,
                  label: 'Full Name',
                ),
                const SizedBox(height: 21),
                CustomTextField(
                  controller: emailController,
                  label: 'Email',
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 21),
                CustomTextField(
                  controller: passwordController,
                  label: 'Password',
                  obscureText: !isPasswordVisible,
                ),
                const SizedBox(height: 21),
                CustomButton(
                  text: 'Register',
                  onPressed: isLoading ? null : register,
                  isLoading: isLoading,
                ),
                const SizedBox(height: 10),
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginView()),
                    );
                  },
                  child: const Text(
                    'Already have an account? Sign in',
                    style: TextStyle(color: AppConstant.appTextColor),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> register() async {
    try {
      setState(() {
        isLoading = true;
      });

      // Validate fields
      if (nameController.text.isEmpty ||
          emailController.text.isEmpty ||
          passwordController.text.isEmpty) {
        showSnackbar('All fields are required.');
        return;
      }
      await Future.delayed(const Duration(seconds: 2));

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: AppConstant.appSecondoryColor,
          content: Text('Registration successful!'),
          duration: Duration(seconds: 2),
        ),
      );

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginView()),
      );
    } catch (e) {
      // ignore: avoid_print
      print('Exception during registration: $e');
      showSnackbar('Registration failed. Please try again.');
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  void showSnackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
        backgroundColor: AppConstant.appSecondoryColor,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}
