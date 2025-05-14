import 'package:flutter/material.dart';
import 'package:tryhard/Source/MVC/View/Home/bottomnavbar.dart';

class Voucher extends StatelessWidget {
  const Voucher({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Row(
          children: [
            GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Image.asset("assets/icon/back.png", width: 40, height: 40)),
            const Text("Voucher",
                style: TextStyle(color: Colors.black, fontSize: 30,
                    fontWeight: FontWeight.bold)),
          ],
        ),
        centerTitle: false,
        actions: const [
          Icon(Icons.more_horiz, color: Colors.black),
          SizedBox(width: 12),
          Icon(Icons.close, color: Colors.black),
          SizedBox(width: 12),
        ],
      ),
      body: Column(
        children: [
          Image.asset("assets/voucher/vc3.png"),
          Spacer(),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
              onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
          }, child: Text("Về Trang Chủ")),
          const SizedBox(height: 20),

        ],
      ),
    );
  }
}
