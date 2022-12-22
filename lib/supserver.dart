import 'dart:convert';
import 'dart:io';

int calculate() {
  return 6 * 7;
}

Future<String> run() async {
  HttpServer server;

  try {
    server = await HttpServer.bind(InternetAddress.anyIPv4, 4045);
  } catch (e) {
    print("Couldn't bind to port 4045: $e");
    exit(-1);
  }
  print('Listening on http://${server.address.address}:${server.port}/');

  await for (HttpRequest req in server) {
    print(DateTime.now());
    req.response.headers.contentType = ContentType.json;
    //CORS Header, so the anybody can use this
    req.response.headers.add(
      'Access-Control-Allow-Origin',
      '*',
      preserveHeaderCase: true,
    );

    print(
        '[${req.connectionInfo?.remoteAddress.address}] -> ${req.uri.path} -> ${req.requestedUri.queryParameters}');
  }
  return 'done.';
}
