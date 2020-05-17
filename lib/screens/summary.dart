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
  Future<Map<String, dynamic>> _futureData;

  // Now the following variables only serve as helpers or convinient variables.
  // So that we don't need to change our previous code so much.
  // They will be updated in the FutureBuilder (once the fetch process completes)

  GroupMember evaluator;
  List<Assessment> assessments;
  List<Criterion> criteria;
  List<Scale> scales;

  @override
  void initState() {
    super.initState();
    _futureData =
        data.fetchData('http://www.mocky.io/v2/5ea539bd3000005900ce2e8f');
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, dynamic>>(
        future: _futureData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            evaluator = snapshot.data['evaluator'];
            assessments = snapshot.data['assessments'];
            criteria = snapshot.data['criteria'];
            scales = snapshot.data['scales'];

            return _buildMainScreen();
          }

          return _buildFetchingDataScreen();
        });
  }

  Scaffold _buildMainScreen() {
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

  Scaffold _buildFetchingDataScreen() {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircularProgressIndicator(),
            SizedBox(height: 50),
            Text('Fetching data in progress'),
          ],
        ),
      ),
    );
  }
} // class _SummaryScreenState

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
    final _percent = widget.screen.assessments[widget.index]
        .percent(maxScore: 20.0); // The maxScore is to be finalized later

    return ListTile(
      title: Text(widget.screen.assessments[widget.index].member.shortName),
      subtitle: Text(widget.screen.assessments[widget.index].member.fullName),
      trailing: CircleAvatar(
        child: Text(
          _percent.round().toString(),
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: _percent < 50 ? Colors.pink : Colors.purple,
      ),
      onTap: () => _navigate(),
    );
  }
}
