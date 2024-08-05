import 'package:flutter/services.dart';
import 'package:yb_mobile/common_libs.dart';
import 'dart:async';

class ConfirmOtpScreen extends StatefulWidget {
  const ConfirmOtpScreen({super.key});

  @override
  State<ConfirmOtpScreen> createState() => _ConfirmOtpScreenState();
}

class _ConfirmOtpScreenState extends State<ConfirmOtpScreen> {
  final FocusNode _pin1FocusNode = FocusNode();
  final FocusNode _confirmButtonFocusNode = FocusNode();

  late final _pin1 = TextEditingController();
  late final _pin2 = TextEditingController();
  late final _pin3 = TextEditingController();
  late final _pin4 = TextEditingController();
  late final _pin5 = TextEditingController();
  late final _pin6 = TextEditingController();

  Timer? _timer;
  int _secondsRemaining = 120; // 2 minutes

  @override
  void initState() {
    super.initState();
    startTimer();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FocusScope.of(context).requestFocus(_pin1FocusNode);
    });
  }

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_secondsRemaining == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            _secondsRemaining--;
          });
        }
      },
    );
  }

  void _onSuccessTyping() {
    if (_pin1.text.isNotEmpty &&
        _pin2.text.isNotEmpty &&
        _pin3.text.isNotEmpty &&
        _pin4.text.isNotEmpty &&
        _pin5.text.isNotEmpty &&
        _pin6.text.isNotEmpty) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        FocusScope.of(context).requestFocus(_confirmButtonFocusNode);
      });
    }
  }

  void _onSubmit() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Enter OTP'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Verification code',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const Text(
                  'We have sent a code to your email',
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey),
                ),
                Row(
                  children: [
                    const Text(
                      'tt***********03@gmail.com',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(
                              context, '/forgot_password');
                        },
                        child: Text("Change email?",
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge
                                ?.copyWith(color: AppColors.primaryColor700)))
                  ],
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: 68,
                        width: 64,
                        child: TextField(
                          controller: _pin1,
                          focusNode: _pin1FocusNode,
                          onChanged: (value) {
                            _onSuccessTyping();
                            if (value.length == 1) {
                              FocusScope.of(context).nextFocus();
                            }
                          },
                          decoration: const InputDecoration(
                            fillColor: Colors.grey,
                            filled: true,
                            border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.transparent)),
                          ),
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                            FilteringTextInputFormatter.digitsOnly
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 68,
                        width: 64,
                        child: TextField(
                          controller: _pin2,
                          onChanged: (value) {
                            _onSuccessTyping();
                            if (value.length == 1) {
                              FocusScope.of(context).nextFocus();
                            }
                            if (value.isEmpty) {
                              FocusScope.of(context).previousFocus();
                            }
                          },
                          decoration: const InputDecoration(
                            fillColor: Colors.grey,
                            filled: true,
                            border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.transparent)),
                          ),
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                            FilteringTextInputFormatter.digitsOnly
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 68,
                        width: 64,
                        child: TextField(
                          controller: _pin3,
                          onChanged: (value) {
                            _onSuccessTyping();
                            if (value.length == 1) {
                              FocusScope.of(context).nextFocus();
                            }
                            if (value.isEmpty) {
                              FocusScope.of(context).previousFocus();
                            }
                          },
                          decoration: const InputDecoration(
                            fillColor: Colors.grey,
                            filled: true,
                            border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.transparent)),
                          ),
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                            FilteringTextInputFormatter.digitsOnly
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 68,
                        width: 64,
                        child: TextField(
                          controller: _pin4,
                          onChanged: (value) {
                            _onSuccessTyping();
                            if (value.length == 1) {
                              FocusScope.of(context).nextFocus();
                            }
                            if (value.isEmpty) {
                              FocusScope.of(context).previousFocus();
                            }
                          },
                          decoration: const InputDecoration(
                            fillColor: Colors.grey,
                            filled: true,
                            border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.transparent)),
                          ),
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                            FilteringTextInputFormatter.digitsOnly
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 68,
                        width: 64,
                        child: TextField(
                          controller: _pin5,
                          onChanged: (value) {
                            _onSuccessTyping();
                            if (value.length == 1) {
                              FocusScope.of(context).nextFocus();
                            }
                            if (value.isEmpty) {
                              FocusScope.of(context).previousFocus();
                            }
                          },
                          decoration: const InputDecoration(
                            fillColor: Colors.grey,
                            filled: true,
                            border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.transparent)),
                          ),
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                            FilteringTextInputFormatter.digitsOnly
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 68,
                        width: 64,
                        child: TextField(
                          controller: _pin6,
                          onChanged: (value) {
                            _onSuccessTyping();
                            if (value.isEmpty) {
                              FocusScope.of(context).previousFocus();
                            }
                          },
                          decoration: const InputDecoration(
                            fillColor: Colors.grey,
                            filled: true,
                            border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.transparent)),
                          ),
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                            FilteringTextInputFormatter.digitsOnly
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'Resend code after ',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "${_secondsRemaining ~/ 60}:${(_secondsRemaining % 60).toString().padLeft(2, '0')}",
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge
                          ?.copyWith(color: AppColors.primaryColor700),
                    )
                  ],
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    flex: 5,
                    child: ElevatedButton(
                        onPressed: _secondsRemaining == 0
                            ? () {
                                setState(() {
                                  _secondsRemaining = 120;
                                });
                                startTimer();
                              }
                            : null,
                        child: Text(
                          'RESEND',
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.copyWith(color: AppColors.primaryColor700),
                        ))),
                Expanded(flex: 1, child: Container()),
                Expanded(
                    flex: 5,
                    child: ElevatedButton(
                      focusNode: _confirmButtonFocusNode,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryColor700,
                      ).copyWith(
                        overlayColor: MaterialStateProperty.resolveWith<Color?>(
                          (Set<MaterialState> states) {
                            if (states.contains(MaterialState.focused)) {
                              return Colors.white.withOpacity(0.2);
                            }
                            return null;
                          },
                        ),
                        side: MaterialStateProperty.resolveWith<BorderSide>(
                          (Set<MaterialState> states) {
                            if (states.contains(MaterialState.focused)) {
                              return const BorderSide(
                                  color: Colors.white, width: 2);
                            }
                            return BorderSide.none;
                          },
                        ),
                      ),
                      onPressed: () {
                        _onSubmit();
                      },
                      child: Text(
                        'Confirm',
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall
                            ?.copyWith(color: AppColors.neutralColor50),
                      ),
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pin1FocusNode.dispose();
    _confirmButtonFocusNode.dispose();
    _pin1.dispose();
    _pin2.dispose();
    _pin3.dispose();
    _pin4.dispose();
    _pin5.dispose();
    _pin6.dispose();
    super.dispose();
  }
}
