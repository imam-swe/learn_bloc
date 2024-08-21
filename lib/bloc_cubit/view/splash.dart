// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class SplashScreen extends StatelessWidget {
//   const SplashScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     context.read<AuthBloc>().add(DoRouteEvent());
//     return Scaffold(
//       body: BlocListener<AuthBloc, AuthState>(
//         listener: (context, state) {
//           if (state is RouteDashboardState) {
//             Navigator.pushReplacement(context, CupertinoPageRoute(builder: (_)=> const DashboardScreen()));
//           } else if (state is RouteLoginState) {
//             Navigator.pushReplacement(context, CupertinoPageRoute(builder: (_)=> const LoginScreen()));
//           }
//         },
//         child: Center(
//           child: Text("Initializing..",style: TextStyle(
//             fontStyle: FontStyle.italic,
//             color: Theme.of(context).colorScheme.surface,
//           ),),
//           /*child: Image.asset(
//             "assets/images/logo.png",
//             height: 90,
//             width: 90,
//           ),*/
//         ),
//       ),
//     );
//   }
// }