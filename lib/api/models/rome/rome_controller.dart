

import 'package:shelf_router/shelf_router.dart';
import 'package:shelf/shelf.dart';

class RomeController {
  Handler get handler {
    final router = Router();
    return router;
  }
}
