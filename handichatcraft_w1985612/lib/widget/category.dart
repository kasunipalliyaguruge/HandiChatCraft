import 'package:flutter/material.dart';
import 'package:handichatcraft_w1985612/model/category_model.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          categoryDataList.length,
          (index) => Padding(
            padding: const EdgeInsets.only(right: 8, bottom: 8, top: 8),
            child: Material(
              elevation: 3,
              borderRadius: BorderRadius.circular(10),
              child: Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                    color: categoryDataList[index].active
                        ? Colors.orange
                        : Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      categoryDataList[index].imagePath,
                      height: 60,
                      width: 60,
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Text(
                      categoryDataList[index].categoryname,
                      style: const TextStyle(fontSize: 8),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
