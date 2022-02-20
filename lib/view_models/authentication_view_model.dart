import 'dart:convert';

import 'package:flutter/animation.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:customer_book/app/app.locator.dart';
import 'package:customer_book/models/new_user.dart';
import 'package:customer_book/services/shared_prefs_service.dart';
import 'package:customer_book/utils/color/color_pallets.dart';
import 'package:customer_book/services/api_service.dart';
import 'package:customer_book/views/otp.dart';

class AuthenticationViewModel extends BaseViewModel {
  final _navService = locator<NavigationService>();
  final _prefsService = locator<SharedPrefsservice>();
  final _apiService = locator<ApiService>();
  final _snackbarService = locator<SnackbarService>();
  final _dialogService = locator<DialogService>();

  String countryCode = '+1';

  void toOtpView({
    // required int companyCode,
    required String number,
  }) async {
    if (number == '' || countryCode == '') {
      _snackbarService.registerSnackbarConfig(SnackbarConfig(
        messageColor: whiteColor,
      ));
      _snackbarService.showSnackbar(message: 'Entry can\'t be empty');
    } else if (number.length < 9) {
      _snackbarService.registerSnackbarConfig(SnackbarConfig(
        messageColor: whiteColor,
      ));
      _snackbarService.showSnackbar(
          message: 'Number is less than 9 characters');
    } else {
      setBusy(true);
      final userModel = NewUser(
        // company: companyCode,
        number: number,
        countryCode: countryCode,
      );
      final response = await _apiService.createAccount(userModel: userModel);
      if (response.statusCode == 200) {
        setBusy(false);
        final data = jsonDecode(response.body);
        if (data['res_code'] == "1") {
          _navService.replaceWithTransition(
            Otp(
              // companyCode: companyCode,
              otp: data['res_data']['otp'],
            ),
            curve: Curves.ease,
            transition: 'rightToLeft',
          );
          return;
        } else {
          _dialogService.showDialog(
            title: 'Authentication',
            description: data['res_message'],
          );
          return;
        }
      } else {
        _dialogService.showDialog(
          title: 'Failed',
          description: "Something went wrong try again",
        );
      }
      setBusy(false);
      return;
    }
  }

  void getCountryCode(String num) {
    countryCode = num;
  }
}
