import 'package:chain_break/screens/authentication/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:chain_break/providers/auth_provider.dart'; // Import AuthProvider
import 'package:chain_break/utils/fonts.dart';
import 'package:chain_break/utils/image_strings.dart';
import 'package:chain_break/widgets/app_button.dart';
import 'package:chain_break/widgets/form_fields.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isObsecure = true;

  void togglePasswordVisibility() => setState(() {
        isObsecure = !isObsecure;
      });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sign Up')),
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
              style: Theme.of(context).textTheme.displayLarge,
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
            // Create Account Button
            AppButton(
              onTap: () async {
                final String email = emailController.text.trim();
                final String password = passwordController.text.trim();
                final String firstName = firstNameController.text.trim();
                final String lastName = lastNameController.text.trim();

                if (email.isEmpty ||
                    password.isEmpty ||
                    firstName.isEmpty ||
                    lastName.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Please fill in all fields')),
                  );
                  return;
                }

                // Call signUp from AuthProvider with first and last name
                await Provider.of<AuthProvider>(context, listen: false)
                    .signUp(email, password, firstName, lastName);

                // Check if sign up was successful
                if (Provider.of<AuthProvider>(context, listen: false)
                    .isAuthenticated) {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => LoginScreen()));
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Sign-up failed')),
                  );
                }
              },
              bText: 'Create Account',
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Text('Have an Account ?'),
            TextButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => LoginScreen()));
                },
                child: Text("Sign In"))
              ],
            )
          ],
        ),
      ),
    );
  }
}
