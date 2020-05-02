import 'package:flutter/material.dart';

import '../constants.dart';
import '../models/assessment.dart';

class SummaryScreen extends StatelessWidget {
  final GroupMember evaluator;
  final List assessments;

  SummaryScreen({this.evaluator, this.assessments});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: <Widget>[
            const Text(
              'Peer and Self Assessement by',
              style: TextStyle(fontSize: 15),
            ),
            Text(
              evaluator.fullName,
              style: const TextStyle(fontSize: 25),
            ),
          ],
        ),
      ),
      body: ListView.separated(
        itemCount: assessments.length,
        itemBuilder: (context, index) => _ListTile(
          index: index,
          screen: this,
        ),
        separatorBuilder: (context, index) => Divider(
          color: Colors.grey,
        ),
      ),
    );
  }
}

class _ListTile extends StatefulWidget {
  final int index;
  final SummaryScreen
      screen; // A convinience variable to access data from the screen object, so that no need to pass multiple variables

  _ListTile({this.index, this.screen});

  @override
  __ListTileState createState() => __ListTileState();
}

class __ListTileState extends State<_ListTile> {
  void _navigate() async {
    final result = await Navigator.pushNamed(
      context,
      detailsRoute,
      arguments: Assessment.copy(widget.screen.assessments[widget.index]),
    );

    if (result != null) {
      setState(() => widget.screen.assessments[widget.index] = result);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(widget.screen.assessments[widget.index].member.shortName),
      subtitle: Text(widget.screen.assessments[widget.index].member.fullName),
      trailing: CircleAvatar(
        child: Text(
          widget.screen.assessments[widget.index].percent.round().toString(),
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: widget.screen.assessments[widget.index].percent < 50
            ? Colors.pink
            : Colors.purple,
      ),
      onTap: () => _navigate(),
    );
  }
}
