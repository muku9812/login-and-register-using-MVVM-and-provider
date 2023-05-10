import 'package:flutter/foundation.dart';
import 'package:mvvm/data/response/api_resonse.dart';
import 'package:mvvm/model/user_get_model.dart';
import 'package:mvvm/repository/home_repository.dart';

class HomeViewViewModel with ChangeNotifier {
  final _myRepo = HomeRepository();
  ApiResponse<UserGetModel> userList = ApiResponse.loading();
  setUserList(ApiResponse<UserGetModel> response) {
    userList = response;
    notifyListeners();
  }

  Future<void> fetchUserListApi() async {
    setUserList(ApiResponse.loading());

    _myRepo.fetchUserApi().then((value) {
      setUserList(ApiResponse.completed(value));
    }).onError((error, stackTrace) {
      setUserList(ApiResponse.error(error.toString()));
    });
  }
}
