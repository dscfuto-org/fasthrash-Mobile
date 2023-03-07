class FormateLongText {
  FormateLongText._();

  static String formateLongText({required String longText}) {
    StringBuffer result = StringBuffer();
    int dotCount = 0;

    for (int i = 0; i < longText.length; i++) {
      if (longText[i] == '.') {
        dotCount++;
        if (dotCount == 3) {
          result.write(".\n\n");
          dotCount = 0;
        } else {
          result.write('.');
        }
      } else {
        result.write(longText[i]);
      }
    }

    return result.toString();
  }
}
