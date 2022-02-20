import 'package:customer_book/models/new_user.dart';
import 'package:http/http.dart' as http;

class ApiService {
  Future<http.Response> createAccount({required NewUser userModel}) async {
    const String serverUrl = 'http://mb.likeview.in/api/sendotp';
    final response = await http.post(
      Uri.parse(serverUrl),
      headers: {'Content-Type': 'application/json'},
      body: userModel.toJson(),
    );
    return response;
  }
  Future<http.Response> cornfirmOtp({required ConfirmOtp cornfirmOtp}) async {
    const String serverUrl = 'http://mb.likeview.in/api/login';
    final response = await http.post(
      Uri.parse(serverUrl),
      headers: {'Content-Type': 'application/json'},
      body: cornfirmOtp.toJson(),
    );
    return response;
  }
}
