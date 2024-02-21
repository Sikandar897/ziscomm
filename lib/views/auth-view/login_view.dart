// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import '../../repository/auth_repository.dart';
import '../../utils/app_constant.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_textfield.dart';
import '../home_view.dart';
import 'registration.dart';
class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  LoginViewState createState() => LoginViewState();
}

class LoginViewState extends State<LoginView> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final AuthRepository authRepository = AuthRepository();
  bool isPasswordVisible = false;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstant.appMainColor,
      body: Center(
        child: SizedBox(
          width: 400,
          child: Card(
            color: AppConstant.appMainColor,
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
                  text: 'Login',
                  onPressed: isLoading ? null : login,
                  isLoading: isLoading,
                ),
                const SizedBox(height: 10),
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const RegistrationView()),
                    );
                  },
                  child: const Text(
                    "Don't have an account? Register",
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

  Future<void> login() async {
    try {
      setState(() {
        isLoading = true;
      });

      // Validate fields
      if (emailController.text.isEmpty && passwordController.text.isEmpty) {
        // Both fields are empty
        showSnackbar('Please fill the required fields.', emailFocus: true);
      } else if (emailController.text.isEmpty || passwordController.text.isEmpty) {
        // One of the fields is empty
        showSnackbar('Please fill both fields.');
      } else {
        bool loginSuccess =
            await authRepository.login(emailController.text.toString(), passwordController.text.toString());

        if (loginSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Login successful!'),
              duration: Duration(seconds: 2),
            ),
          );

          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const HomeView()),
          );
        } else {
          showSnackbar('Incorrect email or password. Please try again.');
        }
      }
    } catch (e) {
      // ignore: avoid_print
      print('Exception during login: $e');
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  // Function to show snackbar
  void showSnackbar(String message, {bool emailFocus = false}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
        backgroundColor: AppConstant.appSecondoryColor,
        behavior: SnackBarBehavior.floating,
      ),
    );

    if (emailFocus) {
      FocusScope.of(context).requestFocus(FocusNode());
      FocusScope.of(context).requestFocus(emailFocusNode);
    }
  }

  // Focus node for email field
  final FocusNode emailFocusNode = FocusNode();

  @override
  void dispose() {
    emailFocusNode.dispose();
    super.dispose();
  }
}
