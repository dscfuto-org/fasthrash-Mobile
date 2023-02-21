import 'package:fastrash/features/education/model/education_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.r),
              //set border radius more than 50% of height and width to make circle
            ),
          margin: const EdgeInsets.symmetric(vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(10.r),topRight: Radius.circular(10.r)),
                child: Image.asset(
                  fit: BoxFit.cover,
                  educationModel.imageUrl,
                  height: 250.h,
                ),
              ),
              // Image.asset(
              //   educationModel.imageUrl,
              //   fit: BoxFit.cover,
              //   height: 250.h,
              // ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      educationModel.title,
                      style: const TextStyle(
                        fontSize: 20.0, color: Colors.green,
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
      ),
    );
  }
}
