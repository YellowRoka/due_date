  DateTime calculateDueDate( DateTime bugDate, int turnTime ){
    int days  = turnTime ~/ 8;
    int hours = turnTime  % 8;

    return DateTime(
      bugDate.year,
      bugDate.month,
      bugDate.day  + days,
      bugDate.hour + hours,
      bugDate.minute,
      bugDate.millisecond,
      bugDate.microsecond
    );
  }