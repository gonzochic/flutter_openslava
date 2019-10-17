import 'package:flutter/material.dart';
import 'api.dart';
import 'event.dart';

class EventSearch extends SearchDelegate<Talk> {
  final List<Talk> talks;

  EventSearch(this.talks);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    var suggestions = query.isEmpty
        ? talks
        : talks
            .where((t) => t.title.toLowerCase().contains(query.toLowerCase()))
            .toList();

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (BuildContext context, int index) {
        var talk = suggestions[index];
        return Event(talk: talk);
      },
    );
  }
}
