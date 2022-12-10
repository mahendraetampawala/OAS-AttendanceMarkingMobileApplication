import 'package:flutter/material.dart';
import 'package:oas_app/utils/app_navigator.dart';
import 'package:oas_app/utils/app_utils.dart';
import 'package:oas_app/views/components/app_bar.dart';
import 'package:oas_app/views/components/button_tiles.dart';
import 'package:oas_app/views/components/component_themes.dart';
import 'package:oas_app/views/components/page_tiles.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final GlobalKey<FormState> _formKeySave = GlobalKey<FormState>();
  bool isViewOnlyState = true;
  // ChangeNickNameRequest _request = ChangeNickNameRequest();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ApplicationBar.getAuthenticatedAppBar(
        context: context,
        pageHeader: "Profile",
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  bottom: 10,
                  left: 30,
                  right: 30,
                  top: 30,
                ),
                child: Column(
                  children: [
                    _buildProfileDetailRow(
                      context: context,
                      title: "Full Name",
                      value: AppUtils.defaultUser!.fullName!,
                    ),
                    _buildProfileDetailRow(
                      context: context,
                      title: "Short Name",
                      value: AppUtils.defaultUser!.shortName!,
                    ),
                    _buildProfileDetailRow(
                      context: context,
                      title: "Gender",
                      value: AppUtils.defaultUser!.genderForDisplay,
                    ),
                    _buildProfileDetailRow(
                      context: context,
                      title: "DOB",
                      value: AppUtils.defaultUser!.email!.split("T")[0],
                    ),
                    _buildProfileDetailRow(
                      context: context,
                      title: "Email Address",
                      value: AppUtils.defaultUser!.email!,
                    ),
                    _buildProfileDetailRow(
                      context: context,
                      title: "Mobile",
                      value: AppUtils.defaultUser!.mobile!,
                    ),
                    _buildProfileDetailRow(
                      context: context,
                      title: "Address",
                      value: AppUtils.defaultUser!.address!,
                    ),
                    _buildProfileDetailRow(
                      context: context,
                      title: "Religion",
                      value: AppUtils.defaultUser!.religion!,
                    ),
                    _buildProfileDetailRow(
                      context: context,
                      title: "Nationality",
                      value: AppUtils.defaultUser!.nationality!,
                    ),
                    _buildProfileDetailRow(
                      context: context,
                      title: "native Language",
                      value: AppUtils.defaultUser!.nativeLanguage!,
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    ButtonTiles.getButtonTile(
                      context: context,
                      title: "Update",
                      onPressed: () {
                        setState(() {
                          isViewOnlyState = false;
                        });
                      },
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    ButtonTiles.getButtonTile(
                      context: context,
                      title: "Change Password",
                      onPressed: () =>
                          AppNavigator.navigateToChangePasswordPage(
                              context: context),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: ApplicationBar.getBottomNavBar(context),
    );
  }

  Widget _buildProfileDetailRow({
    required BuildContext context,
    required String title,
    required String value,
  }) {
    return Column(
      children: [
        TextFormField(
          initialValue: value,
          readOnly: isViewOnlyState,
          keyboardType: title.contains("Email")
              ? TextInputType.emailAddress
              : TextInputType.text,
          textInputAction: TextInputAction.done,
          decoration: ComponentThemes.getInputDecoration(
            context: context,
            labelText: title,
            hintText: title,
          ),
          validator: (String? v) {
            if (v!.isEmpty) {
              return "This field is required!";
            }
          },
          onChanged: (value) {
            setState(() {
              // this._signinRequest.email = value;
            });
          },
        ),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }

  // Widget _buildProfileDetailRow({
  //   required BuildContext context,
  //   required String title,
  //   required String value,
  //   bool showEditButton = false,
  //   VoidCallback? onPressed,
  // }) {
  //   return Column(
  //     children: [
  //       Row(
  //         children: [
  //           Container(
  //             width: (MediaQuery.of(context).size.width - 150) / 2,
  //             child: Text(
  //               title,
  //               style: TextStyle(
  //                 fontSize: 15,
  //                 fontWeight: FontWeight.bold,
  //               ),
  //             ),
  //           ),
  //           Container(
  //             child: Text(
  //               value,
  //               style: TextStyle(
  //                 fontSize: 15,
  //                 fontWeight: FontWeight.w500,
  //               ),
  //             ),
  //           ),
  //           Spacer(),
  //           showEditButton
  //               ? IconButton(
  //                   onPressed: onPressed,
  //                   icon: Icon(
  //                     Icons.drive_file_rename_outline_outlined,
  //                   ),
  //                 )
  //               : Container(),
  //         ],
  //       ),
  //       SizedBox(
  //         height: 20,
  //       ),
  //     ],
  //   );
  // }

  Widget _buildLogoutSection(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          child: Text(
            "Logout",
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          onTap: () async {
            AppUtils.defaultUser = null;
            AppNavigator.navigateToSignInPage(
              context: context,
            );
          },
        )
      ],
    );
  }

  // _saveStateExecution() async {
  //   if (_formKeySave.currentState!.validate()) {
  //     setState(() {
  //       AppUtils.isCommiunicatingWithApi = true;
  //     });
  //     AuthAPIManager.defaultAuthAPIManager
  //         .changeNickName(_request)
  //         .then((value) {
  //       setState(() {
  //         AppUtils.defaultUser!.nickName = _request.nickName;
  //         AppUtils.isCommiunicatingWithApi = false;
  //       });
  //       Navigator.of(context).pop();
  //     });
  //   }
  // }
}
