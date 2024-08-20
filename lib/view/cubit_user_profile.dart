import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_bloc/cubit/user_cubit/user_cubit.dart';
import 'package:learn_bloc/cubit/user_cubit/user_cubit_state.dart';
import 'package:learn_bloc/models/user_model.dart';

class CubitUserProfilePage extends StatefulWidget {
  const CubitUserProfilePage({super.key});

  @override
  State<CubitUserProfilePage> createState() => _CubitUserProfilePageState();
}

class _CubitUserProfilePageState extends State<CubitUserProfilePage> {
  @override
  void initState() {
    super.initState();
    context.read<UserCubit>().getAllUserList();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cubit Counter App'),
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