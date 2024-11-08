
import 'package:chain_break/utils/fonts.dart';
import 'package:chain_break/utils/image_strings.dart';
import 'package:chain_break/widgets/app_button.dart';
import 'package:chain_break/widgets/form_fields.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    TextEditingController firstNameController = TextEditingController();
    TextEditingController lastNameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    bool isObsecure = true;

    void togglePasswordVisibility() => setState(() {
          isObsecure = !isObsecure;
        });

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
              'Join ChainBreak!',
              style: Fonts.headings,
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Expanded(
                  child: AppFormField(
                    controller: firstNameController,
                    heading: 'First Name',
                    hintText: 'Name',
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: AppFormField(
                    controller: lastNameController,
                    heading: 'Last Name',
                    hintText: 'Name',
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
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
              height: 30,
            ),
            AppButton(onTap: () {}, bText: 'Create Account')
          ],
        ),
      ),
    );
  }
}
