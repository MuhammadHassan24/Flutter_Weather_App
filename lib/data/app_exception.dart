class AppException implements Exception {
  final _massege;
  final _perfix;

  AppException([this._massege, this._perfix]);

  String toString() {
    return "$_perfix$_massege";
  }
}

class FetchDataException extends AppException {
  FetchDataException([String? massege])
      : super(massege, "Error During Communication");
}

class BadRequisedException extends AppException {
  BadRequisedException([String? massege]) : super(massege, "InValid Exception");
}

class UnauthorizedException extends AppException {
  UnauthorizedException([String? massege])
      : super(massege, "Unauthorized Request");
}

class InvalidInputException extends AppException {
  InvalidInputException([String? massege]) : super(massege, "Invalid Input");
}
