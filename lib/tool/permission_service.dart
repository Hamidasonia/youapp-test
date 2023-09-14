import 'package:permission_handler/permission_handler.dart';
import 'package:youapp_test/common/configs.dart';

class PermissionService {
  static Future permissionGranted() async {
    bool granted = true;
    for(var element in kPermissions) {
      PermissionStatus s = await element.status;
        if (!s.isGranted) {
          granted = false;
        }
    }
    if (!granted) {
      reqAllPermission();
    }
  }

  static Future reqAllPermission() async {
    return await Future.forEach(kPermissions, (Permission element) async {
      return await element.request();
    });
  }

  static Future reqPermission(Permission permission) async {
    return permission.request();
  }

  Future checkPermission(Permission permission) async {
    return permission.status;
  }
}
