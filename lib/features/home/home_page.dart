import 'package:flutter/cupertino.dart';
import 'package:technical_test/bloc/home/home_bloc.dart';
import 'package:technical_test/bloc/home/home_event.dart';
import 'package:technical_test/bloc/home/home_state.dart';
import 'package:technical_test/common_libs.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:technical_test/features/home/categories_page.dart';
import 'package:technical_test/features/profile/profile_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isPribadiSelected = true;
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: ColorName.primaryColor,
      appBar: AppBar(
        backgroundColor: ColorName.primaryColor,
        title: const GreetingText(),
        actions: [
          IconButton(
            icon: const Icon(
              CupertinoIcons.bell,
              color: ColorName.white,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(
              CupertinoIcons.profile_circled,
              color: ColorName.disabledColor,
              size: 40,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ProfilePage(),
                ),
              );
            },
          ),
        ],
      ),
      body: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => HomeBloc()..add(FetchProduct())),
        ],
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                    color: ColorName.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(34.r),
                        topRight: Radius.circular(34.r))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 16.h,
                    ),
                    Container(
                      height: 40.h,
                      decoration: BoxDecoration(
                          color: ColorName.lightGrey,
                          borderRadius: BorderRadius.circular(64.r)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                isPribadiSelected = true;
                              });
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20.w, vertical: 4.h),
                              decoration: BoxDecoration(
                                color: isPribadiSelected
                                    ? ColorName.primaryColor
                                    : ColorName.lightGrey,
                                borderRadius: BorderRadius.circular(48.r),
                              ),
                              child: Text(
                                'Payuung Pribadi',
                                style: theme.textTheme.labelMedium?.copyWith(
                                  color: isPribadiSelected
                                      ? ColorName.white
                                      : ColorName.secondaryColor,
                                  fontSize: 12.sp,
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                isPribadiSelected = false;
                              });
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20.w, vertical: 4.h),
                              decoration: BoxDecoration(
                                color: !isPribadiSelected
                                    ? ColorName.primaryColor
                                    : ColorName.lightGrey,
                                borderRadius: BorderRadius.circular(48.r),
                              ),
                              child: Text(
                                'Payuung Karyawan',
                                style: theme.textTheme.labelMedium?.copyWith(
                                  color: !isPribadiSelected
                                      ? ColorName.white
                                      : const Color.fromARGB(
                                          255, 202, 198, 198),
                                  fontSize: 12.sp,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    isPribadiSelected
                        ? const PersonalHomePage()
                        : const EmployeeHomePage(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 6.0,
        child: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Beranda',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Cari',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: 'Keranjang',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.yellow[700],
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}

class GreetingText extends StatelessWidget {
  const GreetingText({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      getGreeting(),
      style: TextStyle(fontSize: 14.sp, color: ColorName.white),
    );
  }

  String getGreeting() {
    final hour = DateTime.now().hour;

    if (hour < 12) {
      return 'Selamat Pagi';
    } else if (hour < 18) {
      return 'Selamat Siang';
    } else {
      return 'Selamat Malam';
    }
  }
}

class PersonalHomePage extends StatefulWidget {
  const PersonalHomePage({super.key});

  @override
  State<PersonalHomePage> createState() => _PersonalHomePageState();
}

class _PersonalHomePageState extends State<PersonalHomePage> {
  int wishlist = 0;
  bool isDropdownOpened = false;

  String selectedFilter = "Terpopuler";

  final List<String> filters = [
    'Terpopuler',
    'A to Z',
    'Z to A',
    'Harga Terendah',
    'Harga Tertinggi'
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Kategori produk keuangan
        Text(
          'Produk Keuangan',
          style: theme.textTheme.labelMedium?.copyWith(
            fontWeight: FontWeight.bold,
            fontSize: 18.sp,
            color: ColorName.black,
          ),
        ),
        const SizedBox(height: 10),
        BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
          if (state is Homeloading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is HomeError) {
            return Center(child: Text(state.error));
          }

          if (state is ProductFetched) {
            // Menampilkan daftar produk
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 4,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  children: List.generate(state.products.length, (index) {
                    final product = state.products[index];
                    return _buildProductCard(
                      product['title'],
                      product['icon'],
                      product['color'],
                      product['onTap'],
                    );
                  }),
                ),

                const SizedBox(height: 20),

                // Kategori pilihan
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Kategori Pilihan',
                      style: theme.textTheme.labelMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.sp,
                        color: ColorName.black,
                      ),
                    ),
                    Container(
                      width: 90.w,
                      padding: const EdgeInsets.all(6.0),
                      decoration: BoxDecoration(
                        color: ColorName.lightGrey,
                        borderRadius: BorderRadius.circular(34.r),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Wishlist',
                            style: TextStyle(color: ColorName.secondaryColor),
                          ),
                          Container(
                            width: 20.0,
                            height: 20.0,
                            decoration: const BoxDecoration(
                              color: ColorName.primaryColor,
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                                child: Text(
                              '$wishlist',
                              style: const TextStyle(color: ColorName.white),
                            )),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 10),
                Builder(
                  builder: (context) {
                    List<Map<String, dynamic>> displayedCategories =
                        state.categories.length > 7
                            ? state.categories.sublist(0, 7)
                            : state.categories;

                    if (state.categories.length > 7) {
                      displayedCategories.add({
                        'title': 'Lihat Semua',
                        'icon': CupertinoIcons.square_grid_2x2,
                        'color': Colors.black,
                        'onTap': () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  CategoriesPage(categories: state.categories),
                            ),
                          );
                        },
                      } as Map<String, dynamic>);
                    }

                    return GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        childAspectRatio: 1.0,
                      ),
                      itemCount: displayedCategories.length,
                      itemBuilder: (context, index) {
                        final category = displayedCategories[index];
                        return _buildProductCard(
                          category['title'],
                          category['icon'],
                          category['color'],
                          category['onTap'],
                        );
                      },
                    );
                  },
                ),

                const SizedBox(height: 20),

                // Explore Wellness
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Explore Wellness',
                      style: theme.textTheme.labelMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.sp,
                        color: ColorName.black,
                      ),
                    ),
                    DropdownButton<String>(
                      value: selectedFilter,
                      icon: const Icon(Icons.arrow_drop_down),
                      style: const TextStyle(color: Colors.black),
                      underline: Container(
                        height: 1,
                        color: Colors.grey,
                      ),
                      onTap: () {
                        setState(() {
                          if (isDropdownOpened) {
                            isDropdownOpened = false;
                          } else {
                            isDropdownOpened = true;
                          }
                        });
                      },
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedFilter = newValue!;
                        });
                      },
                      items:
                          filters.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Row(
                            children: [
                              Text(value),
                              if (selectedFilter == value && isDropdownOpened)
                                const Icon(
                                  Icons.circle,
                                  color: Colors.orange,
                                  size: 10,
                                ),
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 80,
                    crossAxisSpacing: 40,
                  ),
                  itemCount: state.wellnessList.length,
                  itemBuilder: (context, index) {
                    final wellnessList = state.wellnessList[index];
                    return _buildWellnessCard(
                      wellnessList['title'],
                      wellnessList['image'],
                      wellnessList['onTap'],
                      wellnessList['price'],
                      wellnessList['discountPrice'],
                      wellnessList['discount'],
                    );
                  },
                ),
              ],
            );
          }

          return const Center(child: Text('No products available.'));
        }),
      ],
    );
  }
}

