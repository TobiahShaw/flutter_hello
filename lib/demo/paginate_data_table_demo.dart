import 'package:flutter/material.dart';
import 'package:hello_world/model/post.dart';

class PaginateDataTableDemo extends StatefulWidget {
  @override
  _PaginateDataTableDemoState createState() => _PaginateDataTableDemoState();
}

class _PaginateDataTableDemoState extends State<PaginateDataTableDemo> {
  int _sortColumnIndex = 0;
  bool _sortAscending = true;

  final PostsDataSource _postsDataSource = PostsDataSource(posts);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PaginateDataTableDemo'),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: <Widget>[
            PaginatedDataTable(
              sortColumnIndex: _sortColumnIndex,
              sortAscending: _sortAscending,
              header: Text('posts'),
              rowsPerPage: 5,
              source: _postsDataSource,
              // 列 data row 中的 cells 要和 这个数量一致
              columns: [
                DataColumn(
                    label: Text('title'),
                    onSort: (index, ascending) {
                      setState(() {
                        _sortColumnIndex = index;
                        _sortAscending = ascending;
                      });
                      _postsDataSource.sort((post) => post.title.toLowerCase(), ascending);
                    }),
                DataColumn(label: Text('author')),
                DataColumn(label: Text('Image')),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class PostsDataSource extends DataTableSource {
  final List<Post> _posts;
  int _selectedRowCount = 0;

  PostsDataSource(this._posts);

  @override
  DataRow getRow(int index) {
    Post post = _posts[index];
    return DataRow.byIndex(index: index, cells: [
      DataCell(Text(post.title)),
      DataCell(Text(post.author)),
      DataCell(Image.network(post.imageUrl)),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => _posts.length;

  @override
  int get selectedRowCount => _selectedRowCount;

  void sort(getField(post), ascending) {
    _posts.sort((a, b) {
      return ascending ? 1 : -1 * getField(a).compareTo(getField(b));
    });
    notifyListeners();
  }
}
