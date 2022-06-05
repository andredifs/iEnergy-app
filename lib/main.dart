import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ienergy_app/firebase_options.dart';
import 'package:ienergy_app/providers/customer_provider.dart';
import 'package:ienergy_app/responsive/mobile_screen_layout.dart';
import 'package:ienergy_app/screens/login.dart';
import 'package:ienergy_app/utils/colors.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => CustomerProvider())],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'iEnergy',
          theme: ThemeData(
            primarySwatch: Colors.green,
          ),
          home: StreamBuilder(
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.active) {
                  if (snapshot.hasData) {
                    return const MobileScreenLayout();
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text('${snapshot.error}'),
                    );
                  }
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: primaryColor,
                    ),
                  );
                }
                return const LoginScreen();
              },
              stream: FirebaseAuth.instance.authStateChanges())),
    );
  }
}
