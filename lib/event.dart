import 'package:flutter/material.dart';
import 'api.dart';
import 'event_details.dart';

class Event extends StatelessWidget {
  final Talk talk;

  const Event({Key key, this.talk}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: talk.technicalOrBusiness == "technical"
          ? Icon(Icons.build)
          : Icon(Icons.work),
      title: Text(talk.title),
      subtitle: Text('${talk.room != null ? talk.room : ""}'),
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => EventDetails(talk: talk),
          )),
    );
  }
}
