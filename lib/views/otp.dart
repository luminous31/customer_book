import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'package:stacked_services/stacked_services.dart';

import 'package:customer_book/app/app.locator.dart';
import 'package:customer_book/app/app.router.dart';
import 'package:customer_book/models/new_user.dart';
import 'package:customer_book/services/shared_prefs_service.dart';
import 'package:customer_book/utils/color/color_pallets.dart';

import '../services/api_service.dart';

class Otp extends StatefulWidget {
  final int otp;
  // final int companyCode;
  const Otp({
    Key? key,
    required this.otp,
    // required this.companyCode,
  }) : super(key: key);

  @override
  _OtpState createState() => _OtpState();
}

class _OtpState extends State<Otp> {
  final _navService = locator<NavigationService>();
  final _dialogService = locator<DialogService>();
  final _apiService = locator<ApiService>();
  final _prefsService = locator<SharedPrefsservice>();
  int? otpCode;
  int? token;

  void getOtpCode(int otp) {
    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        otpCode = otp;
      });
    });
  }

  void generateToken() {
    token = Random().nextInt(9999999);
  }

  void toOtpView() async {
    isBusy = true;
    try {
      final cornfirmOtp = ConfirmOtp(
        otp: otpCode,
        token: token,
      );
      final response = await _apiService.cornfirmOtp(cornfirmOtp: cornfirmOtp);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        print(data['res_code']);
        if (data['res_code'] == "1") {
          // await _prefsService.savedUserState(1);
          // await _prefsService.savedUserData(
          //   key: 'id',
          //   value: data['res_data']['id'],
          //   index: 0,
          // );
          await _prefsService.savedUserData(
            key: 'phone',
            value: data['res_data']['phone'],
            index: 1,
          );
          await _prefsService.savedUserData(
            key: 'country_code',
            value: data['res_data']['country_code'],
            index: 1,
          );
          await _prefsService.savedUserData(
            key: 'otp',
            value: data['res_data']['otp'],
            index: 1,
          );
          await _prefsService.savedUserData(
            key: 'status',
            value: data['res_data']['status'],
            index: 1,
          );
          await _prefsService.savedUserData(
            key: 'authentication_token',
            value: data['res_data']['authentication_token'],
            index: 0,
          );
          await _prefsService.savedUserData(
            key: 'created_at',
            value: data['res_data']['created_at'],
            index: 1,
          );
          await _prefsService.savedUserData(
            key: 'updated_at',
            value: data['res_data']['updated_at'],
            index: 1,
          );
          _navService.replaceWith(Routes.homeView);
          isBusy = false;
          return;
        } else {
          //tamporary
          _navService.replaceWith(Routes.homeView);
          //
          isBusy = false;
          _dialogService.showDialog(
            title: 'Authentication',
            description: data['res_message'],
          );
        }
      } else {
        isBusy = false;
        _dialogService.showDialog(
          title: 'Failed',
          description: "Something went wrong try again",
        );
      }
    } on Exception catch (e) {
      isBusy = false;
      _dialogService.showDialog(
        title: 'Failed',
        description: e.toString(),
      );
    }
  }

  bool? isBusy;

  @override
  void initState() {
    super.initState();
    isBusy = false;
    generateToken();
    getOtpCode(widget.otp);
    SmsAutoFill().getAppSignature;
    SmsAutoFill().listenForCode();
  }

  @override
  void dispose() {
    super.dispose();
    SmsAutoFill().unregisterListener();
  }

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: whiteColor,
      body: Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: _size.height * 0.2,
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/logo/roundlogo.jpg'),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 30),
              child: Text(
                'CUSTOMER BOOK',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            SizedBox(height: _size.height * 0.1 / 30),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Code will be filled automatically',
                style: TextStyle(fontWeight: FontWeight.w300),
              ),
            ),
            SizedBox(height: _size.height * 0.01),
            PinFieldAutoFill(
              codeLength: 4,
              decoration: UnderlineDecoration(
                textStyle: const TextStyle(fontSize: 20, color: Colors.black),
                colorBuilder: FixedColorBuilder(Colors.black.withOpacity(0.3)),
              ),
              currentCode: otpCode.toString(),
              onCodeSubmitted: (code) {},
              onCodeChanged: (code) {
                if (code!.length == 4) {
                  FocusScope.of(context).requestFocus(FocusNode());
                  Future.delayed(const Duration(seconds: 5), () {
                    toOtpView();
                  });
                }
              },
            ),
            SizedBox(height: _size.height * 0.01),
            isBusy!
                ? const Padding(
                    padding: EdgeInsets.all(15.0),
                    child: LinearProgressIndicator(),
                  )
                : const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
