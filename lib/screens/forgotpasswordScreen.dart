import 'package:flutter/material.dart';
import 'package:dialog_context/dialog_context.dart';
import 'package:get/get.dart';
import 'package:shopping_app/screens/loginScreen.dart';

class ForgotPassword extends StatelessWidget {
  static String id = 'forgot-password';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Form(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Email Your Email',
                style: TextStyle(fontSize: 30, color: Colors.white),
              ),
              TextFormField(
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  labelText: 'Email',
                  icon: Icon(
                    Icons.mail,
                    color: Colors.white,
                  ),
                  errorStyle: TextStyle(color: Colors.white),
                  labelStyle: TextStyle(color: Colors.white),
                  hintStyle: TextStyle(color: Colors.white),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  errorBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                child: Text(
                  'Send Email',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  DialogContext().showBottomSheet(
                    builder: (context) => Container(
                        alignment: Alignment.topCenter,
                        height: 200,
                        child: ExpansionTile(
                          title: Text('Başarıyla Kayıt oldunuz'),
                          subtitle: Text('Geri Dön'),
                          children: [
                            IconButton(
                                onPressed: () {
                                  Get.to(LoginScreen());
                                },
                                icon: Icon(Icons.exit_to_app))
                          ],
                        )),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
