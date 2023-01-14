import 'package:add_lease/presentation/add_lease_view/add_lease_screen.dart';
import 'package:add_lease/presentation/provider/lease_provider/lease_provider.dart';
import 'package:add_lease/presentation/provider/my_leases_provider/my_leases_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'app/core/utils/app_strings.dart';
import 'app/theme/light_theme.dart';
import 'di.dart' as di;

Future<void> main() async {


  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarBrightness: Brightness.light,
      statusBarColor: Colors.transparent));

  await di.init();


  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => di.sl<LeaseProvider>()),
    ChangeNotifierProvider(create: (context) => di.sl<MyLeasesProvider>()),
  ],
    child: const MyApp(),));


}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppStrings.appName,
      theme: light,
      home: const AddLeaseScreen(),
    );
  }
}

