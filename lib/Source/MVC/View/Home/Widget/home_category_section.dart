import 'package:flutter/material.dart';

import '../../Product/product_page.dart';

class HomeCategorySection extends StatelessWidget {
  const HomeCategorySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _sectionTitle(context),
        Padding(
          padding: const EdgeInsets.all(12),
          child: GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            physics: const NeverScrollableScrollPhysics(),
            childAspectRatio: 2.3,
            children: const [
              _CategoryItem(title: "Giấy vệ sinh", image: "assets/pub/cate1.png"),
              _CategoryItem(title: "Khăn giấy rút", image: "assets/pub/cate2.png"),
              _CategoryItem(title: "Gói bỏ túi", image: "assets/pub/cate3.png"),
              _CategoryItem(title: "Hộp để bàn", image: "assets/pub/cate4.png"),
            ],
          ),
        )
      ],
    );
  }

  Widget _sectionTitle(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Row(
        children:  [
          Image.asset("assets/voucher/bt7.png"),
          SizedBox(width: 4),
          Text("Danh mục", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
          Spacer(),
          GestureDetector(
            onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductPage())),
              child: Text("Xem thêm", style: TextStyle(color: Colors.green))),
        ],
      ),
    );
  }
}

class _CategoryItem extends StatelessWidget {
  final String title;
  final String image;

  const _CategoryItem({required this.title, required this.image});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: Image.asset(image)),
        const SizedBox(height: 4),
        Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
      ],
    );
  }
}
