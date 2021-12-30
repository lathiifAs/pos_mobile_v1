import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pointofsales/providers/admin/p_auth.dart';
import 'package:pointofsales/utils/constants.dart';
import 'package:pointofsales/utils/dialog_question.dart';
import 'package:pointofsales/utils/size_config.dart';
import 'package:pointofsales/views/components/general_widgets/custom_dialog_success.dart';
import 'package:pointofsales/views/components/general_widgets/default_button.dart';
import 'package:pointofsales/views/components/general_widgets/default_input_text.dart';
import 'package:pointofsales/views/components/general_widgets/general_text_field.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
        child: Consumer<ProviderAuth>(
          builder: (context, data, _) => Container(
            padding: EdgeInsets.fromLTRB(kDefaultPadding, kDefaultPadding * 2,
                kDefaultPadding, kDefaultPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/logo.png',
                  width: SizeConfig.screenWidth * 0.4,
                ),
                // Padding(
                //   padding: EdgeInsets.only(bottom: kDefaultPadding),
                //   child: Text(
                //     "Ombe",
                //     style: TextStyle(
                //         fontSize: 20,
                //         fontWeight: FontWeight.bold,
                //         letterSpacing: 2,
                //         color: Colors.black),
                //   ),
                // ),
                // Padding(
                //   padding: EdgeInsets.only(bottom: kDefaultPadding),
                //   child: Text(
                //     "coffee shop App",
                //     style: TextStyle(color: Colors.black45, fontSize: 15),
                //   ),
                // ),
                Padding(
                  padding: EdgeInsets.all(kDefaultPadding),
                  child: Text(
                    "Welcome to Upmob",
                    style: TextStyle(fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                ),
                DefaultTextInput(
                  obscureText: false,
                  readOnly: false,
                  labelText: "Username",
                  controller: _usernameController,
                  keyboardType: TextInputType.emailAddress,
                  suffixIcon: Icon(
                    Icons.account_circle_outlined,
                    color: kPrimaryColor,
                  ),
                ),
                SizedBox(
                  height: kDefaultPadding,
                ),
                DefaultTextInput(
                  labelText: "Password",
                  controller: _passController,
                  readOnly: false,
                  obscureText: data.isVisible,
                  suffixIcon: IconButton(
                    icon: (data.isVisible)
                        ? Icon(
                            Icons.visibility_off,
                            color: kPrimaryColor,
                          )
                        : Icon(
                            Icons.visibility,
                            color: kPrimaryColor,
                          ),
                    onPressed: () {
                      data.isVisible = !data.isVisible;
                    },
                  ),
                ),
                SizedBox(
                  height: kDefaultPadding,
                ),
                Container(
                    width: double.infinity,
                    height: 50,
                    child: DefaultButton(
                        backgroundColor: kPrimaryColor,
                        buttonText: "Login",
                        onPressed: () {
                          data.postLogin(context, _usernameController.text,
                              _passController.text);
                        }))
              ],
            ),
          ),
        ),
      )),
    );
  }
}
