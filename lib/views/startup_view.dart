import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:customer_book/utils/color/color_pallets.dart';
import 'package:customer_book/view_models/startup_view_model.dart';

class StartUpView extends StatelessWidget {
  const StartUpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return ViewModelBuilder<StartUpViewModel>.nonReactive(
      onModelReady: (model) {
        model.toCompanyView();
      },
      viewModelBuilder: () => StartUpViewModel(),
      builder: (context, model, child) {
        return Scaffold(
          backgroundColor: whiteColor,
          body: Center(
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
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Text(
                    'CUSTOMER BOOK',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
