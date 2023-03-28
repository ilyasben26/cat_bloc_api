import 'package:animated_text_kit/animated_text_kit.dart';
import '../constants/constants.dart';
import 'text_skeleton.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CatCardReborn extends StatelessWidget {
  final String catFact;
  final String catPic;
  final bool isLocal;
  final bool isLoading;

  const CatCardReborn(
      {super.key,
      this.isLoading = false,
      this.catFact = "",
      required this.catPic,
      this.isLocal = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white30,
          borderRadius: BorderRadius.all(Radius.circular(30)),
        ),
        width: 400,
        height: 600,
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: ClipRRect(
                clipBehavior: Clip.hardEdge,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(30),
                ),
                child: isLocal
                    ? Shimmer.fromColors(
                        baseColor: const Color.fromRGBO(204, 204, 204, 1),
                        highlightColor: Colors.white,
                        child: Image.asset(
                          catPic,
                          fit: BoxFit.fitWidth,
                        ),
                      )
                    : FadeInImage.assetNetwork(
                        placeholderFit: BoxFit.fitWidth,
                        placeholder: placeholder,
                        imageErrorBuilder: (context, error, stackTrace) {
                          return Image.asset(
                            placeholder,
                            fit: BoxFit.fitWidth,
                          );
                        },
                        image: catPic,
                        fit: BoxFit.cover,
                      ),
              ),
            ),
            Expanded(
              child: Container(
                width: 400,
                decoration: const BoxDecoration(
                  color: Colors.white30,
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(30),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: isLoading
                            ? Shimmer.fromColors(
                                baseColor: Colors.black,
                                highlightColor: Colors.grey,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    TextSkeleton(
                                        //height: 20,
                                        ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    TextSkeleton(
                                        //width: 230,
                                        ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    TextSkeleton(
                                        //width: 250,
                                        ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    TextSkeleton(
                                        //width: 260,
                                        ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    TextSkeleton(
                                        //width: 200,
                                        ),
                                  ],
                                ),
                              )
                            : AnimatedTextKit(
                                displayFullTextOnTap: true,
                                isRepeatingAnimation: false,
                                animatedTexts: [
                                  TyperAnimatedText(catFact,
                                      speed: const Duration(milliseconds: 50)),
                                ],
                              ) /*Text(
                              catFact,
                              textAlign: TextAlign.justify,
                            ),*/
                        ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
