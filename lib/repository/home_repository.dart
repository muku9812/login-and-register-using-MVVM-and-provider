import 'package:mvvm/data/network/baseApiServices.dart';
import 'package:mvvm/data/network/networkApiServices.dart';
import 'package:mvvm/model/user_get_model.dart';
import 'package:mvvm/resources/app_url.dart';

class HomeRepository {
  final BaseApiServices _apiServices = NetworkApiService();

  Future<UserGetModel> fetchUserApi() async {
    try {
      dynamic response = await _apiServices.getGetApiResponse(AppUrl.users);
      return response = UserGetModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}
