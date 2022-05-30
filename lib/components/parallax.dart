import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;
import 'package:google_fonts/google_fonts.dart';
import '../globals.dart';

class ListItem extends StatelessWidget {
  ListItem({
    Key? key,
    required this.imageUrl,
    this.name = '',
    this.subtitle = '',
    this.description = const [''],
    this.time,
    this.aspectRatio = 16 / 9,
    this.borderRadius = 32,
    this.fillBackground = true,
    this.showGithubIcon = false,
    this.showViewMoreIcon = false,
    this.url = '',
  }) : super(key: key);

  final String imageUrl;
  final String name;
  final String subtitle;
  final List<String> description;
  final double aspectRatio;
  final double borderRadius;
  final bool showGithubIcon;
  final bool fillBackground;
  final bool showViewMoreIcon;
  final String url;
  // ignore: prefer_typing_uninitialized_variables
  final time;
  final GlobalKey _backgroundImageKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    ColorScheme scheme = Theme.of(context).colorScheme;
    return LayoutBuilder(builder: ((context, constraints) {
      if (constraints.isMobile) {
        return Container(
          margin: const EdgeInsets.only(bottom: 50),
          decoration: fillBackground
              ? BoxDecoration(
                  color: scheme.surface,
                  borderRadius: BorderRadius.all(Radius.circular(borderRadius)))
              : BoxDecoration(
                  border: Border.all(
                    color: scheme.surface,
                    width: 2,
                  ),
                  borderRadius:
                      BorderRadius.all(Radius.circular(borderRadius))),
          child: Column(
            children: [
              Container(
                constraints: const BoxConstraints(maxHeight: 500),
                child: AspectRatio(
                  aspectRatio: aspectRatio,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(borderRadius),
                    child: _buildParallaxBackground(context),
                  ),
                ),
              ),
              _listItemText(context),
              if (showGithubIcon)
                Padding(
                  padding:
                      const EdgeInsets.only(bottom: 32, left: 32, right: 32),
                  child: TextButton(
                    onPressed: () {
                      html.window.open(url, 'new tab');
                    },
                    style: TextButton.styleFrom(
                      minimumSize: const Size.fromHeight(40),
                      primary: scheme.onSecondaryContainer,
                      backgroundColor: scheme.secondaryContainer,
                      padding: const EdgeInsets.all(20.0),
                      textStyle: GoogleFonts.poppins(
                          fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    child: const Text('View on GitHub'),
                  ),
                )
            ],
          ),
        );
      }
      return Container(
          margin: const EdgeInsets.only(bottom: 50),
          decoration: fillBackground
              ? BoxDecoration(
                  color: scheme.surface,
                  borderRadius:
                      BorderRadius.all(Radius.circular(borderRadius + 32)))
              : BoxDecoration(
                  border: Border.all(
                    color: scheme.surface,
                    width: 2,
                  ),
                  borderRadius:
                      BorderRadius.all(Radius.circular(borderRadius + 32))),
          child: Padding(
            padding: const EdgeInsets.all(32),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                    flex: 3,
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: ConstrainedBox(
                          constraints: const BoxConstraints(
                              maxWidth: 550, minHeight: 400),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _listItemText(context, padding: 0),
                              if (showGithubIcon)
                                Container(
                                  decoration: BoxDecoration(
                                      color: scheme.secondaryContainer,
                                      borderRadius: BorderRadius.circular(50)),
                                  child: TextButton(
                                    onPressed: () {
                                      html.window.open(url, 'new tab');
                                    },
                                    style: TextButton.styleFrom(
                                      primary: scheme.onSecondaryContainer,
                                      backgroundColor:
                                          scheme.secondaryContainer,
                                      padding: const EdgeInsets.all(20.0),
                                      textStyle: GoogleFonts.poppins(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    child: const Text('View on GitHub'),
                                  ),
                                ),
                              if (showViewMoreIcon)
                                Container(
                                  decoration: BoxDecoration(
                                      color: scheme.secondaryContainer,
                                      borderRadius: BorderRadius.circular(50)),
                                  child: IconButton(
                                      onPressed: () {},
                                      tooltip: 'Read More',
                                      icon: Icon(
                                        Icons.read_more_outlined,
                                        color: scheme.onSecondaryContainer,
                                      )),
                                )
                            ],
                          )),
                    )),
                Container(
                  width: 50,
                ),
                Expanded(
                    flex: 3,
                    child: Align(
                        alignment: Alignment.topRight,
                        child: ConstrainedBox(
                          constraints: const BoxConstraints(maxHeight: 400),
                          child: AspectRatio(
                            aspectRatio: 1,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(borderRadius),
                              child: _buildParallaxBackground(context),
                            ),
                          ),
                        ))),
              ],
            ),
          ));
    }));
  }

  Widget _listItemText(BuildContext context, {double padding = 32}) {
    ColorScheme scheme = Theme.of(context).colorScheme;
    return Padding(
      padding: EdgeInsets.all(padding),
      child: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              name,
              style: GoogleFonts.poppins(
                  color: scheme.onBackground,
                  fontSize: 28,
                  fontWeight: FontWeight.w500),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              subtitle,
              style: GoogleFonts.poppins(
                  color: scheme.secondary,
                  fontSize: 18,
                  fontWeight: FontWeight.w500),
            ),
          ),
          if (time != null) spaceH10,
          if (time != null)
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                time,
                style: GoogleFonts.poppins(
                    color: scheme.secondary,
                    fontSize: 16,
                    fontWeight: FontWeight.w400),
              ),
            ),
          spaceH10,
          description.length == 1
              ? Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    description[0],
                    style: GoogleFonts.poppins(
                        color: scheme.onBackground,
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                  ),
                )
              : descriptionList(context, description),
        ],
      ),
    );
  }

  Widget _buildParallaxBackground(BuildContext context) {
    return Flow(
      delegate: ParallaxFlowDelegate(
        scrollable: Scrollable.of(context)!,
        listItemContext: context,
        backgroundImageKey: _backgroundImageKey,
      ),
      children: [
        Image.asset(
          imageUrl,
          key: _backgroundImageKey,
          fit: BoxFit.cover,
        ),
      ],
    );
  }
}

