import 'package:technical_test/features/profile/informasi_pribadi_page.dart';

import '../../common_libs.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: ColorName.white,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: ColorName.black,
            size: 18.r,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        title: Text(
          'Profile',
          style: TextStyle(
              fontSize: 14.sp,
              color: ColorName.black,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.grey[600],
                  child: const Text(
                    'S',
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  ),
                ),
                SizedBox(width: 20.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Sri Fathra',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 5.h),
                    Text(
                      'Masuk dengan Google',
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                  ],
                ),
              ],
            ),

            // List menu
            SizedBox(
              height: 30.h,
            ),
            Expanded(
              child: ListView(
                children: [
                  _buildProfileOption(Icons.person, "Informasi Pribadi", () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const InformasiPribadiPage(),
                      ),
                    );
                  }),
                  SizedBox(
                    height: 10.h,
                  ),
                  _buildProfileOption(
                      Icons.description, "Syarat & Ketentuan", () {}),
                  SizedBox(
                    height: 10.h,
                  ),
                  _buildProfileOption(Icons.help_outline, "Bantuan", () {}),
                  SizedBox(
                    height: 10.h,
                  ),
                  _buildProfileOption(Icons.lock, "Kebijakan Privasi", () {}),
                  SizedBox(
                    height: 10.h,
                  ),
                  _buildProfileOption(Icons.logout, "Log Out", () {}),
                  SizedBox(
                    height: 10.h,
                  ),
                  _buildProfileOption(
                      Icons.delete_outline, "Hapus Akun", () {}),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileOption(IconData icon, String title, Function()? onTap) {
    return Container(
      decoration: BoxDecoration(
        color: ColorName.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(icon, color: Colors.grey[600]),
        ),
        title: Text(title),
        onTap: onTap ?? () {},
      ),
    );
  }
}
