import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:metrdev/appcolors.dart';
import 'package:iconly/iconly.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  static ScrollController _scrollController = ScrollController();
  int _selectedTab = 0;

  List<Widget> _pages = [];

  void _changeTab(int index) {
    setState(() {
      _selectedTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bg,
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        ),
        child: BottomNavigationBar(
          // elevation: 8.0,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Color(0x1AFFFFFF),
          currentIndex: _selectedTab,
          onTap: (index) => _changeTab(index),
          selectedItemColor: AppColor.main_gold,
          unselectedItemColor: AppColor.gray,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: [
            BottomNavigationBarItem(icon: Icon(IconlyBold.graph), label: ''),
            BottomNavigationBarItem(
                icon: Icon(IconlyLight.activity), label: ''),
            BottomNavigationBarItem(icon: Icon(IconlyLight.setting), label: ''),
          ],
        ),
      ),
      body: _pages[_selectedTab],
    );
  }

  // -------Models-------------------
  List<Map> coin_list = [
    {
      'name': 'BTCUSDT',
      'volume': '36.77 %',
      'image': 'images/i_btc.png',
      'color': 'type1',
    },
    {
      'name': 'ETHUSDT',
      'volume': '24.77 %',
      'image': 'images/i_eth.png',
      'color': 'type2',
    },
    {
      'name': 'BNBUSDT',
      'volume': '36.07 %',
      'image': 'images/i_bnb.png',
      'color': 'type3',
    },
    {
      'name': 'BTCUSDT',
      'volume': '36.77 %',
      'image': 'images/i_btc.png',
      'color': 'type1',
    },
    {
      'name': 'ETHUSDT',
      'volume': '24.77 %',
      'image': 'images/i_eth.png',
      'color': 'type2',
    },
    {
      'name': 'BNBUSDT',
      'volume': '36.07 %',
      'image': 'images/i_bnb.png',
      'color': 'type3',
    },
  ];

  List<Map> bots = [];

  List<Map> active_list = [
    {
      'title': 'EMA Cross 50 200 + ADX (Long)',
      'sub_title': 'Distribution Bot',
      'is_active': true,
    },
    {
      'title': 'EMA Cross 50 200 + ADX (Long)',
      'sub_title': 'Distribution Bot',
      'is_active': false,
    },
    {
      'title': 'EMA Cross 50 200 + ADX (Long)',
      'sub_title': 'Distribution Bot',
      'is_active': true,
    },
    {
      'title': 'EMA Cross 50 200 + ADX (Long)',
      'sub_title': 'Distribution Bot',
      'is_active': false,
    },
  ];

  @override
  void initState() {
    _pages.add(home());
    _pages.add(chart());
    _pages.add(chart());
    super.initState();
  }

  // ------------------ pages -------------------------

  // Dashboard
  Widget home() {
    return SafeArea(
      child: Column(
        children: [
          // top bar
          Padding(
            padding: EdgeInsets.only(top: 20, left: 20, right: 20),
            child: Container(
              color: Colors.transparent,
              child: Row(
                children: [
                  // profile image
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.white,
                    backgroundImage: AssetImage('images/Ellipse21.png'),
                  ),
                  SizedBox(width: 5),

                  // profile name
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hey, Jacobs',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 3),
                      Text(
                        'Welcome back',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: AppColor.gray,
                        ),
                      ),
                    ],
                  ),

                  Expanded(child: Container()),

                  GestureDetector(
                    onTap: () {},
                    child: Image.asset(
                      'images/Notification.png',
                      width: 24,
                      height: 24,
                    ),
                  ),
                ],
              ),
            ),
          ),

          SizedBox(height: 10),

          // body
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(bottom: 20, left: 20, right: 20),
                child: Column(
                  children: [
                    // wallet box
                    Container(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: <Color>[
                              AppColor.bg,
                              AppColor.bg_element,
                              AppColor.main_gold,
                              AppColor.main_gold,
                            ],
                          ),
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                              colorFilter: ColorFilter.mode(AppColor.bg.withOpacity(0.1), BlendMode.softLight), // ColorFilter.linearToSrgbGamma(),
                              fit: BoxFit.cover,
                              image: AssetImage('images/Noise.png'))),
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                'Wallet',
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white,
                                ),
                              ),
                              Expanded(child: Container()),
                              GestureDetector(
                                onTap: () {},
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    border: Border.all(color: Colors.white),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 14, vertical: 10),
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        'images/binance_icon.png',
                                        width: 16,
                                        height: 16,
                                      ),
                                      SizedBox(width: 6),
                                      Text(
                                        ' Binance',
                                        style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.white,
                                        ),
                                      ),
                                      SizedBox(width: 15),
                                      Icon(
                                        Icons.keyboard_arrow_down,
                                        size: 24,
                                        color: Colors.white,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 32),
                          Text(
                            'Account Balance',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            '\$ 12 480.00',
                            style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 20),

                    // coin list
                    Container(
                      height: 155,
                      child: CupertinoScrollbar(
                        controller: _scrollController,
                        child: Column(
                          children: [
                            Expanded(
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                controller: _scrollController,
                                itemCount: coin_list.length,
                                itemBuilder: (BuildContext context, int index) {
                                  Map coin = coin_list[index];
                                  return Container(
                                    width: 132,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: AppColor.bg_element,
                                    ),
                                    margin: EdgeInsets.only(right: 14),
                                    padding: EdgeInsets.all(12),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        // coin icon
                                        Container(
                                          width: 42,
                                          height: 42,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(6),
                                            color: coin['color'] == 'type1'
                                                ? Color(0x33FFFFFF)
                                                : coin['color'] == 'type2'
                                                    ? Color(0x33B1BCFF)
                                                    : Color(0x33F3BA2F),
                                          ),
                                          child: Center(
                                            child: Image.asset(
                                              coin['image'],
                                              width: coin['color'] == 'type2'
                                                  ? 42
                                                  : 20,
                                              height: coin['color'] == 'type2'
                                                  ? 42
                                                  : 20,
                                            ),
                                          ),
                                        ),

                                        SizedBox(height: 21),

                                        // coin name
                                        Text(
                                          coin['name'],
                                          style: TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.white,
                                          ),
                                        ),
                                        SizedBox(height: 3),
                                        // coin volume
                                        Text(
                                          coin['volume'],
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                            SizedBox(
                              height: 14,
                            )
                          ],
                        ),
                      ),
                    ),

                    SizedBox(height: 26),

                    // list picker
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              active_list = [];
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(25),
                            ),
                            // width: ,
                            padding: EdgeInsets.symmetric(
                                horizontal: 15, vertical: 10),
                            child: Center(
                              child: Text(
                                'Signal Groups',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              active_list = bots;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: active_list.isNotEmpty
                                  ? AppColor.bg_element
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(25),
                            ),
                            width: 130,
                            padding: EdgeInsets.symmetric(
                                horizontal: 15, vertical: 10),
                            child: Center(
                              child: Text(
                                'Bots',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 14),

                    // empty list
                    active_list.isEmpty
                        ? Center(
                            child: Text(
                              'Nothing to display!',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                          )
                        // Bot list
                        : ListView.builder(
                            itemCount: active_list.length,
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (BuildContext context, int index) {
                              Map tile = active_list[index];

                              return Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: AppColor.bg_element,
                                ),
                                margin: EdgeInsets.only(bottom: 15),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 10),
                                child: Row(
                                  children: [
                                    // title & sub title
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            tile['title'],
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.white,
                                            ),
                                          ),
                                          SizedBox(height: 10),
                                          Text(
                                            tile['sub_title'],
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),

                                    SizedBox(width: 6),

                                    // bot status

                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(25),
                                        color: tile['is_active'] == true
                                            ? Color(0x1A60FFB5)
                                            : Color(0x1A8B8B8B),
                                      ),
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 7),
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.circle,
                                            size: 6,
                                            color: tile['is_active'] == true
                                                ? Color(0xFF60FFB5)
                                                : AppColor.gray,
                                          ),
                                          SizedBox(width: 8),
                                          Text(
                                            tile['is_active'] == true
                                                ? 'Active'
                                                : 'Inactive',
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600,
                                              color: tile['is_active'] == true
                                                  ? Color(0xFF60FFB5)
                                                  : AppColor.gray,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget chart() {
    return Container();
  }
}
