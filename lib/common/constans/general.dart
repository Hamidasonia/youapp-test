// ignore_for_file: constant_identifier_names

const kGLOG_TAG = "[$kGAppName]";
const kGLOG_ENABLE = true;

const kGAppName = "YouApp Test";
const kGPackageName = "com.example.youapp_test";

printLog(dynamic data){
  if (kGLOG_ENABLE) {
    print("[${DateTime.now().toUtc()}]$kGLOG_TAG${data.toString()}");
  }
}