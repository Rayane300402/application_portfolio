import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../models/DropNode.dart';
import '../theme/theme.dart';

class CustomDropdown extends StatefulWidget {
  final String value;
  final VoidCallback onTap;            // open overlay handled outside
  final bool isOpen;

  const CustomDropdown({
    super.key,
    required this.value,
    required this.onTap,
    required this.isOpen,
  });

  @override
  State<CustomDropdown> createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> with SingleTickerProviderStateMixin {
  late final AnimationController _ctrl = AnimationController(vsync: this, duration: const Duration(milliseconds: 200));
  late final Animation<double> _turn = Tween<double>(begin: 0, end: .5)
      .animate(CurvedAnimation(parent: _ctrl, curve: Curves.easeOut));

  @override
  void didUpdateWidget(covariant CustomDropdown oldWidget) {
    super.didUpdateWidget(oldWidget);
    widget.isOpen ? _ctrl.forward() : _ctrl.reverse();
  }

  @override
  void dispose() { _ctrl.dispose(); super.dispose(); }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      width: MediaQuery.of(context).size.width - 32,
      duration: const Duration(milliseconds: 180),
      curve: Curves.easeOut,
      decoration: BoxDecoration(
        color: Colors.white,                       // white pill like your design
        borderRadius: BorderRadius.circular(24),
      ),
      child: InkWell(
        onTap: widget.onTap,
        borderRadius: BorderRadius.circular(24),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                widget.value,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: AppTheme.primaryGreen,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(width: 10),
              RotationTransition(
                turns: _turn,
                child: const Icon(Icons.expand_more, color: AppTheme.primaryGreen),
              ),
            ],
          ),
        ),
      ),
    );
  }
}