import 'package:flutter/material.dart';

class HomeVoucherSlider extends StatelessWidget {
  const HomeVoucherSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _sectionTitle('Voucher'),
        SizedBox(
          height: 100,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 3,
            padding: const EdgeInsets.only(left: 12),
            itemBuilder: (context, index) => _VoucherCard(),
          ),
        ),
      ],
    );
  }

  Widget _sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Row(
        children: [
          // const Icon(Icons.confirmation_num_outlined, size: 18),
          Image.asset("assets/voucher/bt6.png", width: 30, height: 40),
          const SizedBox(width: 4),
          Text(title, style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
          const Spacer(),
          Text('Xem thêm', style: TextStyle(color: Colors.green.shade700)),
        ],
      ),
    );
  }

  Widget _VoucherCard() {
    return Row(
      children: [
        Image.asset("assets/voucher/vc1.png"),
        const SizedBox(width: 8),
        Image.asset("assets/voucher/vc2.png")
      ],
    );
    // return Container(
    //   width: 250,
    //   margin: const EdgeInsets.only(right: 12),
    //   padding: const EdgeInsets.all(8),
    //   decoration: BoxDecoration(
    //     border: Border.all(color: Colors.orange),
    //     borderRadius: BorderRadius.circular(12),
    //   ),
    //   child: Row(
    //     children: [
    //       // Stack(
    //       //   children: [
    //       //     ClipRRect(
    //       //       borderRadius: BorderRadius.circular(8),
    //       //       child: Image.asset(
    //       //         "assets/pub/vor.png", // Replace with your asset
    //       //         width: 60,
    //       //         height: 60,
    //       //       ),
    //       //     ),
    //       //     Positioned(
    //       //       top: 0,
    //       //       left: 0,
    //       //       child: Container(
    //       //         color: Colors.orange,
    //       //         padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
    //       //         child: const Text('10%', style: TextStyle(fontSize: 10, color: Colors.white)),
    //       //       ),
    //       //     ),
    //       //   ],
    //       // ),
    //       // const SizedBox(width: 8),
    //       // Expanded(
    //       //   child: Column(
    //       //     crossAxisAlignment: CrossAxisAlignment.start,
    //       //     children: [
    //       //       const Text("Giảm 10% tối đa 20k",
    //       //           style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
    //       //       const Text("Đơn đầu tiên từ 0đ", style: TextStyle(fontSize: 12)),
    //       //       const SizedBox(height: 4),
    //       //       Row(
    //       //         children: [
    //       //           Container(
    //       //             padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
    //       //             decoration: BoxDecoration(
    //       //               color: Colors.grey.shade200,
    //       //               borderRadius: BorderRadius.circular(6),
    //       //             ),
    //       //             child: const Text("Lấy mã", style: TextStyle(fontSize: 12)),
    //       //           ),
    //       //           const SizedBox(width: 6),
    //       //           const Text("Sắp hết", style: TextStyle(color: Colors.red, fontSize: 11)),
    //       //         ],
    //       //       )
    //       //     ],
    //       //   ),
    //       // )
    //     ],
    //   ),
    // );
  }
}
