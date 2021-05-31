extension DateFormat on DateTime {
  String get format {
    final year = this.year;
    final month = this.month >= 10 ? "${this.month}" : "0${this.month}";
    final day = this.day >= 10 ? "${this.day}" : "0${this.day}";
    return "$day/$month/$year";
  }
}
