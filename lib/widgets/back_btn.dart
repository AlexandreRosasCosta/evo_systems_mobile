import 'package:evo_systems_mobile/utils/constants.dart';
import 'package:flutter/material.dart';

class BackBtn extends StatelessWidget {
  const BackBtn({ super.key });

  @override
  Widget build(BuildContext context){
    return Container(
    height: 70, 
    width: 70,
    margin: const EdgeInsets.only(
      top: 16, 
      left: 16,
    ),
    decoration: BoxDecoration(
      color: Constants.backgroundColor,
      borderRadius: BorderRadius.circular(8), 
    ),
    child: IconButton(
      onPressed: () {
      Navigator.pop(context);
      }, 
      icon: const Icon(Icons.arrow_back)
    ),
  );
  }
}
