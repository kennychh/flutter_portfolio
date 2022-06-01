import 'package:flutter/material.dart';
import 'package:portfolio/components/glassMorphism.dart';

class AboutAssets extends StatelessWidget {
  const AboutAssets({Key? key, required this.shouldShrinkAssets})
      : super(key: key);

  final bool shouldShrinkAssets;

  @override
  Widget build(BuildContext context) {
    ColorScheme scheme = Theme.of(context).colorScheme;
    return ConstrainedBox(
      constraints: shouldShrinkAssets
          ? const BoxConstraints(maxWidth: 400, maxHeight: 500)
          : const BoxConstraints(maxWidth: 500, maxHeight: 550),
      child: Align(
          alignment: Alignment.topRight,
          child: Flexible(
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                ConstrainedBox(
                  constraints: shouldShrinkAssets
                      ? const BoxConstraints(maxHeight: 250)
                      : const BoxConstraints(maxHeight: 300),
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(32),
                      child: GlassMorphism(
                        opacity: 0.75,
                        constraints: shouldShrinkAssets
                            ? const BoxConstraints(maxHeight: 250)
                            : const BoxConstraints(maxHeight: 300),
                        color: scheme.surface,
                        blur: 10,
                        child: Image.asset(
                          './assets/memoji_1.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                    right: shouldShrinkAssets ? 100 : 150,
                    top: shouldShrinkAssets ? 200 : 250,
                    child: ConstrainedBox(
                      constraints: shouldShrinkAssets
                          ? const BoxConstraints(maxHeight: 300)
                          : const BoxConstraints(maxHeight: 350),
                      child: AspectRatio(
                        aspectRatio: 1,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(32),
                          child: GlassMorphism(
                            opacity: 0.75,
                            constraints: shouldShrinkAssets
                                ? const BoxConstraints(maxHeight: 300)
                                : const BoxConstraints(maxHeight: 350),
                            color: scheme.surface,
                            blur: 10,
                            child: Image.asset(
                              './assets/memoji_2.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    )),
              ],
            ),
          )),
    );
  }
}
