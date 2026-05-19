import 'package:coffee_ui/shared/app_widgets/slide_up_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/config/theme/app_colors.dart';
import '../../../../shared/app_widgets/buttons/custom_icon_button.dart';
import '../../../home/data/models/coffee_model.dart';

class DetailsScreenHeaderSection extends StatefulWidget {
  final CoffeeModel coffeeModel;

  const DetailsScreenHeaderSection({super.key, required this.coffeeModel});

  @override
  State<DetailsScreenHeaderSection> createState() =>
      _DetailsScreenHeaderSectionState();
}

class _DetailsScreenHeaderSectionState
    extends State<DetailsScreenHeaderSection> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: 50),
          decoration: BoxDecoration(
            color: AppColors.kDarkBrown,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(25),
              bottomRight: Radius.circular(25),
            ),
          ),
          child: SizedBox(
            height: 260.h,
            child: SlideUpAnimation(child: Image.asset(widget.coffeeModel.image, fit: BoxFit.contain)),
          ),
        ),
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomIconButton(
                  icon: Icons.arrow_back_ios_new,
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                CustomIconButton(icon: Icons.favorite_border, onTap: () {}),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
