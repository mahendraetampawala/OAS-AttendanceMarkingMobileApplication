import 'package:flutter/material.dart';
import 'package:oas_app/models/error.dart';

class OnlyErrorResponse {
  Error? _error;

  OnlyErrorResponse();

  OnlyErrorResponse.all({
    @required Error? error,
  }) {
    this._error = error;
  }

  factory OnlyErrorResponse.fromJson(Map<String, dynamic> json) {
    OnlyErrorResponse response = new OnlyErrorResponse();
    if (json['error'] != null) {
      response.error = new Error.fromJson(json['error']);
    }
    return response;
  }

  Error? get error => this._error;

  set error(Error? error) => this._error = error;
}
