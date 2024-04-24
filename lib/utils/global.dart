class Global {

  static List logos = [];
  
  static bool vibrateOnScan = true;
  static bool soundOnScan = true;
  static bool openLinkOnScan = true;
  static bool addScanToHistory = true;

  static initialize(data){
    logos = data["logos"];
  }

}