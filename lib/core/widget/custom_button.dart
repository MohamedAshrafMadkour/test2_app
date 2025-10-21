import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.title,
    required this.icon,
    this.onPressed,
    this.color,
    this.isCenter,
    required this.isLoading,
  });
  final String title;
  final IconData icon;
  final Color? color;
  final void Function()? onPressed;
  final bool? isCenter;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 14),
        backgroundColor: color,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      onPressed: onPressed,
      child: Row(
        children: [
          Icon(icon, color: Colors.white, size: 20),
          isCenter == true
              ? const SizedBox(width: 90)
              : const SizedBox(width: 8),
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            child: isLoading
                ? SizedBox(
                    height: 20,
                    width: 20,
                    child: const CircularProgressIndicator(color: Colors.white),
                  )
                : Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
