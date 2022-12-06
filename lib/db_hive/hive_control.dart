import 'dart:io';

import 'package:hive/hive.dart';

import 'db_interfaces.dart';
import 'data_object.dart';
import 'hive_dao.dart';

//usage: flutter pub run build_runner watch --delete-conflicting-outputs

class HiveController implements DBInterfaces{

  final String         _path = Directory.current.path;
  late HiveInterface   hive;
  late Box< HiveDAO >  _box;

  HiveController(){
    _initHiveDB();
  }

  void _initHiveDB() async {
    hive = Hive
      ..init(_path)
      ..registerAdapter( HiveDAOAdapter() );

    var box = await Hive.openBox('bugBox');
  }

  @override
  Future<void> addBug( int id, BugDataObject bugObject ) async => await _box.put( id, HiveDAO.fromBugDataObject(bugObject) );
  
  @override
  Future<BugDataObject> getBug( int id ) async => _box.get(id)!.toBugDataObject();

  @override
  Future<void> removeBug( int id ) async => _box.delete(id);
 
  @override
  Future<List<BugDataObject>?> getAllBug() async => _box.values.toList().map( (e)=>e.toBugDataObject() ).toList();
  
}
