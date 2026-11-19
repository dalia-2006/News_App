import 'package:flutter/material.dart';
import 'package:news_app/core/utils/app_assets.dart';
import 'package:news_app/core/utils/app_routes.dart';
import 'package:news_app/core/validators/app_validators.dart';
import 'package:news_app/core/widgets/custom_Elevated_bottom.dart';
import 'package:news_app/core/widgets/custom_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isPasswordObscured = true;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Image.asset(
                      isDark ?AppAssets.newsLogoDark :AppAssets.newsLogoLight,
                      height: 250,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    "E-mail",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const SizedBox(height: 8),
                  CustomTextField(
                    color: Theme.of(context).dividerColor,
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
                  const SizedBox(height: 30),
                  CustomElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        // TODO: navigate to home screen
                        Navigator.pushNamed(context, AppRoutes.homeRouteName);
                      }
                    },
                    child: Text(
                      "Login",
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don’t have an account?",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, AppRoutes.registerRouteName);
                        },
                        child: Text(
                          "Create Account",
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