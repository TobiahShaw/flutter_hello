import 'package:flutter/material.dart';

class ChipDemo extends StatefulWidget {
  @override
  _ChipDemoState createState() => _ChipDemoState();
}

class _ChipDemoState extends State<ChipDemo> {
  List<String> _tags = [
    'Apple',
    'Banana',
    'Lemon',
  ];
  String _action = 'nothing';
  List<String> _filters = [];
  String _choice = 'Lemon';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ChipDemo'),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            // 会包裹内容 换行
            Wrap(
              spacing: 8.0,
              // 行间距
              runSpacing: 8.0,
              children: <Widget>[
                Chip(
                  label: Text('Life'),
                ),
                Chip(
                  label: Text('Sunset'),
                  backgroundColor: Colors.orange,
                ),
                Chip(
                  label: Text('Tobiah'),
                  avatar: CircleAvatar(
                    backgroundColor: Colors.grey,
                    child: Text('宝'),
                  ),
                ),
                Chip(
                  label: Text('Tobiah'),
                  avatar: CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://resources.ninghao.org/images/candy-shop.jpg'),
                  ),
                ),
                Chip(
                  label: Text('City'),
                  onDeleted: () {},
                  deleteIcon: Icon(Icons.delete),
                  deleteIconColor: Colors.redAccent,
                  deleteButtonTooltipMessage: 'remove this tag',
                ),
              ],
            ),
            // 分割线
            Divider(
              color: Colors.grey,
              height: 32.0,
              // 缩进
              indent: 0.0,
            ),
            Wrap(
              spacing: 8.0,
              runSpacing: 8.0,
              children: _tags
                  .map((String tag) => Chip(
                        label: Text(tag),
                        onDeleted: () {
                          setState(() {
                            _tags.remove(tag);
                          });
                        },
                      ))
                  .toList(),
            ),
            Divider(
              color: Colors.grey,
            ),
            Text('Action Chip : $_action'),
            Wrap(
              spacing: 8.0,
              runSpacing: 8.0,
              children: _tags
                  .map((String tag) => ActionChip(
                        label: Text(tag),
                        onPressed: () {
                          setState(() {
                            _action = tag;
                          });
                        },
                      ))
                  .toList(),
            ),
            Divider(
              color: Colors.grey,
            ),
            Text('Filter Chip : ${_filters.toString().replaceAll('[', '').replaceAll(']', '')}'),
            Wrap(
              spacing: 8.0,
              runSpacing: 8.0,
              children: _tags
                  .map((String tag) => FilterChip(
                        label: Text(tag),
                        onSelected: (select) {
                          setState(() {
                            if (select) {
                              _filters.add(tag);
                            } else {
                              _filters.remove(tag);
                            }
                          });
                        },
                        selected: _filters.contains(tag),
                      ))
                  .toList(),
            ),
            Divider(
              color: Colors.grey,
            ),
            Text('Choose Chip : $_choice'),
            Wrap(
              spacing: 8.0,
              runSpacing: 8.0,
              children: _tags
                  .map((String tag) => ChoiceChip(
                        label: Text(tag),
                        onSelected: (select) {
                          setState(() {
                            _choice = tag;
                          });
                        },
                        selected: _choice == tag,
                        selectedColor: Colors.black,
                      ))
                  .toList(),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.restore),
        onPressed: () {
          setState(() {
            _tags = [
              'Apple',
              'Banana',
              'Lemon',
            ];
            _filters = [];
            _choice = 'Lemon';
          });
        },
      ),
    );
  }
}
