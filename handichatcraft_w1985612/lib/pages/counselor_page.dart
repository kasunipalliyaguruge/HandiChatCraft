import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:handichatcraft_w1985612/model/counselor_model.dart';
import 'package:handichatcraft_w1985612/widget/category.dart';
import 'package:handichatcraft_w1985612/widget/constant.dart';
import 'package:handichatcraft_w1985612/widget/counselor_list.dart';
import 'package:handichatcraft_w1985612/widget/search_box.dart';

class CounselorPage extends StatefulWidget {
  const CounselorPage({super.key});

  @override
  State<CounselorPage> createState() => _CounselorPageState();
}

class _CounselorPageState extends State<CounselorPage> {
  int selectedCategory = -1;
  late List<CounselorModel> counselors = [];
  late List<CounselorModel> filteredList = [];
  late List<CounselorModel> searchedList = [];

  void filter(int cat, String name) {
    selectedCategory = cat;

    filteredList = selectedCategory == -1
        ? counselors
        : counselors
            .where((element) => element.catId == selectedCategory)
            .toList();

    search(name);
  }

  void search(String name) {
    if (name.isNotEmpty) {
      List<CounselorModel> temp = [];

      for (var element in filteredList) {
        if (element.name.toLowerCase().contains(name.toLowerCase())) {
          temp.add(element);
        }
      }

      setState(() {
        searchedList = temp;
      });
    } else {
      //searchedList.clear();
      setState(() {
        searchedList = filteredList;
      });
    }
  }

  void getCounselors() {
    FirebaseFirestore.instance.collection('Counselors').get().then(
      (querySnapshot) {
        counselors = querySnapshot.docs
            .map((doc) => CounselorModel.fromFirestore(doc))
            .toList();

        setState(() {
          filteredList = counselors;
          searchedList = filteredList;
        });
      },
      onError: (e) => print("Error completing: $e"),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCounselors();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: white,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.account_circle,
              color: Colors.orange,
              size: 40,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Hello Anne",
                style: TextStyle(
                  color: Colors.orange,
                  fontFamily: "Calistoga",
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Find your Counselor",
                style: TextStyle(
                  color: Colors.orange,
                  fontFamily: "Calistoga",
                  fontSize: 27,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 20,),
            SearchBox(
              callback: filter,
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 100,
              child: CategoryCard(
                callback: filter,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            CounselorList(
              filteredList: searchedList,
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
