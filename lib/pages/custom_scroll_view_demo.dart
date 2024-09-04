import 'package:flutter/material.dart';

class CustomScrollViewWithGridAndList extends StatefulWidget {
  const CustomScrollViewWithGridAndList({super.key});

  @override
  _CustomScrollViewWithGridAndListState createState() =>
      _CustomScrollViewWithGridAndListState();
}

class _CustomScrollViewWithGridAndListState
    extends State<CustomScrollViewWithGridAndList> {
  int gridItemCount = 4; // Initially showing 4 items in grid

  void _expandGrid() {
    setState(() {
      gridItemCount = 8; // Expand to show 8 items in grid
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        // SliverGrid section
        SliverPadding(
          padding: const EdgeInsets.all(8.0),
          sliver: SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 2,
            ),
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  color: Colors.blue[100 * (index % 9)],
                  child: Center(
                    child: Text('Grid Item $index'),
                  ),
                );
              },
              childCount:
                  gridItemCount, // This controls how many items are shown in the grid
            ),
          ),
        ),
        // Button to expand the grid
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: _expandGrid, // When pressed, more items will show
              child: const Text('Expand Grid'),
            ),
          ),
        ),
        // SliverList section
        SliverPadding(
          padding: const EdgeInsets.all(8.0),
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  height: 80.0,
                  color: Colors.green[100 * (index % 9)],
                  child: Center(
                    child: Text('List Item $index'),
                  ),
                );
              },
              childCount: 20, // Total number of items in the list
            ),
          ),
        ),
      ],
    );
  }
}
