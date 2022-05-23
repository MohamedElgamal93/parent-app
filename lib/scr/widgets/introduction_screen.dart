import 'dart:async';
import 'dart:math';

import 'package:scostudent/scr/widgets/intro_button.dart';
import 'package:scostudent/scr/widgets/page_view_model.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import './../../app_constants.dart';

class IntroductionScreen extends StatefulWidget {
  final List<PageViewModel> pages;

  final VoidCallback onDone;

  final Widget done;

  final VoidCallback? onSkip;

  final ValueChanged<int>? onChange;

  final Widget skip;

  final Widget next;

  /// @Default `false`
  final bool showSkipButton;

  /// @Default `true`
  final bool showNextButton;

  /// @Default `true`
  final bool isProgress;


  /// @Default `false`
  final bool freeze;


  final Color ?globalBackgroundColor;

  /// @Default `350`
  final int animationDuration;


  /// @Default `0`
  final int initialPage;

   /// @Default `1`
  final int skipFlex;


  /// @Default `1`
  final int dotsFlex;


  /// @Default `1`
  final int nextFlex;

  /// @Default `Curves.easeIn`
  final Curve curve;

  const IntroductionScreen({
    Key? key,
    required this.pages,
    required this.onDone,
    required this.done,
    this.onSkip,
    this.onChange,
    required this.skip,
    required this.next,
    this.showSkipButton = false,
    this.showNextButton = true,
    this.isProgress = true,
    this.freeze = false,
    this.globalBackgroundColor,
    this.animationDuration = 500,
    this.initialPage = 0,
    this.skipFlex = 1,
    this.dotsFlex = 1,
    this.nextFlex = 1,
    this.curve = Curves.easeIn,
  })  : assert(pages != null),
        assert(
          pages.length > 0,
          "You provide at least one page on introduction screen !",
        ),
        assert(onDone != null),
        assert(done != null),
        assert((showSkipButton && skip != null) || !showSkipButton),
        assert(skipFlex >= 0 && dotsFlex >= 0 && nextFlex >= 0),
        assert(initialPage == null || initialPage >= 0),
        super(key: key);

  @override
  IntroductionScreenState createState() => IntroductionScreenState();
}

class IntroductionScreenState extends State<IntroductionScreen> {
  late PageController _pageController;
  double _currentPage = 0.0;
  bool _isSkipPressed = false;
  bool _isScrolling = false;

  PageController get controller => _pageController;

  @override
  void initState() {
    super.initState();
    int initialPage = min(widget.initialPage, widget.pages.length - 1);
    _currentPage = initialPage.toDouble();
    _pageController = PageController(initialPage: initialPage);
  }

  void _onNext() {
    animateScroll(min(_currentPage.round() + 1, widget.pages.length - 1));
  }

  Future<void> _onSkip() async {
    if (widget.onSkip != null) return widget.onSkip!();
    await skipToEnd();
  }

  Future<void> skipToEnd() async {
    setState(() => _isSkipPressed = true);
    await animateScroll(widget.pages.length - 1);
    setState(() => _isSkipPressed = false);
  }

  Future<void> animateScroll(int page) async {
    setState(() => _isScrolling = true);
    await _pageController.animateToPage(
      page,
      duration: Duration(milliseconds: widget.animationDuration),
      curve: widget.curve,
    );
    setState(() => _isScrolling = false);
  }

  bool _onScroll(ScrollNotification notification) {
    final metrics = notification.metrics;
    if (metrics is PageMetrics) {
      setState(() => _currentPage = metrics.page!);
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    final isLastPage = (_currentPage.round() == widget.pages.length - 1);
    bool isSkipBtn = (!_isSkipPressed && !isLastPage && widget.showSkipButton);

    final skipBtn = IntroButton(
        child: widget.skip,
      onPressed: _onSkip,
    );

    final nextBtn = IntroButton(
         child: widget.next,
      onPressed: _onNext,
    );

    final doneBtn = IntroButton(
      child: widget.done,
      onPressed: widget.onDone,
    );

    return Stack(
        children: [
          NotificationListener<ScrollNotification>(
            onNotification: _onScroll,
            child: Scaffold(
              backgroundColor: BLACK,
              body: SafeArea(
                right: false,
                left: false,
                child: PageView(
                  controller: _pageController,
                  physics: widget.freeze
                      ? const NeverScrollableScrollPhysics()
                      : const BouncingScrollPhysics(),
                  children: widget.pages
                      .map(
                        (p) => FittedBox(fit: BoxFit.fitHeight,child: p.bodyWidget),
                      )
                      .toList(),
                  onPageChanged: widget.onChange,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 16.0,
            left: 16.0,
            right: 16.0,
            child: SafeArea(
              child: Row(
                children: [
                  Expanded(
                    flex: widget.skipFlex,
                    child: isSkipBtn
                        ? skipBtn
                        : Opacity(opacity: 0.0, child: skipBtn),
                  ),
                  Expanded(
                    flex: widget.dotsFlex,
                    child: Center(
                      child: widget.isProgress
                          ?
                      SmoothPageIndicator(
                          controller: controller,
                          count: widget.pages.length,
                          effect: ScrollingDotsEffect(
                            activeDotColor :Colors.white,
                            dotColor: Colors.grey,
                            activeStrokeWidth: 2.6,
                            activeDotScale: 1.2,
                            radius: 5,
                            spacing: 10,
                          ))
                          : const SizedBox(),
                    ),
                  ),
                  Expanded(
                    flex: widget.nextFlex,
                    child: isLastPage
                        ? doneBtn
                        : widget.showNextButton
                            ? nextBtn
                            : Opacity(opacity: 0.0, child: nextBtn),
                  ),
                ],
              ),
            ),
          ),
        ],
    );
  }
}
