import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movies_streaming_app/widgets/ironman_section.dart';
import 'package:movies_streaming_app/widgets/movies_section.dart';
import 'package:movies_streaming_app/widgets/spiderman_section.dart';
import 'package:movies_streaming_app/widgets/thor_section.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this, initialIndex: 0);
    _tabController.addListener(_tabHandler);
    super.initState();
  }

  void _tabHandler() {
    if (_tabController.indexIsChanging) {
      setState(() {});
    }
  }

  @override
  Widget build(context) {
    return SafeArea(
        child: Scaffold(
      drawer: const Drawer(
        backgroundColor: Color(0xff1d1d28),
      ),
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Movies Streaming"),
        actions: [
          const Padding(
            padding: EdgeInsets.only(right: 15),
            child: Icon(Icons.search),
          )
        ],
      ),
      body: ListView(
        children: [
          CarouselSlider(
            options: CarouselOptions(
              height: 230,
              autoPlay: true,
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              aspectRatio: 16 / 9,
              enableInfiniteScroll: true,
              enlargeCenterPage: true,
              viewportFraction: 0.8,
            ),
            items: [
              carouselContainer("deadpool"),
              carouselContainer("thor3"),
              carouselContainer("upcoming2"),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Center(
            child: TabBar(
              controller: _tabController,
              isScrollable: true,
              indicatorColor: Colors.redAccent,
              unselectedLabelColor: Colors.white.withOpacity(0.5),
              labelStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w500),
              dividerHeight: 0,
              tabs: [
                const Tab(
                  text: "All",
                ),
                const Tab(
                  text: "Thor",
                ),
                const Tab(
                  text: "Spider Man",
                ),
                const Tab(
                  text: "Iron Man",
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Center(
            child: [
              MoviesSection(),
              ThorSection(),
              SpidermanSection(),
              IronmanSection(),
            ][_tabController.index],
          )
        ],
      ),
    ));
  }

  Container carouselContainer(String name) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          image: DecorationImage(
            image: AssetImage("assets/images/$name.jpg"),
            fit: BoxFit.cover,
          )),
    );
  }
}
