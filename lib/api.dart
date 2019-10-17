import 'dart:convert';

import 'package:http/http.dart' as http;

class Talk {
  final String track;
  final String talkType;
  final int order;
  final String description;
  final String title;
  final String room;
  final String technicalOrBusiness;

  Talk({
    this.track,
    this.talkType,
    this.order,
    this.description,
    this.title,
    this.room,
    this.technicalOrBusiness,
  });

  factory Talk.fromJson(Map<String, dynamic> json) {
    return Talk(
      track: json['track'],
      talkType: json['talkType'],
      order: json['order'] as int,
      description: json['description'],
      title: json['title'],
      room: json['room'],
      technicalOrBusiness: json['technicalOrBusiness'],
    );
  }
}

class Api {
  static const _url =
      "https://pui1uplwt0.execute-api.eu-west-1.amazonaws.com/dev";

  static Future<List<Talk>> getProgram() async {
    try {
      var response = await http.get(_url + "/program");
      var talks = json.decode(response.body)["talks"] as List;
      return talks.map((json) => Talk.fromJson(json)).toList();
    } catch (e) {
      print(e);
      return [];
    }
  }
}
