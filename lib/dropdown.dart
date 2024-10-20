import 'package:birthday/color.dart';

import 'package:flutter/material.dart';

class Dropdown extends StatefulWidget {
  const Dropdown({super.key});

  @override
  State<Dropdown> createState() => _DropdownState();
}

class _DropdownState extends State<Dropdown> {
  bool isOpen = false;
  String selectOption = 'Select Option';
  List<String> Options = ["Add Manually", "Add from Contact"];
  @override
  Widget build(BuildContext context) {
    return

     // body:
    Padding(
        padding:   EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(
              height: 50,
              child: InkWell(
                onTap: () {
                  isOpen = !isOpen;

                  setState(() {});
                },
                child: Container(width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(color: bg,
                      border: Border.all(width: 5,color: outline), ),
                  child: Padding(
                    padding:   EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(selectOption),
                        Icon(isOpen ?Icons.keyboard_arrow_up :Icons.keyboard_arrow_down),
                      ],
                    ),
                  ),
                ),
              ),
            ),
           if (isOpen)
            ListView(
              primary: true,
              shrinkWrap: true,
              children: Options.map((e) => Container(
                    decoration: BoxDecoration(color: selectOption==e? outline
                      : bg,
                        border: Border (left: BorderSide(
                      color:outline,
                      width: 2,
                    ),
                bottom: BorderSide(
                  color: outline,
                  width: 2,
                ),
                          right: BorderSide(
                            color: outline,
                            width: 2,
                          ),
                        )),

                    child: Padding(
                      padding:   EdgeInsets.all(8.0),
                      child: InkWell(
                          onTap: () {
                            selectOption = e;
                            isOpen = false;
                            setState(() {});
                          },
                          child: Text(e)),
                    ),
                  )).toList(),
            ),
          ],
        ),
      //),
    );
  }
}
