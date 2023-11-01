import 'package:flutter_fic9_ecommerce_app/common/constants/variables.dart';
import 'package:flutter_fic9_ecommerce_app/data/models/requests/login_request_model.dart';
import 'package:flutter_fic9_ecommerce_app/data/models/requests/register_request_model.dart';
import 'package:flutter_fic9_ecommerce_app/data/models/responses/auth_response_model.dart';
import 'package:http/http.dart' as http;
import 'package:dartz/dartz.dart';

class AuthRemoteDataSource {
  Future<Either<String, AuthResponseModel>> register(
      RegisterRequestModel data) async {
    var headers = {'Content-Type': 'application/json'};
    final response = await http.post(
        Uri.parse('${Variables.baseURL}/api/auth/local/register'),
        body: data.toJson(),
        headers: headers);

    if (response.statusCode == 200) {
      return right(AuthResponseModel.fromJson(response.body));
    } else {
      return left('server error!');
    }
  }

  Future<Either<String, AuthResponseModel>> login(
      LoginRequestModel data) async {
    final headers = {'Content-Type': 'application/json'};
    final response = await http.post(
        Uri.parse('${Variables.baseURL}/api/auth/local'),
        body: data.toJson(),
        headers: headers);
    if (response.statusCode == 200) {
      return right(AuthResponseModel.fromJson(response.body));
    } else {
      return left('server error!');
    }
  }
}