class ParallaxFlowDelegate extends FlowDelegate {
  ParallaxFlowDelegate({
    required this.scrollable,
    required this.listItemContext,
    required this.backgroundImageKey,
  }) : super(repaint: scrollable.position);

  final ScrollableState scrollable;
  final BuildContext listItemContext;
  final GlobalKey backgroundImageKey;

  @override
  BoxConstraints getConstraintsForChild(int i, BoxConstraints constraints) {
    return BoxConstraints.tightFor(
      width: constraints.maxWidth,
    );
  }

  @override
  void paintChildren(FlowPaintingContext context) {
    // Calculate the position of this list item within the viewport.
    final scrollableBox = scrollable.context.findRenderObject() as RenderBox;
    final listItemBox = listItemContext.findRenderObject() as RenderBox;
    final listItemOffset = listItemBox.localToGlobal(
        listItemBox.size.centerLeft(Offset.zero),
        ancestor: scrollableBox);

    // Determine the percent position of this list item within the
    // scrollable area.
    final viewportDimension = scrollable.position.viewportDimension;
    final scrollFraction =
        (listItemOffset.dy / viewportDimension).clamp(0.0, 1.0);

    // Calculate the vertical alignment of the background
    // based on the scroll percent.
    final verticalAlignment = Alignment(0.0, scrollFraction * 2 - 1);

    // Convert the background alignment into a pixel offset for
    // painting purposes.
    final backgroundSize =
        (backgroundImageKey.currentContext!.findRenderObject() as RenderBox)
            .size;
    final listItemSize = context.size;
    final childRect =
        verticalAlignment.inscribe(backgroundSize, Offset.zero & listItemSize);

    // Paint the background.
    context.paintChild(
      0,
      transform:
          Transform.translate(offset: Offset(0.0, childRect.top)).transform,
    );
  }

