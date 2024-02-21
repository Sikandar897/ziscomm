// login.dart

// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../../repository/auth_repository.dart';
import '../../utils/app_constant.dart';
import '../home_view.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final AuthRepository authRepository = AuthRepository();

  bool isPasswordVisible = false;
  bool isLoading = false;

  Future<void> login() async {
    try {
      setState(() {
        isLoading = true;
      });

      // Disable the keyboard after login button pressed
      FocusScope.of(context).unfocus();

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
                TextField(
                  keyboardType: TextInputType.emailAddress,
                  focusNode: emailFocusNode,
                  cursorColor: AppConstant.appTextColor,
                  style: const TextStyle(color: AppConstant.appTextColor),
                  controller: emailController,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.email, color: AppConstant.appTextColor),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(21)),
                      borderSide: BorderSide(color: AppConstant.appTextColor),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(21)),
                      borderSide: BorderSide(color: AppConstant.appTextColor),
                    ),
                    label: Text('Email', style: TextStyle(color: AppConstant.appTextColor)),
                    hintText: 'Enter Your Email',
                    hintStyle: TextStyle(
                      color: AppConstant.appTextColor,
                    ),
                  ),
                ),
                const SizedBox(height: 21),
                TextField(
                  cursorColor: AppConstant.appTextColor,
                  obscureText: !isPasswordVisible,
                  style: const TextStyle(color: AppConstant.appTextColor),
                  controller: passwordController,
                  decoration: InputDecoration(
                    focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(21)),
                      borderSide: BorderSide(color: AppConstant.appTextColor),
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(21)),
                      borderSide: BorderSide(color: AppConstant.appTextColor),
                    ),
                    prefixIcon: const Icon(Icons.lock, color: AppConstant.appTextColor),
                    suffixIcon: IconButton(
                      icon: Icon(
                        isPasswordVisible ? Icons.visibility_off : Icons.visibility,
                        color: AppConstant.appTextColor,
                      ),
                      onPressed: () {
                        setState(() {
                          isPasswordVisible = !isPasswordVisible;
                        });
                      },
                    ),
                    label: const Text('Password', style: TextStyle(color: AppConstant.appTextColor)),
                    hintText: 'Enter Your Password',
                    hintStyle: const TextStyle(
                      color: AppConstant.appTextColor,
                    ),
                  ),
                ),
                const SizedBox(height: 21),
                ElevatedButton(
                  onPressed: isLoading ? null : login,
                  style: const ButtonStyle(
                    shadowColor: MaterialStatePropertyAll(AppConstant.appSecondoryColor),
                    backgroundColor: MaterialStatePropertyAll(AppConstant.appMainColor),
                    overlayColor: MaterialStatePropertyAll(AppConstant.appSecondoryColor),
                    elevation: MaterialStatePropertyAll(21),
                    minimumSize: MaterialStatePropertyAll(Size(150, 50)),
                  ),
                  child: isLoading
                      ? const SpinKitCircle(
                          color: AppConstant.appTextColor,
                          size: 30.0,
                        )
                      : const Text('Login', style: TextStyle(color: AppConstant.appTextColor)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
