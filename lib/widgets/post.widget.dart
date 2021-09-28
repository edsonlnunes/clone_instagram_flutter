import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class Post extends StatelessWidget {
  const Post({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: size.height * .70,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          buildTopWidgets(),
          buildContent(),
          const SizedBox(height: 10),
          buildBottomWidgets(),
        ],
      ),
    );
  }

  Widget buildTopWidgets() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: const [
          CircleAvatar(
            backgroundColor: Colors.yellow,
            radius: 15,
          ),
          SizedBox(width: 5),
          Text(
            'growdev',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          Spacer(),
          Icon(
            Icons.more_vert_rounded,
            size: 30,
          ),
        ],
      ),
    );
  }

  Widget buildContent() {
    return Expanded(
      child: Image.asset(
        'assets/images/img-1.png',
        fit: BoxFit.fill,
      ),
    );
  }

  Widget buildBottomWidgets() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: const [
              Icon(
                Icons.favorite_border,
                size: 30,
              ),
              SizedBox(width: 15),
              Icon(
                Icons.mode_comment_outlined,
                size: 30,
              ),
              SizedBox(width: 15),
              Icon(
                Icons.send_outlined,
                size: 30,
              ),
              Spacer(),
              Icon(
                Icons.bookmark_border,
                size: 30,
              ),
            ],
          ),
          const SizedBox(height: 10),
          const Text(
            '500 likes',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'growdev',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(text: ' A descrição do post vai aqui')
              ],
            ),
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 15),
          buildAddComent(),
        ],
      ),
    );
  }

  Widget buildAddComent() {
    return Row(
      children: const [
        CircleAvatar(
          backgroundColor: Colors.yellow,
          radius: 10,
        ),
        SizedBox(width: 10),
        Text(
          'Add a comment...',
          style: TextStyle(
            color: Colors.grey,
          ),
        ),
        Spacer(),
        Text('🤣   💪')
      ],
    );
  }
}
