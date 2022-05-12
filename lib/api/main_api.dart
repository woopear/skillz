import 'dart:io';
import 'package:firebase_dart/firebase_dart.dart';

HttpServer? server;

/// creation serveur
Future<HttpServer> createServer() async {
  final address = InternetAddress.loopbackIPv4;
  const port = 8000;
  return await HttpServer.bind(address, port);
}

/// init server
Future<void> main() async {
  FirebaseDart.setup();
  final server = await createServer();
  print('Serveur démarré: ${server.address} avec le port ${server.port}');
}


