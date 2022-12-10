import 'package:flutter/material.dart';
import 'package:oas_app/utils/app_utils.dart';
import 'package:oas_app/views/components/app_bar.dart';
import 'package:oas_app/views/components/button_tiles.dart';
import 'package:oas_app/views/components/component_themes.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  // ChangePasswordRequest _request = new ChangePasswordRequest();
  bool _isCurrentPasswordVisibilityOff = true;
  bool _isRePasswordVisibilityOff = true;
  bool _isNewPasswordVisibilityOff = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ApplicationBar.getDefaultAppBar(
        context: context,
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 30,
                    ),
                    width: MediaQuery.of(context).size.width,
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(
                            height: 100,
                          ),
                          TextFormField(
                              obscureText: _isCurrentPasswordVisibilityOff,
                              decoration: ComponentThemes.getInputDecoration(
                                context: context,
                                labelText: "Current Password",
                                hintText: "",
                                prefixIcon: Icon(
                                  Icons.password_outlined,
                                ),
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      this._isCurrentPasswordVisibilityOff =
                                          !this._isCurrentPasswordVisibilityOff;
                                    });
                                  },
                                  icon: Icon(
                                    this._isCurrentPasswordVisibilityOff
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                  ),
                                ),
                              ),
                              validator: (String? v) {
                                if (v!.isEmpty) {
                                  return "This field is required!";
                                }
                              },
                              onChanged: (value) {
                                setState(() {
                                  // this._request.oldPassword = value;
                                });
                              }),
                          SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                              obscureText: _isNewPasswordVisibilityOff,
                              decoration: ComponentThemes.getInputDecoration(
                                context: context,
                                labelText: "New Password",
                                hintText: "",
                                prefixIcon: Icon(
                                  Icons.password_outlined,
                                ),
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      this._isNewPasswordVisibilityOff =
                                          !this._isNewPasswordVisibilityOff;
                                    });
                                  },
                                  icon: Icon(
                                    this._isNewPasswordVisibilityOff
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                  ),
                                ),
                              ),
                              validator: (String? v) {
                                if (v!.isEmpty) {
                                  return "This field is required!";
                                }
                              },
                              onChanged: (value) {
                                setState(() {
                                  // this._request.newPassword = value;
                                });
                              }),
                          SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                              obscureText: _isRePasswordVisibilityOff,
                              decoration: ComponentThemes.getInputDecoration(
                                context: context,
                                labelText: "Re-Type Password",
                                hintText: "",
                                prefixIcon: Icon(
                                  Icons.password_outlined,
                                ),
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      this._isRePasswordVisibilityOff =
                                          !this._isRePasswordVisibilityOff;
                                    });
                                  },
                                  icon: Icon(
                                    this._isRePasswordVisibilityOff
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                  ),
                                ),
                              ),
                              validator: (String? v) {
                                if (v!.isEmpty) {
                                  return "This field is required!";
                                }
                                //  else if (v != this._request.newPassword) {
                                //   return "Password does not match!";
                                // }
                              },
                              onChanged: (value) {}),
                          SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          AppUtils.isCommiunicatingWithApi
                              ? ButtonTiles.getLoadingButtonTile(
                                  context: context)
                              : ButtonTiles.getButtonTile(
                                  context: context,
                                  title: "Update",
                                  onPressed: _sendRequest,
                                ),
                          SizedBox(
                            height: 50,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      // bottomNavigationBar: ApplicationBar.getBottomNavBar(context),
    );
  }

  _sendRequest() async {
    // if (this._formKey.currentState!.validate()) {
    //   setState(() {
    //     AppUtils.isCommiunicatingWithApi = true;
    //   });
    //   AuthAPIManager.defaultAuthAPIManager
    //       .changePassword(this._request)
    //       .then((OnlyErrorResponse? response) {
    //     setState(() {
    //       AppUtils.isCommiunicatingWithApi = false;
    //     });
    //     if (response!.error != null) {
    //       AppNotification.showErrorNotificationAlert(
    //         context: context,
    //         text: response.error!.errorMessage,
    //       );
    //     } else {
    //       AppNotification.showSuccessNotificationAlert(
    //         context: context,
    //       );
    //     }
    //   });
    // }
  }
}
