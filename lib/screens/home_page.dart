import 'package:discover/screens/utils/models.dart';
import 'package:gradient_borders/gradient_borders.dart';
import 'package:flutter/material.dart';

int selectedIndex = 0;

class Home_Page extends StatefulWidget {
  const Home_Page({super.key});

  @override
  State<Home_Page> createState() => _Home_PageState();
}

class _Home_PageState extends State<Home_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D053D),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0D053D),
        elevation: 0,
        title: const Text(
          'Discover',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w600, fontSize: 24),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: Icon(
              Icons.search,
              color: Colors.white.withOpacity(0.5),
              size: 30,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            StoryList(),
            const SizedBox(
              height: 20,
            ),
            PostList(),
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.only(right: 250),
              child: Text(
                'Most Watched',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 18),
              ),
            ),
            PostList_2(),
            PostList_2()
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int index) {
          setState(() {
            selectedIndex = index;
          });
        },
        backgroundColor: Color.fromARGB(255, 3, 7, 80),
        unselectedItemColor: Colors.grey,
        fixedColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        currentIndex: selectedIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Colors.grey,
            ),
            label: 'Discover',
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.videocam,
                color: Colors.grey,
              ),
              label: 'Browse'),
          BottomNavigationBarItem(
              icon: Icon(Icons.bookmark, color: Colors.grey),
              label: 'Bookmark'),
          BottomNavigationBarItem(
              icon: Icon(Icons.chrome_reader_mode_sharp, color: Colors.grey),
              label: 'More'),
        ],
      ),
    );
  }

  Widget PostList() {
    return Container(
      padding: const EdgeInsets.only(top: 10),
      height: 250,
      child: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return TimeWeather(Posts.post[index]);
        },
        itemCount: Posts.post.length,
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        primary: false,
        scrollDirection: Axis.horizontal,
      ),
    );
  }

  Widget PostList_2() {
    return Container(
      padding: const EdgeInsets.only(top: 10),
      height: 180,
      child: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return PostsMethod(Posts.post_1[index]);
        },
        itemCount: Posts.post_1.length,
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        primary: false,
        scrollDirection: Axis.horizontal,
      ),
    );
  }

  Widget StoryList() {
    return Container(
      padding: const EdgeInsets.only(top: 10),
      height: 100,
      child: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return story(Storys.name[index]);
        },
        itemCount: Storys.name.length,
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        primary: false,
        scrollDirection: Axis.horizontal,
      ),
    );
  }

  Widget story(Storys name) {
    return Row(
      children: [
        const SizedBox(
          width: 14,
        ),
        Column(
          children: [
            Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: const GradientBoxBorder(
                      gradient: LinearGradient(
                        colors: [
                          Color(0xFF3797FB),
                          Color(0xFF6E37FB),
                        ],
                      ),
                      width: 2,
                    ),
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: NetworkImage(name.urlName), fit: BoxFit.cover),
                  ),
                  width: 70,
                  height: 70,
                ),
                Positioned(
                  right: 1,
                  bottom: 1,
                  child: Container(
                    height: 20,
                    width: 20,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: NetworkImage(name.nikname == 'Your story' ||
                                    name.nikname == 'Isabella'
                                ? 'https://cdn3.iconfinder.com/data/icons/social-messaging-ui-color-line/254000/39-512.png'
                                : ''),
                            fit: BoxFit.cover)),
                  ),
                ),
              ],
            ),
            Text(
              name.nikname,
              style: const TextStyle(color: Colors.white),
            ),
          ],
        ),
      ],
    );
  }

  Widget TimeWeather(Posts post) {
    return Container(
      padding: const EdgeInsets.only(top: 5),
      margin: const EdgeInsets.all(4),
      child: Column(
        children: [
          SizedBox(
            height: 8,
          ),
          SizedBox(
            height: 8,
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  post.time,
                  style: TextStyle(
                      color: post.celsi == 'Karol Bary\n2 weeks ago'
                          ? Colors.white
                          : Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 20),
                ),
              ),
              SizedBox(
                width: 80,
              ),
              Container(
                child: Image.network(post.image),
                width: 150,
                height: 140,
              ),
            ],
          ),
          SizedBox(
            height: 2,
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 255),
            child: Text(
              post.celsi,
              style: TextStyle(
                color: post.celsi == 'Karol Bary\n2 weeks ago'
                    ? Colors.white
                    : Colors.black,
              ),
            ),
          ),
        ],
      ),
      decoration: BoxDecoration(
        color: post.celsi == 'Karol Bary\n2 weeks ago'
            ? const Color(0xFF3BCDF8)
            : const Color(0xFFFECFA6),
        borderRadius: BorderRadius.circular(18),
      ),
      width: 370,
      height: 561,
    );
  }

  Widget PostsMethod(Posts post_1) {
    return Container(
      padding: const EdgeInsets.only(top: 5),
      margin: const EdgeInsets.all(4),
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(image: NetworkImage(post_1.image))),
                width: 100,
                height: 100,
              ),
              SizedBox(
                width: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  post_1.time,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 20),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              post_1.celsi,
              style: TextStyle(color: Colors.white.withOpacity(0.3)),
            ),
          ),
        ],
      ),
      width: 400,
    );
  }
}
