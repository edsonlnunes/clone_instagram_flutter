import 'package:clone_instagram_local/widgets/post.widget.dart';
import 'package:clone_instagram_local/widgets/story.widget.dart';
import 'package:flutter/material.dart';

class FeedPage extends StatefulWidget {
  const FeedPage({Key? key}) : super(key: key);

  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  double scale = 1;
  int? indexTaped;

  void scaleUp(int index) {
    setState(() {
      scale = 1;
      indexTaped = index;
    });
  }

  void scaleDown(int index) {
    setState(() {
      scale = 0.9;
      indexTaped = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: widget.key,
      appBar: buildAppBar(),
      body: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (notification) {
          notification.disallowGlow();
          return true;
        },
        child: SingleChildScrollView(
          child: Column(
            children: [
              buildStories(),
              ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                separatorBuilder: (_, __) {
                  return const SizedBox(
                    height: 25,
                  );
                },
                shrinkWrap: true,
                itemCount: 100,
                itemBuilder: (_, index) {
                  return const Post();
                },
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: buildBottomNavigation(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: const Text(
        'Instagram',
        style: TextStyle(
          fontFamily: 'Shadows Into Light',
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
      ),
      actions: [
        GestureDetector(
          child: const Icon(
            Icons.add_box_outlined,
            size: 30,
          ),
          onTap: () {},
        ),
        const SizedBox(width: 20),
        GestureDetector(
          child: const Icon(
            Icons.favorite_border_rounded,
            size: 30,
          ),
          onTap: () {},
        ),
        const SizedBox(width: 20),
        GestureDetector(
          child: const Icon(
            Icons.maps_ugc_rounded,
            size: 30,
          ),
          onTap: () {},
        ),
        const SizedBox(width: 15),
      ],
    );
  }

  Widget buildStories() {
    return Container(
      height: 100,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: .3,
            color: Colors.white,
          ),
        ),
      ),
      child: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (notification) {
          notification.disallowGlow();
          return true;
        },
        child: ListView.separated(
          separatorBuilder: (_, __) => const SizedBox(
            width: 10,
          ),
          itemCount: 12,
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, index) {
            return GestureDetector(
              onTap: () async {
                scaleDown(index);
                await Future.delayed(const Duration(milliseconds: 100));
                scaleUp(index);
              },
              onLongPress: () => scaleDown(index),
              onLongPressEnd: (_) => scaleUp(index),
              child: Transform.scale(
                child: Story(index: index),
                scale: indexTaped == index ? scale : 1,
              ),
            );
          },
        ),
      ),
    );
  }

  Widget buildBottomNavigation() {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Colors.white,
            width: .3,
          ),
        ),
      ),
      child: BottomNavigationBar(
        currentIndex: 0,
        fixedColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black,
        iconSize: 30,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.ondemand_video_outlined),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag_outlined),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: CircleAvatar(
              backgroundColor: Colors.blue,
              radius: 15,
            ),
            label: '',
          ),
        ],
      ),
    );
  }
}
