import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import 'package:customer_book/utils/color/color_pallets.dart';
import 'package:customer_book/view_models/authentication_view_model.dart';
import 'package:customer_book/views/login_view.form.dart';

@FormView(fields: [
  FormTextField(name: 'number'),
])
class LoginView extends StatelessWidget with $LoginView {
  final int? companyCode;
  LoginView({
    Key? key,
    this.companyCode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return ViewModelBuilder<AuthenticationViewModel>.reactive(
      viewModelBuilder: () => AuthenticationViewModel(),
      builder: (context, model, child) {
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
                SizedBox(
                  child: IntlPhoneField(
                    controller: numberController,
                    decoration: const InputDecoration(
                      labelText: 'Mobile Number',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(),
                      ),
                    ),
                    onChanged: (phone) {
                      print(phone.completeNumber);
                    },
                    onCountryChanged: (country) {
                      print('Country changed to: ' + country.dialCode);
                      model.getCountryCode(country.dialCode);
                    },
                  ),
                ),
                const SizedBox(height: 10.0),
                model.isBusy
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : SizedBox(
                        height: _size.height * 0.1 / 1.8,
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: primaryColor,
                          ),
                          onPressed: () {
                            model.toOtpView(
                              // companyCode: companyCode!,
                              number: numberController.text,
                            );
                          },
                          child: const Text(
                            'LOG IN',
                            style: TextStyle(
                              color: whiteColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 20.0,
                            ),
                          ),
                        ),
                      ),
              ],
            ),
          ),
        );
      },
    );
  }
}
