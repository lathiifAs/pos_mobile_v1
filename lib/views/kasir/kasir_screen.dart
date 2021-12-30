import 'package:flutter/material.dart';
import 'package:pointofsales/providers/admin/p_auth.dart';
import 'package:pointofsales/providers/kasir/p_kasir.dart';
import 'package:pointofsales/utils/constants.dart';
import 'package:provider/provider.dart';

class KasirScreen extends StatefulWidget {
  const KasirScreen({Key? key}) : super(key: key);

  @override
  State<KasirScreen> createState() => _KasirScreenState();
}

class _KasirScreenState extends State<KasirScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Waiters"),
        actions: [
          InkWell(
            onTap: () {
              Provider.of<ProviderAuth>(context, listen: false).logout();
            },
            child: Icon(
              Icons.logout,
              color: Colors.white,
            ),
          ),
          SizedBox(
            width: 10,
          )
        ],
      ),
      drawer: Drawer(
        child: Consumer<ProviderKasir>(
          builder: (context, data, _) => ListView(
            padding:
                EdgeInsets.fromLTRB(kDefaultPadding, 50, kDefaultPadding, 0),
            children: [
              Container(
                margin: EdgeInsets.only(bottom: kDefaultPadding),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.account_circle_outlined,
                      size: 80,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      width: kDefaultPadding / 2,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Username",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text("Waiters")
                      ],
                    )
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  data.isDrawerSettings = !data.isDrawerSettings;
                },
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Settings",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 19),
                      ),
                      Icon(
                        data.isDrawerSettings == true
                            ? Icons.keyboard_arrow_down
                            : Icons.keyboard_arrow_right,
                      )
                    ],
                  ),
                ),
              ),
              (data.isDrawerSettings == false)
                  ? Container()
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: kDefaultPadding,
                        ),
                        InkWell(
                          onTap: () {},
                          child: Row(
                            children: [
                              Image.asset(
                                "assets/images/print.png",
                                width: 25,
                                height: 25,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Setting Printer",
                                style: TextStyle(fontSize: 17),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
              SizedBox(
                height: kDefaultPadding,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
