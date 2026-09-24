import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:skeleton_mobile_app/core/theming/app_color.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key, required this.nextRoute});

  final String nextRoute;

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  static const String _restOfWord = 'keleton';

  late final AnimationController _controller;

  static const double _bgStart = 0.0;
  static const double _bgEnd = 0.25;

  static const double _logoStart = 0.30;
  static const double _logoEnd = 0.55;

  static const double _lettersStart = 0.55;
  static const double _lettersEnd = 0.98;
  static const double _letterSpan = 0.22;

  bool _navigated = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 4000),
    );

    _controller.forward();
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _holdThenNavigate();
      }
    });
  }

  Future<void> _holdThenNavigate() async {
    if (_navigated) return;
    await Future.delayed(const Duration(milliseconds: 450));
    if (!mounted || _navigated) return;
    _navigated = true;
    Navigator.of(context).pushReplacementNamed(widget.nextRoute);
  }

  double _intervalProgress(double start, double end) {
    if (_controller.value <= start) return 0;
    if (_controller.value >= end) return 1;
    return (_controller.value - start) / (end - start);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      backgroundColor: isDark
          ? AppColorsDark.background
          : AppColorsLight.background,
      body: AnimatedBuilder(
        animation: _controller,
        builder: (context, _) {
          final bgT = Curves.easeOutCubic.transform(
            _intervalProgress(_bgStart, _bgEnd),
          );
          final logoT = Curves.elasticOut.transform(
            _intervalProgress(_logoStart, _logoEnd),
          );
          final logoOpacity = _intervalProgress(
            _logoStart,
            _logoStart + 0.12,
          ).clamp(0.0, 1.0);

          final gradientStart = isDark
              ? AppColorsDark.primaryGradientStart
              : AppColorsLight.primaryGradientStart;
          final gradientEnd = isDark
              ? AppColorsDark.primaryGradientEnd
              : AppColorsLight.primaryGradientEnd;

          return Stack(
            fit: StackFit.expand,
            children: [
              Positioned.fill(
                child: Opacity(
                  opacity: bgT,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [gradientStart, gradientEnd],
                      ),
                    ),
                  ),
                ),
              ),

              Center(
                child: _WordMark(
                  logoScale: logoT.clamp(0.0, 1.4),
                  logoOpacity: logoOpacity,
                  restOfWord: _restOfWord,
                  letterProgressBuilder: _letterProgress,
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  double _letterProgress(int index) {
    final step = _restOfWord.isEmpty
        ? 0.0
        : (_lettersEnd - _letterSpan - _lettersStart) /
              math.max(1, _restOfWord.length - 1);
    final start = _lettersStart + index * step;
    final end = start + _letterSpan;
    return Curves.easeOutBack.transform(_intervalProgress(start, end));
  }
}

class _WordMark extends StatelessWidget {
  const _WordMark({
    required this.logoScale,
    required this.logoOpacity,
    required this.restOfWord,
    required this.letterProgressBuilder,
  });

  final double logoScale;
  final double logoOpacity;
  final String restOfWord;
  final double Function(int index) letterProgressBuilder;

  static const double _fontSize = 52;
  static const double _logoAspect = 720 / 920;

  @override
  Widget build(BuildContext context) {
    final letterStyle = GoogleFonts.plusJakartaSans(
      fontSize: _fontSize,
      fontWeight: FontWeight.w800,
      color: Colors.white,
      letterSpacing: 0.5,
      height: 1,
    );

    final logoHeight = _fontSize * 1.15;
    final logoWidth = logoHeight * _logoAspect;

    final visibleLetters = <Widget>[];
    for (var i = 0; i < restOfWord.length; i++) {
      final t = letterProgressBuilder(i);
      if (t <= 0) continue;
      visibleLetters.add(
        Opacity(
          opacity: t.clamp(0.0, 1.0),
          child: Transform.translate(
            offset: Offset(0, (1 - t) * 10),
            child: Text(restOfWord[i], style: letterStyle),
          ),
        ),
      );
    }

    return Directionality(
      textDirection: TextDirection.ltr,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Opacity(
            opacity: logoOpacity,
            child: Transform.scale(
              scale: logoScale,
              child: Image.asset(
                'assets/images/skeleton_logo.png',
                width: logoWidth,
                height: logoHeight,
                fit: BoxFit.contain,
              ),
            ),
          ),
          ...visibleLetters,
        ],
      ),
    );
  }
}
