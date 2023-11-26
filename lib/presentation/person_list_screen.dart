import 'package:fake_api_app/controllers/person_controller.dart';
import 'package:fake_api_app/presentation/person_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PersonListUIScreen extends StatelessWidget {
  final PersonController _personController = Get.put(PersonController());

  PersonListUIScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Person List'),
      ),
      body: RefreshIndicator(
        onRefresh: () => _personController.refreshPersons(),
        child: Obx(
          () => _personController.persons.isEmpty
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(
                  itemCount: _personController.persons.length +
                      (_personController.noMoreData ? 1 : 0),
                  itemBuilder: (context, index) {
                    if (index == _personController.persons.length) {
                      return _personController.noMoreData
                          ? const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Center(
                                child: Text('No more data'),
                              ),
                            )
                          : const Center(child: CircularProgressIndicator());
                    }

                    final person = _personController.persons[index];
                    return ListTile(
                      title: Text('${person.firstname!} ${person.lastname!}'),
                      subtitle: Text(person.email ?? 'No email'),
                      leading: _buildImage(person.image ?? ''),
                      onTap: () {
                        Get.to(() => PersonDetailsPage(person: person));
                      },
                    );
                  },
                ),
        ),
      ),
    );
  }

  Widget _buildImage(String imageUrl) {
    return Image.network(
      imageUrl,
      errorBuilder:
          (BuildContext context, Object error, StackTrace? stackTrace) {
        return Image.asset(
          'assets/images/person_placeholder.png', // Replace with your placeholder image path
          width: 40,
          height: 40,
        );
      },
    );
  }
}
