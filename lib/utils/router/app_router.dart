import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../features/calculate/calculate.dart';
import '../../features/home/home_view.dart';
import '../../features/interest/interest.dart';
import '../../features/price/price_view.dart';
import '../../features/user/user_model.dart';
import '../../features/user/user_success.dart';
import '../../features/user/user_view.dart';

class Routes {
  static const String home = '/';
  static const String formPrice = '/price';
  static const String formInterest = '/interest';
  static const String formUser = '/user';
  static const String formUserSuccess = 'success';
  static const String formCalculator = '/calculate';
  static const String calculateTypeA = 'calculatetype-a';
  static const String calculateTypeB = 'calculatetype-b';
  static const String interestTypeA = 'interesttype-a';
  static const String interestTypeB = 'interesttype-b';
}

class RouteName {
  static const String home = 'home';
  static const String formPrice = 'form-price';
  static const String formInterest = 'form-interest';
  static const String formUser = 'form-user';
  static const String formUserSuccess = 'success';
  static const String formCalculator = 'form-calculator';
  static const String calculateTypeA = 'calculatetype-a';
  static const String calculateTypeB = 'calculatetype-b';
  static const String interestTypeA = 'interesttype-a';
  static const String interestTypeB = 'interesttype-b';
}

final navigatorKey = GlobalKey<NavigatorState>();

final goRouterProvider = Provider<GoRouter>(
  (ref) {
    return GoRouter(
      initialLocation: Routes.home,
      navigatorKey: navigatorKey,
      debugLogDiagnostics: true,
      routes: [
        GoRoute(
          path: Routes.home,
          name: RouteName.home,
          pageBuilder: (context, state) {
            return CustomTransitionPage(
              child: const HomeView(),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                return FadeTransition(
                  opacity: animation,
                  child: child,
                );
              },
            );
          },
        ),
        GoRoute(
          path: Routes.formCalculator,
          name: RouteName.formCalculator,
          pageBuilder: (context, state) {
            return CustomTransitionPage(
              child: const CalculateView(),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                return FadeTransition(
                  opacity: animation,
                  child: child,
                );
              },
            );
          },
          routes: [
            GoRoute(
              path: Routes.calculateTypeA,
              name: RouteName.calculateTypeA,
              pageBuilder: (context, state) {
                return CustomTransitionPage(
                  child: const CalculateTypeA(),
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {
                    return FadeTransition(
                      opacity: animation,
                      child: child,
                    );
                  },
                );
              },
            ),
            GoRoute(
              path: Routes.calculateTypeB,
              name: RouteName.calculateTypeB,
              pageBuilder: (context, state) {
                return CustomTransitionPage(
                  child: const CalculateTypeB(),
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {
                    return FadeTransition(
                      opacity: animation,
                      child: child,
                    );
                  },
                );
              },
            ),
          ],
        ),
        GoRoute(
          path: Routes.formInterest,
          name: RouteName.formInterest,
          pageBuilder: (context, state) {
            return CustomTransitionPage(
              child: const InterestView(),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                return FadeTransition(
                  opacity: animation,
                  child: child,
                );
              },
            );
          },
          routes: [
            GoRoute(
              path: Routes.interestTypeA,
              name: RouteName.interestTypeA,
              pageBuilder: (context, state) {
                return CustomTransitionPage(
                  child: const InterestTypeA(),
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {
                    return FadeTransition(
                      opacity: animation,
                      child: child,
                    );
                  },
                );
              },
            ),
            GoRoute(
              path: Routes.interestTypeB,
              name: RouteName.interestTypeB,
              pageBuilder: (context, state) {
                return CustomTransitionPage(
                  child: const InterestTypeB(),
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {
                    return FadeTransition(
                      opacity: animation,
                      child: child,
                    );
                  },
                );
              },
            ),
          ],
        ),
        GoRoute(
          path: Routes.formPrice,
          name: RouteName.formPrice,
          pageBuilder: (context, state) {
            return CustomTransitionPage(
              child: const PriceView(),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                return FadeTransition(
                  opacity: animation,
                  child: child,
                );
              },
            );
          },
        ),
        GoRoute(
          path: Routes.formUser,
          name: RouteName.formUser,
          pageBuilder: (context, state) {
            return CustomTransitionPage(
              child: const UserView(),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                return FadeTransition(
                  opacity: animation,
                  child: child,
                );
              },
            );
          },
          routes: [
            GoRoute(
              path: Routes.formUserSuccess,
              name: RouteName.formUserSuccess,
              pageBuilder: (context, state) {
                return CustomTransitionPage(
                  child: UserSuccess(user: state.extra as UserModel),
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {
                    return FadeTransition(
                      opacity: animation,
                      child: child,
                    );
                  },
                );
              },
            ),
          ],
        ),
      ],
    );
  },
);
