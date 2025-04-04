import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:jpec_sama/extensions/context_extension.dart';
import 'package:jpec_sama/services/supabase/supabase_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../home/home_tab.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});
  static const routeName = 'register';

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool _isLoading = false;
  bool _redirecting = false;
  final _formKey = GlobalKey<FormState>();
  late final StreamSubscription<AuthState> _authStateSubscription;
  late final TextEditingController _emailController =
      TextEditingController(text: '');
  late final TextEditingController _passwordController =
      TextEditingController(text: 'Bonjour');
  late final TextEditingController _confirmPasswordController =
      TextEditingController(text: 'Bonjour');

  @override
  void initState() {
    _authStateSubscription = supabase.auth.onAuthStateChange.listen(
      (AuthState data) {
        // print(data);
        if (_redirecting) {
          return;
        }
        final session = data.session;
        // print(session);

        if (session != null) {
          _redirecting = true;
          context.pushReplacementNamed(
            HomeTab.tabName,
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
    _confirmPasswordController.dispose();

    _authStateSubscription.cancel();

    super.dispose();
  }

  Future<void> _signUp() async {
    try {
      if (!_formKey.currentState!.validate()) {
        context.showSnackBar('Invalid form', isError: true);
        return;
      }
      setState(() {
        _isLoading = true;
      });

      final authResponse = await supabase.auth.signUp(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim());

      if (mounted) {
        print(authResponse.user);
        print(authResponse.session);
        if (authResponse.session != null) {
          print(authResponse.session);
          context.pushReplacementNamed(
            HomeTab.tabName,
          );
        }
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.translations.signUp,
        ),
        automaticallyImplyLeading: true,
      ),
      body: Align(
        alignment: const FractionalOffset(0, 0.2),
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.amberAccent,
          ),
          child: Form(
            key: _formKey,
            child: ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 12),
              children: [
                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(labelText: 'Email'),
                ),
                const SizedBox(height: 18),
                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: context.translations.password,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return context.translations.pleaseEnterSomeText;
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 18),
                TextFormField(
                  controller: _confirmPasswordController,
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return context.translations.pleaseEnterSomeText;
                    }
                    if (value == _passwordController.text) {
                      return null;
                    }
                    return context.translations.passwordsDontMatch;
                  },
                  decoration: InputDecoration(
                    labelText: context.translations.confirmPassword,
                  ),
                ),
                const SizedBox(height: 18),
                ElevatedButton(
                  onPressed: _isLoading ? null : _signUp,
                  child: Text(_isLoading
                      ? context.translations.loading
                      : context.translations.signUp),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
