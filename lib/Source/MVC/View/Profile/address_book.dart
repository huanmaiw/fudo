import 'package:flutter/material.dart';

import 'add_address.dart';

class AddressBookScreen extends StatelessWidget {
  const AddressBookScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Image.asset("assets/icon/back.png", width: 40, height: 40),
            ),
            const Text(
              "Sổ địa chỉ",
              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        backgroundColor: Colors.white,
        actions: const [
          Icon(Icons.more_horiz, color: Colors.black),
          SizedBox(width: 12),
          Icon(Icons.close, color: Colors.black),
        ],
        elevation: 0,
      ),
      body: Column(
        children: [
          const AddressItem(
            address: "2A1 Giải phóng, phường 4, quận Tân Bình",
            name: "Xuân Thiện",
            phone: "0838032132",
            isDefault: true,
          ),
          const AddressItem(
            address: "49 Lê Trung Nghĩa, phường 4, quận Tân Bình",
            name: "Xuân Thiện",
            phone: "0838032132",
            isDefault: false,
          ),
          //const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: GestureDetector(
              onTap: () {
                // xử lý thêm địa chỉ mới
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "Thêm địa chỉ mới",
                    style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 10,),
                  IconButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>AddNewAddressScreen()));
                  }, icon: Icon(Icons.add, color: Colors.green,))
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icon/bt1.png',
              width: 24,
              height: 24,
            ),
            label: 'Cửa hàng',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icon/bt2.png',
              width: 24,
              height: 24,
            ),
            label: 'Sản phẩm',
          ),
          BottomNavigationBarItem(
            icon: Stack(
              clipBehavior: Clip.none,
              children: [
                Image.asset(
                  'assets/icon/bt3.png',
                  width: 24,
                  height: 24,
                ),
                Positioned(
                  right: -6,
                  top: -6,
                  child: Container(
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    constraints: const BoxConstraints(
                      minWidth: 16,
                      minHeight: 16,
                    ),
                  ),
                ),
              ],
            ),
            label: 'Giỏ hàng',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icon/bt4.png',
              width: 24,
              height: 24,
            ),
            label: 'Đơn hàng',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icon/bt5.png',
              width: 24,
              height: 24,
            ),
            label: 'Cá nhân',
          ),
        ],
      ),
    );
  }
}

class AddressItem extends StatelessWidget {
  final String address;
  final String name;
  final String phone;
  final bool isDefault;

  const AddressItem({
    super.key,
    required this.address,
    required this.name,
    required this.phone,
    required this.isDefault,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.black12)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Radio icon
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Icon(
              isDefault ? Icons.radio_button_checked : Icons.radio_button_off,
              color: isDefault ? Colors.black : Colors.grey,
            ),
          ),
          const SizedBox(width: 12),
          // Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(address,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: isDefault ? Colors.black : Colors.grey[800],
                    )),
                const SizedBox(height: 4),
                Text("$name - $phone",
                    style: const TextStyle(color: Colors.black54, fontSize: 13)),
                if (isDefault)
                  Container(
                    margin: const EdgeInsets.only(top: 6),
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: const Text(
                      "Mặc định",
                      style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                    ),
                  )
              ],
            ),
          ),
          // Chỉnh sửa
          GestureDetector(
            onTap: () {
              // xử lý chỉnh sửa
            },
            child: const Text(
              "Chỉnh sửa",
              style: TextStyle(
                  color: Colors.green, fontWeight: FontWeight.bold, fontSize: 14),
            ),
          )
        ],
      ),
    );
  }
}
