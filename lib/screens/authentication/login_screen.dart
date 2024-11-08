import 'package:flutter/material.dart';

import '../../utils/fonts.dart';
import '../../utils/image_strings.dart';
import '../../widgets/app_button.dart';
import '../../widgets/form_fields.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isObsecure = true;

  void togglePasswordVisibility() => setState(() {
        isObsecure = !isObsecure;
      });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            Center(child: Image.asset(logo)),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Welcome Back!',
              style: Fonts.headings,
            ),
            const SizedBox(
              height: 30,
            ),
            AppFormField(
              controller: emailController,
              heading: 'E-mail',
              hintText: 'Enter your email',
            ),
            const SizedBox(
              height: 20,
            ),
            AppFormField(
              controller: passwordController,
              heading: 'Password',
              hintText: '*********',
              isObsecure: isObsecure,
              icon: IconButton(
                icon: isObsecure
                    ? const Icon(Icons.visibility_off)
                    : const Icon(Icons.visibility),
                onPressed: togglePasswordVisibility,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Align( alignment: Alignment.centerRight, child: Text('Forgot Password?')),
            const SizedBox(
              height: 30,
            ),
            AppButton(onTap: () {}, bText: 'Sign In')
          ],
        ),
      ),
    );
  }
}
