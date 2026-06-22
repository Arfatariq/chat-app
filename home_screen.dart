import 'package:chatapp/customWidgets/bottomnavigation_bar.dart';
import 'package:chatapp/customWidgets/tab_bar.dart';
import 'package:chatapp/screens/homepagescreens/friend_requests.dart';
import 'package:flutter/material.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int index = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:   Color.fromARGB(255, 9, 42, 112),
     appBar: AppBar(
  backgroundColor: const Color.fromARGB(255, 9, 42, 112),
  toolbarHeight: 70,
  title: const Text(
    'CONVO',
    style: TextStyle(
      fontSize: 20, 
      fontWeight: FontWeight.w700,
      letterSpacing: 1,
    ),
  ),
  actions: [
    IconButton(
      icon: const Icon(Icons.person_add_alt_1, size: 26), 
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const FriendRequestsPage()),
        );
      },
    ),
    const Padding(
      padding: EdgeInsets.only(right: 8),
      child: Icon(Icons.more_vert, size: 26),
    ),
  ],
),

      body: Column(
        children: [
          CustomTabs(controller: _tabController),
        ],
      
      ),
     floatingActionButton: SizedBox(
      height: 50,
      width: 50,
       child: FloatingActionButton(
  onPressed: () {},
  backgroundColor:  Color.fromARGB(255, 9, 42, 112),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(20), 
  ),
  child: const Icon(Icons.add),
),
     ),

      bottomNavigationBar: CustomBottomNav(
        currentIndex: index,
        onTap: (i) => setState(() => index = i),
      ),
    );
  }
}
