import 'dart:io';

import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

import 'data_model/data_object.dart';
import 'data_model/hive_dao.dart';
import 'db_interfaces.dart';


//usage: flutter pub run build_runner watch --delete-conflicting-outputs

class HiveController implements DBInterfaces {

  late Box< HiveDAO >  _box;
  
  @override
  Future< void > initHiveDB() async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String appDocPath = appDocDir.path;

    Hive
      ..init(appDocPath)
      ..registerAdapter( HiveDAOAdapter() );

    await Hive.openBox<HiveDAO>("bugBox");

    _box = Hive.box<HiveDAO>('bugBox');
  }

  @override
  Future<void> addBug( int id, BugDataObject bugObject ) async {
    await _box.put( id, HiveDAO.fromBugDataObject(bugObject) );
  } 
  
  @override
  Future<BugDataObject> getBug( int id ) async => _box.get(id)!.toBugDataObject();

  @override
  Future<void> removeBug( int id ) async => _box.delete(id);
 
  @override
  Future<List<BugDataObject>?> getAllBug() async => _box.values.toList().map( (e)=>e.toBugDataObject() ).toList();
  
  @override
  int getDBSize() => _box.length;
}
