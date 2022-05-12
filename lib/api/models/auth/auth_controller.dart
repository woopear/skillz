import 'package:firebase_dart/firebase_dart.dart';
import 'package:shelf_router/shelf_router.dart';
import 'package:shelf/shelf.dart';
import 'package:skillz/api/utils/config.dart';

class Auth {
  /// connexion init à firebase skillz
  Future<FirebaseApp> initApp() async {
    late FirebaseApp app;

    try {
      app = Firebase.app();
    } catch (e) {
      app = await Firebase.initializeApp(
          options: FirebaseOptions.fromMap(Config.configFirebase));
    }

    return app;
  }

  /// init routeur
  Handler get handler {
    var router = Router();
    return router;
  }
}
