import 'package:expenseui/colors.dart';
import 'package:expenseui/json/create_budget_json.dart';
import 'package:flutter/material.dart';

class CreateBudget extends StatefulWidget {
  const CreateBudget({super.key});

  @override
  State<CreateBudget> createState() => _CreateBudgetState();
}

class _CreateBudgetState extends State<CreateBudget> {
  int activeCategory = 0;
 final TextEditingController _budgetName = TextEditingController(text: "Shopping");
 final TextEditingController _budgetcost = TextEditingController(text: "\$325.43");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: grey.withOpacity(0.2),
      body: getBody(),
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(color: white, boxShadow: [
              BoxShadow(
                  color: grey.withOpacity(0.1), spreadRadius: 10, blurRadius: 3)
            ]),
            child: const Padding(
                padding:
                    EdgeInsets.only(top: 30, right: 20, left: 20, bottom: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Create Budget',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: black),
                    ),
                    Icon(Icons.search),
                  ],
                )),
          ),
       const   SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20),
            child: Text(
              'Choose Category',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: black.withOpacity(0.9)),
            ),
          ),
         const SizedBox(
            height: 20,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(categories.length, (index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      activeCategory = index;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Container(
                      margin:const EdgeInsets.only(left: 10),
                      width: 150,
                      height: 170,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: activeCategory == index
                                  ? primary
                                  : Colors.transparent,
                              width: activeCategory == index ? 2 : 0),
                          borderRadius: BorderRadius.circular(12),
                          color: white,
                          boxShadow: [
                            BoxShadow(
                                color: grey.withOpacity(0.01),
                                spreadRadius: 10,
                                blurRadius: 3),
                          ]),
                      child: Padding(
                        padding:const EdgeInsets.only(
                            left: 25, right: 25, bottom: 20, top: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: grey.withOpacity(0.15)),
                                child: Center(
                                    child: Image.asset(
                                  categories[index]['icon'],
                                  width: 30,
                                  height: 30,
                                  fit: BoxFit.cover,
                                ))),
                            Text(
                              categories[index]['name'],
                              style:const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
        const  SizedBox(
            height: 50,
          ),
          Padding(
            padding:const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'budget name',
                  style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: black.withOpacity(0.6)),
                ),
                TextField(
                  controller: _budgetName,
                  cursorColor: black,
                  style:const TextStyle(
                      fontSize: 17, fontWeight: FontWeight.bold, color: black),
                  decoration:const InputDecoration(border: InputBorder.none),
                ),
               const SizedBox(
                  height: 20,
                ),
                Text(
                  'enter budget',
                  style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: black.withOpacity(0.6)),
                ),
                Row(
                  children: [
                    SizedBox(
                      width: size.width - 110,
                      child: Column(children: [
                        TextField(
                          controller: _budgetcost,
                          cursorColor: black,
                          style:const TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: black),
                          decoration:const InputDecoration(border: InputBorder.none),
                        ),
                      ]),
                    ),
                   const SizedBox(
                      width: 20,
                    ),
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                          color: primary,
                          borderRadius: BorderRadius.circular(15)),
                      child:const Icon(
                        Icons.arrow_forward,
                        color: white,
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
