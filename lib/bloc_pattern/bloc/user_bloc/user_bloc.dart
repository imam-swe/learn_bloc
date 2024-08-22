import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_bloc/bloc_pattern/bloc/user_bloc/user_event.dart';
import 'package:learn_bloc/bloc_pattern/bloc/user_bloc/user_state.dart';
import 'package:learn_bloc/bloc_pattern/models/user_model.dart';
import 'package:learn_bloc/bloc_pattern/services/api_service.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  List<UserModel> userModelList = [];

  UserBloc() : super(UserInit()) {

    ApiService _apiService = ApiService();
    on<GetAllUserList>((event, emit) async {

      try {
        emit(UserLoading());
        userModelList = await _apiService.getData();
        emit(UserDataLoaded(userModelList));
      } catch (e) {
        emit(UserError(e.toString()));
      }
    });
  }

}