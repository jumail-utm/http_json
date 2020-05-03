import 'package:flutter/material.dart';

import '../constants.dart';
import '../models/form.dart';
import '../models/assessment.dart';
import '../models/data.dart' as data;

// We need to convert SummaryScreen to stateful because we need the initState() method.

class SummaryScreen extends StatefulWidget {
  @override
  _SummaryScreenState createState() => _SummaryScreenState();
}

class _SummaryScreenState extends State<SummaryScreen> {
  GroupMember evaluator;
  List<Assessment> assessments = [];
  List<Criterion> criteria = [];
  List<Scale> scales = [];

  // Initializing the above lists with empty lists is important to prevent
  //  null pointer errors during the first time built, as during that time
  //  the data is not fully fetched yet.

  // An helper method to aid initState(). As initState() cannot have aysnc with it
  Future<void> _fetchData() async {
    final _data =
        await data.fetchData('http://www.mocky.io/v2/5ea539bd3000005900ce2e8f');

    evaluator = _data['evaluator'];
    assessments = _data['assessments'];
    scales = _data['scales'];
    criteria = _data['criteria'];

    setState(
        () {}); // We need setState() here only to re-build the SummaryScreen
  }

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

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
              evaluator != null ? evaluator.fullName : '',
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
  final _SummaryScreenState
      screen; // A convinience variable to access data from the screen object, so that no need to pass multiple variables

  _ListTile({this.index, this.screen});

  @override
  __ListTileState createState() => __ListTileState();
}

class __ListTileState extends State<_ListTile> {
  void _navigate() async {
    final result = await Navigator.pushNamed(context, detailsRoute, arguments: {
      'assessment': Assessment.copy(widget.screen.assessments[widget.index]),
      'criteria': widget.screen.criteria,
      'scales': widget.screen.scales
    });

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
