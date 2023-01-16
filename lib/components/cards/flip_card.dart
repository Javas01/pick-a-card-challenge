// import 'package:flip_card/flip_card.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/material.dart';
// import 'package:flip_card/flip_card_controller.dart';

// class MyWidget extends StatelessWidget {
//   const MyWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return FlipCard(
//                             fill: Fill.fillBack,
//                             flipOnTouch: !cardSelected,
//                             controller: option.controller,
//                             onFlipDone: (isFront) {
//                               if (isFront) {
//                                 showDialog(
//                                   context: context,
//                                   builder: (context) => AlertDialog(
//                                     title: Text('You picked ${option.name}'),
//                                     actions: [
//                                       TextButton(
//                                         child: const Text('Eh, pick again'),
//                                         onPressed: () {
//                                           option.controller.toggleCard();
//                                           Navigator.of(context).pop();
//                                         },
//                                       ),
//                                       TextButton(
//                                         child: const Text('Yay! Sounds fun'),
//                                         onPressed: () {
//                                           setState(() {
//                                             cardSelected = true;
//                                           });
//                                           Navigator.of(context).pop();
//                                         },
//                                       )
//                                     ],
//                                   ),
//                                 );
//                               }
//                             },
//                             front: const Card(
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.all(
//                                   Radius.circular(20),
//                                 ),
//                               ),
//                               child: SizedBox(
//                                 width: 400,
//                                 height: 200,
//                                 child: Center(child: Text('Flip Me')),
//                               ),
//                             ),
//                             back: Card(
//                               shape: const RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.all(
//                                   Radius.circular(20),
//                                 ),
//                               ),
//                               elevation: 10,
//                               shadowColor: Colors.green,
//                               child: SizedBox(
//                                 width: 400,
//                                 height: 200,
//                                 child: Center(child: Text(option.name)),
//                               ),
//                             ),
//                           ),;
//   }
// }