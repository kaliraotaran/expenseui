import 'package:expenseui/colors.dart';
import 'package:expenseui/json/daily_json.dart';
import 'package:expenseui/json/day_month.dart';
import 'package:flutter/material.dart';

class DailyPage extends StatefulWidget {
  const DailyPage({super.key});

  @override
  State<DailyPage> createState() => _DailyPageState();
}

class _DailyPageState extends State<DailyPage> {
  int activeday = 4;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: grey.withOpacity(0.05),
      body: getBody(),
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: white,
              boxShadow: [
                BoxShadow(
                    color: grey.withOpacity(0.01),
                    spreadRadius: 10,
                    blurRadius: 3),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 20, bottom: 20, right: 10, left: 10),
              child: Column(children: [
                const Row(
                  
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Daily Transaction",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: black),
                    ),
                    Icon(Icons.search)
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(9, (index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              activeday = index;
                            });
                          },
                          child: SizedBox(
                            width: (size.width - 80) / 6,
                            child: Column(
                              children: [
                                Text(
                                  days[index]['label'],
                                  style:const TextStyle(fontSize: 13),
                                ),
                                const SizedBox(
                                  height: 6,
                                ),
                                Container(
                                  width: 30,
                                  height: 30,
                                  decoration: BoxDecoration(
                                      color: activeday == index
                                          ? primary
                                          : Colors.transparent,
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                          color: activeday == index
                                              ? primary
                                              : Colors.black.withOpacity(0.3))),
                                  child: Center(
                                      child: Text(
                                    days[index]['day'],
                                    style: TextStyle(
                                        fontSize: 10,
                                        color: activeday == index
                                            ? white
                                            : Colors.black),
                                  )),
                                )
                              ],
                            ),
                          ),
                        );
                      })),
                )
              ]),
            ),
          ),
       const   SizedBox(
            height: 30,
          ),
          Padding(
              padding:const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                children: List.generate(daily.length, (index) {
                  return Column(
                    children: [
                      Row(children: [
                        SizedBox(
                          width: (size.width - 40) * 0.7,
                          child: Row(
                            children: [
                              Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                    color: grey.withOpacity(0.2),
                                    shape: BoxShape.circle),
                                child: Center(
                                  child: Image.asset(
                                    daily[index]['icon'],
                                    width: 30,
                                    height: 30,
                                  ),
                                ),
                              ),
                             const SizedBox(
                                width: 15,
                              ),
                              SizedBox(
                                width: (size.width - 90) * .50,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      daily[index]['name'],
                                      style:const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                          color: black),
                                    ),
                                 const   SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      daily[index]['date'],
                                      style:const TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 12,
                                          color: black),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          width: (size.width - 40) * 0.3,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                daily[index]['price'],
                                style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                    color: green),
                              )
                            ],
                          ),
                        )
                      ]),
                   const   Padding(
                        padding:  EdgeInsets.only(left: 65.0, top: 8),
                        child: Divider(
                          thickness: 0.8,
                        ),
                      )
                    ],
                  );
                }),
              )),
       const   SizedBox(
            height: 15,
          ),
          Padding(
            padding:const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
             const   Spacer(),
                Text(
                  'Total',
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: black.withOpacity(0.4)),
                ),
              const  Spacer(),
              const  Text(
                  '\$1554',
                  style: TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold, color: black),
                )
              ],
            ),
          ),
        const  SizedBox(
            height: 50,
          )
        ],
      ),
    );
  }
}
