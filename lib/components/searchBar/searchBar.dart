import 'package:flutter/material.dart';
import '../../custom_widgets/colors.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search, color: AppColor.mainGrey),
                hintStyle: TextStyle(color: AppColor.mainGrey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    width: 0,
                    style: BorderStyle.none,
                  ),
                ),
                fillColor: AppColor.mainBlue,
                filled: true,
                hintText: 'Search',
                isDense: true,
              ),
            ),
          ),
          SizedBox(
            width: 8,
          ),
          Container(
              decoration: BoxDecoration(
                  color: Color.fromRGBO(231, 241, 248, 10),
                  borderRadius: BorderRadius.circular(7.32)),
              child: GestureDetector(
                onTap: () {},
                child: Center(
                  child: Container(
                    width: 45,
                    height: 45,
                    decoration: BoxDecoration(
                      color: AppColor.mainBlue,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(
                      Icons.filter_alt,
                      color: AppColor.mainGrey,
                    ),
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
