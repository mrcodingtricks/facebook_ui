import 'package:facebook_ui/app_config.dart';
import 'package:flutter/material.dart';

class CreateRoomButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: OutlineButton(
        onPressed: (){},
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        color: Colors.white,
        textColor: AppConfig.facebook,
        borderSide: BorderSide(
          width: 3.0,
          color: Colors.blueAccent[100]
        ),
        child: Row(
          children: [
            ShaderMask(shaderCallback: (rect) => AppConfig.roomGradient.createShader(rect),
            
              child: Icon(Icons.video_call, size: 35.0, color: Colors.white,),
            ),
            const SizedBox(width: 4),
            Text('Create\nRoom')
          ],
        ),
      ),
    );
  }
}