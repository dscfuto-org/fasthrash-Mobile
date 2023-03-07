import 'package:fastrash/features/education/model/education_model.dart';
import 'package:fastrash/utils/formate_long_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EducationCardDetails extends StatelessWidget {
  final EducationModel educationModel;
  const EducationCardDetails({
    super.key,
    required this.educationModel,
  });

  @override
  Widget build(BuildContext context) {
    final String decription = FormateLongText.formateLongText(longText: educationModel.description );
    return Scaffold(
        appBar: AppBar(
          title: Text(
            educationModel.title,
          ),
          centerTitle: true,
        ),
        body: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            Image.asset(
              educationModel.imageUrl,
              fit: BoxFit.cover,
              height: 250.h,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 5.0),
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
                       decription,
                        style: const TextStyle(
                          fontSize: 16.0,
                          height: 1.5,
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
