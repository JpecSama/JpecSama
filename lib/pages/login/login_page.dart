import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:jpec_sama/extensions/context_extension.dart';
import 'package:jpec_sama/main.dart';
import 'package:jpec_sama/pages/home/home_page.dart';
import 'package:jpec_sama/pages/register/register_page.dart';
import 'package:jpec_sama/router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../account/account_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  static const routeName = 'login';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isLoading = false;
  bool _redirecting = false;
  late final TextEditingController _emailController =
      TextEditingController(text: 'jean.paul.bella@hotmail.fr');
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

  Future<void> _signInWithOtp() async {
    try {
      setState(() {
        _isLoading = true;
      });

      await supabase.auth.signInWithOtp(
        email: _emailController.text.trim(),
        emailRedirectTo:
            kIsWeb ? null : 'io.supabase.flutterquickstart://login-callback/',
      );
      if (mounted) {
        context.showSnackBar('Check your email for a login link!');
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
      appBar: AppBar(title: const Text('Sign In')),
      body: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 12),
        children: [
          // const Text('Sign in via the magic link with your email below'),
          // const SizedBox(height: 18),
          TextFormField(
            controller: _emailController,
            decoration: const InputDecoration(labelText: 'Email'),
          ),
          const SizedBox(height: 18),
          TextFormField(
            controller: _passwordController,
            obscureText: true,
            decoration: const InputDecoration(
              labelText: 'Password',
            ),
          ),
          const SizedBox(height: 18),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: TextButton(
              onPressed: () {
                context.pushNamed(RegisterPage.routeName);
              },
              child: Text('Not yet a member ? Sign up here'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: TextButton(
              onPressed: () async {
                showDialog(
                    context: context,
                    builder: (context) {
                      return Dialog(
                        child: Column(
                          children: [
                            TextFormField(
                              controller: _emailController,
                              decoration:
                                  const InputDecoration(labelText: 'Email'),
                            ),
                            ElevatedButton(
                                onPressed: () async {
                                  await supabase.auth.resetPasswordForEmail(
                                      _emailController.text.trim());
                                },
                                child: Text('Send a reset email'))
                          ],
                        ),
                      );
                    });
              },
              child: Text('Password forgotten ?'),
            ),
          ),

          ElevatedButton(
            onPressed: _isLoading ? null : _signIn,
            child: Text(_isLoading ? 'Checking...' : 'Sign in with password'),
          ),
          ElevatedButton(
            onPressed: _isLoading ? null : _signInWithOtp,
            child: Text(_isLoading ? 'Sending...' : 'Send Magic Link'),
          ),
        ],
      ),
    );
  }
}
