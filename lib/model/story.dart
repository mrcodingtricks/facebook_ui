import 'package:facebook_ui/model/user.dart';

class Story{
  final User user;
  final String imageUrl;
  final bool isViewed;

  Story({this.user, this.imageUrl, this.isViewed = false});
}