import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:portfolio/core/core.dart';

class PortfolioCard extends StatefulWidget {
  final String image;
  final String title;
  final Function onTap;
  final bool underDevelopment;

  const PortfolioCard({
    this.image,
    this.title,
    this.onTap,
    this.underDevelopment,
  });

  @override
  _PortfolioCardState createState() => _PortfolioCardState();
}

class _PortfolioCardState extends State<PortfolioCard> {
  Widget hoverChild = SizedBox.shrink();
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      onHover: (hover) {
        if (hover) {
          hoverChild = Container(
            color: Colors.black.withOpacity(0.6),
            padding: const EdgeInsets.symmetric(
              vertical: 28.0,
              horizontal: 34.0,
            ),
            height: 213,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(widget.title ?? '',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyText2.copyWith(
                          fontFamily: 'Russo One',
                        )),
                OutlineButton(
                  highlightElevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  borderSide:
                      BorderSide(color: CustomColors.accentColor, width: 2),
                  onPressed: widget.onTap,
                  child: (widget.underDevelopment ?? true)
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Under Development",
                              style:
                                  Theme.of(context).textTheme.button.copyWith(
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
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Visit Website",
                              style:
                                  Theme.of(context).textTheme.button.copyWith(
                                        color: CustomColors.white87,
                                        fontFamily: 'Russo One',
                                      ),
                            ),
                            Icon(
                              Icons.chevron_right,
                              color: CustomColors.accentColor,
                            )
                          ],
                        ),
                ),
              ],
            ),
          );
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

  Widget _buildChild(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Align(
          alignment: Alignment.center,
          child: Image.asset(
            widget.image,
            width: 150,
          ),
        ),
        hoverChild
      ],
    );
  }
}
