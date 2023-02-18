import 'package:fastrash/features/education/model/education_model.dart';
import 'package:flutter/material.dart';

class EducationCard extends StatelessWidget {
  final EducationModel educationModel;
  final VoidCallback onTapped;
  const EducationCard({
    super.key,
    required this.educationModel,
    required this.onTapped,
  });

  @override
  Widget build(BuildContext context) {

    return InkWell(
      onTap: onTapped,
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(
              educationModel.imageUrl,
              fit: BoxFit.cover,
              height: 150.0,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    educationModel.title,
                    style: const TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5.0),
                  Text(
                    educationModel.description,
                    style: const TextStyle(
                      fontSize: 16.0,
                    ),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,

                  ),
                  const SizedBox(height: 5.0),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
