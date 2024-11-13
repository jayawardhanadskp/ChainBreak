import 'package:chain_break/screens/home/main_screen.dart';
import 'package:chain_break/utils/test.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:chain_break/providers/auth_provider.dart';  // Import AuthProvider
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
      appBar: AppBar(title: const Text('Login')),
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
              style:Theme.of(context).textTheme.displayLarge,
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
            AppButton(
              onTap: () async {
                final String email = emailController.text.trim();
                final String password = passwordController.text.trim();

                if (email.isEmpty || password.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Please enter email and password')),
                  );
                  return;
                }

                // Call signIn from AuthProvider
                await Provider.of<AuthProvider>(context, listen: false)
                    .signIn(email, password);

                // Check if login was successful
                if (Provider.of<AuthProvider>(context, listen: false).isAuthenticated) {
                   Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => MainScreen()));
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Login failed')),
                  );
                }
              },
              bText: 'Sign In',
            ),
          ],
        ),
      ),
    );
  }
}
