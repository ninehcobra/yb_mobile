import 'package:flutter/material.dart';

class HeaderAuthWidget extends StatelessWidget {
  const HeaderAuthWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 4),
      child: Center(
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey[300]!),
            color: Colors
                .transparent, // Change this to your desired background color
            borderRadius: BorderRadius.circular(100),
            // Adjust the radius as needed
          ),
          child: const SizedBox(
            width: 100, // Set a width for the SizedBox
            height: 100, // Set a height for the SizedBox
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Young Blood',
                    style: TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.bold)),
                Text('Ecommerce',
                    style: TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
