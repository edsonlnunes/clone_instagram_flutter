import 'package:flutter/material.dart';

class Story extends StatelessWidget {
  final int index;
  const Story({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 60,
          height: 60,
          padding: const EdgeInsets.all(2),
          margin: const EdgeInsets.only(top: 7),
          decoration: BoxDecoration(
            color: index == 0 ? Colors.grey : null,
            gradient: index != 0
                ? const LinearGradient(
                    colors: [
                      Color.fromRGBO(250, 126, 30, 1),
                      Color.fromRGBO(214, 41, 118, 1)
                    ],
                  )
                : null,
            shape: BoxShape.circle,
          ),
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.black,
              shape: BoxShape.circle,
            ),
            child: const Padding(
              padding: EdgeInsets.all(4.0),
              child: CircleAvatar(
                backgroundColor: Colors.blue,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          index == 0 ? 'Your Story' : 'growdev',
          style: TextStyle(
            color: index == 0 ? Colors.grey : Colors.white,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}
