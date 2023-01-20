import 'package:camera/camera.dart';
import 'package:flutter/material.dart' hide Page;
import 'package:mystery_app/components/dot_indicator.dart';
import 'package:mystery_app/models/models.dart';
import 'package:mystery_app/screens/summary.dart';

class SexyBar extends StatelessWidget {
  const SexyBar({
    super.key,
    required this.pageController,
    required this.cameraController,
    required this.pageIndex,
    required this.pages,
    required this.isLastPage,
    required this.savePicture,
  });
  final PageController pageController;
  final CameraController cameraController;
  final int pageIndex;
  final List<Page> pages;
  final bool isLastPage;
  final Function savePicture;

  @override
  Widget build(BuildContext context) {
    print(pageIndex);
    return SafeArea(
      minimum: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.pink.withOpacity(0.7),
              borderRadius: const BorderRadius.all(Radius.circular(24)),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ...List.generate(
                  6,
                  (index) => GestureDetector(
                    onTap: (() => pageController.animateToPage(
                          index,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.ease,
                        )),
                    child: Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: DotIndicator(isActive: index == pageIndex),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Visibility(
            visible:
                pages[pageIndex].selectedOption.isNotEmpty || pageIndex == 0,
            child: pages[pageIndex].imagePath.isEmpty
                ? Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.pink.withOpacity(0.7),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(24),
                      ),
                    ),
                    child: IconButton(
                        onPressed: () {
                          showBottomSheet(
                            enableDrag: true,
                            context: context,
                            builder: (context, [bool mounted = true]) {
                              return Column(
                                children: [
                                  Expanded(
                                    child: CameraPreview(
                                      cameraController,
                                      child: Align(
                                        alignment: Alignment.bottomCenter,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: FloatingActionButton(
                                            onPressed: () async {
                                              try {
                                                final image =
                                                    await cameraController
                                                        .takePicture();
                                                savePicture(image.path);

                                                if (!mounted) return;
                                                Navigator.pop(context);
                                              } catch (e) {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  SnackBar(
                                                    content: Text(
                                                      e.toString(),
                                                    ),
                                                  ),
                                                );
                                              }
                                            },
                                            backgroundColor: Colors.pinkAccent,
                                            child: const Icon(Icons.cake),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        icon: const Icon(Icons.camera_alt_rounded)),
                  )
                : ElevatedButton(
                    onPressed: () {
                      if (isLastPage) {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => SummaryPage(pages: pages),
                          ),
                        );
                      }
                      pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.ease,
                      );
                    },
                    style:
                        ElevatedButton.styleFrom(shape: const CircleBorder()),
                    child: isLastPage
                        ? const Icon(
                            Icons.done,
                          )
                        : const Icon(
                            Icons.arrow_forward,
                          ),
                  ),
          )
        ],
      ),
    );
  }
}
