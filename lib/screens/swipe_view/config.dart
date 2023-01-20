import 'package:mystery_app/models/models.dart';

List<Page> pagesConfig = [
  Page(
    title: 'Intro',
    options: ['', '', ''],
    cardImage: 'images/breakfast.png',
    imagePath: 'none',
  ),
  Page(
    title: 'Breakfast', // 100
    options: [
      'Pancake Social',
      'Breakfast Boys',
      'Atlanta Breakfast Club',
    ],
    cardImage: 'images/breakfast.png',
  ),
  Page(
    title: 'Treat Yourself', // 200
    options: [
      'My Signature Scent',
      'My Signature Scent',
      'My Signature Scent',
    ],
    cardImage: 'images/shop.jpeg',
  ),
  Page(
    title: 'Lunch', // 50
    options: [
      'Shwarma',
      'Springreens',
      'Chin Chin',
    ],
    cardImage: 'images/lunch.webp',
  ),
  Page(
    title: 'Birthday Suprise', // 150
    options: [
      'The Selfie Experience',
      'The Selfie Experience',
      'The Selfie Experience',
    ],
    cardImage: 'images/fun.jpeg',
  ),
  Page(
    title: 'Dinner', // 100
    options: [
      'Sundial',
      'Nikolais Roof',
      'Sundial',
    ],
    cardImage: 'images/dinner.png',
  ),
];
