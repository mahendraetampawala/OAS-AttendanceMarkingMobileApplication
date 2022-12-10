import 'package:flutter/material.dart';
import 'package:oas_app/api_manager/leave_api_manager.dart';
import 'package:oas_app/models/requests/leave_request.dart';
import 'package:oas_app/models/responses/only_error_response.dart';
import 'package:oas_app/utils/app_navigator.dart';
import 'package:oas_app/utils/app_utils.dart';
import 'package:oas_app/views/components/app_bar.dart';
import 'package:oas_app/views/components/button_tiles.dart';
import 'package:oas_app/views/components/component_themes.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:oas_app/views/components/notification.dart';

class LeaveRequestForm extends StatefulWidget {
  const LeaveRequestForm({Key? key}) : super(key: key);

  @override
  State<LeaveRequestForm> createState() => _LeaveRequestFormState();
}

class _LeaveRequestFormState extends State<LeaveRequestForm> {
  final GlobalKey<FormState> _formKeySave = GlobalKey<FormState>();
  LeaveRequest _request = LeaveRequest();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ApplicationBar.getAuthenticatedAppBar(
        context: context,
        pageHeader: "Leave Request Form",
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
                child: Form(
                  key: _formKeySave,
                  child: Column(
                    children: [
                      TextFormField(
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.done,
                        decoration: ComponentThemes.getInputDecoration(
                          context: context,
                          labelText: "Subject",
                          hintText: "Subject",
                        ),
                        validator: (String? v) {
                          if (v!.isEmpty) {
                            return "This field is required!";
                          }
                        },
                        onChanged: (value) {
                          setState(() {
                            this._request.subject = value;
                          });
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.done,
                        decoration: ComponentThemes.getInputDecoration(
                          context: context,
                          labelText: "Reason",
                          hintText: "Reason",
                        ),
                        maxLines: 3,
                        validator: (String? v) {
                          if (v!.isEmpty) {
                            return "This field is required!";
                          }
                        },
                        onChanged: (value) {
                          setState(() {
                            this._request.reason = value;
                          });
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      DateTimePicker(
                        initialValue: '',
                        firstDate: DateTime(1900),
                        lastDate: DateTime(2100),
                        decoration: ComponentThemes.getInputDecoration(
                          context: context,
                          labelText: "From",
                          hintText: "",
                          prefixIcon: null,
                          suffixIcon: null,
                        ),
                        validator: (String? v) {
                          if (v!.isEmpty) {
                            return "This field is required!";
                          }
                        },
                        onChanged: (value) {
                          setState(() {
                            this._request.dateFrom = value;
                          });
                        },
                        onSaved: (val) => print(val),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      DateTimePicker(
                        initialValue: '',
                        firstDate: DateTime(1900),
                        lastDate: DateTime(2100),
                        decoration: ComponentThemes.getInputDecoration(
                          context: context,
                          labelText: "To",
                          hintText: "",
                          prefixIcon: null,
                          suffixIcon: null,
                        ),
                        validator: (String? v) {
                          if (v!.isEmpty) {
                            return "This field is required!";
                          }
                        },
                        onChanged: (value) {
                          setState(() {
                            this._request.dateTo = value;
                          });
                        },
                        onSaved: (val) => print(val),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      AppUtils.isCommiunicatingWithApi
                          ? ButtonTiles.getLoadingButtonTile(context: context)
                          : ButtonTiles.getButtonTile(
                              context: context,
                              title: "Save",
                              onPressed: _saveStateExecution,
                            ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  _saveStateExecution() async {
    if (_formKeySave.currentState!.validate()) {
      setState(() {
        AppUtils.isCommiunicatingWithApi = true;
      });
      _request.requestedEmployeeId = AppUtils.defaultUser!.id;
      LeaveApiManager.defaultApiManager
          .savePost(_request)
          .then((OnlyErrorResponse? response) {
        setState(() {
          AppUtils.isCommiunicatingWithApi = false;
          this._request = new LeaveRequest();
        });
        AppNotification.showSuccessNotificationAlert(
            context: context, message: "Leave Submition Successfull.");
        AppNavigator.navigateToLeavesPage(context: context);
      });
    }
  }
}
