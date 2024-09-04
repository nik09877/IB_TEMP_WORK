import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int gridItemCount = 6; // Initially showing 6 items in the Grid

  void _showMoreItems() {
    setState(() {
      gridItemCount = 22; // Show more items when "Show More" is clicked
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: const Drawer(),
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(60),
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(255, 244, 114, 28), // Lighter orange
                    Color.fromARGB(255, 255, 77, 17), // Deeper orange

                    // Color.fromARGB(255, 255, 102, 0), // Lighter orange
                    // Color.fromARGB(255, 204, 51, 0), // Deeper orange
                  ],
                  begin: Alignment.centerLeft, // Start from the left
                  end: Alignment.centerRight, // End at the right
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Builder(builder: (context) {
                        return IconButton(
                          icon: const Icon(
                            Icons.menu,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            Scaffold.of(context).openDrawer();
                          },
                        );
                      }),
                      const Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(Icons.search_outlined,
                                color: Colors.white),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(Icons.headphones_outlined,
                                color: Colors.white),
                          ),
                          Padding(
                            padding: EdgeInsets.all(9.5),
                            child: Icon(Icons.chat_bubble_outline_rounded,
                                color: Colors.white),
                          ),
                          Stack(
                            children: [
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Icon(Icons.notifications_none_outlined,
                                    color: Colors.white),
                              ),
                              Positioned(
                                right: 5,
                                top: 5,
                                child: CircleAvatar(
                                  backgroundColor:
                                      Color.fromARGB(255, 111, 17, 10),
                                  radius: 8,
                                  child: Text(
                                    "5",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      )
                    ]),
              ),
            )),
        body: Stack(
          children: [
            // Main content with GridView
            Container(
              padding: const EdgeInsets.all(10.0),
              height: 200,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(255, 244, 114, 28), // Lighter orange
                    Color.fromARGB(255, 255, 77, 17), // Deeper orange
                  ],
                  begin: Alignment.centerLeft, // Start from the left
                  end: Alignment.centerRight, // End at the right
                ),
              ),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                ),
                itemCount:
                    gridItemCount + 1, // Show one extra for "Show More" button
                itemBuilder: (context, index) {
                  if (index == gridItemCount) {
                    // "Show More" button at the end
                    return GestureDetector(
                      onTap: _showMoreItems,
                      child: Container(
                        color: Colors.blue,
                        child: const Center(
                          child: Text(
                            'Show More',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    );
                  } else {
                    // Regular Grid items
                    return Container(
                      color: Colors.white,
                      child: Center(child: Text('Item $index')),
                    );
                  }
                },
              ),
            ),

            // DraggableScrollableSheet
            DraggableScrollableSheet(
              initialChildSize: 0.6, // Initial size of the sheet
              minChildSize: 0.6, // Minimum size when collapsed
              maxChildSize: 1, // Maximum size when expanded
              builder:
                  (BuildContext context, ScrollController scrollController) {
                return Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(20)),
                  ),
                  child: CustomScrollView(
                    controller:
                        scrollController, // Connects scrolling with the DraggableScrollableSheet
                    slivers: [
                      SliverToBoxAdapter(
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: Container(
                            width: 50,
                            height: 5,
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                        ),
                      ),

                      // Title Section
                      const SliverToBoxAdapter(
                        child: Padding(
                          padding: EdgeInsets.all(15.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Recent transactions",
                                  style: TextStyle(fontSize: 16)),
                              Row(
                                children: [
                                  Text(
                                    "VIEW ALL",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.orange,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(width: 5),
                                  Icon(
                                    Icons.arrow_forward_ios_outlined,
                                    size: 10,
                                    color: Colors.orange,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),

                      // Horizontal ListView
                      SliverToBoxAdapter(
                        child: SizedBox(
                          height: 100,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 10,
                            itemBuilder: (context, index) {
                              return Container(
                                width: 80,
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                decoration: BoxDecoration(
                                  color: Colors.teal[100],
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Center(child: Text('Item $index')),
                              );
                            },
                          ),
                        ),
                      ),

                      const SliverToBoxAdapter(
                          child: SizedBox(
                        height: 20,
                      )),
                      // Vertical GridView
                      SliverGrid(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, // Number of items per row
                          crossAxisSpacing: 10, // Spacing between grid items
                          mainAxisSpacing: 10,
                        ),
                        delegate: SliverChildBuilderDelegate(
                          (BuildContext context, int index) {
                            return Container(
                              decoration: BoxDecoration(
                                color: Colors.teal[100],
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(child: Text('Grid Item $index')),
                            );
                          },
                          childCount: 6, // Number of grid items
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
