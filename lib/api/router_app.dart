import 'package:shelf_router/shelf_router.dart';
import 'package:shelf/shelf.dart';
import 'package:skillz/api/models/auth/auth_controller.dart';
import 'package:skillz/api/models/rome/rome_controller.dart';

class RouterApp {
  Handler get handler {
    var router = Router();
    /// route api rome
    router.mount('/rome', RomeController().handler);
    /// route auth
    router.mount('/auth', Auth().handler);

    return router;
  }
}