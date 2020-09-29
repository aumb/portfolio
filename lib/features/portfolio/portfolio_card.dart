import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:portfolio/core/core.dart';
import 'package:portfolio/core/utils/utils.dart';

class PortfolioCard extends StatefulWidget {
  final RecentWork recentWork;

  const PortfolioCard({
    this.recentWork,
  });

  @override
  _PortfolioCardState createState() => _PortfolioCardState();
}

class _PortfolioCardState extends State<PortfolioCard> {
  Widget hoverChild = SizedBox.shrink();
  bool hover = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        hover = !hover;
        if (hover) {
          hoverChild = _buildOnHover();
          setState(() {});
        } else {
          hoverChild = SizedBox.shrink();
          setState(() {});
        }
      },
      onHover: (hover) {
        this.hover = hover;
        if (hover) {
          hoverChild = _buildOnHover();
          setState(() {});
        } else {
          hoverChild = SizedBox.shrink();
          setState(() {});
        }
      },
      child: Card(
        child: Container(
          width: 320,
          height: 213,
          child: _buildChild(context),
        ),
      ),
    );
  }

  Container _buildOnHover() {
    return Container(
      color: Colors.black.withOpacity(0.6),
      padding: const EdgeInsets.symmetric(vertical: 28.0, horizontal: 34.0),
      height: 213,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildDescription(),
          _buildButton(),
        ],
      ),
    );
  }

  Text _buildDescription() {
    return Text(widget.recentWork.description ?? '',
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.bodyText2.copyWith(
              fontFamily: 'Russo One',
            ));
  }

  Widget _buildButton() {
    return OutlineButton(
        highlightElevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        borderSide: BorderSide(color: CustomColors.accentColor, width: 2),
        onPressed: () {
          if (widget.recentWork.url?.contains('.com') ?? false)
            launchUrls(scheme: 'https', path: widget.recentWork.url);
        },
        child: ((widget.recentWork.url?.contains('.com') ?? false))
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Visit Website",
                    style: Theme.of(context).textTheme.button.copyWith(
                          color: CustomColors.white87,
                          fontFamily: 'Russo One',
                        ),
                  ),
                  Icon(
                    Icons.chevron_right,
                    color: CustomColors.accentColor,
                  )
                ],
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Under Development",
                    style: Theme.of(context).textTheme.button.copyWith(
                          color: CustomColors.white87,
                          fontFamily: 'Russo One',
                        ),
                  ),
                  SizedBox(width: 4),
                  Icon(
                    MdiIcons.hammerScrewdriver,
                    color: CustomColors.accentColor,
                  ),
                ],
              ));
  }

  Widget _buildChild(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        FadeInImage.assetNetwork(
            fit: BoxFit.cover,
            placeholder: Images.loadingGif,
            image: API.host +
                API.recentWorkPicture +
                "/" +
                widget.recentWork.id.toString()),
        hoverChild
      ],
    );
  }
}
