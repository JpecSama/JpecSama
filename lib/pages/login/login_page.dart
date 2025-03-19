import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:jpec_sama/constants.dart';
import 'package:jpec_sama/extensions/context_extension.dart';
import 'package:jpec_sama/pages/dashboard/dashboard.dart';
import 'package:jpec_sama/pages/register/register_page.dart';
import 'package:jpec_sama/services/supabase/supabase_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../services/supabase/repositories/user_repository.dart';
import '../../theme/custom_theme.dart';
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
  bool _isPasswordVisible = false;
  bool _redirecting = false;
  late final TextEditingController _emailController =
      TextEditingController(text: '');
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
    _authStateSubscription = supabase.auth.onAuthStateChange.listen(
      (AuthState data) async {
        // print(data);
        if (_redirecting) {
          return;
        }
        final session = data.session;
        // print(session);

        if (session != null) {
          _redirecting = true;
          context.pushReplacementNamed(
            Dashboard.routeName,
          );
          final hiveBox = await Hive.openBox('supabase');
          await hiveBox.put('userId',
              data.session?.user.id ?? UserRepository.getCurrentUserId());
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
                      await UserRepository.resetPassword(_emailController.text);
                    },
                    child: Text(
                      context.translations.sendResetPasswordByEmail,
                    ))
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
        title: Text(
          context.translations.signIn,
        ),
        automaticallyImplyLeading: false,
      ),
      body: Align(
        alignment: const FractionalOffset(0, 0.25),
        child: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(vertical: 2 * kPadding),
          children: [
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 2 * kPadding,
                vertical: 2 * kPadding,
              ),
              decoration: const BoxDecoration(
                color: sakuraIro,
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      bottom: 2 * kPadding,
                      top: kPadding * 2,
                    ),
                    child: TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        labelText: context.translations.email,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 2 * kPadding),
                    child: TextFormField(
                      controller: _passwordController,
                      obscureText: !_isPasswordVisible,
                      decoration: InputDecoration(
                        labelText: context.translations.password,
                        suffixIcon: IconButton(
                          icon: _isPasswordVisible
                              ? const Icon(Icons.remove_red_eye)
                              : const Icon(Icons.remove_red_eye_outlined),
                          onPressed: () {
                            setState(() {
                              _isPasswordVisible = !_isPasswordVisible;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: kPadding),
                    child: ElevatedButton(
                      onPressed: _isLoading ? null : _signIn,
                      child: Text(
                        _isLoading
                            ? context.translations.loading
                            : context.translations.signInWithPassword,
                      ),
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
                child: Text(
                  context.translations.notMemberRegister,
                  style: context.textTheme.labelLarge,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: kPadding),
              child: TextButton(
                onPressed: _showResetPasswordDialog,
                child: Text(
                  context.translations.passwordForgotten,
                  style: context.textTheme.labelMedium,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
