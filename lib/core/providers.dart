import 'package:pointofsales/providers/admin/p_printer.dart';
import 'package:pointofsales/providers/admin/p_retail_account.dart';
import 'package:pointofsales/providers/admin/p_unit.dart';
import 'package:pointofsales/providers/admin/p_warehouse.dart';
import 'package:pointofsales/providers/admin/settings/p_preferences.dart';
import 'package:pointofsales/providers/admin/transaction/p_stock_opname.dart';
import 'package:pointofsales/providers/apps/p_app.dart';
import 'package:pointofsales/providers/apps/p_firebase.dart';
import 'package:pointofsales/providers/dapur/p_dapur.dart';
import 'package:pointofsales/providers/kasir/p_kasir.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:pointofsales/providers/admin/p_admin_account.dart';
import 'package:pointofsales/providers/admin/p_auth.dart';
import 'package:pointofsales/providers/admin/p_cafe_account.dart';
import 'package:pointofsales/providers/admin/p_dashboard.dart';
import 'package:pointofsales/providers/admin/p_discount.dart';
import 'package:pointofsales/providers/admin/p_jenis_pembayaran.dart';
import 'package:pointofsales/providers/admin/p_kitchen.dart';
import 'package:pointofsales/providers/admin/p_konversi_satuan.dart';
import 'package:pointofsales/providers/admin/p_master_cafe.dart';
import 'package:pointofsales/providers/admin/p_product.dart';
import 'package:pointofsales/providers/admin/p_product_group.dart';
import 'package:pointofsales/providers/admin/transaction/p_purchasing.dart';
import 'package:pointofsales/providers/admin/p_retail_bakery.dart';
import 'package:pointofsales/providers/admin/p_role.dart';
import 'package:pointofsales/providers/admin/p_sales_group.dart';
import 'package:pointofsales/providers/admin/p_sub_product_group.dart';
import 'package:pointofsales/providers/admin/p_supplier.dart';
import 'package:pointofsales/providers/admin/p_table.dart';
import 'package:pointofsales/providers/admin/p_warehouse_account.dart';
import 'package:pointofsales/providers/admin/transaction/p_pos.dart';
import 'package:pointofsales/providers/admin/transaction/p_warehouse_mutation.dart';
import 'package:pointofsales/providers/waiters/p_waiters.dart';

class ProviderListener {
  static final List<SingleChildWidget> listProvider = [
    ChangeNotifierProvider<ProviderUnit>(create: (_) => ProviderUnit()),
    ChangeNotifierProvider<ProviderJenisPembayaran>(
        create: (_) => ProviderJenisPembayaran()),
    ChangeNotifierProvider<ProviderTable>(create: (_) => ProviderTable()),
    ChangeNotifierProvider<ProviderAuth>(create: (_) => ProviderAuth()),
    ChangeNotifierProvider<ProviderDashboardAdmin>(
        create: (_) => ProviderDashboardAdmin()),
    ChangeNotifierProvider<ProviderMasterCafe>(
        create: (_) => ProviderMasterCafe()),
    ChangeNotifierProvider<ProviderRole>(create: (_) => ProviderRole()),
    ChangeNotifierProvider<ProviderAdminAccount>(
        create: (_) => ProviderAdminAccount()),
    ChangeNotifierProvider<ProviderCafeAccount>(
        create: (_) => ProviderCafeAccount()),
    ChangeNotifierProvider<ProviderWarehouseAccount>(
        create: (_) => ProviderWarehouseAccount()),
    ChangeNotifierProvider<ProviderRetailBakery>(
        create: (_) => ProviderRetailBakery()),
    ChangeNotifierProvider<ProviderProductGroup>(
        create: (_) => ProviderProductGroup()),
    ChangeNotifierProvider<ProviderSubProductGroup>(
        create: (_) => ProviderSubProductGroup()),
    ChangeNotifierProvider<ProviderSalesGroup>(
        create: (_) => ProviderSalesGroup()),
    ChangeNotifierProvider<ProviderSupplier>(create: (_) => ProviderSupplier()),
    ChangeNotifierProvider<ProviderDiscount>(create: (_) => ProviderDiscount()),
    ChangeNotifierProvider<ProviderKonversiSatuan>(
        create: (_) => ProviderKonversiSatuan()),
    ChangeNotifierProvider<ProviderProduct>(create: (_) => ProviderProduct()),
    ChangeNotifierProvider<ProviderKitchen>(create: (_) => ProviderKitchen()),
    ChangeNotifierProvider<ProviderPurchasing>(
        create: (_) => ProviderPurchasing()),
    ChangeNotifierProvider<ProviderWarehouseMutation>(
        create: (_) => ProviderWarehouseMutation()),
    ChangeNotifierProvider<ProviderPos>(create: (_) => ProviderPos()),
    ChangeNotifierProvider<ProviderWaiters>(create: (_) => ProviderWaiters()),
    ChangeNotifierProvider<ProviderPrinter>(create: (_) => ProviderPrinter()),
    ChangeNotifierProvider<ProviderSettings>(create: (_) => ProviderSettings()),
    ChangeNotifierProvider<ProviderStockOpname>(
        create: (_) => ProviderStockOpname()),
    ChangeNotifierProvider<ProviderApp>(create: (_) => ProviderApp()),
    ChangeNotifierProvider<ProviderRetailAccount>(
        create: (_) => ProviderRetailAccount()),
    ChangeNotifierProvider<ProviderDapur>(create: (_) => ProviderDapur()),
    ChangeNotifierProvider<ProviderFirebase>(create: (_) => ProviderFirebase()),
    ChangeNotifierProvider<ProviderWarehouse>(
        create: (_) => ProviderWarehouse()),
    ChangeNotifierProvider<ProviderKasir>(
        create: (_) => ProviderKasir()),
  ];
}
