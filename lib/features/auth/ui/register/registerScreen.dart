import 'package:flutter/material.dart';
import 'package:news_app/core/validators/app_validators.dart';

import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_routes.dart';
import '../../../../core/utils/app_theme.dart';
import '../../../../core/widgets/custom_Elevated_bottom.dart';
import '../../../../core/widgets/custom_text_field.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final rePasswordController = TextEditingController();

  bool isPasswordObscured = true;
  bool isRePasswordObscured = true;

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    passwordController.dispose();
    rePasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Image.asset(
                      isDark ?AppAssets.newsLogoDark :AppAssets.newsLogoLight,
                      height: 150,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    "Name",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const SizedBox(height: 8),
                  CustomTextField(
                    color: Theme.of(context).dividerColor,
                    hintText: "enter your name",
                    hintStyle: Theme.of(context).textTheme.bodyMedium,
                    controller: nameController,
                    validator: AppValidators.validateFullName,
                  ),
                  const SizedBox(height: 15),
                  Text(
                    "Phone",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const SizedBox(height: 8),
                  CustomTextField(
                    hintText: "enter your phone",
                    hintStyle: Theme.of(context).textTheme.bodyMedium,
                    controller: phoneController,
                    validator: AppValidators.validatePhoneNumber,
                    keyboardType: TextInputType.phone,
                  ),
                  const SizedBox(height: 15),
                  Text(
                    "E-mail",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const SizedBox(height: 8),
                  CustomTextField(
                    hintText: "enter your email",
                    hintStyle: Theme.of(context).textTheme.bodyMedium,
                    controller: emailController,
                    validator: AppValidators.validateEmail,
                  ),
                  const SizedBox(height: 15),
                  Text(
                    "Password",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const SizedBox(height: 8),
                  CustomTextField(
                    hintText: "enter your password",
                    hintStyle: Theme.of(context).textTheme.bodyMedium,
                    controller: passwordController,
                    validator: AppValidators.validatePassword,
                    obscureText: isPasswordObscured,
                    keyboardType: TextInputType.visiblePassword,
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          isPasswordObscured = !isPasswordObscured;
                        });
                      },
                      icon: Icon(
                        isPasswordObscured
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: Theme.of(context).cardColor,
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    "Confirm Password",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const SizedBox(height: 8),
                  CustomTextField(
                    hintText: "enter your password",
                    hintStyle: Theme.of(context).textTheme.bodyMedium,
                    controller: rePasswordController,
                    validator: (val) => AppValidators.validateConfirmPassword(
                      val,
                      passwordController.text,
                    ),
                    obscureText: isRePasswordObscured,
                    keyboardType: TextInputType.visiblePassword,
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          isRePasswordObscured = !isRePasswordObscured;
                        });
                      },
                      icon: Icon(
                        isRePasswordObscured
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: Theme.of(context).cardColor,
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: CustomElevatedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          // TODO: navigate to loginScreen or perform register
                          Navigator.pushNamed(context, AppRoutes.loginRouteName);
                        }
                      },
                      child: Text(
                        "Register",
                        style: Theme.of(context).textTheme.displayLarge,
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account?",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, AppRoutes.loginRouteName);
                        },
                        child: Text(
                          "Sign in",
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}