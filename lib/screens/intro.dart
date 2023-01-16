import 'package:flutter/material.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Column(
        children: [
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              clipBehavior: Clip.hardEdge,
              child: Image.asset(
                'images/Mizan2.jpeg',
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            'For your birthday I have planned for us to spend the whole day together. By the time you wake up, this app should be on your phone. I have set this app up to mimic the #pickacardchallenge from TikTok. Im sure you know how it works but if not, the rules are simple: ',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 0, 0, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  '- There will be 6 events and 3 options for each event',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.left,
                ),
                Text(
                  '- Tap on a card to pick (if you dont like it, you can pick again)',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                Text(
                  '- After you confirm your pick, a camera button will appear',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                Text(
                  '- Use that to pull up the camera and take a picture once we get to the event',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                Text(
                  '- Once you have taken a picture, you can continue to the next page',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                Text(
                  '- swipe left or press the arrow to begin!',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
