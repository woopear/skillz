import 'dart:io';
import 'package:firebase_dart/firebase_dart.dart';
import 'package:shelf/shelf_io.dart' as io;
import 'package:skillz/api/router_app.dart';

/// creation serveur
Future<HttpServer> createServer() async {
  final address = InternetAddress.loopbackIPv4;
  const port = 8000;
  return await io.serve(RouterApp().handler, address, port);
}

/// init server
Future<void> main() async {
  FirebaseDart.setup();
  final server = await createServer();
  print('Serveur démarré: ${server.address} sur le port ${server.port}');
}

/// commande pour executer le server : dart run lib/api/server.dart
