import 'package:cached_network_image/cached_network_image.dart';
import 'package:facebook_ui/app_config.dart';
import 'package:facebook_ui/model/post.dart';
import 'package:facebook_ui/widgets/profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class PostList extends StatelessWidget {
  final Post post;

  const PostList({Key key, this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      padding: const EdgeInsets.symmetric(vertical: 8),
      color: Colors.white,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              children: [
                ProfileAvatar(
                  imageUrl: post.user.imageUrl,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        post.user.name,
                        style: const TextStyle(fontWeight: FontWeight.w600),
                      ),
                      Row(
                        children: [
                          Text('${post.timeAgo} • ',
                              style: TextStyle(
                                  color: Colors.grey[600], fontSize: 12)),
                          Icon(
                            Icons.public,
                            color: Colors.grey[600],
                            size: 12,
                          )
                        ],
                      )
                    ],
                  ),
                ),
                IconButton(icon: const Icon(Icons.more_horiz), onPressed: () {})
              ],
            ),
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Text(post.caption),
          ),
          post.imageUrl != null
              ? Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: CachedNetworkImage(imageUrl: post.imageUrl),
                )
              : const SizedBox.shrink(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: _PostStats(post: post),
          ),
        ],
      ),
    );
  }
}

class _PostStats extends StatelessWidget {
  final Post post;

  const _PostStats({Key key, this.post}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            children: [
              Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                      color: AppConfig.facebook, shape: BoxShape.circle),
                  child: Icon(
                    Icons.thumb_up,
                    size: 10,
                    color: Colors.white,
                  )),
              const SizedBox(width: 4),
              Expanded(
                child: Text(
                  '${post.likes}',
                  style: TextStyle(color: Colors.grey[600]),
                ),
              ),
              const SizedBox(width: 8),
              Text(
                '${post.comments} Comments',
                style: TextStyle(color: Colors.grey[600]),
              ),
              const SizedBox(width: 8),
              Text(
                '${post.shares} Shares',
                style: TextStyle(color: Colors.grey[600]),
              ),
            ],
          ),
        ),
        const Divider(),
        Row(
          children: [
            _PostButton(
              icon: Icon(MdiIcons.thumbUpOutline, color: Colors.grey[600], size: 20,),
              text: 'Like',
              onTap: (){},
            ),
             _PostButton(
              icon: Icon(MdiIcons.commentOutline, color: Colors.grey[600], size: 20,),
              text: 'Comment',
              onTap: (){},
            ),
             _PostButton(
              icon: Icon(MdiIcons.shareOutline, color: Colors.grey[600], size: 20,),
              text: 'Share',
              onTap: (){},
            )
          ],
        )
      ],
    );
  }
}


class _PostButton extends StatelessWidget {
  final Icon icon;
  final String text;
  final Function onTap;

  const _PostButton({Key key, this.icon, this.text, this.onTap}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Material(
        color: Colors.white,
        child: InkWell(
          onTap: onTap,
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                icon,
                const SizedBox(width: 4,),
                Text(text)
              ],
            ),
          ),
        ),
      ),
    );
  }
}