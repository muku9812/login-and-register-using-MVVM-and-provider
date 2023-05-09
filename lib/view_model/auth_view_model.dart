import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mvvm/repository/auth_repository.dart';
import 'package:mvvm/utilities/routes/routes_name.dart';
import 'package:mvvm/utilities/utilities.dart';

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
      Utils.snackBar('Login Successful.', context);
      Navigator.pushNamed(context, RoutesName.home);
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
      Navigator.pushNamed(context, RoutesName.home);
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
