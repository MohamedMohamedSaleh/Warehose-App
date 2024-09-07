import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'shimmer_widget.dart';

class ShimmerLoadingProduct extends StatelessWidget {
  const ShimmerLoadingProduct({super.key, this.isMain = true});
  final bool isMain;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: 150 / 260,
        crossAxisCount: 2,
        mainAxisSpacing: 0,
        crossAxisSpacing: 16,
      ),
      itemCount: 10,
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      itemBuilder: (context, index) {
        return _productShimmerWidget(isMain: isMain);
      },
    );
  }

  Widget _productShimmerWidget({required bool isMain}) => Padding(
        padding: const EdgeInsets.only(bottom: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ShimmerWidget.rectangular(
              height: 100,
              shapeBorder: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(13),
                ),
              ),
            ),
            const SizedBox(
              height: 6,
            ),
            const ShimmerWidget.rectangular(
              height: 18,
              width: 100,
              shapeBorder: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(4),
                ),
              ),
            ),
            const SizedBox(
              height: 6,
            ),
            const ShimmerWidget.rectangular(
              height: 10,
              width: double.infinity,
              shapeBorder: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(4),
                ),
              ),
            ),
            const SizedBox(
              height: 3,
            ),
            const ShimmerWidget.rectangular(
              height: 10,
              width: double.infinity,
              shapeBorder: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(4),
                ),
              ),
            ),
            const SizedBox(
              height: 6,
            ),
            const ShimmerWidget.rectangular(
              height: 16,
              width: 70,
              shapeBorder: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(4),
                ),
              ),
            ),
            const SizedBox(
              height: 6,
            ),
            isMain
                ? const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: ShimmerWidget.rectangular(
                      height: 26,
                      shapeBorder: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(7)),
                      ),
                    ),
                  )
                : const SizedBox(),
          ],
        ),
      );
}