  @override
  bool shouldRepaint(ParallaxFlowDelegate oldDelegate) {
    return scrollable != oldDelegate.scrollable ||
        listItemContext != oldDelegate.listItemContext ||
        backgroundImageKey != oldDelegate.backgroundImageKey;
  }
}

class Parallax extends SingleChildRenderObjectWidget {
  const Parallax({
    Key? key,
    required Widget background,
  }) : super(key: key, child: background);

  @override
  RenderObject createRenderObject(BuildContext context) {
    return RenderParallax(scrollable: Scrollable.of(context)!);
  }

  @override
  void updateRenderObject(
      BuildContext context, covariant RenderParallax renderObject) {
    renderObject.scrollable = Scrollable.of(context)!;
  }
}

class ParallaxParentData extends ContainerBoxParentData<RenderBox> {}

class RenderParallax extends RenderBox
    with RenderObjectWithChildMixin<RenderBox>, RenderProxyBoxMixin {
  RenderParallax({
    required ScrollableState scrollable,
  }) : _scrollable = scrollable;

  ScrollableState _scrollable;

  ScrollableState get scrollable => _scrollable;

  set scrollable(ScrollableState value) {
    if (value != _scrollable) {
      if (attached) {
        _scrollable.position.removeListener(markNeedsLayout);
      }
      _scrollable = value;
      if (attached) {
        _scrollable.position.addListener(markNeedsLayout);
      }
    }
  }

  @override
  void attach(covariant PipelineOwner owner) {
    super.attach(owner);
    _scrollable.position.addListener(markNeedsLayout);
  }

  @override
  void detach() {
    _scrollable.position.removeListener(markNeedsLayout);
    super.detach();
  }

  @override
  void setupParentData(covariant RenderObject child) {
    if (child.parentData is! ParallaxParentData) {
      child.parentData = ParallaxParentData();
    }
  }

  @override
  void performLayout() {
    size = constraints.biggest;

    // Force the background to take up all available width
    // and then scale its height based on the image's aspect ratio.
    final background = child!;
    final backgroundImageConstraints =
        BoxConstraints.tightFor(width: size.width);
    background.layout(backgroundImageConstraints, parentUsesSize: true);

    // Set the background's local offset, which is zero.
    (background.parentData as ParallaxParentData).offset = Offset.zero;
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    // Get the size of the scrollable area.
    final viewportDimension = scrollable.position.viewportDimension;

    // Calculate the global position of this list item.
    final scrollableBox = scrollable.context.findRenderObject() as RenderBox;
    final backgroundOffset =
        localToGlobal(size.centerLeft(Offset.zero), ancestor: scrollableBox);

    // Determine the percent position of this list item within the
    // scrollable area.
    final scrollFraction =
        (backgroundOffset.dy / viewportDimension).clamp(0.0, 1.0);

    // Calculate the vertical alignment of the background
    // based on the scroll percent.
    final verticalAlignment = Alignment(0.0, scrollFraction * 2 - 1);

    // Convert the background alignment into a pixel offset for
    // painting purposes.
    final background = child!;
    final backgroundSize = background.size;
    final listItemSize = size;
    final childRect =
        verticalAlignment.inscribe(backgroundSize, Offset.zero & listItemSize);

    // Paint the background.
    context.paintChild(
        background,
        (background.parentData as ParallaxParentData).offset +
            offset +
            Offset(0.0, childRect.top));
  }
}

class ParallaxItem {
  const ParallaxItem({
    required this.imageUrl,
    this.title = '',
    this.subtitle = '',
    this.description = const [''],
    this.time,
    this.url = '',
  });

  final String title;
  final String url;
  final String subtitle;
  final String imageUrl;
  final List<String> description;
  // ignore: prefer_typing_uninitialized_variables
  final time;
}
