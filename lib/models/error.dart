import 'package:flutter/material.dart';

class Error {
  String? _errorMessage;
  int? _errorCode;
  bool? _displayable;

  Error();

  Error.all({
    @required String? errorMessage,
    @required int? errorCode,
    @required bool? displayable,
  }) {
    this._errorMessage = errorMessage;
    this._errorCode = errorCode;
    this._displayable = displayable;
  }

  factory Error.fromJson(Map<String, dynamic> json) => Error.all(
        errorMessage: json['errorMessage'],
        errorCode: json['errorCode'],
        displayable: json['displayable'],
      );

  String? get errorMessage => this._errorMessage;

  set errorMessage(String? errorMessage) => this._errorMessage = errorMessage;

  int? get errorCode => this._errorCode;

  set errorCode(int? errorCode) => this._errorCode = errorCode;

  bool? get displayable => this._displayable;

  set displayable(bool? displayable) => this._displayable = displayable;

  @override
  String toString() {
    return "Error{_errorMessage:$_errorMessage,_errorCode:$_errorCode,_displayable:$_displayable}";
  }
}
