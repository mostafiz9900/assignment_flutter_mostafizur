// Sealed class for representing different API result states
import 'package:get/get.dart';

import '../../app_pkg.dart';

sealed class Result2<T> {
  const Result2._();

  factory Result2.success(T value) = Success<T>;
  factory Result2.error(ApiError error) = Error<T>;
}

class Success<T> extends Result2<T> {
  final T value;
  const Success(this.value) : super._();
}

class Error<T> extends Result2<T> {
  final ApiError error;
  const Error(this.error) : super._();
}

class ApiError {
  final String message;
  ApiError(this.message);
}



