import 'package:flutter/material.dart';
import 'package:portfolio/components/circular_picture_container.dart';
import 'package:portfolio/core/core.dart';

class ProfilePicture extends StatefulWidget {
  final double size;
  final PersonalInformation information;

  const ProfilePicture({this.size, this.information});

  @override
  _ProfilePictureState createState() => _ProfilePictureState();
}

class _ProfilePictureState extends State<ProfilePicture> {
  ProfilePictureController _controller;

  @override
  void initState() {
    _controller = ProfilePictureController();
    super.initState();
    if (_controller.profilePicture == null &&
        !_controller.isLoading &&
        (widget.information.img != null && widget.information.img.isNotEmpty)) {
      _controller.getUserProfilePicture(widget.information.id);
    }
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
        stream: _controller.combinedStream,
        builder: (BuildContext context, snapshot) {
          return profilePictureStatus();
        });
  }

  Widget profilePictureStatus() {
    if (_controller.profilePicture == null) {
      if (_controller.isLoading) {
        return _buildProfilePicture();
      } else {
        return _buildProfilePicturePlaceholder();
      }
    } else {
      return _buildProfilePicture();
    }
  }

  Widget _buildProfilePicture() {
    return CircularPictureContainer(
      size: widget.size,
      image: _controller.isLoading
          ? AssetImage(Images.loadingGif)
          : MemoryImage(
              _controller.profilePicture,
            ),
    );
  }

  Widget _buildProfilePicturePlaceholder() {
    List<String> name = widget.information.name.split(' ');
    String firstName = name.first;
    String lastName = name.last;
    String initalLetterOfFirstName = firstName[0];
    String initalLetterOfLastName = lastName[0];
    return Container(
      width: widget.size,
      height: widget.size,
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        shape: BoxShape.circle,
        border: Border.all(
          color: Colors.white30,
          width: 0.0,
        ),
      ),
      child: Align(
        alignment: Alignment.center,
        child: Text(
          "$initalLetterOfFirstName$initalLetterOfLastName",
          style: Theme.of(context).textTheme.bodyText1.copyWith(
                fontSize: (widget.size ?? 100) * 0.20,
                letterSpacing: 1,
              ),
        ),
      ),
    );
  }
}
