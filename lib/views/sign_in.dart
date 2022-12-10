import 'package:flutter/material.dart';
import 'package:oas_app/api_manager/auth_api_manager.dart';
import 'package:oas_app/models/requests/signin_request.dart';
import 'package:oas_app/models/responses/signin_response.dart';
import 'package:oas_app/models/user.dart';
import 'package:oas_app/services/geo_location_service.dart';
import 'package:oas_app/utils/api_utils.dart';
import 'package:oas_app/utils/app_navigator.dart';
import 'package:oas_app/utils/app_utils.dart';
import 'package:oas_app/views/components/app_bar.dart';
import 'package:oas_app/views/components/button_tiles.dart';
import 'package:oas_app/views/components/component_themes.dart';
import 'package:oas_app/views/components/notification.dart';
import 'package:oas_app/views/components/page_tiles.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  SigninRequest _signinRequest = new SigninRequest();
  bool _isPasswordVisibilityOff = true;
  @override
  void initState() {
    super.initState();
    // NotificationService().initPermissions(context);
  }

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
              PageTiles.getHeaderTile(
                context: context,
                title: "Login",
              ),
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
                          TextFormField(
                            // Todo::Remove pre authentication details
                            // initialValue: "kanishkaudaya99@gmail.com",
                            keyboardType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.done,
                            decoration: ComponentThemes.getInputDecoration(
                              context: context,
                              labelText: "Email Address",
                              hintText: "name@example.com",
                              prefixIcon: Icon(
                                Icons.email,
                              ),
                              suffixIcon: null,
                            ),
                            validator: (String? v) {
                              if (v!.isEmpty) {
                                return "This field is required!";
                              }
                            },
                            onChanged: (value) {
                              setState(() {
                                this._signinRequest.email = value;
                              });
                            },
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            // Todo::Remove pre authentication details
                            // initialValue: "123",
                            obscureText: _isPasswordVisibilityOff,
                            decoration: ComponentThemes.getInputDecoration(
                              context: context,
                              labelText: "Password",
                              hintText: "",
                              prefixIcon: Icon(
                                Icons.password_outlined,
                              ),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    this._isPasswordVisibilityOff =
                                        !this._isPasswordVisibilityOff;
                                  });
                                },
                                icon: Icon(
                                  this._isPasswordVisibilityOff
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
                                this._signinRequest.password = value;
                              });
                            },
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          _buildForgotPasswordField(context),
                          SizedBox(
                            height: 50,
                          ),
                          AppUtils.isCommiunicatingWithApi
                              ? ButtonTiles.getLoadingButtonTile(
                                  context: context)
                              : ButtonTiles.getButtonTile(
                                  context: context,
                                  title: "Login",
                                  onPressed: _loginProcess,
                                ),
                          SizedBox(
                            height: 50,
                          ),
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.center,
                          //   children: [
                          //     Text("Don't have an account yet? "),
                          //     GestureDetector(
                          //       child: Text(
                          //         "SignUp",
                          //         style: TextStyle(
                          //           color: Theme.of(context).primaryColor,
                          //           fontWeight: FontWeight.bold,
                          //         ),
                          //       ),
                          //       onTap: () {
                          //         // AppNavigator.navigateToSignUpPage(
                          //         //   context: context,
                          //         // );
                          //       },
                          //     )
                          //   ],
                          // ),
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
    );
  }

  _buildForgotPasswordField(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        GestureDetector(
          child: Text(
            "Forgot Password",
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          onTap: () async {
            // String url = APIUtils.generateUrl(APIURL.REQUEST_RESET_PASSWORD);
            // if (await canLaunch(url)) {
            //   await launch(
            //     url,
            //     forceSafariVC: false,
            //     forceWebView: false,
            //     // enableJavaScript: true,
            //   );
            // } else {
            //   print("Can't launch");
            // }
          },
        )
      ],
    );
  }

  _loginProcess() async {
    if (this._formKey.currentState!.validate()) {
      setState(() {
        AppUtils.isCommiunicatingWithApi = true;
      });
      AuthAPIManager.defaultAuthAPIManager
          .signinRequest(this._signinRequest)
          .then((SigninResponse? response) {
        setState(() {
          AppUtils.isCommiunicatingWithApi = false;
        });
        if (response!.error != null) {
          AppNotification.showErrorNotificationAlert(
            context: context,
            text: response.error!.errorMessage,
          );
        } else {
          setState(() {
            AppUtils.defaultUser = response.user;
            APIUtils.REQUEST_HEADER_AUTHENTICATED["email"] =
                response.user!.email!;
            APIUtils.REQUEST_HEADER_AUTHENTICATED["employeeId"] =
                "${response.user!.id!}";
          });
          setState(() {
            AppUtils.fromProfilePage = false;
            AppUtils.bottomNavigationBarCurrentIndex = 0;
          });
          AppNavigator.navigateToAttendancePage(context: context);
          GeoLocationService.startLocationChecking();
        }
      });
    }
  }
}
