import 'package:expenseui/charts.dart';
import 'package:expenseui/colors.dart';
import 'package:expenseui/json/day_month.dart';
import 'package:flutter/material.dart';

class StatsPage extends StatefulWidget {
  const StatsPage({super.key});

  @override
  State<StatsPage> createState() => _StatsPageState();
}

class _StatsPageState extends State<StatsPage> {
  var activeMonth = 3;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: grey.withOpacity(0.05),
      body: getBody(),
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    List expenses = [
      {
        "icon": Icons.arrow_back,
        "color": blue,
        "label": "Income",
        "cost": "\$4532.23"
      },
      {
        "icon": Icons.arrow_forward,
        "color": red,
        "label": "Expenses",
        "cost": "\$2342.44"
      },
    ];
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(color: white, boxShadow: [
              BoxShadow(
                  color: grey.withOpacity(0.01),
                  spreadRadius: 10,
                  blurRadius: 3)
            ]),
            child: Padding(
              padding:
                const  EdgeInsets.only(top: 60, left: 20, right: 20, bottom: 25),
              child: Column(
                children: [
                 const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Stats',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: black),
                      ),
                      Icon(Icons.search),
                    ],
                  ),
                const  SizedBox(
                    height: 25,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: List.generate(10, (index) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                activeMonth = index;
                              });
                            },
                            child: SizedBox(
                              width: (size.width - 80) / 6,
                              child: Column(
                                children: [
                                  Text(
                                    months[index]['label'],
                                    style:const TextStyle(fontSize: 13),
                                  ),
                                  const SizedBox(
                                    height: 6,
                                  ),
                                  Container(
                                    width: 45,
                                    height: 30,
                                    decoration: BoxDecoration(
                                        color: activeMonth == index
                                            ? primary
                                            : Colors.transparent,
                                        borderRadius: BorderRadius.circular(5),
                                        border: Border.all(
                                            color: activeMonth == index
                                                ? primary
                                                : Colors.black
                                                    .withOpacity(0.3))),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          top: 7.0,
                                          bottom: 7,
                                          right: 12,
                                          left: 12),
                                      child: Text(
                                        months[index]['day'],
                                        style: TextStyle(
                                            fontSize: 10,
                                            color: activeMonth == index
                                                ? white
                                                : Colors.black),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        })),
                  ),
              const    SizedBox(
                    height: 50,
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding:const EdgeInsets.only(left: 20, right: 20),
            child: Container(
              width: double.infinity,
              height: 250,
              decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                        color: black.withOpacity(0.01),
                        blurRadius: 3,
                        spreadRadius: 10)
                  ]),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Net balance',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 13,
                                color: black.withOpacity(0.3)),
                          ),
                         const SizedBox(
                            height: 10,
                          ),
                         const Text(
                            "\$2310.45",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 25),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 78.0),
                      child: SizedBox(
                        width: size.width - 20,
                        // height: 170,
                        child: LineChartWidget(pricePoints),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Wrap(
              spacing: 20,
              children: List.generate(expenses.length, (index) {
                return Container(
                  width: (size.width - 60) / 2,
                  height: 170,
                  decoration: BoxDecoration(
                      color: white,
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      boxShadow: [
                        BoxShadow(
                            color: grey.withOpacity(0.01),
                            spreadRadius: 10,
                            blurRadius: 3)
                      ]),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 25),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                                color: expenses[index]['color'],
                                shape: BoxShape.circle),
                            child:
                                Center(child: Icon(expenses[index]['icon']))),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              expenses[index]['label'],
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 13,
                                  color: black.withOpacity(0.3)),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              expenses[index]['cost'],
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 23),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                );
              })),
          const SizedBox(
            height: 50,
          )
        ],
      ),
    );
  }
}
