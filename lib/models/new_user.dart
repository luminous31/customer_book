import 'dart:convert';

class NewUser {
  String? countryCode;
  String? number;
  NewUser({
    this.countryCode,
    this.number,
  });

  Map<String, dynamic> toMap() {
    return {
      "country_code": countryCode,
      "phone": number
    };
  }

  String toJson() => json.encode(toMap());
}
class ConfirmOtp {
  int? number;
  int? otp;
  int? token;
  ConfirmOtp({
    this.number,
    this.otp,
    this.token,

  });

  Map<String, dynamic> toMap() {
    return {
      "phone": number,
      "otp": otp,
      "token": token

    };
  }

  String toJson() => json.encode(toMap());
}
