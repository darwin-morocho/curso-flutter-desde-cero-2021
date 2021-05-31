import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ui_ux/src/ui/global_widgets/svg_from_asset.dart';
import 'package:ui_ux/src/utils/font_styles.dart';

class SearchButton extends StatelessWidget {
  const SearchButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      color: Colors.grey.withOpacity(0.3),
      borderRadius: BorderRadius.circular(15),
      child: Row(
        children: [
          SvgFromAsset(
            path: 'assets/pages/home/search.svg',
            width: 20,
            color: Colors.grey,
          ),
          SizedBox(width: 10),
          Text(
            "Find your food",
            style: FontStyles.regular.copyWith(
              color: Colors.grey,
            ),
          )
        ],
      ),
      onPressed: () {},
    );
  }
}
