import 'package:facebook_ui/model/user.dart';
import 'package:facebook_ui/widgets/create_room_button.dart';
import 'package:facebook_ui/widgets/profile_avatar.dart';
import 'package:flutter/material.dart';

class CreateRoom extends StatelessWidget {
  final List<User> users;

  const CreateRoom({Key key, this.users}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      color: Colors.white,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 4),
        itemCount: users.length + 1,
        itemBuilder: (context, index){
            if(index ==0 ){
                return CreateRoomButton();
            }
            final user = users[index - 1];
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: ProfileAvatar(
                imageUrl: user.imageUrl,
                isActive: true,
              ),
            );
        }
      ),
    );
  }
}
