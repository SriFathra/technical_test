import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:technical_test/common_libs.dart';
import 'package:technical_test/widgets.dart/source_image_button.dart';

class InformasiPribadiPage extends StatefulWidget {
  const InformasiPribadiPage({super.key});

  @override
  State<InformasiPribadiPage> createState() => _InformasiPribadiPageState();
}

class _InformasiPribadiPageState extends State<InformasiPribadiPage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  void _onPageChanged(int page) {
    setState(() {
      _currentPage = page;
    });
  }

  void _onButtonPressed(int page) {
    _pageController.animateToPage(page,
        duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          'Informasi Pribadi',
          style: TextStyle(
              fontSize: 14.sp,
              color: ColorName.black,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Row(
                children: List.generate(3, (index) {
                  String label;
                  switch (index) {
                    case 0:
                      label = "Biodata Diri";
                      break;
                    case 1:
                      label = "Alamat Pribadi";
                      break;
                    case 2:
                      label = "Informasi Perusahaan";
                      break;
                    default:
                      label = "";
                  }
                  return GestureDetector(
                    onTap: () => _onButtonPressed(index),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: _currentPage == index ||
                                        _currentPage > index
                                    ? ColorName.primaryColor
                                    : Colors.yellow[100],
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                '${index + 1}',
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                            ),
                            if (index < 2)
                              Container(
                                width: 45,
                                height: 5,
                                color: _currentPage == index ||
                                        _currentPage > index
                                    ? ColorName.primaryColor
                                    : Colors.yellow[100],
                              ),
                            if (index < 2)
                              Container(
                                width: 45,
                                height: 5,
                                color: _currentPage > index
                                    ? ColorName.primaryColor
                                    : Colors.yellow[100],
                              ),
                          ],
                        ),
                        SizedBox(
                          width: 50,
                          height: 80,
                          child: Text(
                            label,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 12.sp, color: ColorName.primaryColor),
                          ),
                        )
                      ],
                    ),
                  );
                }),
              ),
            ),
            Expanded(
              child: PageView(
                controller: _pageController,
                onPageChanged: _onPageChanged,
                children: const [
                  BiodataForm(),
                  AlamatForm(),
                  PerusahaanForm(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BiodataForm extends StatelessWidget {
  const BiodataForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: '* ',
                  style: TextStyle(color: Colors.red, fontSize: 10.sp),
                ),
                TextSpan(
                  text: 'NAMA LENGKAP',
                  style: TextStyle(color: Colors.black, fontSize: 10.sp),
                ),
              ],
            ),
          ),
          SizedBox(height: 10.h),
          const TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: ColorName.lightGrey),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: ColorName.secondaryColor),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AlamatForm extends StatefulWidget {
  const AlamatForm({super.key});

  @override
  State<AlamatForm> createState() => _AlamatFormState();
}

class _AlamatFormState extends State<AlamatForm> {
  final ImagePicker picker = ImagePicker();
  String pathKTP = '';

  Future<void> _requestPermission() async {
    await [
      Permission.camera,
      Permission.photos,
    ].request();
  }

  Future<void> _checkPermissions() async {
    var cameraStatus = await Permission.camera.status;
    var photoStatus = await Permission.photos.status;
    if (!cameraStatus.isGranted || !photoStatus.isGranted) {
      await _requestPermission();
    }
  }

  void showImageSourceDialog(BuildContext context) {
    final theme = Theme.of(context);

    _checkPermissions().then((_) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            title: Text(
              'Pilih Sumber',
              textAlign: TextAlign.center,
              style: theme.textTheme.labelMedium?.copyWith(
                color: ColorName.primaryColor,
                fontSize: 16.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SourceImageButton(
                  prefixIcon: CupertinoIcons.camera,
                  title: 'Ambil Foto',
                  isEnabled: true,
                  onPressed: () async {
                    final pickedFile =
                        await picker.pickImage(source: ImageSource.camera);
                    if (pickedFile != null) {
                      setState(() {
                        pathKTP = pickedFile.path;
                      });
                    }
                    Navigator.of(context).pop();
                  },
                ),
                SizedBox(height: 12.h),
                SourceImageButton(
                  prefixIcon: CupertinoIcons.photo,
                  title: 'Pilih dari Galeri',
                  isEnabled: true,
                  onPressed: () async {
                    final pickedFile =
                        await picker.pickImage(source: ImageSource.gallery);
                    if (pickedFile != null) {
                      setState(() {
                        pathKTP = pickedFile.path;
                      });
                    }
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          );
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                showImageSourceDialog(context);
              },
              child: SizedBox(
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.yellow[200],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Icon(
                        Icons.quick_contacts_mail_rounded,
                        color: ColorName.primaryColor,
                      ),
                    ),
                    SizedBox(width: 10.w),
                    Expanded(
                      child: Text(
                        pathKTP == '' ? 'Upload KTP' : pathKTP,
                        style: TextStyle(color: Colors.black, fontSize: 14.sp),
                      ),
                    ),
                    SizedBox(width: 10.w),
                    if (pathKTP != '')
                      const Icon(
                        Icons.check_circle,
                        color: Colors.green,
                      )
                  ],
                ),
              ),
            ),
            SizedBox(height: 20.h),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: '* ',
                    style: TextStyle(color: Colors.red, fontSize: 12.sp),
                  ),
                  TextSpan(
                    text: 'NIK',
                    style: TextStyle(color: Colors.black, fontSize: 12.sp),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10.h),
            const TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PerusahaanForm extends StatelessWidget {
  const PerusahaanForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'NAMA USAHA / PERUSAHAAN',
            style: TextStyle(color: Colors.black, fontSize: 10.sp),
          ),
          SizedBox(height: 10.h),
          const TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: ColorName.lightGrey),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: ColorName.secondaryColor),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
