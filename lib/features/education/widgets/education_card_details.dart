import 'package:fastrash/features/education/model/education_model.dart';
import 'package:flutter/material.dart';

class EducationCardDetails extends StatelessWidget {
  final EducationModel educationModel;
  const EducationCardDetails({
    super.key,
    required this.educationModel,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            educationModel.title,
          ),
        ),
        body: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            const SizedBox(
              height: 10,
            ),
            Image.network(
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
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        educationModel.description,
                        style: const TextStyle(
                          fontSize: 16.0,
                        ),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                    const SizedBox(height: 5.0),
                  ]),
            ),
          ],
        ));
  }
}
