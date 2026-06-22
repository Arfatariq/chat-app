import 'package:chatapp/screens/homepagescreens/all_users.dart';
import 'package:chatapp/screens/homepagescreens/home_chatslist.dart';

import 'package:flutter/material.dart';


class CustomTabs extends StatelessWidget {
  final TabController controller;
  const CustomTabs({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          // The tab labels
         // The tab labels
Container(
  margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
  decoration: BoxDecoration(
    color: Color.fromARGB(255, 5, 21, 86), // TabBar background
    borderRadius: BorderRadius.circular(25),       // Rounded corners
  ),
  child: TabBar(
    controller: controller,
    indicator: BoxDecoration(
      color: Color.fromARGB(255, 60, 80, 134),                        // Indicator color
      borderRadius: BorderRadius.circular(25),    // Rounded indicator
    ),
    labelColor: Colors.white,
    unselectedLabelColor: Colors.grey[400],
    indicatorPadding: const EdgeInsets.all(4),    // Space around indicator
    tabs: const [
      Tab(text: "Groups"),
      Tab(text: "Find people"),
      Tab(text: "Unread"),
    ],
  ),
),

          // The pages
          Expanded(
            child: TabBarView(
              controller: controller,
              children: [
                Container(color: Colors.white ,child: const HomeChats()),
                Container(color: Colors.white, child: const AllUsersList()),
                Container(color: Colors.orange, child: const Center(child: Text("Unread Page"))),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
