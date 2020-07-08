import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  TabController _tabController;

  List<Menu> menus = [
    Menu(title: 'Calculator', icon: 'assets/images/budget.png'),
    Menu(
        title: 'Sales Register',
        icon: 'assets/images/commerce_and_shopping.png'),
    Menu(title: 'Customers', icon: 'assets/images/customer_behavior.png'),
    Menu(title: 'Expenses', icon: 'assets/images/expenses.png'),
    Menu(title: 'Setting', icon: 'assets/images/gear.png'),
    Menu(title: 'Suppliers', icon: 'assets/images/inventory.png'),
    Menu(title: 'Staffs', icon: 'assets/images/man.png'),
    Menu(title: 'Payment', icon: 'assets/images/pay.png'),
    Menu(title: 'Product/Service', icon: 'assets/images/product.png'),
    Menu(title: 'Reports', icon: 'assets/images/report.png'),
    Menu(title: 'Sales', icon: 'assets/images/sales.png'),
    Menu(title: 'SMS', icon: 'assets/images/sms.png'),
    Menu(title: 'Offline Sales', icon: 'assets/images/wifi.png'),
  ];
  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 2);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top:20.0),
        child: Column(
          children: <Widget>[
            TabBar(
              indicatorColor: Color(0xFFE0115F),
              controller: _tabController,
              tabs: [
                new Tab(child: Text('DASHBOARD',  style: TextStyle(color:Colors.black))),
                new Tab(
                    child: Text(
                  'ACTIVITY', style: TextStyle(color:Colors.black),
                )),
                // new Tab(icon: new Icon(Icons.directions_bike)),
              ],
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: <Widget>[
                  SingleChildScrollView(
                                    child: Column(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.all(18.0),
                          padding: EdgeInsets.all(18.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10.0)),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey[300],
                                blurRadius: 25.0, // soften the shadow
                                spreadRadius: 1.0, //extend the shadow
                                offset: Offset(
                                  5.0, // Move to right 10  horizontally
                                  5.0, // Move to bottom 10 Vertically
                                ),
                              )
                            ],
                            color: Colors.white,
                          ),
                          // width: double.infinity,
                          // height: 100,
                          child: Column(
                            children: <Widget>[
                              ListTile(
                                contentPadding: EdgeInsets.all(0),
                                title: Text('Today\'s Transaction'),
                                subtitle: Text('15 June 2020'),
                              ),
                              Column(
                                children: <Widget>[Text('₦ 0.00', style: Theme.of(context).textTheme.headline3.copyWith(color:Colors.black)), Text('Sales')],
                              ),
                              Row(
                                children: <Widget>[
                                  Expanded(
                                    flex: 4,
                                    child: SizedBox(
                                      height: 20.0,
                                      child: new LinearProgressIndicator(
                                          value: 0.5,
                                          backgroundColor:
                                              Color(0xFFE0115F).withOpacity(0.2),
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                                  Color(0xFFE0115F))),
                                    ),
                                  ),
                                  SizedBox(width: 5.0),
                                  Expanded(
                                      child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text('₦ 0.00'),
                                      Text('Profit')
                                    ],
                                  ))
                                ],
                              ),
                              SizedBox(height: 10.0),
                              Row(
                                children: <Widget>[
                                  Expanded(
                                    flex: 3,
                                    child: SizedBox(
                                      height: 20.0,
                                      child: new LinearProgressIndicator(
                                          value: 0.3,
                                          backgroundColor:
                                              Color(0xFFE0115F).withOpacity(0.2),
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                                  Color(0xFFE0115F))),
                                    ),
                                  ),
                                  SizedBox(width: 5.0),
                                  Expanded(
                                      flex: 2,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text('₦ 0.00'),
                                          Text('Expenses')
                                        ],
                                      ))
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: GridView.count(
                            padding: EdgeInsets.symmetric(
                                vertical: 30, horizontal: 18.0),
                            childAspectRatio: 0.95,
                            crossAxisSpacing:
                                MediaQuery.of(context).size.width * 0.035,
                            mainAxisSpacing:
                                MediaQuery.of(context).size.height * 0.025,
                            shrinkWrap: true,
                            physics: ScrollPhysics(),
                            crossAxisCount: 2,
                            children: menus
                                .map(
                                  (menu) => Container(
                                    // constraints: BoxConstraints.expand(),
                                    // height: 60.0,
                                    // width: 60.0,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: <Widget>[
                                        Image(
                                          image: AssetImage(menu.icon),
                                          height: 50.0,
                                        ),
                                        SizedBox(height: 20.0),
                                        Text(menu.title)
                                      ],
                                    ),

                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10.0)),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey[300],
                                          blurRadius: 25.0, // soften the shadow
                                          spreadRadius: 1.0, //extend the shadow
                                          offset: Offset(
                                            5.0, // Move to right 10  horizontally
                                            5.0, // Move to bottom 10 Vertically
                                          ),
                                        )
                                      ],
                                      color: Colors.white,
                                    ),
                                  ),
                                )
                                .toList(),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Menu {
  final String title;
  final String icon;

  Menu({this.title, this.icon});
}
