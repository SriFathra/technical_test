import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:technical_test/bloc/home/home_event.dart';
import 'package:technical_test/bloc/home/home_state.dart';
import 'package:technical_test/common_libs.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitState()) {
    // Register the event handler for FetchProduct
    on<FetchProduct>(_onFetchProduct);
  }

  // This is the event handler for FetchProduct
  Future<void> _onFetchProduct(
      FetchProduct event, Emitter<HomeState> emit) async {
    try {
      emit(Homeloading());

      final products = [
        {
          'title': 'Urun',
          'icon': CupertinoIcons.person_3_fill,
          'color': Colors.yellow[800]!,
          'onTap': () {}
        },
        {
          'title': 'Pembiayaan Porsi Haji',
          'icon': CupertinoIcons.person_alt,
          'color': Colors.green,
          'onTap': () {}
        },
        {
          'title': 'Financial Check Up',
          'icon': CupertinoIcons.doc_chart_fill,
          'color': Colors.yellow,
          'onTap': () {}
        },
        {
          'title': 'Asuransi Mobil',
          'icon': CupertinoIcons.car_detailed,
          'color': Colors.grey,
          'onTap': () {}
        },
        {
          'title': 'Asuransi Properti',
          'icon': CupertinoIcons.house,
          'color': Colors.red,
          'onTap': () {}
        },
      ];

      final categories = [
        {
          'title': 'Hobi',
          'icon': Icons.beach_access,
          'color': Colors.blue,
          'onTap': () {},
        },
        {
          'title': 'Merchandise',
          'icon': Icons.shopping_cart,
          'color': Colors.blue,
          'onTap': () {},
        },
        {
          'title': 'Gaya Hidup Sehat',
          'icon': Icons.monitor_heart,
          'color': Colors.red,
          'onTap': () {},
        },
        {
          'title': 'Konseling & Rohani',
          'icon': CupertinoIcons.chat_bubble_2_fill,
          'color': Colors.blue,
          'onTap': () {},
        },
        {
          'title': 'Self Development',
          'icon': Icons.school,
          'color': Colors.purple,
          'onTap': () {},
        },
        {
          'title': 'Perencanaan Keuangan',
          'icon': Icons.account_balance_wallet,
          'color': Colors.green,
          'onTap': () {},
        },
        {
          'title': 'Konsultasi Medis',
          'icon': Icons.health_and_safety,
          'color': Colors.green,
          'onTap': () {},
        },
        {
          'title': 'Kuliner',
          'icon': Icons.fastfood,
          'color': Colors.red[900],
          'onTap': () {},
        },
        {
          'title': 'Kebutuhan Harian',
          'icon': Icons.house,
          'color': Colors.black,
          'onTap': () {},
        },
        {
          'title': 'Pulsa dan Listrik',
          'icon': Icons.electric_bolt,
          'color': Colors.yellow[700],
          'onTap': () {},
        },
        {
          'title': 'Donasi',
          'icon': CupertinoIcons.heart_circle_fill,
          'color': Colors.blue[900],
          'onTap': () {},
        },
        {
          'title': 'Perangkat Kerja',
          'icon': Icons.work,
          'color': Colors.yellow[900],
          'onTap': () {},
        },
      ];

      final wellnessList = [
        {
          'image': Assets.lib.assets.images.indomaret.path,
          'title': 'Voucher Digital Indomaret Rp 25.000',
          'onTap': () {},
          'price': 'Rp 25.000',
          'discountPrice': '',
          'discount': '',
        },
        {
          'image': Assets.lib.assets.images.hM.path,
          'title': 'Voucher Digital H&M Rp 100.000',
          'onTap': () {},
          'price': 'Rp 100.000',
          'discountPrice': 'Rp 97.000',
          'discount': '3% OFF',
        },
        {
          'image': Assets.lib.assets.images.grab.path,
          'title': 'Voucher Digital Grab Transport Rp. 20.000',
          'onTap': () {},
          'price': 'Rp 20.000',
          'discountPrice': '',
          'discount': '',
        },
        {
          'image': Assets.lib.assets.images.haagenDazs.path,
          'title': 'Voucher Digital Haagen Dazs Rp. 100.000',
          'onTap': () {},
          'price': 'Rp 100.000',
          'discountPrice': 'Rp 75.000',
          'discount': '25% OFF',
        },
        {
          'image': Assets.lib.assets.images.keds.path,
          'title': 'Voucher Digital Keds Rp. 50.000',
          'onTap': () {},
          'price': 'Rp 50.000',
          'discountPrice': 'Rp 49.000',
          'discount': '2% OFF',
        },
        {
          'image': Assets.lib.assets.images.alfamart.path,
          'title': 'Voucher Digital Alfamart Rp. 25.000',
          'onTap': () {},
          'price': 'Rp 25.000',
          'discountPrice': '',
          'discount': '',
        },
      ];

      emit(ProductFetched(
          products: products,
          categories: categories,
          wellnessList: wellnessList));
    } catch (e) {
      emit(HomeError(e.toString()));
    }
  }
}
