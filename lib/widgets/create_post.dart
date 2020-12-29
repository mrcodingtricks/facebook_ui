import 'package:cached_network_image/cached_network_image.dart';
import 'package:facebook_ui/model/user.dart';
import 'package:flutter/material.dart';

class CreatePost extends StatelessWidget {
  final User user;

  const CreatePost({Key key, this.user}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 12.0, right: 12.0, top: 7),
      color: Colors.white,
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.grey[200],
                backgroundImage: CachedNetworkImageProvider(user.imageUrl),
                radius: 20,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: TextField(
                  decoration: InputDecoration.collapsed(
                      hintText: 'What\'s on your mind, ${user.name}?'),
                ),
              )
            ],
          ),
          const Divider(height: 10, thickness: 0.5,),
          Container(
              height: 40,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FlatButton.icon(
                      onPressed: () {},
                      icon: Icon(
                        Icons.videocam,
                        color: Colors.red,
                      ),
                      label: Text('Live')),
                                  const VerticalDivider(width: 8),
                   FlatButton.icon(
                      onPressed: () {},
                      icon: Icon(
                        Icons.photo_library,
                        color: Colors.green,
                      ),
                      label: Text('Photo')),
                      const VerticalDivider(width: 8),
                   FlatButton.icon(
                      onPressed: () {},
                      icon: Icon(
                        Icons.video_call,
                        color: Colors.purpleAccent,
                      ),
                      label: Text('Room')),

                ],
              ))
        ],
      ),
    );
  }
}
