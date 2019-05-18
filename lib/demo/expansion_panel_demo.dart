import 'package:flutter/material.dart';

class ExpansionPanelDemo extends StatefulWidget {
  @override
  _ExpansionPanelDemoState createState() => _ExpansionPanelDemoState();
}

class _ExpansionPanelDemoState extends State<ExpansionPanelDemo> {
  List<ExpansionPanelItem> _expansionPanelItem;

  @override
  void initState() {
    super.initState();
    _expansionPanelItem = <ExpansionPanelItem>[
      ExpansionPanelItem(
        label: 'Panel A',
        body: Container(
          padding: EdgeInsets.all(16.0),
          width: double.infinity,
          child: Text('Content of Panel A'),
        ),
        isExpanded: false,
      ),
      ExpansionPanelItem(
        label: 'Panel B',
        body: Container(
          padding: EdgeInsets.all(16.0),
          width: double.infinity,
          child: Text('Content of Panel B'),
        ),
        isExpanded: false,
      ),
      ExpansionPanelItem(
        label: 'Panel C',
        body: Container(
          padding: EdgeInsets.all(16.0),
          width: double.infinity,
          child: Text('Content of Panel C'),
        ),
        isExpanded: false,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ExpansionPanelDemo'),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ExpansionPanelList(
              children: _expansionPanelItem.map((ExpansionPanelItem item) {
                return ExpansionPanel(
                  headerBuilder: (context, expanded) {
                    return Container(
                      padding: EdgeInsets.all(16.0),
                      child: Text(
                        item.label,
                        style: Theme.of(context).textTheme.title,
                      ),
                    );
                  },
                  body: item.body,
                  isExpanded: item.isExpanded,
                );
              }).toList(),
              expansionCallback: (index, isExpanded) {
                setState(() {
                  _expansionPanelItem[index].isExpanded = !isExpanded;
                });
              },
            )
          ],
        ),
      ),
    );
  }
}

class ExpansionPanelItem {
  final String label;
  final Widget body;
  bool isExpanded;

  ExpansionPanelItem({this.label, this.body, this.isExpanded});
}
