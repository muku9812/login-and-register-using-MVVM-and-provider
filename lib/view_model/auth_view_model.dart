import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mvvm/model/user_model.dart';
import 'package:mvvm/repository/auth_repository.dart';
import 'package:mvvm/utilities/routes/routes_name.dart';
import 'package:mvvm/utilities/utilities.dart';
import 'package:mvvm/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

class AuthViewMode with ChangeNotifier {
  final _myRepo = AuthRepository();

  bool _loading = false;
  bool get loading => _loading;

  bool _signUpLoading = false;
  bool get signUpLoading => _signUpLoading;

  setLoading(bool value) {
    _signUpLoading = value;
    notifyListeners();
  }

  setSignUpsLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future<void> loginApi(dynamic data, BuildContext context) async {
    setLoading(true);
    _myRepo.loginApi(data).then((value) {
      setLoading(false);
      final userPreference = Provider.of<UserViewModel>(context, listen: false);
      userPreference.saveUser(UserModel(
          token: value['token'].toString(),
          message: value['message'].toString()));
      Utils.snackBar('Login Successful.', context);
      Navigator.pushReplacementNamed(context, RoutesName.home);
      if (kDebugMode) {
        print(value.toString());
      }
    }).onError((error, stackTrace) {
      setLoading(false);
      if (kDebugMode) {
        Utils.toastMessage(error.toString());
        print(error.toString());
      }
    });
  }

  Future<void> signUpApi(dynamic data, BuildContext context) async {
    setSignUpsLoading(true);
    _myRepo.signUpApi(data).then((value) {
      setSignUpsLoading(false);
      Utils.toastMessage('Registration Successful.');
      Navigator.pushReplacementNamed(context, RoutesName.home);
      if (kDebugMode) {
        print(value.toString());
      }
    }).onError((error, stackTrace) {
      setSignUpsLoading(false);
      if (kDebugMode) {
        Utils.toastMessage(error.toString());
        print(error.toString());
      }
    });
  }
}
