import 'package:mystery_app/components/cards/front_card.dart';
import 'package:mystery_app/components/cards/back_card.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mystery_app/screens/swipe_view/config.dart';
import 'package:mystery_app/components/sexy_bar.dart';
import 'package:mystery_app/utils/show_confirm.dart';
import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter/material.dart' hide Page;
import 'package:mystery_app/models/models.dart';
import 'package:mystery_app/screens/intro.dart';
import 'package:flip_card/flip_card.dart';
import 'package:camera/camera.dart';
import 'dart:io';

class SwipeView extends StatefulWidget {
  const SwipeView({
    Key? key,
    required this.camera,
  }) : super(key: key);

  final CameraDescription camera;

  @override
  State<SwipeView> createState() => _SwipeViewState();
}

class _SwipeViewState extends State<SwipeView> {
  late List<Page> pages = pagesConfig;
  late CameraController _controller;
  late PageController _pageController;
  final FlipCardController _flip1Controller = FlipCardController();
  final FlipCardController _flip2Controller = FlipCardController();
  final FlipCardController _flip3Controller = FlipCardController();

  int _pageIndex = 0;
  bool isLastPage = false;

  Future<void> _loadPage(int pageIndex) async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.getString('page $pageIndex option') != null) {
      setState(() {
        pages[pageIndex].selectedOption =
            prefs.getString('page $pageIndex option')!;
      });
    }
    if (prefs.getString('page $pageIndex image') != null) {
      setState(() {
        pages[pageIndex].imagePath = prefs.getString('page $pageIndex image')!;
      });
    }
  }

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();

    _controller = CameraController(
      widget.camera,
      ResolutionPreset.low,
    );

    _controller.initialize();
  }

  @override
  void dispose() {
    _controller.dispose();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemCount: 6,
      controller: _pageController,
      onPageChanged: (index) {
        _loadPage(index);
        setState(
          () {
            _pageIndex = index;
            isLastPage = index == 5;
          },
        );
      },
      itemBuilder: (context, index) => Scaffold(
        appBar: AppBar(
          title: Text(
            index == 0
                ? '🎉 Happy 21st Birthday Mizan! 🎉'
                : pages[_pageIndex].title,
          ),
        ),
        body: index == 0
            ? const IntroPage()
            : Column(
                children: pages[_pageIndex].selectedOption.isNotEmpty
                    ? [
                        SizedBox(
                          height: 400,
                          width: 400,
                          child: pages[_pageIndex].imagePath.isNotEmpty
                              ? Image.file(
                                  File(pages[_pageIndex].imagePath),
                                )
                              : null,
                        ),
                        BackCard(option: pages[_pageIndex].selectedOption)
                      ]
                    : [
                        Option(
                          name: pages[_pageIndex].options[0],
                          controller: _flip1Controller,
                        ),
                        Option(
                          name: pages[_pageIndex].options[1],
                          controller: _flip2Controller,
                        ),
                        Option(
                          name: pages[_pageIndex].options[2],
                          controller: _flip3Controller,
                        )
                      ]
                        .map<Widget>(
                          (option) => FlipCard(
                            fill: Fill.fillBack,
                            flipOnTouch:
                                pages[_pageIndex].selectedOption.isEmpty,
                            controller: option.controller,
                            onFlipDone: (isFront) async {
                              if (isFront) {
                                Option? selectedOption =
                                    await showConfirm(context, option);
                                if (selectedOption == null) return;
                                final prefs =
                                    await SharedPreferences.getInstance();

                                setState(
                                  () {
                                    pages[_pageIndex].selectedOption =
                                        selectedOption.name;
                                    prefs.setString('page $_pageIndex option',
                                        selectedOption.name);
                                  },
                                );
                              }
                            },
                            front: FrontCard(page: pages[_pageIndex]),
                            back: BackCard(option: option.name),
                          ),
                        )
                        .toList(),
              ),
        bottomNavigationBar: SexyBar(
            pageController: _pageController,
            pageIndex: _pageIndex,
            pages: pages,
            isLastPage: isLastPage,
            cameraController: _controller,
            savePicture: (image) async {
              final prefs = await SharedPreferences.getInstance();
              setState(() {
                pages[_pageIndex].imagePath = image;
                prefs.setString('page $_pageIndex image', image);
              });
            }),
      ),
    );
  }
}
