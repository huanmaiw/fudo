import 'package:flutter/material.dart';

class AddNewAddressScreen extends StatelessWidget {
  const AddNewAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        titleSpacing: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          children: [
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Image.asset("assets/icon/back.png", width: 40, height: 40),
            ),
            const Text(
              'Thêm địa chỉ mới',
              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            const Spacer(),
            const Icon(Icons.more_horiz, color: Colors.black),
            const SizedBox(width: 12),
            const Icon(Icons.close, color: Colors.black),
            const SizedBox(width: 8),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView(
          children: [
            const SizedBox(height: 16),

            // Người nhận
            const CustomInputField(
              hintText: 'Người nhận',
              icon: Icons.person_outline,
            ),
            const SizedBox(height: 12),

            // Điện thoại
            const CustomInputField(
              hintText: 'Điện thoại',
              icon: Icons.phone_outlined,
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(height: 12),

            // Địa chỉ chi tiết
            const CustomInputField(
              hintText: 'Địa chỉ chi tiết, số nhà, tên đường,',
              icon: Icons.location_on_outlined,
            ),
            const SizedBox(height: 12),

            // Quận & Phường
            Row(
              children: [
                Expanded(
                  child: DropdownButtonFormField<String>(
                    decoration: inputDecoration("Quận/ huyện"),
                    items: ["Tân Bình", "Tân Phú", "Quận 1"]
                        .map((value) => DropdownMenuItem(
                      value: value,
                      child: Text(value),
                    ))
                        .toList(),
                    onChanged: (value) {},
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: DropdownButtonFormField<String>(
                    decoration: inputDecoration("Phường"),
                    items: ["Phường 4", "Phường 5", "Phường 7"]
                        .map((value) => DropdownMenuItem(
                      value: value,
                      child: Text(value),
                    ))
                        .toList(),
                    onChanged: (value) {},
                  ),
                ),
              ],
            ),

            const SizedBox(height: 24),

            // Xác nhận
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'XÁC NHẬN',
                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
            ),

            const SizedBox(height: 12),

            // Hủy
            SizedBox(
              width: double.infinity,
              height: 50,
              child: OutlinedButton(
                onPressed: () => Navigator.pop(context),
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Colors.black26),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'HỦY',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
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

  InputDecoration inputDecoration(String label) {
    return InputDecoration(
      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      hintText: label,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
    );
  }
}

class CustomInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final TextInputType? keyboardType;

  const CustomInputField({
    super.key,
    required this.hintText,
    required this.icon,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: keyboardType ?? TextInputType.text,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: Icon(icon),
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }
}
