import 'package:fake_api_app/models/person_model.dart';
import 'package:flutter/material.dart';

class PersonDetailsPage extends StatelessWidget {
  final PersonsData person;

  const PersonDetailsPage({super.key, required this.person});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${person.firstname!} ${person.lastname!}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildImage(person.image ?? ''),
            const SizedBox(height: 16),
            Text('Name: ${person.firstname!} ${person.lastname!}'),
            Text('Email: ${person.email}'),
          ],
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
          width: 100,
          height: 100,
        );
      },
    );
  }
}
