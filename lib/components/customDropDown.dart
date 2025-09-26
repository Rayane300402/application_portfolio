import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../theme/theme.dart';

class CustomDropDown extends StatefulWidget {
  final String title;
  final List<Widget> children;
  final Color bgColor;
  final Color txtColor;

  const CustomDropDown({super.key, required this.title, required this.children, required this.bgColor, required this.txtColor});

  @override
  State<CustomDropDown> createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> with SingleTickerProviderStateMixin{
  bool _isExpanded = false;
  late AnimationController _controller;
  late Animation<double> _arrowAnimation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300)
    );

    _arrowAnimation = Tween<double>(begin:0.0, end: 0.5).animate(_controller);

  }

  void _toggleExpand() {
    setState(() {
      _isExpanded = !_isExpanded;
      if(_isExpanded){
        _controller.forward();
      }else {
        _controller.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return AnimatedContainer(
        duration: const Duration(milliseconds: 300),
      decoration: BoxDecoration(
        color: widget.bgColor,
        borderRadius: BorderRadius.circular(12),
      ),
      margin: const EdgeInsets.symmetric(vertical: 6),
      child: Column(
        children: [
          ListTile(
            title: Text(
              widget.title,
              style: textTheme.displayMedium!.copyWith(
                  fontSize: 18,
                  color: widget.txtColor,
              ),
            ),
            trailing: RotationTransition(
                turns: _arrowAnimation,
              child:  IgnorePointer(    // keeps splash taps clean
                child: SvgPicture.asset(
                  'assets/images/Caret_Down_MD.svg',
                  colorFilter: ColorFilter.mode(
                    AppTheme.textWhite,
                    BlendMode.srcATop,
                  ),
                ),
              ),
            ),
            onTap: _toggleExpand,
          ),
          AnimatedCrossFade(
            duration: const Duration(milliseconds: 300),
            crossFadeState: _isExpanded ? CrossFadeState.showFirst : CrossFadeState.showSecond,
            firstChild: Column(children: widget.children),
            secondChild: const SizedBox.shrink(),
          )
        ],
      ),
    );
  }
}
