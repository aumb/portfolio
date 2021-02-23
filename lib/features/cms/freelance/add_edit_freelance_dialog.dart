import 'package:flutter/material.dart';
import 'package:portfolio/components/buttons/dialog_loading_button.dart';
import 'package:portfolio/components/custom_dialog.dart';
import 'package:portfolio/components/textfields/custom_text_form_field.dart';
import 'package:portfolio/core/core.dart';
import 'package:portfolio/features/cms/freelance/freelance_entry_picture.dart';

class AddEditFreelanceDialog extends StatefulWidget {
  final RecentWork recentWork;

  const AddEditFreelanceDialog({this.recentWork});

  @override
  _AddEditFreelanceDialogState createState() => _AddEditFreelanceDialogState();
}

class _AddEditFreelanceDialogState extends State<AddEditFreelanceDialog> {
  FreelanceController _controller;

  @override
  void initState() {
    super.initState();
    _controller = FreelanceController(recentWork: widget.recentWork);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
        stream: _controller.allStreams,
        builder: (context, snapshot) {
          return CustomDialog(
            content: [
              _buildAccent(),
              Padding(
                padding: const EdgeInsets.only(
                    left: 16.0, right: 16.0, bottom: 24, top: 19),
                child: Text(
                  widget.recentWork != null
                      ? Strings.editProject
                      : Strings.addProject,
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          FreelanceEntryPicture(
                            recentWork: widget.recentWork,
                            onPictureChanged: (image) =>
                                _controller.image = image,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: CustomTextFormField(
                  initialValue: widget.recentWork?.url,
                  labelText: Strings.url,
                  onChanged: (v) => _controller.url = v,
                  isRequired: true,
                ),
              ),
              SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: CustomTextFormField(
                  initialValue: widget.recentWork?.description,
                  labelText: Strings.description,
                  onChanged: (v) => _controller.description = v,
                  isRequired: true,
                ),
              ),
              SizedBox(height: 32),
              DialogLoadingButton(
                label: widget.recentWork != null
                    ? Strings.edit.toUpperCase()
                    : Strings.add.toUpperCase(),
                disabled: !_controller.canSubmitChanges,
                future: () => _controller.postRecentWork().then(
                      (value) => Navigator.of(context).pop(value),
                    ),
              ),
              if (widget.recentWork != null) SizedBox(height: 16),
              if (widget.recentWork != null)
                DialogLoadingButton(
                  backgroundColor: Colors.red,
                  label: Strings.delete.toUpperCase(),
                  future: () => _controller.deleteRecentWork().then(
                        (value) => Navigator.of(context).pop(
                          RecentWork(id: -1),
                        ),
                      ),
                ),
              SizedBox(height: 16),
            ],
          );
        });
  }

  Container _buildAccent() {
    return Container(height: 5, color: Theme.of(context).accentColor);
  }
}
