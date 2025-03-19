import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:jpec_sama/pages/account/account_page.dart';
import 'package:jpec_sama/pages/login/login_page.dart';
import 'package:jpec_sama/pages/register/register_page.dart';
import 'package:jpec_sama/pages/review/review_page.dart';
import 'package:jpec_sama/services/supabase/supabase_service.dart';

import 'pages/add_flashcard/add_flashcard_page.dart';
import 'pages/dashboard/dashboard.dart';
import 'pages/not_found/not_found_page.dart';

final router = GoRouter(
  redirect: (context, state) async {
    debugPrint(state.fullPath);
    // await supabase.auth.getSessionFromUrl(state.uri);
    if (state.fullPath != null &&
        [
          '/not-found',
          '/login',
          '/register',
        ].contains(state.fullPath!.split('?')[0])) {
      return null;
    }
    if (supabase.auth.currentSession == null) {
      return '/login';
    }
    return null;
  },
  errorBuilder: (context, state) => const NotFoundPage(),
  routes: [
    GoRoute(
      path: '/',
      name: Dashboard.routeName,
      builder: (context, state) => const Dashboard(),
    ),
    GoRoute(
      path: '/login',
      name: LoginPage.routeName,
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      path: '/register',
      name: RegisterPage.routeName,
      builder: (context, state) => const RegisterPage(),
    ),
    GoRoute(
      path: '/flashcards/add',
      name: AddFlashcardPage.routeName,
      builder: (context, state) => const AddFlashcardPage(),
    ),
    GoRoute(
      path: '/profile',
      name: AccountPage.routeName,
      builder: (context, state) => const AccountPage(),
    ),
    GoRoute(
      path: '/review',
      name: ReviewPage.routeName,
      builder: (context, state) {
        final maxCount =
            int.tryParse(state.uri.queryParameters['maxCount'] ?? '100') ?? 100;

        return ReviewPage(
          maxCount: maxCount,
        );
      },
    ),
  ],
);
