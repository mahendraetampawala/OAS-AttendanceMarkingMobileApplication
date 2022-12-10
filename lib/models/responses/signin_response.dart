import 'package:flutter/material.dart';
import 'package:oas_app/models/error.dart';
import 'package:oas_app/models/user.dart';

class SigninResponse {
  Error? _error;
  User? _user;

  SigninResponse();

  SigninResponse.all({
    @required Error? error,
    @required User? user,
  }) {
    this._error = error;
    this._user = user;
  }

  factory SigninResponse.fromJson(Map<String, dynamic> json) {
    SigninResponse response = new SigninResponse();
    if (json['error'] != null) {
      response.error = new Error.fromJson(json['error']);
    }
    if (json['user'] != null) {
      response.user = new User.fromJson(json['user']);
    }
    return response;
  }

  User? get user => this._user;

  set user(User? user) => this._user = user;

  Error? get error => this._error;

  set error(Error? error) => this._error = error;
}
