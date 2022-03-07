import 'package:animated_login/animated_login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/screens/forgotpasswordScreen.dart';

import 'package:shopping_app/screens/homeScreen.dart';

import 'package:shopping_app/services/google_services.dart';
import 'dart:io' show Platform;

class LoginScreen extends StatefulWidget {
  /// Simulates the multilanguage, you will implement your own logic.
  /// According to the current language, you can display a text message
  /// with the help of [LoginTexts] class.
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LanguageOption language = _languageOptions[1];
  AuthMode currentMode = AuthMode.login;

  @override
  Widget build(BuildContext context) {
    return AnimatedLogin(
      onLogin: LoginFunctions(context).onLogin,
      onSignup: LoginFunctions(context).onSignup,
      onForgotPassword: LoginFunctions(context).onForgotPassword,
      logo: Image.network(
        "https://cdn.dribbble.com/users/2399342/screenshots/6553839/gif-final.gif",
        height: 100,
        width: 100,
      ),
      // backgroundImage: 'images/background_image.jpg',
      signUpMode: SignUpModes.both,
      socialLogins: _socialLogins(context),
      loginDesktopTheme: _desktopTheme,
      loginMobileTheme: _mobileTheme,
      loginTexts: _loginTexts,
      changeLanguageCallback: (LanguageOption? _language) {
        if (_language != null) {
          DialogBuilder(context).showResultDialog(
              'Successfully changed the language to: ${_language.value}.');
          if (mounted) setState(() => language = _language);
        }
      },
      languageOptions: _languageOptions,
      selectedLanguage: language,
      initialMode: currentMode,
      onAuthModeChange: (AuthMode newMode) => currentMode = newMode,
    );
  }

  static List<LanguageOption> get _languageOptions => const <LanguageOption>[
        LanguageOption(
          value: 'Turkish',
          code: 'TR',
          iconPath: 'images/tr.png',
        ),
        LanguageOption(
          value: 'English',
          code: 'EN',
          iconPath: 'images/en.png',
        ),
      ];

  /// You can adjust the colors, text styles, button styles, borders
  /// according to your design preferences for *DESKTOP* view.
  /// You can also set some additional display options such as [showLabelTexts].
  LoginViewTheme get _desktopTheme => _mobileTheme.copyWith(
        // To set the color of button text, use foreground color.
        actionButtonStyle: ButtonStyle(
          foregroundColor: MaterialStateProperty.all(Colors.white),
        ),
        dialogTheme: const AnimatedDialogTheme(
          languageDialogTheme: LanguageDialogTheme(
              optionMargin: EdgeInsets.symmetric(horizontal: 80)),
        ),
      );

  /// You can adjust the colors, text styles, button styles, borders
  /// according to your design preferences for *MOBILE* view.
  /// You can also set some additional display options such as [showLabelTexts].
  LoginViewTheme get _mobileTheme => LoginViewTheme(
        // showLabelTexts: false,
        backgroundColor: Colors.blue, // const Color(0xFF6666FF),
        formFieldBackgroundColor: Colors.white,
        formWidthRatio: 60,
        // actionButtonStyle: ButtonStyle(
        //   foregroundColor: MaterialStateProperty.all(Colors.blue),
        // ),
      );

  LoginTexts get _loginTexts => LoginTexts(
        nameHint: _username,
        login: _login,
        signUp: _signup,
      );

  /// You can adjust the texts in the screen according to the current language
  /// With the help of [LoginTexts], you can create a multilanguage scren.
  String get _username => language.code == 'TR' ? 'Kullanıcı Adı' : 'Username';

  String get _login => language.code == 'TR' ? 'Giriş Yap' : 'Login';

  String get _signup => language.code == 'TR' ? 'Kayıt Ol' : 'Sign Up';

  /// Social login options, you should provide callback function and icon path.
  /// Icon paths should be the full path in the assets
  /// Don't forget to also add the icon folder to the "pubspec.yaml" file.
  List<SocialLogin> _socialLogins(BuildContext context) => <SocialLogin>[
        SocialLogin(
            callback: () async => LoginFunctions(context).socialLogin('Google'),
            iconPath: 'images/google.png'),
        SocialLogin(
            callback: () async =>
                LoginFunctions(context).socialLogin('Misafir'),
            iconPath: 'images/customer.jpeg'),
        SocialLogin(
            callback: () async => LoginFunctions(context).socialLogin('Apple'),
            iconPath: 'images/apple.png'),
      ];
}

class LoginFunctions {
  /// Collection of functions will be performed on login/signup.
  /// * e.g. [onLogin], [onSignup], [socialLogin], and [onForgotPassword]
  const LoginFunctions(this.context);
  final BuildContext context;

  /// Login action that will be performed on click to action button in login mode.
  Future<String?> onLogin(LoginData loginData) async {
    DialogBuilder(context).showLoadingDialog();
    await Future.delayed(const Duration(seconds: 2));
    Get.to(HomeScreen());
    DialogBuilder(context).showResultDialog('Giriş Başarılı.');
  }

  /// Sign up action that will be performed on click to action button in sign up mode.
  Future<String?> onSignup(SignUpData signupData) async {
    DialogBuilder(context).showLoadingDialog();
    await Future.delayed(const Duration(seconds: 2));
    Navigator.of(context).pop();
    DialogBuilder(context).showResultDialog('Başarıyla kayıt oldunuz.');
  }

  Future<String?> socialLogin(String type) async {
    DialogBuilder(context).showLoadingDialog();
    await Future.delayed(const Duration(seconds: 2));
    if (type == 'Google') {
      Get.to(SignInDemo());
    }
    if (type == 'Misafir') {
      Get.to(HomeScreen());
    }
    if (type == 'Apple') {
      Get.to(HomeScreen());
    }

    DialogBuilder(context)
        .showResultDialog(' $type ile başarılı giriş yaptınız');
  }

  Future<String?> onForgotPassword(String email) async {
    DialogBuilder(context).showLoadingDialog();
    await Future.delayed(const Duration(seconds: 2));
    Get.to(ForgotPassword());
  }
}

/*Future<String?> socialLogin(String type) async {
    DialogBuilder(context).showLoadingDialog();
    DialogBuilder(context)
        .showResultDialog('Successful social login with $type.');
    if (type == 'Google') {

    
      Get.to(SignInDemo());
    }
    if (type == 'Facebook') {
     
      Get.to(FacebookServices(plugin: plugin));
   
    } if(type == 'Apple') {
      DialogBuilder(context).showLoadingDialog();

     
    }
      DialogBuilder(context)
          .showResultDialog('Successful social login with $type.');
  }*/

class DialogBuilder {
  /// Builds various dialogs with different methods.
  /// * e.g. [showLoadingDialog], [showResultDialog]
  const DialogBuilder(this.context);
  final BuildContext context;

  /// Example loading dialog
  Future<void> showLoadingDialog() => showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) => WillPopScope(
          onWillPop: () async => false,
          child: const AlertDialog(
            content: SizedBox(
              width: 100,
              height: 100,
              child: Center(
                child: CircularProgressIndicator(
                  color: Colors.black,
                  strokeWidth: 3,
                ),
              ),
            ),
          ),
        ),
      );

  /// Example result dialog
  Future<void> showResultDialog(String text) => showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          content: SizedBox(
            height: 100,
            width: 100,
            child: Center(child: Text(text, textAlign: TextAlign.center)),
          ),
        ),
      );
}
