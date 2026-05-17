import 'dart:async';

import 'package:coffee_ui/features/home/data/models/coffee_model.dart';
import 'package:coffee_ui/shared/app_widgets/coffee_simple_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PopularCoffeeCarousel extends StatefulWidget {
  final List<CoffeeModel> coffees;

  const PopularCoffeeCarousel({super.key, required this.coffees});

  @override
  State<PopularCoffeeCarousel> createState() => _PopularCoffeeCarouselState();
}

class _PopularCoffeeCarouselState extends State<PopularCoffeeCarousel> {
  late PageController _controller;
  double currentPage = 0;
  Timer? timer;

  @override
  void initState() {
    super.initState();

    _controller = PageController(viewportFraction: 0.62);

    _controller.addListener(() {
      setState(() {
        currentPage = _controller.page ?? 0;
      });
    });

    timer = Timer.periodic(const Duration(seconds: 3), (_) {
      if (!mounted) return;
      int nextPage = currentPage.round() < widget.coffees.length - 1
          ? currentPage.round() + 1
          : 0;

      _controller.animateToPage(
        nextPage,
        duration: const Duration(milliseconds: 700),
        curve: Curves.easeOutCubic,
      );
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: SizedBox(
        height: 300.h,
        child: PageView.builder(
          controller: _controller,
          itemCount: widget.coffees.length,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            final coffee = widget.coffees[index];

            final difference = (currentPage - index).abs().clamp(0.0, 1.0);

            final scale = 1.0 - (difference * 0.15);

            final opacity = 1.0 - (difference * 0.45);

            return Center(
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 250),
                opacity: opacity.clamp(0.55, 1.0),
                child: Transform.scale(
                  scale: scale,
                  alignment: Alignment.center,
                  child: SizedBox(
                    width: 220.w,
                    height: 250.h,
                    child: CoffeeSimpleCard(coffeeModel: coffee),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
