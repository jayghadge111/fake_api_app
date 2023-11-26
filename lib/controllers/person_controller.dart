// person_controller.dart

import 'package:fake_api_app/core/api_service.dart';
import 'package:fake_api_app/models/person_model.dart';
import 'package:get/get.dart';

class PersonController extends GetxController {
  final ApiService _apiService = ApiService();
  final RxList<PersonsData> persons = <PersonsData>[].obs;
  final RxBool isLoading = false.obs;
  int page = 1;
  bool noMoreData = false;

  @override
  void onInit() {
    fetchPersons();
    super.onInit();
  }

  Future<void> fetchPersons() async {
    if (noMoreData) return;
    try {
      isLoading.value = true;
      final data = await _apiService.fetchPersons(page);
      if (data.isEmpty) {
        noMoreData = true;
        return;
      }

      persons.addAll(data);
      page++;
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> refreshPersons() async {
    noMoreData = false;
    persons.clear();
    page = 1;
    fetchPersons();
  }
}
