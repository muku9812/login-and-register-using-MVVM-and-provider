import 'package:mvvm/data/response/status.dart';

class ApiResponse<T> {
  Status? status;
  T? data;
  String message;

  ApiResponse(this.status, this.data, this.message);

  ApiResponse.loading()
      : status = Status.LOADING,
        data = null,
        message = "";
  ApiResponse.completed(T data)
      : status = Status.COMPLETED,
        // ignore: prefer_initializing_formals
        data = data,
        message = "";
  ApiResponse.error(String message)
      : status = Status.ERROR,
        data = null,
        // ignore: prefer_initializing_formals
        message = message;

  @override
  String toString() {
    return "status: $status \n Message: $message \n Data: $data";
  }
}
