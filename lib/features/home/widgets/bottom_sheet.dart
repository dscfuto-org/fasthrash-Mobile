import 'package:fastrash/features/home/widgets/widgets.dart';
import 'package:fastrash/utils/image_picker.dart';
import 'package:flutter/material.dart';

actionsModalBottomSheet(
  BuildContext context,
) {
  double sheetHeight = 300;
  showModalBottomSheet(
      context: context,
      isDismissible: true,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter stateSetter) {
            return Container(
                height: sheetHeight,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    )),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      color: Colors.black45,
                      height: 5,
                      width: 100,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const PickImage(),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text('Input data count'),
                    const SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Submit'),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                  ],
                ));
          },
        );
      });
}

