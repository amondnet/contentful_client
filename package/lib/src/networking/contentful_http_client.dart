import 'dart:async';

import 'package:http/http.dart' as http;
import 'package:http2_client/http2_client.dart' as http2;
import 'package:meta/meta.dart';

class ContentfulHttpClient extends http.BaseClient {
  final http2.Http2Client client;
  final String accessToken;

  factory ContentfulHttpClient({
    http2.Http2Client client,
    @required String accessToken,
  }) {
    final client = http2.Http2Client();
    return ContentfulHttpClient._(client, accessToken);
  }

  ContentfulHttpClient._(this.client, this.accessToken);

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) {
    request.headers['Authorization'] = 'Bearer $accessToken';
    return client.send(request);
  }
}
