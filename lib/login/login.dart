import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:twitterapp/common/appbar.dart';
import 'package:twitterapp/common/asset_constants.dart';
import 'package:twitterapp/feed/display.dart';
import 'package:twitterapp/services/auth.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String phone = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Appbar(
        ic: Icon(
          Icons.close,
          color: Colors.black,
        ),
      ),
      body: Stack(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsetsDirectional.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 50),
                    height: 60,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          'Please enter your mobile number',
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        const Text(
                          'You will receive a 4 digit code to verify next.',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 30),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 5,
                    ),
                    height: 60,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                      ),
                    ),
                    child: Stack(
                      children: [
                        InternationalPhoneNumberInput(
                          onInputChanged: (value) {
                            phone = value.phoneNumber!;
                          },
                          inputDecoration: const InputDecoration(
                            contentPadding: EdgeInsets.only(left: 0, bottom: 14.5),
                            border: InputBorder.none,
                            hintText: 'Phone Number',
                            hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 16,
                            ),
                          ),
                          maxLength: 10,
                          searchBoxDecoration: const InputDecoration(
                            hintText: 'Search Country',
                            hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 20,
                            ),
                            contentPadding: EdgeInsets.only(
                              top: 10,
                              bottom: 10,
                            ),
                            enabledBorder: UnderlineInputBorder(),
                          ),
                          textStyle: const TextStyle(
                            fontFamily: 'Mont',
                            fontSize: 16,
                            color: Colors.black,
                            letterSpacing: 3,
                          ),
                          formatInput: false,
                          selectorConfig: const SelectorConfig(
                            selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                          ),
                          selectorTextStyle: const TextStyle(
                            fontFamily: 'Mont',
                            fontSize: 16,
                            color: Colors.black,
                          ),
                          spaceBetweenSelectorAndTextField: 0,
                        ),
                        Positioned(
                          left: 80,
                          top: 22,
                          child: Container(
                            width: 10,
                            height: 2,
                            color: Colors.black,
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    color: const Color.fromRGBO(46, 59, 98, 1),
                    height: 60,
                    child: ElevatedButton(
                      onPressed: () {
                        if (phone.length == 13) {
                          AuthService.instace.verifyPhone(phone);
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => AuthScreen(
                              phone: phone,
                            ),
                          ));
                        } else {
                          const snack = SnackBar(
                            content: Text('Enter Valid Mobile Number'),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snack);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                      ),
                      child: const Text(
                        'CONTINUE',
                        style: TextStyle(
                          fontFamily: 'Mont',
                          fontSize: 16,
                          letterSpacing: 2,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              child: Image.asset(AssetConstants.vector2),
            ),
          ),
        ],
      ),
    );
  }
}

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key, required this.phone});

  final String phone;
  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  late String code;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Appbar(
        ic: Icon(
          Icons.arrow_back,
          color: Colors.black,
        ),
      ),
      body: Padding(
        padding: const EdgeInsetsDirectional.symmetric(
          horizontal: 15,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 50),
              height: 50,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Verify Phone',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  Text(
                    'Code is sent to ${widget.phone}',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(
                vertical: 25,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  OtpTextField(
                    numberOfFields: 6,
                    textStyle: const TextStyle(fontSize: 15),
                    showFieldAsBox: true,
                    fieldWidth: 50,
                    filled: true,
                    cursorColor: Colors.black,
                    focusedBorderColor: Colors.black,
                    fillColor: const Color.fromRGBO(147, 210, 243, 1),
                    onSubmit: (value) {
                      code = value;
                      // AuthService().verifyOTP(code);
                    },
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Did not receive the code?',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                Container(
                  margin: const EdgeInsets.only(left: 5),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        AuthService.instace.verifyPhone(widget.phone);
                      });
                    },
                    child: const Text(
                      'Request Again',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 25),
              color: const Color.fromRGBO(46, 59, 98, 1),
              height: 60,
              child: ElevatedButton(
                onPressed: () async {
                  var flag = await AuthService.instace.verifyOTP(code);
                  if (mounted) {
                    if (flag) {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ContentScreen()));
                    } else {
                      Navigator.pop(context);
                      const snack = SnackBar(content: Text('Wrong OTP'));
                      ScaffoldMessenger.of(context).showSnackBar(snack);
                    }
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                ),
                child: const Text(
                  'VERIFY AND CONTINUE',
                  style: TextStyle(
                    fontFamily: 'Mont',
                    fontSize: 16,
                    letterSpacing: 2,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
