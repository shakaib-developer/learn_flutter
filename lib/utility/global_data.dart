class GlobalData {
  static int userId = 0;
  static String deviceToken = "";

  static int epochToDate(String? epochString) {
    print("epoch ki VALUE $epochString");

    String myEpoch = epochString ?? "";
    epochString = myEpoch.replaceAll(new RegExp(r"\D"), "");
    return int.tryParse(epochString) ?? 0;
  }
}
