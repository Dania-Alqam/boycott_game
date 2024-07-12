import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../screens/landing_page.dart';
import '../screens/our_goals.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => LandingPage(),
    ),
    GoRoute(
      path: '/our-goals',
      builder: (context, state) => OurGoalsPage(),
    ),
  ],
);
