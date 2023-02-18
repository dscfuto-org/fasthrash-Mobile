import 'package:fastrash/features/education/model/education_model.dart';
import 'package:fastrash/features/education/widgets/education_card.dart';
import 'package:fastrash/features/home/widgets/widgets.dart';
import 'package:flutter/material.dart';

class EducationView extends StatelessWidget {
  const EducationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Education'),
          centerTitle: true,
        ),
        body: ListView.builder(
          itemCount: educationData.length,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) => EducationCard(
            educationModel: educationData[index],
          ),
        ));
  }
}
