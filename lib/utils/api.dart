import 'dart:io';

import 'package:graphql_flutter/graphql_flutter.dart';

class Response<T> {
  Status status;
  T data;
  String message;

  Response.initial([this.message]) : status = Status.INITIAL;

  Response.loading(this.message) : status = Status.LOADING;

  Response.completed(this.data) : status = Status.COMPLETED;

  Response.error(this.message) : status = Status.ERROR;

  @override
  String toString() {
    return "Status : $status \n Message : $message \n Data : $data";
  }
}

enum Status { INITIAL, LOADING, COMPLETED, ERROR }

class AppException implements Exception {
  final _message;
  final _prefix;

  AppException([this._message, this._prefix]);

  String toString() {
    return "$_prefix$_message";
  }
}

class FetchDataException extends AppException {
  FetchDataException([String message]) : super(message, "Error:- ");
}

class BadRequestException extends AppException {
  BadRequestException([message]) : super(message, "Invalid Request:- ");
}

class UnauthorisedException extends AppException {
  UnauthorisedException([message]) : super(message, "Unauthorised Request:- ");
}

class InvalidInputException extends AppException {
  InvalidInputException([String message]) : super(message, "Invalid Input:- ");
}

void throwOperationError(OperationException operationException) {
  throw FetchDataException(operationException.graphqlErrors.length != 0
      ? operationException.graphqlErrors[0].message
      //   socket exception exposes our graphql endpoint and we dont want that
      : operationException.linkException.originalException is SocketException
          ? "NetworkError when attempting to fetch resource."
          : operationException.linkException.originalException.message);
}
