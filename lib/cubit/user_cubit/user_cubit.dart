import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_bloc/cubit/user_cubit/user_cubit_state.dart';
import 'package:learn_bloc/models/user_model.dart';
import 'package:learn_bloc/services/api_service.dart';

class UserCubit extends Cubit<UserCubitState> {
  List<UserModel> userList = [];
  ApiService apiService;
  UserCubit({required this.apiService}) : super(UserCubitInit());
  
  void getAllUserList() async{
    try {
      emit(UserCubitLoading());
      userList = await apiService.getData();
      emit(UserCubitDataLoaded(userList: userList));
    } catch(e){
      emit(UserCubitError(message: e.toString()));
    }
  }
}