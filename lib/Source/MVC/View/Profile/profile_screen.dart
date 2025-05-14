import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tryhard/Source/MVC/View/Home/bottomnavbar.dart';
import 'address_book.dart';
import 'edit_info.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          children: [
            GestureDetector(
                onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context) =>  HomePage())),
                child: Image.asset("assets/icon/back.png", width: 40, height: 40)),
            const Text(
              'Cá nhân',
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
            ),
          ],
        ),
        centerTitle: false,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: Icon(Icons.more_horiz, color: Colors.black),
          ),
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: Icon(Icons.close, color: Colors.black),
          ),
        ],
      ),
      body: ListView(
        children: [
          // User Profile Section
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: const AssetImage('assets/pub/avt.png'),
                  backgroundColor: Colors.grey.shade200,
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Xuân Thiên',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Zalo ID: 53454363****',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey.shade600,fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Divider(),
          // Options List
          ListTile(
            leading: Image.asset("assets/icon/bt6.png"),
            title: const Text('Thông tin tài khoản'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>AccountInfoScreen()));
            },
          ),
          ListTile(
            leading:Image.asset("assets/icon/bt7.png"),
            title: const Text('Số địa chỉ'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>AddressBookScreen()));
            },
          ),
          ListTile(
            leading: Image.asset("assets/icon/bt8.png"),
            title: const Text('Affiliate | Tiếp thị liên kết'),
            onTap: () {
              Get.snackbar(
                'Thông báo',
                'Chức năng đang được phát triển!',
                snackPosition: SnackPosition.TOP,
                backgroundColor: Colors.red,
                colorText: Colors.white,
              );
            },
          ),
          const Divider(),
          ListTile(
            leading: Image.asset("assets/icon/bt9.png"),
            title: const Text('Điều Khoản và dịch vụ'),
            onTap: () {},
          ),
          ListTile(
            leading: Image.asset("assets/voucher/bt7.png"),
            title: const Text('Ghim Ứng dụng ngoại màn hình'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}