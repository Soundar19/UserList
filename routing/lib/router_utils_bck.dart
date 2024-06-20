// part of routing;
//
// class AppScreen {
//   String name;
//   String path;
//   Function(dynamic)? callback;
//   Page<dynamic> Function(BuildContext context, GoRouterState state) builder;
//
//   AppScreen(this.name, this.path, this.builder, {this.callback});
// }
//
// class RouteUtils {
//   late GoRouter _router;
//   final List<GoRoute> _routes = [];
//   final List<AppScreen> _appScreen = [];
//   late final FutureOr<String?> Function(
//       BuildContext context, GoRouterState state) _redirect;
//
//   get router => _router;
//
//   addRoutes(List<AppScreen> items) {
//     if (_routes.isEmpty) {
//       _appScreen.addAll(items);
//       _routes.addAll(items
//           .map<GoRoute>((e) => GoRoute(
//                 path: e.path,
//                 name: e.name,
//                 pageBuilder: (context, state) => e.builder(context, state),
//               ))
//           .toList());
//       initRouter();
//     }
//   }
//
//   addRedirection(
//       FutureOr<String?> Function(BuildContext context, GoRouterState state)
//           redirect) {
//     //_redirect = redirect;
//   }
//
//   initRouter() {
//     _router = GoRouter(
//       ///Reference [https://github.com/csells/go_router/discussions/122#discussioncomment-1960950]
//       //refreshListenable: GoRouterRefreshStream(refreshStream!),
//       debugLogDiagnostics: true,
//       routerNeglect: true,
//       routes: _routes,
//       //redirect: _redirect,
//       observers: [AppRouteObserver()],
//       errorPageBuilder: (context, state) => MaterialPage<void>(
//         key: state.pageKey,
//         child: Center(child: Text(state.error.toString())),
//       ),
//     );
//   }
//
//   Future<T?> pushNamed<T>(String name,
//       {Map<String, String> params = const <String, String>{},
//       Map<String, dynamic> queryParams = const <String, dynamic>{},
//       Object? extra,
//       callback}) {
//     debugPrint("Set callback SET: ${callback.hashCode}");
//     return _router.pushNamed(name,
//         params: params, queryParams: queryParams, extra: extra);
//   }
//
//   pushReplacedName<T>(
//     String name, {
//     Map<String, String> params = const <String, String>{},
//     Map<String, dynamic> queryParams = const <String, dynamic>{},
//     Object? extra,
//   }) {
//     _router.pushReplacementNamed(name,
//         params: params, queryParams: queryParams, extra: extra);
//   }
//
//   pop(result) {
//     debugPrint("pop: $result");
//     AppScreen screen = _appScreen.firstWhere((element) {
//       return "/${element.name}" == _router.location;
//     });
//     screen.callback?.call(result);
//     return _router.pop(result);
//   }
//
//   void pushNamedAndRemoveUntil(String name) {
//     while (_router.canPop()) {
//       _router.pop();
//     }
//     _router.pushReplacementNamed(name);
//   }
//
//   //in case require for web where path is consider for location
//   _push(
//     String path,
//     Object? extra,
//   ) {
//     _router.push(path, extra: extra);
//   }
// }
//
// class AppRouteObserver extends RouteObserver {
//   @override
//   void didPop(Route route, Route? previousRoute) {
//     super.didPop(route, previousRoute);
//   }
// }
//
// final routeUtilProvider = Provider(
//   (ref) => RouteUtils(),
//   name: 'routeProvider',
// );
//
// final goRouterProvider = Provider<GoRouter>((ref) {
//   var routes = ref.watch(routingControllerProvider);
//   var refreshStream = ref.read(refreshStreamProvider);
//   return GoRouter(
//     ///Reference [https://github.com/csells/go_router/discussions/122#discussioncomment-1960950]
//     refreshListenable: GoRouterRefreshStream(refreshStream!),
//     debugLogDiagnostics: true,
//     routerNeglect: true,
//     routes: routes,
//     observers: [RouteObserver()],
//     errorPageBuilder: (context, state) => MaterialPage<void>(
//       key: state.pageKey,
//       child: Center(child: Text(state.error.toString())),
//     ),
//     redirect: (context, state) {
//       for (var value
//           in ref.read(routingControllerProvider.notifier).redirectConditions) {
//         var data = value(state);
//         if (data != null) return data;
//       }
//       return null;
//     },
//   );
// });
