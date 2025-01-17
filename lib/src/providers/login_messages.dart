import 'package:flutter/material.dart';

class LoginMessages with ChangeNotifier {
  LoginMessages(
      {this.userHint = defaultUserHint,
      this.recoverHint = defaultRecoverHint,
      this.userIdLoginHint = defaultUserIdLoginHint,
      this.passwordHint = defaultPasswordHint,
      this.confirmPasswordHint = defaultConfirmPasswordHint,
      this.forgotPasswordButton = defaultForgotPasswordButton,
      this.loginButton = defaultLoginButton,
      this.signupButton = defaultSignupButton,
      this.recoverPasswordButton = defaultRecoverPasswordButton,
      this.recoverPasswordIntro = defaultRecoverPasswordIntro,
      this.recoverPasswordDescription = defaultRecoverPasswordDescription,
      this.userIdLoginButton = defaultuserIdLoginButtonButton,
      this.userIdLoginButtonIntro = defaultuserIdLoginButtonIntro,
      this.userIdLoginButtonDescription = defaultuserIdLoginButtonDescription,
      this.goBackButton = defaultGoBackButton,
      this.confirmPasswordError = defaultConfirmPasswordError,
      this.recoverPasswordSuccess = defaultRecoverPasswordSuccess,
      this.userIdLoginButtonSuccess = defaultuserIdLoginButtonSuccess,
      this.flushbarTitleError = defaultflushbarTitleError,
      this.flushbarTitleSuccess = defaultflushbarTitleSuccess,
      this.signUpSuccess = defaultSignUpSuccess,
      this.providersTitle = defaultProvidersTitle});

  static const defaultUserHint = 'Email';
  static const defaultRecoverHint = 'Email';
  static const defaultUserIdLoginHint = 'User Id';
  static const defaultPasswordHint = 'Password';
  static const defaultConfirmPasswordHint = 'Confirm Password';
  static const defaultForgotPasswordButton = 'Forgot Password?';
  static const defaultLoginButton = 'LOGIN';
  static const defaultSignupButton = 'SIGNUP';
  static const defaultRecoverPasswordButton = 'RECOVER';
  static const defaultRecoverPasswordIntro = 'Reset your password here';
  static const defaultRecoverPasswordDescription =
      'We will send your plain-text password to this email account.';
  static const defaultuserIdLoginButtonButton = 'LOGIN';
  static const defaultuserIdLoginButtonIntro = 'Login with user id';
  static const defaultuserIdLoginButtonDescription =
      'You can use your user id from web extension here.';
  static const defaultGoBackButton = 'BACK';
  static const defaultConfirmPasswordError = 'Password do not match!';
  static const defaultRecoverPasswordSuccess = 'An email has been sent';
  static const defaultuserIdLoginButtonSuccess = 'Logged in';
  static const defaultflushbarTitleSuccess = 'Success';
  static const defaultflushbarTitleError = 'Error';
  static const defaultSignUpSuccess = 'An activation link has been sent';
  static const defaultProvidersTitle = 'or login with';

  /// Hint text of the userHint [TextField]
  /// By default is Email
  final String userHint;

  /// By default is Email
  final String recoverHint;
  final String userIdLoginHint;

  /// Hint text of the password [TextField]
  final String passwordHint;

  /// Hint text of the confirm password [TextField]
  final String confirmPasswordHint;

  /// Forgot password button's label
  final String forgotPasswordButton;

  /// Login button's label
  final String loginButton;

  /// Signup button's label
  final String signupButton;

  /// Recover password button's label
  final String recoverPasswordButton;
  final String userIdLoginButton;

  /// Intro in password recovery form
  final String recoverPasswordIntro;
  final String userIdLoginButtonIntro;

  /// Description in password recovery form
  final String recoverPasswordDescription;
  final String userIdLoginButtonDescription;

  /// Go back button's label. Go back button is used to go back to to
  /// login/signup form from the recover password form
  final String goBackButton;

  /// The error message to show when the confirm password not match with the
  /// original password
  final String confirmPasswordError;

  /// The success message to show after submitting recover password
  final String recoverPasswordSuccess;
  final String userIdLoginButtonSuccess;

  /// Title on top of Flushbar on errors
  final String flushbarTitleError;

  /// Title on top of Flushbar on successes
  final String flushbarTitleSuccess;

  /// The success message to show after signing up
  final String signUpSuccess;

  /// The string shown above the Providers buttons
  final String providersTitle;
}
