import 'package:flutter/material.dart';
import 'package:wear_work/utils/colors.dart';
import 'package:wear_work/widgets/small_text.dart';

class SearchFilterRow extends StatefulWidget {
  final String title;
  final String initialValue;
  final List<String> options;

  const SearchFilterRow({
    required this.title,
    required this.initialValue,
    required this.options,
    Key? key,
  }) : super(key: key);

  @override
  _SearchFilterRowState createState() => _SearchFilterRowState();
}

class _SearchFilterRowState extends State<SearchFilterRow> {
  late String selectedValue;

  @override
  void initState() {
    super.initState();
    selectedValue = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SmallText(
            text: widget.title,
            color: AppColors.mainBlackColor,
            size: 18,
            fontWeight: FontWeight.w400,
          ),
          GestureDetector(
            onTap: () {
              _showOptionsDialog(context);
            },
            child: Container(
              width: 120,
              alignment: Alignment.center,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: AppColors.lightBlue,
                borderRadius: BorderRadius.circular(24),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SmallText(
                    text: "$selectedValue ",
                    color: AppColors.white,
                    size: 14,
                    fontWeight: FontWeight.w400,
                  ),
                  const Icon(
                    Icons.keyboard_arrow_down,
                    color: Colors.white,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showOptionsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Select ${widget.title}'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(widget.options.length, (index) {
              final option = widget.options[index];
              return ListTile(
                title: Text(option),
                onTap: () {
                  setState(() {
                    selectedValue = option;
                  });
                  Navigator.pop(context);
                },
              );
            }),
          ),
        );
      },
    );
  }
}
