import 'dart:async';

import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

import 'http2_client.dart';

class ContentfulHttpClient extends http.BaseClient {
  final Http2Client client;
  final String accessToken;

  factory ContentfulHttpClient({
    Http2Client client,
    @required String accessToken,
  }) {
    final client = Http2Client();
    return ContentfulHttpClient._(client, accessToken);
  }

  ContentfulHttpClient._(this.client, this.accessToken);

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) {
    request.headers['Authorization'] = 'Bearer $accessToken';
    return client.send(request);
  }
}
