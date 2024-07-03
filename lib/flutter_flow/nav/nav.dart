import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import '/backend/backend.dart';

import '/backend/supabase/supabase.dart';

import '/auth/base_auth_user_provider.dart';

import '/index.dart';
import '/main.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/lat_lng.dart';
import '/flutter_flow/place.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'serialization_util.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  BaseAuthUser? initialUser;
  BaseAuthUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(BaseAuthUser newUser) {
    final shouldUpdate =
        user?.uid == null || newUser.uid == null || user?.uid != newUser.uid;
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    // No need to update unless the user has changed.
    if (notifyOnAuthChange && shouldUpdate) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      errorBuilder: (context, state) =>
          appStateNotifier.loggedIn ? NavBarPage() : Auth1Widget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) =>
              appStateNotifier.loggedIn ? NavBarPage() : Auth1Widget(),
        ),
        FFRoute(
          name: 'userprofile',
          path: '/userprofile',
          requireAuth: true,
          builder: (context, params) => params.isEmpty
              ? NavBarPage(initialPage: 'userprofile')
              : UserprofileWidget(),
        ),
        FFRoute(
          name: 'searchcourse',
          path: '/searchcourse',
          builder: (context, params) => params.isEmpty
              ? NavBarPage(initialPage: 'searchcourse')
              : SearchcourseWidget(),
        ),
        FFRoute(
          name: 'coursedetails',
          path: '/coursedetails',
          requireAuth: true,
          builder: (context, params) => NavBarPage(
            initialPage: '',
            page: CoursedetailsWidget(
              course: params.getParam<CoursesRow>(
                'course',
                ParamType.SupabaseRow,
              ),
              orders: params.getParam<OrdersRow>(
                'orders',
                ParamType.SupabaseRow,
              ),
            ),
          ),
        ),
        FFRoute(
          name: 'successpayment',
          path: '/successpayment',
          requireAuth: true,
          builder: (context, params) => SuccesspaymentWidget(
            order: params.getParam<OrdersRow>(
              'order',
              ParamType.SupabaseRow,
            ),
            course: params.getParam<CoursesRow>(
              'course',
              ParamType.SupabaseRow,
            ),
          ),
        ),
        FFRoute(
          name: 'orders',
          path: '/orders',
          requireAuth: true,
          builder: (context, params) => params.isEmpty
              ? NavBarPage(initialPage: 'orders')
              : OrdersWidget(),
        ),
        FFRoute(
          name: 'lesson',
          path: '/lesson',
          requireAuth: true,
          builder: (context, params) => NavBarPage(
            initialPage: '',
            page: LessonWidget(
              course: params.getParam<CoursesRow>(
                'course',
                ParamType.SupabaseRow,
              ),
              orders: params.getParam<OrdersRow>(
                'orders',
                ParamType.SupabaseRow,
              ),
            ),
          ),
        ),
        FFRoute(
          name: 'completeProfile',
          path: '/completeProfile',
          builder: (context, params) => CompleteProfileWidget(),
        ),
        FFRoute(
          name: 'changeVerify',
          path: '/changeVerify',
          builder: (context, params) => ChangeVerifyWidget(
            phone: params.getParam(
              'phone',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'addCourse',
          path: '/addCourse',
          builder: (context, params) => AddCourseWidget(),
        ),
        FFRoute(
          name: 'editCourse',
          path: '/editCourse',
          builder: (context, params) => EditCourseWidget(
            course: params.getParam<CoursesRow>(
              'course',
              ParamType.SupabaseRow,
            ),
          ),
        ),
        FFRoute(
          name: 'category',
          path: '/category',
          builder: (context, params) => CategoryWidget(
            category: params.getParam<CategoryRow>(
              'category',
              ParamType.SupabaseRow,
            ),
          ),
        ),
        FFRoute(
          name: 'editCatecory',
          path: '/editCatecory',
          builder: (context, params) => EditCatecoryWidget(
            category: params.getParam<CategoryRow>(
              'category',
              ParamType.SupabaseRow,
            ),
          ),
        ),
        FFRoute(
          name: 'pay',
          path: '/pay',
          builder: (context, params) => PayWidget(),
        ),
        FFRoute(
          name: 'Auth1',
          path: '/auth1',
          builder: (context, params) => Auth1Widget(),
        ),
        FFRoute(
          name: 'homePage',
          path: '/homePage',
          requireAuth: true,
          builder: (context, params) => params.isEmpty
              ? NavBarPage(initialPage: 'homePage')
              : HomePageWidget(),
        ),
        FFRoute(
          name: 'teacher',
          path: '/teacher',
          builder: (context, params) => NavBarPage(
            initialPage: '',
            page: TeacherWidget(
              teacher: params.getParam<TeachersRow>(
                'teacher',
                ParamType.SupabaseRow,
              ),
            ),
          ),
        ),
        FFRoute(
          name: 'editTeacher',
          path: '/editTeacher',
          builder: (context, params) => EditTeacherWidget(
            teacher: params.getParam<TeachersRow>(
              'teacher',
              ParamType.SupabaseRow,
            ),
          ),
        ),
        FFRoute(
          name: 'addTeacher',
          path: '/addTeacher',
          builder: (context, params) => AddTeacherWidget(),
        ),
        FFRoute(
          name: 'students',
          path: '/students',
          builder: (context, params) => StudentsWidget(
            course: params.getParam<CoursesRow>(
              'course',
              ParamType.SupabaseRow,
            ),
          ),
        ),
        FFRoute(
          name: 'video2',
          path: '/video2',
          builder: (context, params) => Video2Widget(
            lesson: params.getParam<LessonsRow>(
              'lesson',
              ParamType.SupabaseRow,
            ),
          ),
        )
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState => AppStateNotifier.instance;
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
  void setRedirectLocationIfUnset(String location) =>
      appState.updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(uri.queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.allParams.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, {
    bool isList = false,
    List<String>? collectionNamePath,
  }) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(
      param,
      type,
      isList,
      collectionNamePath: collectionNamePath,
    );
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (context, state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.uri.toString());
            return '/auth1';
          }
          return null;
        },
        pageBuilder: (context, state) {
          fixStatusBarOniOS16AndBelow(context);
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? isWeb
                  ? Container()
                  : Container(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      child: Center(
                        child: Image.asset(
                          'assets/images/Blue_and_Yellow_Elegant_Modern_Class_Academy_Logo.png',
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          height: double.infinity,
                          fit: BoxFit.contain,
                        ),
                      ),
                    )
              : page;

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).buildTransitions(
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ),
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => TransitionInfo(hasTransition: false);
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouterState.of(context).uri.toString();
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}

extension GoRouterLocationExtension on GoRouter {
  String getCurrentLocation() {
    final RouteMatch lastMatch = routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : routerDelegate.currentConfiguration;
    return matchList.uri.toString();
  }
}
