import 'package:equatable/equatable.dart';
import 'package:learn_bloc/models/user_model.dart';

abstract class UserCubitStae extends Equatable {
  const UserCubitStae();
}

class UserCubitInit extends UserCubitStae {
  @override
  // TODO: implement props
  List<Object?> get props => [];

}

class UserCubitLoading extends UserCubitStae {
  @override
  // TODO: implement props
  List<Object?> get props => [];

}

class UserCubitDataLoaded extends UserCubitStae {
  List<UserModel> userList;

  UserCubitDataLoaded({required this.userList});
  @override
  // TODO: implement props
  List<Object?> get props => [userList];

}

class UserCubitError extends UserCubitStae {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}