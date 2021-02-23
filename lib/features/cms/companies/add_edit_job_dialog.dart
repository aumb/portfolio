import 'package:flutter/material.dart';
import 'package:portfolio/components/buttons/dialog_loading_button.dart';
import 'package:portfolio/components/custom_dialog.dart';
import 'package:portfolio/components/textfields/custom_text_form_field.dart';
import 'package:portfolio/core/core.dart';
import 'package:portfolio/core/utils/utils.dart';
import 'package:portfolio/features/cms/companies/job_entry_picture.dart';

class AddEditJobDialog extends StatefulWidget {
  final Job job;

  const AddEditJobDialog({this.job});

  @override
  _AddEditJobDialogState createState() => _AddEditJobDialogState();
}

class _AddEditJobDialogState extends State<AddEditJobDialog> {
  CompaniesController _controller;
  TextEditingController _startDateController;
  TextEditingController _endDateController;

  @override
  void initState() {
    super.initState();
    _controller = CompaniesController(job: widget.job);
    _startDateController = TextEditingController();
    _endDateController = TextEditingController();

    _startDateController.text =
        getStrDate(widget.job?.startDate, pattern: 'MMMM yyyy');
    _endDateController.text =
        getStrDate(widget.job?.endDate, pattern: 'MMMM yyyy');
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    _startDateController.dispose();
    _endDateController.dispose();
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
                  Strings.addJob,
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
                          JobEntryPicture(
                            job: widget.job,
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
                  initialValue: widget.job?.title,
                  labelText: Strings.jobTitle,
                  onChanged: (v) => _controller.title = v,
                  isRequired: true,
                ),
              ),
              SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: CustomTextFormField(
                  initialValue: widget.job?.companyName,
                  labelText: Strings.companyName,
                  onChanged: (v) => _controller.name = v,
                  isRequired: true,
                ),
              ),
              SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: CustomTextFormField(
                  initialValue: widget.job?.companyLink,
                  labelText: Strings.companyLink,
                  onChanged: (v) => _controller.link = v,
                  isRequired: true,
                ),
              ),
              SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: CustomTextFormField(
                  initialValue: widget.job?.description,
                  labelText: Strings.jobDescription,
                  keyboardType: TextInputType.multiline,
                  maxLines: 5,
                  onChanged: (v) => _controller.description = v,
                  isRequired: true,
                ),
              ),
              SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () async {
                          final DateTime date = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1995, 12),
                              lastDate: DateTime(2101));
                          _startDateController.text =
                              getStrDate(date, pattern: 'MMMM yyyy');
                          _controller.startDate = date;
                        },
                        child: IgnorePointer(
                          child: CustomTextFormField(
                            controller: _startDateController,
                            labelText: Strings.startDate,
                            isRequired: true,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: InkWell(
                        onTap: () async {
                          final DateTime date = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1995, 12),
                              lastDate: DateTime(2101));
                          _endDateController.text =
                              getStrDate(date, pattern: 'MMMM yyyy');
                          _controller.endDate = date;
                        },
                        child: IgnorePointer(
                          child: CustomTextFormField(
                            controller: _endDateController,
                            labelText: Strings.endDate,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 32),
              DialogLoadingButton(
                label: Strings.add.toUpperCase(),
                disabled: !_controller.canSubmitChanges,
                future: () => _controller.postJob().then(
                      (value) => Navigator.of(context).pop(value),
                    ),
              ),
              if (widget.job != null) SizedBox(height: 16),
              if (widget.job != null)
                DialogLoadingButton(
                  backgroundColor: Colors.red,
                  label: Strings.delete.toUpperCase(),
                  future: () => _controller.deleteRecentWork().then(
                        (value) => Navigator.of(context).pop(
                          Job(id: -1),
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
