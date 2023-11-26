import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:fake_api_app/models/person_model.dart';

class ApiService {
  final Dio _dio = Dio();

  Future<List<PersonsData>> fetchPersons(int page) async {
    final response = await _dio
        .get('https://fakerapi.it/api/v1/persons?_quantity=20&_page=$page');

    List<PersonsData> data = [];

    if (response.statusCode == 200) {
      data = response.data['data']
          .map<PersonsData>((data) => PersonsData.fromJson(data))
          .toList();
      log(jsonEncode(data));
    }
    return data;
  }
}
