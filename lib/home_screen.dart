import 'package:facebook_ui/app_config.dart';
import 'package:facebook_ui/widgets/create_post.dart';
import 'package:facebook_ui/widgets/create_room.dart';
import 'package:facebook_ui/widgets/create_story.dart';
import 'package:facebook_ui/widgets/post_list.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:facebook_ui/data.dart';


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            brightness: Brightness.light,
            backgroundColor: Colors.white,
            title: Text(
              'facebook',
              style: TextStyle(
                color: AppConfig.facebook,
                fontSize: 28,
                fontWeight: FontWeight.bold,
                letterSpacing: -1.5,
              ),
            ),
            centerTitle: false,
            floating: true,
            actions: [
              Container(
                margin: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  shape: BoxShape.circle,
                ),
                child: IconButton(icon: Icon(Icons.search, size: 30, color: Colors.black,), onPressed: () {})),

                Container(
                margin: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  shape: BoxShape.circle,
                ),
                child: IconButton(icon: Icon(MdiIcons.facebookMessenger, size: 30, color: Colors.black,), onPressed: () {}))
              ],
          ),

          SliverToBoxAdapter(
            child: CreatePost(user: currentUser)
          ),

          SliverPadding(
            padding: const EdgeInsets.only(top: 10, bottom: 5),
            sliver: SliverToBoxAdapter(
              child: CreateRoom(users: onlineUsers)
            ),
          ),

          SliverPadding(
            padding: const EdgeInsets.only(top: 10, bottom: 5),
            sliver: SliverToBoxAdapter(
              child: CreateStory(user: currentUser, stories: stories)
            ),
          ),
          SliverList(delegate: SliverChildBuilderDelegate(
            (context, index) {
              final post = posts[index];
              return PostList(post: post);
            }
          )),

        ],
      ),
    );
  }
}
