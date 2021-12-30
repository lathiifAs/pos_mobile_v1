import 'package:flutter/material.dart';
import 'package:pointofsales/providers/admin/p_printer.dart';
import 'package:pointofsales/utils/constants.dart';
import 'package:provider/provider.dart';


class BottomDialogDevicePrinter extends StatelessWidget {
  const BottomDialogDevicePrinter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      expand: false,
      minChildSize: 0.4,
      initialChildSize: 0.4,
      builder: (context, scrollController) {
        return Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0),
              ),
              color: kBackgroundColor),
          child: ListView(
            controller: scrollController,
            physics: ClampingScrollPhysics(),
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 8),
                  height: 5.0,
                  width: 70.0,
                  decoration: BoxDecoration(
                      color: Colors.grey[400], borderRadius: BorderRadius.circular(10.0)),
                ),
              ),
              Consumer<ProviderPrinter>(
                  builder: (c,data,_){
                return ListView.builder(
                    itemCount: data.devicesPrinter.length,
                    physics: ClampingScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (c, i) {

                      var devicePrinter=data.devicesPrinter[i];

                      return ListTile(
                        onTap: (){
                          data.device=devicePrinter;
                          // if(data.connected){
                          //   data.disconnectPrinter();
                          // }else{
                            data.connectToPrinter();
                          // }
                        },
                        title: Text("${devicePrinter.name}",style: blackBoldTextStyle,),
                        subtitle: Text("${devicePrinter.address}",style: blackTextStyle,),
                        trailing: Column(
                          children: [
                            Text("${data.connected ? devicePrinter.name==data.printerName? 'Connected' : 'Disconnected' :'Disconnected'  }",style: blackBoldTextStyle.copyWith(color: devicePrinter.connected ? kPrimaryColor : kButtonColor),),

                            Expanded(
                              child: TextButton(
                                onPressed: ()=> data.testPrint(),
                                  child: Text("${data.connected ? devicePrinter.name==data.printerName? 'Test Print' : '' :''  }",style: blackBoldTextStyle.copyWith(color: kPrimaryColor),)),
                            ),
                          ],
                        ),
                      );
                    });
              })
            ],
          ),
        );
      },
    );
  }
}
