import 'package:equatable/equatable.dart';
import 'package:learn_bloc/bloc_cubit/models/user_model.dart';

abstract class UserCubitState extends Equatable {
  const UserCubitState();
}

class UserCubitInit extends UserCubitState {
  @override
  // TODO: implement props
  List<Object?> get props => [];

}

class UserCubitLoading extends UserCubitState {
  @override
  // TODO: implement props
  List<Object?> get props => [];

}

class UserCubitDataLoaded extends UserCubitState {
  final List<UserModel> userList;

  const UserCubitDataLoaded({required this.userList});
  @override
  List<Object?> get props => [userList];

}

class UserCubitError extends UserCubitState {
  final String message;
  const UserCubitError({required this.message});
  @override
  List<Object?> get props => [message];

}