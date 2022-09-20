// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Pulsedin`
  String get appName {
    return Intl.message(
      'Pulsedin',
      name: 'appName',
      desc: '',
      args: [],
    );
  }

  /// `Something went wrong. Please try again.`
  String get genericError {
    return Intl.message(
      'Something went wrong. Please try again.',
      name: 'genericError',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your password`
  String get enterPassword {
    return Intl.message(
      'Please enter your password',
      name: 'enterPassword',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your confirm password`
  String get enterConfirmPassword {
    return Intl.message(
      'Please enter your confirm password',
      name: 'enterConfirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `Email can't be empty`
  String get emptyEmailMessage {
    return Intl.message(
      'Email can\'t be empty',
      name: 'emptyEmailMessage',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid email`
  String get enterValidEmail {
    return Intl.message(
      'Please enter a valid email',
      name: 'enterValidEmail',
      desc: '',
      args: [],
    );
  }

  /// `Error`
  String get error {
    return Intl.message(
      'Error',
      name: 'error',
      desc: '',
      args: [],
    );
  }

  /// `SUCCESS`
  String get success {
    return Intl.message(
      'SUCCESS',
      name: 'success',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `404 Forbidden`
  String get forbidden {
    return Intl.message(
      '404 Forbidden',
      name: 'forbidden',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get search {
    return Intl.message(
      'Search',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `500 Server Broken`
  String get serverBroken {
    return Intl.message(
      '500 Server Broken',
      name: 'serverBroken',
      desc: '',
      args: [],
    );
  }

  /// `Too many requests`
  String get tooManyRequests {
    return Intl.message(
      'Too many requests',
      name: 'tooManyRequests',
      desc: '',
      args: [],
    );
  }

  /// `405 Method Not Allowed`
  String get methodNotAllowed {
    return Intl.message(
      '405 Method Not Allowed',
      name: 'methodNotAllowed',
      desc: '',
      args: [],
    );
  }

  /// `Please check your internet connection`
  String get checkYourInternetConnection {
    return Intl.message(
      'Please check your internet connection',
      name: 'checkYourInternetConnection',
      desc: '',
      args: [],
    );
  }

  /// `Submit`
  String get submit {
    return Intl.message(
      'Submit',
      name: 'submit',
      desc: '',
      args: [],
    );
  }

  /// `Un Authenticated`
  String get unauthenticated {
    return Intl.message(
      'Un Authenticated',
      name: 'unauthenticated',
      desc: '',
      args: [],
    );
  }

  /// `For Educators`
  String get forEducators {
    return Intl.message(
      'For Educators',
      name: 'forEducators',
      desc: '',
      args: [],
    );
  }

  /// `Our mission is to provide industry-leading educational and interactive tools.`
  String get ourMissionIs {
    return Intl.message(
      'Our mission is to provide industry-leading educational and interactive tools.',
      name: 'ourMissionIs',
      desc: '',
      args: [],
    );
  }

  /// `Educators`
  String get educators {
    return Intl.message(
      'Educators',
      name: 'educators',
      desc: '',
      args: [],
    );
  }

  /// `Enter your password`
  String get enterYourPassword {
    return Intl.message(
      'Enter your password',
      name: 'enterYourPassword',
      desc: '',
      args: [],
    );
  }

  /// `Enter your email`
  String get enterYourEmail {
    return Intl.message(
      'Enter your email',
      name: 'enterYourEmail',
      desc: '',
      args: [],
    );
  }

  /// `Forget password?`
  String get forgetPassword {
    return Intl.message(
      'Forget password?',
      name: 'forgetPassword',
      desc: '',
      args: [],
    );
  }

  /// `Dashboard`
  String get dashboard {
    return Intl.message(
      'Dashboard',
      name: 'dashboard',
      desc: '',
      args: [],
    );
  }

  /// `Classroom`
  String get classroom {
    return Intl.message(
      'Classroom',
      name: 'classroom',
      desc: '',
      args: [],
    );
  }

  /// `Create Classroom`
  String get createClassroom {
    return Intl.message(
      'Create Classroom',
      name: 'createClassroom',
      desc: '',
      args: [],
    );
  }

  /// `You don't have classrooms yet. Click the add button to create one.`
  String get classroomEmptyText {
    return Intl.message(
      'You don\'t have classrooms yet. Click the add button to create one.',
      name: 'classroomEmptyText',
      desc: '',
      args: [],
    );
  }

  /// `Enter your classroom name`
  String get enterYourClassName {
    return Intl.message(
      'Enter your classroom name',
      name: 'enterYourClassName',
      desc: '',
      args: [],
    );
  }

  /// `Sure Pass`
  String get surePass {
    return Intl.message(
      'Sure Pass',
      name: 'surePass',
      desc: '',
      args: [],
    );
  }

  /// `Intense PREP`
  String get intensePREP {
    return Intl.message(
      'Intense PREP',
      name: 'intensePREP',
      desc: '',
      args: [],
    );
  }

  /// `Students list`
  String get studentsList {
    return Intl.message(
      'Students list',
      name: 'studentsList',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Students`
  String get students {
    return Intl.message(
      'Students',
      name: 'students',
      desc: '',
      args: [],
    );
  }

  /// `No data available`
  String get noDataAvailable {
    return Intl.message(
      'No data available',
      name: 'noDataAvailable',
      desc: '',
      args: [],
    );
  }

  /// `Id :`
  String get id {
    return Intl.message(
      'Id :',
      name: 'id',
      desc: '',
      args: [],
    );
  }

  /// `Name :`
  String get name {
    return Intl.message(
      'Name :',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `No of Students :`
  String get noOfStudents {
    return Intl.message(
      'No of Students :',
      name: 'noOfStudents',
      desc: '',
      args: [],
    );
  }

  /// `Assignments :`
  String get assignments {
    return Intl.message(
      'Assignments :',
      name: 'assignments',
      desc: '',
      args: [],
    );
  }

  /// `Average Score :`
  String get averageScore {
    return Intl.message(
      'Average Score :',
      name: 'averageScore',
      desc: '',
      args: [],
    );
  }

  /// `Classroom Detail`
  String get classroomDetail {
    return Intl.message(
      'Classroom Detail',
      name: 'classroomDetail',
      desc: '',
      args: [],
    );
  }

  /// `Enter the email address associated with your account`
  String get enterEmail {
    return Intl.message(
      'Enter the email address associated with your account',
      name: 'enterEmail',
      desc: '',
      args: [],
    );
  }

  /// `Verify Now`
  String get verifyNow {
    return Intl.message(
      'Verify Now',
      name: 'verifyNow',
      desc: '',
      args: [],
    );
  }

  /// `Reset password`
  String get setPassword {
    return Intl.message(
      'Reset password',
      name: 'setPassword',
      desc: '',
      args: [],
    );
  }

  /// `Confirm`
  String get confirm {
    return Intl.message(
      'Confirm',
      name: 'confirm',
      desc: '',
      args: [],
    );
  }

  /// `Enter New Password`
  String get enterNewPassword {
    return Intl.message(
      'Enter New Password',
      name: 'enterNewPassword',
      desc: '',
      args: [],
    );
  }

  /// `Confirm New Password`
  String get confirmNewPassword {
    return Intl.message(
      'Confirm New Password',
      name: 'confirmNewPassword',
      desc: '',
      args: [],
    );
  }

  /// `Add Student`
  String get addStudents {
    return Intl.message(
      'Add Student',
      name: 'addStudents',
      desc: '',
      args: [],
    );
  }

  /// `Select classroom`
  String get selectClassRoom {
    return Intl.message(
      'Select classroom',
      name: 'selectClassRoom',
      desc: '',
      args: [],
    );
  }

  /// `All Students`
  String get allStudents {
    return Intl.message(
      'All Students',
      name: 'allStudents',
      desc: '',
      args: [],
    );
  }

  /// `Disabled Students`
  String get disabledStudents {
    return Intl.message(
      'Disabled Students',
      name: 'disabledStudents',
      desc: '',
      args: [],
    );
  }

  /// `Bulk Import`
  String get bulkImport {
    return Intl.message(
      'Bulk Import',
      name: 'bulkImport',
      desc: '',
      args: [],
    );
  }

  /// `Import multiple student details through Excel sheet.`
  String get bulkImportDes {
    return Intl.message(
      'Import multiple student details through Excel sheet.',
      name: 'bulkImportDes',
      desc: '',
      args: [],
    );
  }

  /// `Download sample file`
  String get downloadSample {
    return Intl.message(
      'Download sample file',
      name: 'downloadSample',
      desc: '',
      args: [],
    );
  }

  /// `Import List`
  String get importList {
    return Intl.message(
      'Import List',
      name: 'importList',
      desc: '',
      args: [],
    );
  }

  /// `Add student manually`
  String get addStudentsManually {
    return Intl.message(
      'Add student manually',
      name: 'addStudentsManually',
      desc: '',
      args: [],
    );
  }

  /// `First Name`
  String get firstName {
    return Intl.message(
      'First Name',
      name: 'firstName',
      desc: '',
      args: [],
    );
  }

  /// `Last Name`
  String get lastName {
    return Intl.message(
      'Last Name',
      name: 'lastName',
      desc: '',
      args: [],
    );
  }

  /// `Add to List`
  String get addToList {
    return Intl.message(
      'Add to List',
      name: 'addToList',
      desc: '',
      args: [],
    );
  }

  /// `select`
  String get select {
    return Intl.message(
      'select',
      name: 'select',
      desc: '',
      args: [],
    );
  }

  /// `Selected`
  String get selected {
    return Intl.message(
      'Selected',
      name: 'selected',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
