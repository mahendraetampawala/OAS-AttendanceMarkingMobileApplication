class SigninRequest {
  String? _email;
  String? _password;

  SigninRequest();

  SigninRequest.user({
    required String? email,
    required String? password,
  }) {
    this._email = email;
    this._password = password;
  }

  Map<String, String> toJson() => {
        "email": this._email.toString(),
        "password": this._password.toString(),
      };

  String? get email => this._email;

  set email(String? email) => this._email = email;

  String? get password => this._password;

  set password(String? password) => this._password = password;

  @override
  String toString() {
    return "SignUpRequest{_email:$email,_password:$_password}";
  }
}
