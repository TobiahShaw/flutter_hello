import 'package:flutter/material.dart';
import 'package:hello_world/model/post.dart';

class DataTableDemo extends StatefulWidget {
  @override
  _DataTableDemoState createState() => _DataTableDemoState();
}

class _DataTableDemoState extends State<DataTableDemo> {
  int _sortColumnIndex = 0;
  bool _sortAscending = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DataTableDemo'),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: <Widget>[
            DataTable(
              sortColumnIndex: _sortColumnIndex,
              sortAscending: _sortAscending,
              // 列 data row 中的 cells 要和 这个数量一致
              columns: [
                DataColumn(
                    label: Text('title'),
                    onSort: (index, ascedning) {
                      setState(() {
                        _sortColumnIndex = index;
                        _sortAscending = ascedning;

                        posts.sort((a, b) {
                          return ascedning ? 1 : -1 * a.title.toUpperCase().compareTo(b.title.toUpperCase());
                        });
                      });
                    }),
                DataColumn(label: Text('author')),
                DataColumn(label: Text('Image')),
              ],
              rows: posts.map((post) {
                return DataRow(
                    selected: post.selected,
                    cells: [
                      DataCell(Text(post.title)),
                      DataCell(Text(post.author)),
                      DataCell(Image.network(post.imageUrl)),
                    ],
                    // 没有这个属性， 就没有行的 checkbox 以及全选
                    onSelectChanged: (selected) {
                      setState(() {
                        post.selected = selected;
                      });
                    });
              }).toList(),
            )
          ],
        ),
      ),
    );
  }
}
