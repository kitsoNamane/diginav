class Device {
  static Future<dynamic> connectivityResults() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    return connectivityResult;
  }

  static Future<bool> isOnWiFi() async {
    if (Device.connectivityResults().wifi) {
      return true;
    }
    return false;
  }

  static Future<bool> isOnMobileData() async {
    if (Device.connectivityResults().mobile) {
      return true;
    }
    return false;
  }

  static Future<dynamic> currentNetworkState() async {
    var state = Connectivity().onConnectivityChanged;
    return state;
  }

  static Future<bool> isConnected() async {
    return false;
  }

  static String getMACAddress() {
    return '';
  }

  static String getDeviceName() {
    return '';
  }
}
