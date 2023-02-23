import 'package:fastrash/utils/dropdown_widget.dart';

mixin DashBoardWidgets {
  DashBoardDropDownFormField createDropDownList(
      String setValue, String label, List<dynamic> items) {
    return DashBoardDropDownFormField(
        setValue: setValue, label: label, items: items);
  }
}