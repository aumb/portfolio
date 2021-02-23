import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:portfolio/components/circular_picture_container.dart';
import 'package:portfolio/core/core.dart';
import 'package:portfolio/core/utils/custom_colors.dart';
import 'package:portfolio/features/introduction/profile_picture.dart';

class EditProfilePicture extends StatefulWidget {
  final PersonalInformation personal;
  final double size;
  final Function(PickedFile) onPictureChanged;

  const EditProfilePicture({
    this.personal,
    this.size = 150,
    this.onPictureChanged,
  });
  @override
  _EditProfilePictureState createState() => _EditProfilePictureState();
}

class _EditProfilePictureState extends State<EditProfilePicture> {
  final ImagePicker _picker = ImagePicker();
  PickedFile image;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        image = await _picker.getImage(
          source: ImageSource.gallery,
        );
        if (image != null) {
          widget.onPictureChanged(image);
        }
        setState(() {});
      },
      child: Stack(
        children: [
          image == null
              ? ProfilePicture(
                  size: widget.size,
                  information: widget.personal,
                )
              : Stack(
                  children: [
                    CircularPictureContainer(
                      size: widget.size,
                      image: kIsWeb
                          ? NetworkImage(image.path)
                          : FileImage(File(image.path)),
                    ),
                    Positioned(
                      top: 0,
                      left: 1,
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: CustomColors.cardColor,
                          shape: BoxShape.circle,
                        ),
                        child: InkWell(
                            onTap: () {
                              image = null;
                              widget.onPictureChanged(image);
                              setState(() {});
                            },
                            child: Icon(Icons.close)),
                      ),
                    ),
                  ],
                ),
          Positioned(
            bottom: -4,
            right: 0,
            left: 0,
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: CustomColors.cardColor,
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.upload_file),
            ),
          ),
        ],
      ),
    );
  }
}
