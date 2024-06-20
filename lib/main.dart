
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:routing/routing.dart';
import 'package:stack_trace/stack_trace.dart' as stack_trace;
import 'package:untitled/app_routes.dart';

final ProviderContainer appContainer = ProviderContainer();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  runApp(
    ProviderScope(
      child: const MyApp(),
    ),
  );
  FlutterError.demangleStackTrace = (StackTrace stack) {
    if (stack is stack_trace.Trace) return stack.vmTrace;
    if (stack is stack_trace.Chain) return stack.toTrace().vmTrace;
    return stack;
  };
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {

        // ThemeMode? mode = ref.watch(themeControllerProvider);
        // ThemeManager themeManager = ref.read(themeManagerProvider);
        //
        //
        final goRouter = ref.read(routeUtilProvider)
          ..addRoutes(
            appScreenList,
            redirect: appRedirection,
          );
        //..addRedirection(appRedirection)
        //..initRouter();
        return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            // theme: themeManager.lightTheme,
            // darkTheme: themeManager.darkTheme,
            themeMode:
            //mode ??
                ThemeMode.light,

            builder: (context, child) {
              return ScrollConfiguration(
                behavior: MyBehavior(),
                child: child!,
              );
            },
            routeInformationParser: goRouter.router.routeInformationParser,
            routerDelegate: goRouter.router.routerDelegate);
      },
    );
  }
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}

