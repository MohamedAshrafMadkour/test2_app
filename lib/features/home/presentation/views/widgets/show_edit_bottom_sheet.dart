import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

Future<void> showEditProfileField({
  required BuildContext context,
  required String fieldName,
  required String initialValue,
  required Function(String newValue) onSave,
}) {
  final controller = TextEditingController(text: initialValue);

  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) {
      return Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
          left: 20,
          right: 20,
        ),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(25)),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 10,
                offset: Offset(0, -3),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  height: 5,
                  width: 40,
                  margin: const EdgeInsets.only(bottom: 15),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade400,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              Text(
                'Edit $fieldName',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ).animate().fadeIn(duration: 400.ms).slideY(begin: 0.3, end: 0),
              const SizedBox(height: 15),
              TextField(
                    controller: controller,
                    decoration: InputDecoration(
                      hintText: 'Enter new $fieldName',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.blueAccent,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  )
                  .animate()
                  .fadeIn(duration: 400.ms, delay: 100.ms)
                  .slideY(begin: 0.3, end: 0),
              const SizedBox(height: 20),
              SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      icon: const Icon(Icons.save, color: Colors.white),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueAccent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                      ),
                      onPressed: () {
                        if (controller.text.trim().isNotEmpty) {
                          onSave(controller.text.trim());
                          Navigator.pop(context);
                        }
                      },
                      label: const Text(
                        'Save Changes',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  )
                  .animate()
                  .fadeIn(duration: 400.ms, delay: 200.ms)
                  .slideY(begin: 0.3, end: 0),
              const SizedBox(height: 10),
            ],
          ),
        ),
      );
    },
  );
}
