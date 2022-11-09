import 'package:flutter/material.dart';



class CategoryCard extends StatelessWidget {
  const CategoryCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, '/products');
      },
      child: Container(
        margin: const EdgeInsets.fromLTRB(6, 20, 6, 4),
        width: 100,
        padding: const EdgeInsets.only(top: 10),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(7.32)),
        child: Column(
          children: [
            CircleAvatar(
              radius: 32.0,
              backgroundImage: const AssetImage('assets/images/orthopedic.png'),
              backgroundColor: Colors.blue.shade50,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              // '${categories[index].name}',
              'Orthopedics',
              textAlign: TextAlign.center,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
