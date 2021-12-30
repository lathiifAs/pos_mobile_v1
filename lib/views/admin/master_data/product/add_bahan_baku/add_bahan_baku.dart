import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pointofsales/providers/admin/p_product.dart';
import 'package:pointofsales/utils/constants.dart';
import 'package:pointofsales/utils/currency_formatters.dart';
import 'package:pointofsales/utils/empty_data.dart';
import 'package:pointofsales/utils/size_config.dart';
import 'package:pointofsales/views/components/general_widgets/default_button.dart';
import 'package:pointofsales/views/components/general_widgets/default_dropdown.dart';
import 'package:pointofsales/views/components/general_widgets/default_input_text.dart';
import 'package:pointofsales/views/components/general_widgets/general_text_field.dart';
import 'package:provider/provider.dart';

class AddBahanBaku extends StatefulWidget {
  const AddBahanBaku({Key? key, required this.productGroupId})
      : super(key: key);

  final String productGroupId;

  @override
  _AddBahanBakuState createState() => _AddBahanBakuState();
}

class _AddBahanBakuState extends State<AddBahanBaku> {
  TextEditingController _productNameController = TextEditingController();
  TextEditingController _aliasContr = TextEditingController();
  TextEditingController _productPriceController = TextEditingController();
  TextEditingController _minStockCont = TextEditingController();
  TextEditingController _maxStockCount = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      var data = Provider.of<ProviderProduct>(context, listen: false);
      data.getDataAdd(context, widget.productGroupId);
    });
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      var data = Provider.of<ProviderProduct>(context, listen: false);
      data.subProductGroupId = null;
    });
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      var data = Provider.of<ProviderProduct>(context, listen: false);
      data.fileImgAddBahanBaku = null;
    });
    super.initState();
  }

  String satuanDasarId = "";
  String productPrice = "";

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Data"),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(kDefaultPadding),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Consumer<ProviderProduct>(
                builder: (context, data, _) => InkWell(
                  onTap: () {
                    data.getImageAddBahanBaku();
                  },
                  child: (data.fileImgAddBahanBaku == null)
                      ? Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Product Image *',
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Container(
                              width: double.infinity,
                              height: SizeConfig.screenHeight * 0.28,
                              decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Icon(
                                Icons.add_photo_alternate_outlined,
                                color: Colors.white,
                                size: 50,
                              ),
                            ),
                          ],
                        )
                      : Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Image',
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Container(
                                width: double.infinity,
                                height: SizeConfig.screenHeight * 0.23,
                                decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: Image.file(
                                  data.fileImgAddBahanBaku!,
                                  fit: BoxFit.cover,
                                )),
                          ],
                        ),
                ),
              ),
              SizedBox(
                height: kDefaultPadding,
              ),
              GeneralTextField(
                label: "Product Name *",
                controller: _productNameController,
              ),
              SizedBox(
                height: kDefaultPadding / 2,
              ),
              GeneralTextField(
                label: "Alias *",
                controller: _aliasContr,
              ),
              SizedBox(
                height: kDefaultPadding / 2,
              ),
              Consumer<ProviderProduct>(
                  builder: (context, data, _) => (data.modelDataAdd == null)
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : (data.modelDataAdd!.data == null)
                          ? Container()
                          : (data.modelDataAdd!.data!.arraySubProdukGroup!
                                      .length ==
                                  0)
                              ? DefaultDropdown(
                                  label: "Sub Product Group *",
                                  selectedItem: "Data is empty!",
                                  onChanged: (value) {},
                                  items: data
                                      .modelDataAdd!.data!.arraySubProdukGroup!
                                      .map((e) => e.subProdukGroupNama)
                                      .toList())
                              : DefaultDropdown(
                                  label: "Sub Product Group *",
                                  selectedItem: "Choose",
                                  onChanged: (value) {
                                    var subProductGroupNama = data.modelDataAdd!
                                        .data!.arraySubProdukGroup!
                                        .where((element) =>
                                            element.subProdukGroupNama ==
                                            value);
                                    subProductGroupNama.forEach((element) {
                                      data.subProductGroupId =
                                          element.subProdukGroupId.toString();
                                    });
                                  },
                                  items: data
                                      .modelDataAdd!.data!.arraySubProdukGroup!
                                      .map((e) => e.subProdukGroupNama)
                                      .toList())),
              SizedBox(
                height: kDefaultPadding / 2,
              ),
              Consumer<ProviderProduct>(
                  builder: (context, data, _) => (data.modelDataAdd == null)
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : (data.modelDataAdd!.data == null)
                          ? Container()
                          : (data.modelDataAdd!.data!.arraySatuan!.length == 0)
                              ? DefaultDropdown(
                                  label: "UOM *",
                                  selectedItem: "Data is empty!",
                                  onChanged: (value) {},
                                  items: data.modelDataAdd!.data!.arraySatuan!
                                      .map((e) => e.satuanNama)
                                      .toList())
                              : DefaultDropdown(
                                  label: "UOM *",
                                  selectedItem: "Choose",
                                  onChanged: (value) {
                                    var name = data
                                        .modelDataAdd!.data!.arraySatuan!
                                        .where((element) =>
                                            element.satuanNama == value);
                                    name.forEach((element) {
                                      satuanDasarId =
                                          element.satuanId.toString();
                                    });
                                  },
                                  items: data.modelDataAdd!.data!.arraySatuan!
                                      .map((e) => e.satuanNama)
                                      .toList())),
              SizedBox(
                height: kDefaultPadding / 2,
              ),
              GeneralTextField(
                label: "Sales Price *",
                controller: _productPriceController,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  CurrencyFormatters(maxDigits: 12)
                ],
                inputType: TextInputType.number,
              ),
              SizedBox(
                height: kDefaultPadding / 2,
              ),
              Row(
                children: [
                  Expanded(
                    child: GeneralTextField(
                      label: "Min. Stock *",
                      controller: _minStockCont,
                      inputType: TextInputType.number,
                    ),
                  ),
                  SizedBox(
                    width: kDefaultPadding,
                  ),
                  Expanded(
                    child: GeneralTextField(
                      label: "Max. Stock *",
                      controller: _maxStockCount,
                      inputType: TextInputType.number,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: kDefaultPadding,
              ),
              Consumer<ProviderProduct>(
                builder: (context, data, _) => Container(
                  width: double.infinity,
                  height: 50,
                  child: DefaultButton(
                      backgroundColor: kButtonColor,
                      buttonText: "Save",
                      onPressed: () {
                        productPrice =
                            _productPriceController.text.replaceAll(".", "");
                        data.postAddBahanBaku(
                            context,
                            widget.productGroupId,
                            _productNameController.text,
                            data.subProductGroupId.toString(),
                            data.imgAddBahanBaku!,
                            productPrice,
                            satuanDasarId,
                            _minStockCont.text,
                            _maxStockCount.text,
                            _aliasContr.text);
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
