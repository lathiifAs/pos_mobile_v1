import 'package:flutter/material.dart';
import 'package:pointofsales/providers/admin/p_table.dart';
import 'package:pointofsales/utils/constants.dart';
import 'package:pointofsales/utils/general_button.dart';
import 'package:pointofsales/views/components/general_widgets/default_button.dart';
import 'package:pointofsales/views/components/general_widgets/default_dropdown.dart';
import 'package:pointofsales/views/components/general_widgets/general_text_field.dart';
import 'package:provider/provider.dart';

class AddMasterTable extends StatelessWidget {
  const AddMasterTable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController _tableNameController = TextEditingController();
    String roleId = '';
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Master Table'),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Consumer<ProviderTable>(
                builder: (context, data, _) => (data.modelAddMeja == null)
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : (data.modelAddMeja!.data == null)
                        ? Container()
                        : (data.modelAddMeja!.data!.outlet!.length == 0)
                            ? DefaultDropdown(
                                label: "Outlet *",
                                selectedItem: "Data is empty!",
                                onChanged: (value) {},
                                items: data.modelAddMeja!.data!.outlet!
                                    .map((e) => e.roleNm)
                                    .toList())
                            : DefaultDropdown(
                                label: "Outlet *",
                                selectedItem: "Choose",
                                onChanged: (value) {
                                  var name = data.modelAddMeja!.data!.outlet!
                                      .where(
                                          (element) => element.roleNm == value);
                                  name.forEach((element) {
                                    roleId = element.roleId.toString();
                                    data.inisialMeja =
                                        element.inisialMeja.toString();
                                  });
                                },
                                items: data.modelAddMeja!.data!.outlet!
                                    .map((e) => e.roleNm)
                                    .toList(),
                              ),
              ),
              SizedBox(
                height: 10,
              ),
              Consumer<ProviderTable>(
                builder: (context, data, _) => GeneralTextField(
                  label: "Table Name *",
                  controller: _tableNameController,
                  prefixText: data.inisialMeja,
                  // prefixText: ,
                ),
              ),
              SizedBox(
                height: kDefaultPadding,
              ),
              Container(
                width: double.infinity,
                height: 50,
                child: Consumer<ProviderTable>(
                  builder: (context, data, _) => DefaultButton(
                      backgroundColor: kButtonColor,
                      buttonText: 'Save',
                      onPressed: () {
                        data.postAddMeja(context, _tableNameController.text,
                            roleId, data.inisialMeja);
                        _tableNameController.clear();
                        roleId = '';
                        data.inisialMeja = '';
                      }),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
