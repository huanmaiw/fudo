import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final List<Tab> _tabs = const [Tab(text: "Cập nhật"), Tab(text: "Đơn hàng")];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabs.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Image.asset(
                    "assets/icon/back.png",
                    width: 40,
                    height: 40,
                  ),
                ),
                const Text(
                  "Thông báo",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                const Icon(Icons.more_horiz, color: Colors.black),
                const SizedBox(width: 12),
                const Icon(Icons.close, color: Colors.black),
              ],
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          // Tabs
          TabBar(
            controller: _tabController,
            tabs: _tabs,
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey,
            indicatorColor: Colors.black,
            indicatorWeight: 2,
            labelStyle: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),

          // Nội dung của từng tab
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                // Tab 1: Cập nhật
                ListView(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 16,
                  ),
                  children: [
                    GestureDetector(
                      onTap:
                          () => Get.bottomSheet(
                            Container(
                              padding: const EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(25),
                                ),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children:  [
                                  Image.asset("assets/pub/nitiii.png"),
                                  SizedBox(height: 10),
                                  Text(
                                    "Chương trình KM dành riêng cho khách hàng mua lần đầu sắp kết thúc",
                                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    "Nhận ngay 100k khi bạn mua hàng lần đầu tại Fudo và giới thiệu tới người quen cùng sử dụng",
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    "Gỗ mất rất nhiều thời gian để tái tạo, trong khi cây tre chỉ cần khoảng 2-3 năm. Sử dụng khăn giấy khô làm từ rừng tre đạt chuẩn FSC giúp bảo vệ môi trường bền vững hơn.",
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  SizedBox(height: 10),
                                  Image.asset("assets/icon/iconnot.png"),
                                  SizedBox(height: 10),
                                  Text("Đóng", style: TextStyle(fontSize: 16, color: Colors.grey, fontWeight: FontWeight.bold),),
                                ],
                              ),
                            ),
                            isDismissible: true,
                            enableDrag: true,
                          ),

                      child: NotificationItem(
                        iconPath: 'assets/pub/uudai.png',
                        title: 'Tết Đông Đầy 2024',
                        date: '20.10.2023',
                        content:
                            'Nhận ngay 100k khi bạn mua hàng lần đầu tại Fudo và giới thiệu tới người quen cùng sử dụng',
                      ),
                    ),
                    SizedBox(height: 16),
                    NotificationItem(
                      iconPath: 'assets/pub/uudai.png',
                      title:
                          'Chương trình KM dành riêng cho khách hàng mua lần đầu sắp kết thúc',
                      date: '20.10.2023',
                      content:
                          'Nhận ngay 100k khi bạn mua hàng lần đầu tại Fudo và giới thiệu tới người quen cùng sử dụng',
                    ),
                  ],
                ),

                // Tab 2: Đơn hàng
                ListView(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 16,
                  ),
                  children: [
                    Image.asset("assets/icon/noti.png"),
                    // NotificationItem(
                    //   iconPath: 'assets/pub/uudai.png',
                    //   title: 'Đơn hàng #1234 đã được giao thành công',
                    //   date: '15.10.2023',
                    //   content: 'Cảm ơn bạn đã mua hàng. Đơn hàng đã được giao tới bạn lúc 10:00 sáng.',
                    // ),
                    // SizedBox(height: 16),
                    // NotificationItem(
                    //   iconPath: 'assets/pub/uudai.png',
                    //   title: 'Đơn hàng #1233 đang được giao',
                    //   date: '14.10.2023',
                    //   content: 'Đơn hàng của bạn đang trên đường giao. Dự kiến giao trước 18:00 hôm nay.',
                    // ),
                  ],
                ),
              ],
            ),
          ),

          // Nút về trang chủ
          Padding(
            padding: const EdgeInsets.all(16),
            child: SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  "Về Trang chủ",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class NotificationItem extends StatelessWidget {
  final String iconPath;
  final String title;
  final String date;
  final String content;

  const NotificationItem({
    super.key,
    required this.iconPath,
    required this.title,
    required this.date,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(iconPath, height: 32, width: 32),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  date,
                  style: TextStyle(fontSize: 13, color: Colors.grey.shade600),
                ),
                const SizedBox(height: 4),
                Text(
                  content,
                  style: TextStyle(fontSize: 14, color: Colors.grey.shade800),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
