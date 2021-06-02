library aisweb.src;

import 'package:meta/meta.dart' show required;

import 'package:http/http.dart' as http;
import 'package:http/http.dart' show Response;

import 'package:xml2json/xml2json.dart';
import 'dart:convert' show jsonDecode;

import 'exceptions.dart' show AISWEBException;

class AISWEB {
  final String apiKey;
  final String apiPass;
  final Uri uri;
  final String area;

  AISWEB({@required this.apiKey, @required this.apiPass, @required this.area})
      : uri = Uri(
            scheme: 'http',
            host: 'aisweb.decea.gov.br',
            path: '/api/',
            queryParameters: {
              'apiKey': apiKey,
              'apiPass': apiPass,
              'area': area
            });

  Future<Map<String, dynamic>> get(Map<String, dynamic> queryParameters) async {
    final xml2json = Xml2Json();
    queryParameters.addAll(uri.queryParameters);

    final Response response =
        await http.get(uri.replace(queryParameters: queryParameters));

    if (response.statusCode == 200) {
      xml2json.parse(response.body);
      Map<String, dynamic> json = jsonDecode(xml2json.toParker())['aisweb'];

      if (!json.containsKey('error')) return json;

      throw AISWEBException(json['error']);
    }
    throw AISWEBException(response.body);
  }
}