Widget _buildProductCard(
    String title, IconData icon, Color colorIcon, Function()? onTap) {
  return GestureDetector(
    onTap: onTap ?? () {},
    child: SizedBox(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(
            icon,
            size: 32.r,
            color: colorIcon,
          ),
          const SizedBox(height: 5),
          Text(title,
              style: TextStyle(fontSize: 12.sp), textAlign: TextAlign.center),
        ],
      ),
    ),
  );
}

Widget _buildWellnessCard(String title, String imagePath, Function()? onTap,
    String price, String discountPrice, String discount) {
  return GestureDetector(
    onTap: onTap ?? () {},
    child: SizedBox(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              height: 50.h,
              color: ColorName.white,
              child: Image.asset(imagePath, fit: BoxFit.fitWidth),
            ),
          ),
          SizedBox(height: 20.h),
          Text(title,
              style: TextStyle(fontSize: 12.sp), textAlign: TextAlign.left),
          SizedBox(height: 10.h),
          Flexible(
            child: Row(
              children: [
                Text(price,
                    style: TextStyle(
                      fontSize: 12.sp,
                      decoration: (discountPrice != '')
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                    ),
                    textAlign: TextAlign.left),
                if (discount != '')
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(discount,
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: Colors.red,
                        ),
                        textAlign: TextAlign.left),
                  ),
              ],
            ),
          ),
          if (discountPrice != '')
            Flexible(
              child: Text(discountPrice,
                  style: TextStyle(
                    fontSize: 12.sp,
                  ),
                  textAlign: TextAlign.left),
            ),
        ],
      ),
    ),
  );
}

class EmployeeHomePage extends StatelessWidget {
  const EmployeeHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.7,
      child: const Center(
        child: Text('Payuung Karyawan Page'),
      ),
    );
  }
}
