import 'package:flutter/material.dart';

import 'api.dart';

class EventDetails extends StatelessWidget {
  final Talk talk;
  const EventDetails({Key key, this.talk}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Talk"),
          elevation: 0,
        ),
        body: Stack(
          children: <Widget>[
            FractionallySizedBox(
              heightFactor: 1,
              widthFactor: 1,
            ),
            FractionallySizedBox(
              heightFactor: 0.25,
              widthFactor: 1,
              child: Container(
                width: MediaQuery.of(context).size.width,
                color: Theme.of(context).primaryColor,
                child: Center(
                    child: Text(
                  talk.title,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 20),
                )),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.15,
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Card(
                    elevation: 5,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: Text(
                          talk.description,
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
