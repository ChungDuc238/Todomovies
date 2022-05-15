class CurrentYear {
  static String getCurrentYear() {
    var datetime = DateTime.now();

    return datetime.year.toString();
  }
}
