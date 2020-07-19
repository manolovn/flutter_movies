import 'dart:async' show Future;
import 'dart:convert' show json;
import 'package:flutter/services.dart' show rootBundle;

class Config {
  final String apiKey;

  Config({this.apiKey = ""});

  factory Config.fromJson(Map<String, dynamic> jsonMap) {
    return new Config(apiKey: jsonMap["api_key"]);
  }
}

class ConfigLoader {
  Future<Config> load() {
    return rootBundle.loadStructuredData<Config>('config.json',
        (jsonStr) async {
      return Config.fromJson(json.decode(jsonStr));
    });
  }
}
