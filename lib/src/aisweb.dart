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
  final String baseUrl;
  final String area;

  const AISWEB(
      {@required this.apiKey, @required this.apiPass, @required this.area})
      : baseUrl =
            'http://aisweb.decea.gov.br/api/?apiKey=$apiKey&apiPass=$apiPass&area=$area';

  Future<Map<String, dynamic>> get(String query) async {
    final xml2json = Xml2Json();
    final Response response = await http.get('$baseUrl&$query');

    if (response.statusCode == 200) {
      xml2json.parse(response.body);
      Map<String, dynamic> json = jsonDecode(xml2json.toParker())['aisweb'];

      if (!json.containsKey('error')) return json;

      throw AISWEBException(json['error']);
    }
    throw AISWEBException(response.body);
  }
}
