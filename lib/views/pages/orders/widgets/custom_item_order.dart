import 'package:flutter/material.dart';
import 'package:warehouse/constants/my_colors.dart';

class CustomItemOrder extends StatelessWidget {
  const CustomItemOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 4, left: 4, bottom: 10),
      child: DecoratedBox(
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(blurRadius: 11, color: Colors.black.withOpacity(0.04)),
            ],
            borderRadius: BorderRadius.circular(11)),
        child: ExpansionTile(
          childrenPadding: const EdgeInsets.symmetric(horizontal: 16),
          tilePadding: const EdgeInsets.symmetric(horizontal: 16),
          title: Row(
            children: [
               Text(
                'ID: a5f45',
                style: _textStyle1,
              ),
              const Spacer(),
              DecoratedBox(
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(7)),
                    color: mainColor.withOpacity(.2)),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  child: Text(
                    'Waiting',
                    style: TextStyle(color: Colors.black, fontSize: 14),
                  ),
                ),
              ),
            ],
          ),
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text('Product:', style: _textStyle1),
                     SizedBox(
                      width: 130,
                      child: Text(
                        ' Test Name',
                        style: _textStyle1.copyWith(fontWeight: FontWeight.w500),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const Spacer(),
                    Text('Id:', style: _textStyle1),
                     Text(
                      ' 12322',
                      style: _textStyle1.copyWith(fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  children: [
                    Text('Robot: ', style: _textStyle1),
                     Text(
                      '2',
                      style: _textStyle1.copyWith(fontWeight: FontWeight.w500)
                    ),
                    const Spacer(),
                    Text('Type: ', style: _textStyle1),
                     Text(
                      'put',
                      style: _textStyle1.copyWith(fontWeight: FontWeight.w500)
                    ),
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Time: ', style: _textStyle1),
                     Text(
                      '12/5/2022',
                      style: _textStyle1.copyWith(fontWeight: FontWeight.w500)
                    ),
                    const Spacer(),
                    Text('Cell: ', style: _textStyle1),
                     Text(
                      '12',
                      style: _textStyle1.copyWith(fontWeight: FontWeight.w500)
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

TextStyle _textStyle1 = const TextStyle(
    color: mainColor, fontSize: 16, fontWeight: FontWeight.bold);
