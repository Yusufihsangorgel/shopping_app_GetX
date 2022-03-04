import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:shopping_app/screens/loginScreen.dart';
import 'package:form_validator/form_validator.dart';

class ForgotPassword extends StatefulWidget {
  static String id = 'forgot-password';

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  GlobalKey<FormState> _form = GlobalKey<FormState>();
  void _validate() {
    _form.currentState?.validate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Form(
        key: _form,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Şifremi unuttum',
                style: TextStyle(fontSize: 30, color: Colors.white),
              ),
              TextFormField(
                validator:
                    ValidationBuilder().email().maxLength(5, "anan").build(),
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  labelText: 'Email',
                  icon: Icon(
                    Icons.mail,
                    color: Colors.white,
                  ),
                  labelStyle: TextStyle(color: Colors.white),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              FloatingActionButton(
                onPressed: _validate,
                tooltip: 'Next',
                child: Icon(Icons.arrow_forward),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/*
child: const Text(
                  'Doğrulama maili gönder',
                  style: TextStyle(color: Colors.white),
                ),
showAnimatedDialog(
                    context: context,
                    barrierDismissible: true,
                    builder: (BuildContext context) {
                      return ClassicGeneralDialogWidget(
                        titleText: 'Şifremi unuttum',
                        contentText: 'Mail gönderimi başarılı',
                        onPositiveClick: () {
                          Get.to(const LoginScreen());
                        },
                        onNegativeClick: () {
                          Get.back();
                        },
                      );
                    },
                    animationType: DialogTransitionType.size,
                    curve: Curves.fastOutSlowIn,
                    duration: const Duration(seconds: 1),
                  );*/