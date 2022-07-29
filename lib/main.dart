import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_212solutionsllc/data/firebase/authentication.dart';
import 'package:task_212solutionsllc/data/firebase/weight.dart';
import 'package:task_212solutionsllc/logic/cubit/authentication_cubit/authentication_cubit.dart';
import 'package:task_212solutionsllc/logic/cubit/wieght_cubit/weight_cubit.dart';
import 'package:task_212solutionsllc/views/home_page/home_page.dart';
import 'package:task_212solutionsllc/views/sign_in/screen/sign_in_screen.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<WeightCubit>(
            create: (_) => WeightCubit(weightRepo: WeightRepo())),
      ],
      child: MaterialApp(
        title: 'Flutter Task',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: StreamBuilder<User?>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: Color.fromARGB(255, 221, 59, 116),
                  ),
                );
              } else if (snapshot.hasError) {
                return const Center(child: Text('Something wrong!!'));
              } else if (snapshot.hasData) {
                // if the user is login
                return const HomePage();
              } else {
                return BlocProvider(
                  create: (context) =>
                      AuthenticationCubit(authentication: Authentication()),
                  child: SignInScreen(),
                );
              }
            }),
      ),
    );
  }
}
