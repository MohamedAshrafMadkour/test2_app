import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ImageField extends StatefulWidget {
  const ImageField({super.key, required this.onImageSelected});
  final ValueChanged<File> onImageSelected;

  @override
  State<ImageField> createState() => _ImageFieldState();
}

class _ImageFieldState extends State<ImageField> {
  File? fileImage;
  bool isLoading = false;
  final ImagePicker picker = ImagePicker();

  Future<void> pickImage(ImageSource source) async {
    try {
      setState(() => isLoading = true);

      final XFile? image = await picker.pickImage(source: source);
      if (image != null) {
        fileImage = File(image.path);
        widget.onImageSelected(fileImage!);
      }
    } catch (e) {
      debugPrint('Error picking image: $e');
    } finally {
      setState(() => isLoading = false);
    }
  }

  void showPickOptions() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) {
        return SafeArea(
          child: Wrap(
            children: [
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('pick from gallery'),
                onTap: () {
                  Navigator.pop(context);
                  pickImage(ImageSource.gallery);
                },
              ),
              ListTile(
                leading: const Icon(Icons.camera_alt),
                title: const Text('take a photo with camera'),
                onTap: () {
                  Navigator.pop(context);
                  pickImage(ImageSource.camera);
                },
              ),

              Center(
                child: ListTile(
                  trailing: const Icon(Icons.close),
                  title: const Text('close'),
                  onTap: () => Navigator.pop(context),
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: isLoading,
      child: GestureDetector(
        onTap: showPickOptions,
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: MediaQuery.sizeOf(context).height * 0.22,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: const Color(0xFFE6E9E9), width: 1),
              ),
              child: fileImage != null
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.file(fileImage!, fit: BoxFit.cover),
                    )
                  : const Center(
                      child: Icon(
                        Icons.image_outlined,
                        size: 100,
                        color: Colors.grey,
                      ),
                    ),
            ),
            if (fileImage != null)
              Positioned(
                top: 8,
                right: 8,
                child: IconButton(
                  onPressed: () {
                    setState(() => fileImage = null);
                  },
                  icon: const Icon(Icons.delete, color: Colors.red, size: 28),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
