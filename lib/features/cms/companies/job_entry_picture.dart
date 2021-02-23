import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:portfolio/core/core.dart';
import 'package:portfolio/core/utils/custom_colors.dart';

class JobEntryPicture extends StatefulWidget {
  final Job job;
  final Function(PickedFile) onPictureChanged;

  const JobEntryPicture({
    this.job,
    this.onPictureChanged,
  });
  @override
  _JobEntryPictureState createState() => _JobEntryPictureState();
}

class _JobEntryPictureState extends State<JobEntryPicture> {
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
        if (mounted) setState(() {});
      },
      child: Card(
        color: CustomColors.backgroundColor,
        child: AspectRatio(
          aspectRatio: 16 / 9,
          child: _buildPicture(),
        ),
      ),
    );
  }

  Widget _buildPicture() {
    if (widget.job == null) {
      if (image == null) {
        return _buildPlaceholder();
      } else {
        return _buildPickedPicture();
      }
    } else {
      if (image == null) {
        return _buildExistingPicture();
      } else {
        return _buildPickedPicture();
      }
    }
  }

  Widget _buildExistingPicture() {
    return Image.network(
      API.host + API.jobPicture + "/" + widget.job.id.toString(),
      fit: BoxFit.cover,
    );
  }

  Widget _buildPickedPicture() {
    return Stack(
      fit: StackFit.expand,
      children: [
        kIsWeb
            ? Image.network(
                image.path,
                fit: BoxFit.cover,
              )
            : Image.file(
                File(image.path),
                fit: BoxFit.cover,
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
                  if (mounted) setState(() {});
                },
                child: Icon(Icons.close)),
          ),
        ),
      ],
    );
  }

  Widget _buildPlaceholder() {
    return Icon(Icons.image);
  }
}
