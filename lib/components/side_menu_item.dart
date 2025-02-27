import 'package:flutter/material.dart';
import 'package:websafe_svg/websafe_svg.dart';

import '../constants.dart';
import 'counter_badge.dart';

class SideMenuItem extends StatelessWidget {
  final bool isActive, isHover, showBorder;
  final int itemCount;
  final String iconSrc, title;
  final VoidCallback press;

  const SideMenuItem({
    Key? key,
    this.isHover = false,
    this.itemCount = 0,
    this.showBorder = true,
    required this.isActive,
    required this.iconSrc,
    required this.title,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: kDefaultPadding),
      child: InkWell(
        onTap: press,
        child: Row(
          children: [
            (isActive || isHover)
                ? WebsafeSvg.asset(
                    "assets/icons/Angle right.svg",
                    width: 15,
                  )
                : const SizedBox(width: 15),
            const SizedBox(width: kDefaultPadding / 4),
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(bottom: 15, right: 5),
                decoration: showBorder
                    ? const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(color: Color(0xFFDFE2EF)),
                        ),
                      )
                    : null,
                child: Row(
                  children: [
                    WebsafeSvg.asset(
                      iconSrc,
                      height: 20,
                      color: (isActive || isHover) ? kPrimaryColor : kGrayColor,
                    ),
                    const SizedBox(width: kDefaultPadding * 0.75),
                    Text(
                      title,
                      style: Theme.of(context).textTheme.button?.copyWith(
                            color:
                                (isActive || isHover) ? kTextColor : kGrayColor,
                          ),
                    ),
                    const Spacer(),
                    if (itemCount != 0) CounterBadge(count: itemCount)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
