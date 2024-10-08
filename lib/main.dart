import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:learn_bloc/bloc_cubit/cubit/counter_cubit/counter_cubit.dart';
// import 'package:learn_bloc/bloc_cubit/cubit/user_cubit/user_cubit.dart';
// import 'package:learn_bloc/bloc_cubit/services/api_service.dart';
// import 'package:learn_bloc/bloc_cubit/view/cubit_counter_app.dart';
import 'package:learn_bloc/bloc_pattern/bloc/counter_bloc/counter_bloc.dart';
import 'package:learn_bloc/bloc_pattern/bloc/user_bloc/user_bloc.dart';
import 'package:learn_bloc/bloc_pattern/views/bloc_counter_app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider( //!Bloc Pattern
      providers: [
        BlocProvider<CounterBloc>(
          create: (context) => CounterBloc(),
        ),
        BlocProvider<UserBloc>(
          create: (context) => UserBloc(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          // useMaterial3: true,
          primarySwatch: Colors.blue
        ),
        debugShowCheckedModeBanner: false,
        home: const BlocCounterAppPage(),
      ),
    );
    // return MultiBlocProvider( //!Bloc Cubit
    //   providers: [
    //     BlocProvider(create: (context) => CounterCubit()),
    //     BlocProvider(create: (context) => UserCubit(apiService: ApiService())),
    //   ], 
    //   child: MaterialApp(
    //     theme: ThemeData(
    //       colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
    //       useMaterial3: true,
    //       primarySwatch: Colors.blue
    //     ),
    //     debugShowCheckedModeBanner: false,
    //     home: const CubitCounterAppPage(),
    //   ),
    // );
  }
}


