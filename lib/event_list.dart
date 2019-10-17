import 'package:flutter/material.dart';
import 'package:openslava/event_search.dart';

import 'api.dart';
import 'event.dart';

class EventList extends StatelessWidget {
  final List<Talk> talks;
  const EventList({Key key, this.talks}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("OpenSlava 2019"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(context: context, delegate: EventSearch(talks));
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: talks.length,
        itemBuilder: (BuildContext context, int index) {
          var talk = talks[index];
          return Event(talk: talk);
        },
      ),
    );
  }
}
