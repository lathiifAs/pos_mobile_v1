import 'package:flutter/material.dart';
import 'package:pointofsales/providers/admin/p_auth.dart';
import 'package:pointofsales/providers/waiters/p_waiters.dart';
import 'package:pointofsales/utils/constants.dart';
import 'package:pointofsales/utils/dialog_snackbar.dart';
import 'package:pointofsales/utils/enum.dart';
import 'package:pointofsales/utils/general_button.dart';
import 'package:pointofsales/views/components/general_widgets/default_button.dart';
import 'package:pointofsales/views/components/general_widgets/default_dropdown.dart';
import 'package:pointofsales/views/components/general_widgets/general_text_field.dart';
import 'package:pointofsales/views/waiters/waiters_screen.dart';
import 'package:provider/provider.dart';

class IndexScreen extends StatefulWidget {
  const IndexScreen({Key? key}) : super(key: key);

  @override
  State<IndexScreen> createState() => _IndexScreenState();
}

class _IndexScreenState extends State<IndexScreen> {
  @override
  void initState() {
    // TODO: implement initState
    Provider.of<ProviderWaiters>(context, listen: false)
        .getIndexWaiters(context);
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      var data = Provider.of<ProviderWaiters>(context, listen: false);
      data.typeService = 'dine in';
    });
    super.initState();
  }

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
      body: Card(
        margin: const EdgeInsets.all(10),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Consumer<ProviderWaiters>(
            builder: (context, data, _) => SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  DefaultDropdown(
                      label: 'Type of Service *',
                      selectedItem: data.typeService!,
                      onChanged: (val) => data.typeService = val!,
                      items: ["Dine In", "Take Away", "Delivery"]),
                  SizedBox(
                    height: 10,
                  ),
                  (data.typeService!.toLowerCase() == 'dine in')
                      ? (data.modelIndexWaiters == null)
                          ? Center(
                              child: CircularProgressIndicator(),
                            )
                          : (data.modelIndexWaiters!.data == null)
                              ? Container()
                              : (data.modelIndexWaiters!.data!.arrayMeja!
                                          .length ==
                                      0)
                                  ? Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        DefaultDropdown(
                                            label: "Table *",
                                            selectedItem: "Empty Data!",
                                            onChanged: (value) {},
                                            items: data.modelIndexWaiters!.data!
                                                .arrayMeja!
                                                .map((e) => e.mejaNomor)
                                                .toList()),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        GeneralTextField(
                                          label: "Number of Person *",
                                          controller: data.numberOfPersonCont,
                                          inputType: TextInputType.number,
                                        ),
                                      ],
                                    )
                                  : Column(
                                      children: [
                                        DefaultDropdown(
                                            label: "Table *",
                                            selectedItem: "Choose",
                                            onChanged: (value) {
                                              var nama = data.modelIndexWaiters!
                                                  .data!.arrayMeja!
                                                  .where((element) =>
                                                      element.mejaNomor ==
                                                      value);
                                              nama.forEach((element) {
                                                data.mejaId =
                                                    element.mejaId.toString();
                                                data.tableName = element
                                                    .mejaNomor
                                                    .toString();
                                              });
                                              data.customerNameCont.clear();
                                            },
                                            items: data.modelIndexWaiters!.data!
                                                .arrayMeja!
                                                .map((e) => e.mejaNomor)
                                                .toList()),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        GeneralTextField(
                                          label: "Person *",
                                          controller: data.numberOfPersonCont,
                                          hintText: 'Enter number of person',
                                          inputType: TextInputType.number,
                                        ),
                                      ],
                                    )
                      : GeneralTextField(
                          label: "Customer Name *",
                          controller: data.customerNameCont,
                          hintText: 'Enter customer name',
                        ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: double.infinity,
                    height: 50,
                    child: DefaultButton(
                        backgroundColor: kButtonColor,
                        buttonText: 'Next',
                        onPressed: () {
                          if (data.typeService!.toLowerCase() == 'dine in') {
                            if (data.mejaId.isEmpty ||
                                data.numberOfPersonCont.text.isEmpty) {
                              showSnackBar(
                                  snackBarType: SnackBarType.WARNING,
                                  title: 'Warning',
                                  message:
                                      'Table and Number of Person is required!');
                            } else {
                              (data.totalHargaProduk == 0)
                                  ? showSnackBar(
                                      snackBarType: SnackBarType.WARNING,
                                      title: 'Warning',
                                      message: 'Please select the menu first')
                                  : Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              WaitersScreen()));
                            }
                          }
                          if (data.typeService!.toLowerCase() == 'take away' ||
                              data.typeService!.toLowerCase() == 'delivery') {
                            if (data.customerNameCont.text.isEmpty) {
                              showSnackBar(
                                  snackBarType: SnackBarType.WARNING,
                                  title: 'Warning',
                                  message: 'Customer Name is required!');
                            } else {
                              (data.totalHargaProduk == 0)
                                  ? showSnackBar(
                                      snackBarType: SnackBarType.WARNING,
                                      title: 'Warning',
                                      message: 'Please select the menu first')
                                  : Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              WaitersScreen()));
                            }
                          }
                        }),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
