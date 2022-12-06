import 'package:hive/hive.dart';

import 'data_object.dart';

part 'hive_dao.g.dart';

@HiveType(typeId: 1)
class HiveDAO {

  @HiveField(0) final DateTime  bugDate;
  @HiveField(1) final DateTime? fixDate;
  @HiveField(2) final int       turnroundTime;

  HiveDAO(this.bugDate, this.fixDate, this.turnroundTime);

  @override
  String toString() => 'Bug Date: $bugDate, Fix Date: $fixDate, Turnround Time: $turnroundTime';

  BugDataObject toBugDataObject() => BugDataObject( bugDate, fixDate, turnroundTime );

  factory HiveDAO.fromBugDataObject(BugDataObject bugData) => HiveDAO( bugData.bugDate, bugData.fixDate, bugData.turnroundTime );
}
