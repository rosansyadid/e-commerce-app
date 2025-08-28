// import 'package:ecommerce_mobile/preferences/color.dart';
import 'package:flutter/material.dart';

class InputAddress extends StatelessWidget {
  const InputAddress({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 40),
      child: Column(
        children: [
          buildInput(
            title: 'Delivery address',
            hintText: '10th avenue, Lekki, Lagos State',
          ),
          buildInput(title: 'Number we can call', hintText: '09090605708'),
          SizedBox(height: 30),
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () {},
                  child: Text('Pay on delivery'),
                ),
              ),
              SizedBox(width: 50),
              Expanded(
                child: OutlinedButton(
                  onPressed: () {},
                  child: Text('Pay with card'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildInput({required String title, required String hintText}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
          SizedBox(height: 16),
          TextFormField(decoration: InputDecoration(hintText: hintText)),
        ],
      ),
    );
  }
}
