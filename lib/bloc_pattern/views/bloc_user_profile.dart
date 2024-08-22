import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_bloc/bloc_cubit/cubit/user_cubit/user_cubit.dart';
import 'package:learn_bloc/bloc_cubit/cubit/user_cubit/user_cubit_state.dart';
import 'package:learn_bloc/bloc_cubit/models/user_model.dart';

class BlocUserProfilePage extends StatefulWidget {
  const BlocUserProfilePage({super.key});

  @override
  State<BlocUserProfilePage> createState() => _BlocUserProfilePageState();
}

class _BlocUserProfilePageState extends State<BlocUserProfilePage> {
  @override
  void initState() {
    super.initState();
    context.read<UserCubit>().getAllUserList();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        title: const Text('Cubit User App'),
        centerTitle: true,
      ),
      body: BlocBuilder<UserCubit, UserCubitState>(
        builder: (context, state){
          if (state is UserCubitLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is UserCubitError) {
            return Center(
              child: Text(state.message.toString()),
            );
          } else if (state is UserCubitDataLoaded) {
            return ListView.builder(
              itemBuilder: (context, itemIndex){
                UserModel userModel = state.userList[itemIndex];
                return ListTile(
                  leading: Text(userModel.id.toString()),
                  title: Text(userModel.name.toString()),
                  subtitle: Text(userModel.email.toString()),
                  trailing: Text('Lat-Long: (${userModel.address!.geo!.lat.toString()}, ${userModel.address!.geo!.lng.toString()})'),
                );
              },
              itemCount: state.userList.length,
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}