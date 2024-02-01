import 'package:flutter/material.dart';

class terms_and_conditions_text extends StatelessWidget {
  const terms_and_conditions_text({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: 'By logging, you agree to our',
            style: TextStyle(
              fontSize: 13,
              color: Colors.grey,
            ),
          ),
          TextSpan(
            text: ' Terms & Conditions',
            style: TextStyle(
              fontSize: 13,
              color: Color.fromARGB(239, 18, 5, 100),
            ),
          ),
          TextSpan(
            text: ' and',
            style: TextStyle(
              fontSize: 13,
              color: Colors.grey,
            ).copyWith(height: 1.5),
          ),
          TextSpan(
            text: ' Privacy Policy',
            style: TextStyle(
              fontSize: 13,
              color: Color.fromARGB(239, 18, 5, 100),
            ),
          ),
        ],
      ),
    );
  }
}
