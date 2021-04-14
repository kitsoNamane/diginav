import 'package:flutter/foundation.dart';
import 'package:logging/logging.dart';

class Log {
  //The ? indicated we can't have null for the logger
  static Logger? logger;

  static getLogger() {
    if (logger == null) {
      //TODO Retrieve name of current project
      String projectname = 'Diginav';
      Logger?.root.level = Level.ALL;
      logger = Logger(projectname);
    }
  }
}
