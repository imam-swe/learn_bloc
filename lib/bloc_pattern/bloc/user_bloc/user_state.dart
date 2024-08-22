import 'package:equatable/equatable.dart';
import 'package:learn_bloc/bloc_pattern/models/user_model.dart';

abstract class UserState extends Equatable {

}

class UserInit extends UserState {
  @override
  List<Object?> get props => [];

}

class UserLoading extends UserState {
  @override
  List<Object?> get props => [];

}

class UserDataLoaded extends UserState {
  List<UserModel> userModelList;

  UserDataLoaded(this.userModelList);
  @override
  List<Object?> get props => [userModelList];

}

class UserError extends UserState {
  String message;

  UserError(this.message);

  @override
  List<Object?> get props => [message];

}

