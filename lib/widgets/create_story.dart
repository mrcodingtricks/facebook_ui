import 'package:facebook_ui/model/story.dart';
import 'package:facebook_ui/model/user.dart';
import 'package:facebook_ui/widgets/story_card.dart';
import 'package:flutter/material.dart';


class CreateStory extends StatelessWidget {
  final User user;
  final List<Story> stories;

  const CreateStory({Key key, this.user, this.stories}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      color: Colors.white,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 6),
        scrollDirection: Axis.horizontal,
        itemCount: stories.length + 1,
        itemBuilder: (context, index){
            if (index == 0) {
                return StoryCard( isAddStory: true, user: user,);
            }
          final story = stories[index - 1];
          return StoryCard(story: story,);
        },
      ),
    );
  }
}