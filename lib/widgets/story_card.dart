import 'package:cached_network_image/cached_network_image.dart';
import 'package:facebook_ui/app_config.dart';
import 'package:facebook_ui/model/story.dart';
import 'package:facebook_ui/model/user.dart';
import 'package:facebook_ui/widgets/profile_avatar.dart';
import 'package:flutter/material.dart';

class StoryCard extends StatelessWidget {
  final bool isAddStory;
  final User user;
  final Story story;

  const StoryCard({Key key, this.isAddStory = false, this.user, this.story}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: CachedNetworkImage(
              imageUrl: isAddStory ? user.imageUrl : story.imageUrl,
              height: double.infinity,
              width: 110.0,
              fit: BoxFit.cover
            ),
          ),

          Container(
            height: double.infinity,
            width: 110,
            decoration: BoxDecoration(
              gradient: AppConfig.storyGradient,
              borderRadius: BorderRadius.circular(12)
            ),
          ),
          Positioned(
            left: 8,
            right: 8,
            bottom: 8,
            child: Text( isAddStory ? 'Add to Story': story.user.name, style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              
            ), maxLines: 2, overflow: TextOverflow.ellipsis,)
          ),

          Positioned(
            left: 8,
            top: 8,
            child: isAddStory ? Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle
              ),
              child: IconButton(
                padding: EdgeInsets.zero,
                icon: Icon(Icons.add,),
                iconSize: 30,
                color: AppConfig.facebook,
                 onPressed: (){}),
            ) : ProfileAvatar( imageUrl: story.user.imageUrl, hasBorder: !story.isViewed,)
          
          )
        ],
      ),
    );
  }
}