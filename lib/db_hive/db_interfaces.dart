import 'data_object.dart';

abstract class DBInterfaces {
  
  Future< void >                   addBug( int id, BugDataObject bugDattaObject );
  Future< BugDataObject >          getBug( int id );
  Future< List< BugDataObject >? > getAllBug();
  Future< void >                   removeBug( int id );
  Future< void >                   initHiveDB(); 
  int                              getDBSize();

}
