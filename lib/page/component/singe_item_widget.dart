import 'package:flutter/material.dart';
import 'package:polaroid_count/style/text_style.dart';

//单个首页list的item
class SingleItemWidget extends StatelessWidget {
  final double width; //宽度
  final String countPercent; //百分比
  final int countNum; //数量
  final String name; //名称
  final Color color; //颜色
  final Color textColor; //文字颜色

  const SingleItemWidget(
      {super.key,
      required this.width,
      required this.countPercent,
      required this.countNum,
      required this.name,
      required this.color,
      required this.textColor});

  @override
  Widget build(BuildContext context) => Container(
        width: width,
        margin: const EdgeInsets.symmetric(horizontal: 3, vertical: 6),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 6),
            Text(countNum.toString(), style: AppTextStyle.heading3),
            const SizedBox(height: 3),
            Text(countPercent),
            Expanded(child: Container()),
            Container(
              alignment: Alignment.center,
              width: double.infinity,
              height: 22,
              decoration: BoxDecoration(
                  color: color,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(12),
                    bottomRight: Radius.circular(12),
                  )),
              child: Text(name, style: TextStyle(color: textColor)),
            ),
          ],
        ),
      );
}
