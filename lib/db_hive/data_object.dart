
class BugDataObject {

  final DateTime  bugDate;
  final DateTime? fixDate;
  final DateTime? turnroundTime;

  BugDataObject(this.bugDate, this.fixDate, this.turnroundTime);

  @override
  String toString() => 'Bug Date: $bugDate, Fix Date: $fixDate, Turnround Time: $turnroundTime';
  
}
