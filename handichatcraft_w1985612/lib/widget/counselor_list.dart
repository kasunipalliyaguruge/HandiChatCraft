import 'package:flutter/material.dart';
import 'package:handichatcraft_w1985612/model/counselor_model.dart';
import 'package:handichatcraft_w1985612/widget/my_card.dart';

class CounselorList extends StatefulWidget {
  const CounselorList({super.key});

  @override
  State<CounselorList> createState() => _CounselorListState();
}

class _CounselorListState extends State<CounselorList> {
  late List<CounselorModel> counselors = [];

  void initState() {
    super.initState();

    counselors.add(
      CounselorModel(
        "Mr.Saman Kumara",
        "Specialized in batik",
        "about",
      ),
    );

    counselors.add(
      CounselorModel(
        "Mr.Saman Kumara",
        "Specialized in batik",
        "about",
      ),
    );

    counselors.add(
      CounselorModel(
        "Mr.Saman Kumara",
        "Specialized in batik",
        "about",
      ),
    );

    counselors.add(
      CounselorModel(
        "Mr.Saman Kumara",
        "Specialized in batik",
        "about",
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: counselors.length,
      itemBuilder: (context, index) => MyCard(
          title: counselors[index].name,
          subtitle: counselors[index].specialize),
    );
  }
}
