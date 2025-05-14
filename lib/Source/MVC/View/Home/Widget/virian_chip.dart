import 'package:flutter/material.dart';

class VariantChip extends StatelessWidget {
  final String label;

  const VariantChip({required this.label});

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(label),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      backgroundColor: Colors.grey[200],
    );
  }
}

class QtyButton extends StatelessWidget {
  final IconData icon;

  const QtyButton({required this.icon, required void Function() onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Icon(icon, size: 18),
      padding: const EdgeInsets.all(6),
    );
  }
}
