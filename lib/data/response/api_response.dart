import 'package:weatherapp/data/response/status.dart';

class ApiResponse<T> {
  Status? status;
  T? data;
  String? messege;

  ApiResponse(this.status, this.data, this.messege);

  ApiResponse.loading() : status = Status.LOADING;

  ApiResponse.complete() : status = Status.COMPLETE;

  ApiResponse.error() : status = Status.ERROR;

  @override
  String toString() {
    return "Status : $status \n Message : $messege \n Data : $data";
  }
}
