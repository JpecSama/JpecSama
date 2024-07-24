import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:jpec_sama/constants.dart';
import 'package:jpec_sama/extensions/context_extension.dart';
import 'package:jpec_sama/main.dart';
import 'package:jpec_sama/pages/home/home_page.dart';
import 'package:jpec_sama/pages/register/register_page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../theme/theme_dialog.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  static const routeName = 'login';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

//https://supabase.com/blog/flutter-authentication
class _LoginPageState extends State<LoginPage> {
  bool _isLoading = false;
  bool _redirecting = false;
  late final TextEditingController _emailController =
      TextEditingController(text: 'jpec.bella@gmail.com');
  late final TextEditingController _passwordController =
      TextEditingController();

  late final StreamSubscription<AuthState> _authStateSubscription;

  Future<void> _signIn() async {
    try {
      setState(() {
        _isLoading = true;
      });
      await supabase.auth.signInWithPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim());
      // await supabase.auth.signInWithOtp(
      //   email: _emailController.text.trim(),
      //   emailRedirectTo:
      //       kIsWeb ? null : 'io.supabase.flutterquickstart://login-callback/',
      // );
      if (mounted) {
        _emailController.clear();
      }
    } on AuthException catch (error) {
      if (mounted) context.showSnackBar(error.message, isError: true);
    } catch (error) {
      if (mounted) {
        context.showSnackBar('Unexpected error occurred', isError: true);
      }
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  void initState() {
    // await supabase.auth.getSessionFromUrl();
//
    _authStateSubscription = supabase.auth.onAuthStateChange.listen(
      (AuthState data) {
        print(data);
        if (_redirecting) {
          return;
        }
        final session = data.session;
        print(session);

        if (session != null) {
          _redirecting = true;
          context.pushReplacementNamed(
            HomePage.routeName,
          );
        }
      },
      onError: (error) {
        if (error is AuthException) {
          context.showSnackBar(error.message, isError: true);
        } else {
          context.showSnackBar('Unexpected error occurred', isError: true);
        }
      },
    );
    super.initState();
  }

  _showResetPasswordDialog() {
    showDialog(
        context: context,
        builder: (context) {
          return ThemeDialog(
            child: Column(
              children: [
                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(labelText: 'Email'),
                ),
                ElevatedButton(
                    onPressed: () async {
                      await supabase.auth
                          .resetPasswordForEmail(_emailController.text.trim());
                    },
                    child: Text('Send a reset email'))
              ],
            ),
          );
        });
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _authStateSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign In'),
        automaticallyImplyLeading: false,
      ),
      body: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(vertical: 2 * kPadding),
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 2 * kPadding,
              vertical: kPadding,
            ),
            decoration: const BoxDecoration(
              color: Colors.lightGreen,
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 2 * kPadding),
                  child: TextFormField(
                    controller: _emailController,
                    decoration: const InputDecoration(labelText: 'Email'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 2 * kPadding),
                  child: TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: 'Password',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: kPadding),
                  child: ElevatedButton(
                    onPressed: _isLoading ? null : _signIn,
                    child: Text(
                        _isLoading ? 'Checking...' : 'Sign in with password'),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: kPadding),
            child: TextButton(
              onPressed: () {
                context.pushNamed(RegisterPage.routeName);
              },
              child: Text('Not yet a member ? Sign up here'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: kPadding),
            child: TextButton(
              onPressed: _showResetPasswordDialog,
              child: Text(
                'Password forgotten ?',
                style: context.textTheme.labelMedium,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
