import 'package:flutter/material.dart';
import 'package:portfolio/components/bootstrap/bootstrap_column.dart';
import 'package:portfolio/components/buttons/custom_rasied_button.dart';
import 'package:portfolio/components/textfields/custom_text_form_field.dart';
import 'package:portfolio/core/core.dart';
import 'package:portfolio/features/introduction/edit_profile_picture.dart';

class PersonalInformationScreen extends StatefulWidget {
  final PersonalInformation personal;
  final Function(PersonalInformation) newInformation;

  const PersonalInformationScreen({
    this.personal,
    this.newInformation,
  });

  @override
  _PersonalInformationScreenState createState() =>
      _PersonalInformationScreenState();
}

class _PersonalInformationScreenState extends State<PersonalInformationScreen> {
  PersonalInformationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PersonalInformationController(widget.personal);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return StreamBuilder<bool>(
        stream: _controller.allStreams,
        builder: (context, snapshot) {
          return Scaffold(
            body: SingleChildScrollView(
              child: BSColumn(
                padding: EdgeInsets.symmetric(horizontal: width * 0.1),
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(32.0),
                        child: Text(
                          "Personal Information",
                          style: Theme.of(context).textTheme.headline6,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          EditProfilePicture(
                            onPictureChanged: (image) =>
                                _controller.image = image,
                            personal: widget.personal,
                          ),
                        ],
                      ),
                      SizedBox(height: 32),
                      CustomTextFormField(
                        labelText: "Name",
                        initialValue: _controller.name,
                        onChanged: (String s) => _controller.name = s,
                        isRequired: true,
                      ),
                      SizedBox(height: 16),
                      CustomTextFormField(
                        labelText: "About header",
                        initialValue: _controller.aboutHeader,
                        onChanged: (String s) => _controller.aboutHeader = s,
                        isRequired: true,
                      ),
                      SizedBox(height: 16),
                      CustomTextFormField(
                        labelText: "About",
                        initialValue: _controller.about,
                        maxLines: 3,
                        onChanged: (String s) => _controller.about = s,
                        isRequired: true,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(32.0),
                        child: Text(
                          "Job Information",
                          style: Theme.of(context).textTheme.headline6,
                        ),
                      ),
                      CustomTextFormField(
                        labelText: "Job header",
                        initialValue: _controller.jobHeader,
                        onChanged: (String s) => _controller.jobHeader = s,
                        isRequired: true,
                      ),
                      SizedBox(height: 16),
                      CustomTextFormField(
                        labelText: "Job",
                        initialValue: _controller.job,
                        onChanged: (String s) => _controller.job = s,
                        isRequired: true,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(32.0),
                        child: Text(
                          "Contact & Social Media",
                          style: Theme.of(context).textTheme.headline6,
                        ),
                      ),
                      CustomTextFormField(
                        labelText: "Contact header",
                        initialValue: _controller.contactHeader,
                        onChanged: (String s) => _controller.contactHeader = s,
                        isRequired: true,
                      ),
                      SizedBox(height: 16),
                      CustomTextFormField(
                        labelText: "Contact sub-header",
                        initialValue: _controller.contactSubHeader,
                        onChanged: (String s) =>
                            _controller.contactSubHeader = s,
                        isRequired: true,
                      ),
                      SizedBox(height: 16),
                      CustomTextFormField(
                        labelText: "Phone Number",
                        initialValue: _controller.phoneNumber,
                        onChanged: (String s) => _controller.phoneNumber = s,
                        isRequired: true,
                      ),
                      SizedBox(height: 16),
                      CustomTextFormField(
                        labelText: "Email",
                        initialValue: _controller.email,
                        onChanged: (String s) => _controller.email = s,
                        isRequired: true,
                      ),
                      SizedBox(height: 16),
                      CustomTextFormField(
                        labelText: "Facebook",
                        initialValue: _controller.facebook,
                        onChanged: (String s) => _controller.facebook = s,
                      ),
                      SizedBox(height: 16),
                      CustomTextFormField(
                        labelText: "Linkedin",
                        initialValue: _controller.linkedin,
                        onChanged: (String s) => _controller.linkedin = s,
                      ),
                      SizedBox(height: 16),
                      CustomTextFormField(
                        labelText: "Github",
                        initialValue: _controller.github,
                        onChanged: (String s) => _controller.github = s,
                      ),
                      SizedBox(height: 16),
                      CustomTextFormField(
                        labelText: "Instagram",
                        initialValue: _controller.instagram,
                        onChanged: (String s) => _controller.instagram = s,
                      ),
                      SizedBox(height: 16),
                      CustomTextFormField(
                        labelText: "Twitter",
                        initialValue: _controller.twitter,
                        onChanged: (String s) => _controller.twitter = s,
                      ),
                      SizedBox(height: 32),
                      CustomRaisedButton(
                        label: "Save changes".toUpperCase(),
                        disabled: !_controller.canSubmit,
                        onPressed: () =>
                            _controller.postPersonalInformation().then(
                                  (value) => widget.newInformation(value),
                                ),
                        isLoading: _controller.isLoading,
                      ),
                      SizedBox(height: 32),
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }
}
