import 'package:flutter/material.dart';
import 'package:hello_world/model/post.dart';

class SliverDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            // title: Text('Tobiah'),
            // 固定顶部
            // pinned: true,
            // 在任意位置向上滚动一点就显示
            floating: true,
            // app bar 可扩展区域
            expandedHeight: 178.0,
            // 可扩展内容
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                'Tobiah Flutter',
                style: TextStyle(
                    fontSize: 15.0,
                    // 文字间距
                    letterSpacing: 3.0,
                    fontWeight: FontWeight.w400),
              ),
              background: Image.network(posts[0].imageUrl, fit: BoxFit.cover,),
            ),
          ),
          // 在安全区域显示（状态栏不显示）
          SliverSafeArea(
            // 添加内边距
            sliver: SliverPadding(
              padding: EdgeInsets.all(8.0),
              sliver: SliverListDemo(),
            ),
          )
        ],
      ),
    );
  }
}

class SliverListDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          // 添加下边内边距
          return Padding(
            padding: EdgeInsets.only(bottom: 32.0),
            // 设置圆角阴影
            child: Material(
              borderRadius: BorderRadius.circular(12.0),
              elevation: 14.0,
              shadowColor: Colors.grey.withOpacity(0.5),
              child: Stack(
                children: <Widget>[
                  // 调整比例 16：9
                  AspectRatio(
                    aspectRatio: 16 / 9,
                    child: Image.network(
                      posts[index].imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    top: 32.0,
                    left: 32.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          posts[index].title,
                          style: TextStyle(fontSize: 20.0, color: Colors.white),
                        ),
                        Text(
                          posts[index].author,
                          style: TextStyle(fontSize: 13.0, color: Colors.white),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
        childCount: posts.length,
      ),
    );
  }
}

class SliverGridDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
          childAspectRatio: 1.0),
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return Container(
            child: Image.network(
              posts[index].imageUrl,
              fit: BoxFit.cover,
            ),
          );
        },
        childCount: posts.length,
      ),
    );
  }
}
