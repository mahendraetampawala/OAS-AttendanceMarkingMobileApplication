import 'package:flutter/material.dart';
import 'package:oas_app/views/attendance_view.dart';
import 'package:oas_app/views/change_password.dart';
import 'package:oas_app/views/leave_request_form.dart';
import 'package:oas_app/views/leaves_view.dart';
import 'package:oas_app/views/mark_attendance.dart';
import 'package:oas_app/views/profile.dart';
import 'package:oas_app/views/sign_in.dart';

class Routes {
  static const String ROUTES_HOME = '/';
  static const String ROUTES_SIGNIN = '/signin';
  static const String ROUTES_ATTENDANCE = '/attendance';
  static const String ROUTES_PROFILE = "/profile";
  static const String ROUTES_CHANGE_PASSWORD = "/change-password";
  static const String ROUTES_MARK_ATTENDANCE = "/mark-attendance";
  static const String ROUTES_LEAVES = "/leaves";
  static const String ROUTES_LEAVE_REQUEST_FORM = "/leave-request-form";
  // static const String ROUTES_DAILY_THOUGHT_SET_REMINDER =
  //     "/daily-thoughts-set-reminder";
  // static const String ROUTES_QUESTIONAIRE = "/questionaire";
  // static const String ROUTES_ANXIETY_DETAILS = "/anxiety-details";
  // static const String ROUTES_ARTICLES_PLAIN = "/articles-plain";
  // static const String ROUTES_ARTICLES_YOUTUBE = "/articles-youtube";
  // static const String ROUTES_DAILY_THOUGHTS = "/daily-thoughts";
  // static const String ROUTES_PAST_DAILY_THOUGHTS = "/past-daily-thoughts";
  // static const String ROUTES_ADD_DAILY_THOUGHTS = "/add-daily-thoughts";
  // static const String ROUTES_COMMUNITY = "/community";
  // static const String ROUTES_COMMUNITY_ADD_POST = "/community-add-post";
  // static const String ROUTES_EXERCISES = "/exercises";
  // static const String ROUTES_BREATHING_EXERCISES_NAVIGATION =
  //     "/breathing-exercises-navigation";
  // static const String ROUTES_POSITIVITY_GAME = "/positivity-game";
  // static const String ROUTES_DASHBOARD = "/dashboard";
  static final Map<String, WidgetBuilder> routes = getRoutes();

  static final RouteFactory onUnknownRoute = (RouteSettings settings) {
    return MaterialPageRoute(builder: ((BuildContext context) => SignIn()));
  };

  static Map<String, WidgetBuilder> getRoutes() {
    return <String, WidgetBuilder>{
      ROUTES_HOME: (BuildContext context) => SignIn(),
      ROUTES_SIGNIN: (BuildContext context) => SignIn(),
      ROUTES_ATTENDANCE: (BuildContext context) => AttendanceView(),
      ROUTES_PROFILE: (BuildContext context) => Profile(),
      ROUTES_CHANGE_PASSWORD: (BuildContext context) => ChangePassword(),
      ROUTES_MARK_ATTENDANCE: (BuildContext context) => MarkAttendance(),
      ROUTES_LEAVES: (BuildContext context) => LeavesView(),
      ROUTES_LEAVE_REQUEST_FORM: (BuildContext context) => LeaveRequestForm(),
      // ROUTES_QUESTIONAIRE: (BuildContext context) => Questionaire(),
      // ROUTES_DAILY_THOUGHT_SET_REMINDER: (BuildContext context) =>
      //     DailyThoughtSetReminder(),
      // ROUTES_ANXIETY_DETAILS: (BuildContext context) => AnxietyDetails(),
      // ROUTES_ARTICLES_PLAIN: (BuildContext context) => PlainArticles(),
      // ROUTES_ARTICLES_YOUTUBE: (BuildContext context) => YoutubeArticles(),
      // ROUTES_DAILY_THOUGHTS: (BuildContext context) => DailyThoughts(),
      // ROUTES_PAST_DAILY_THOUGHTS: (BuildContext context) => PastDailyThoughts(),
      // ROUTES_ADD_DAILY_THOUGHTS: (BuildContext context) => AddThoughts(),
      // ROUTES_COMMUNITY: (BuildContext context) => Community(),
      // ROUTES_COMMUNITY_ADD_POST: (BuildContext context) => AddPost(),
      // ROUTES_EXERCISES: (BuildContext context) => Exercises(),
      // ROUTES_BREATHING_EXERCISES_NAVIGATION: (BuildContext context) =>
      //     BreathingExercisesNavigation(),
      // ROUTES_POSITIVITY_GAME: (BuildContext context) => PositivityGame(),
      // ROUTES_DASHBOARD: (BuildContext context) => Dashboard(),
    };
  }
}
