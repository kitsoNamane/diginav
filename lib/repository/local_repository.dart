
// Container class for all our local database, file storage, etc ...
import 'package:diginav/repository/floor/user_dao.dart';

class LocalRepository {
  final UserDao userDao;

  LocalRepository(this.userDao); 
}
