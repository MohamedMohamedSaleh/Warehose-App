import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'shimmer_widget.dart';

class ShimmerLoadingProduct extends StatelessWidget {
  const ShimmerLoadingProduct({super.key, this.isMain = true});
  final bool isMain;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: 150.w / 250.h,
        crossAxisCount: 2,
        mainAxisSpacing: 0,
        crossAxisSpacing: 16,
      ),
      itemCount: 10,
      padding: EdgeInsets.symmetric(
        horizontal: 16.w,
      ),
      itemBuilder: (context, index) {
        return _productShimmerWidget(isMain: isMain);
      },
    );
  }

  Widget _productShimmerWidget({required bool isMain}) => Padding(
        padding: EdgeInsets.only(bottom: 16.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ShimmerWidget.rectangular(
              height: 100.h,
              shapeBorder: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  const Radius.circular(13).w,
                ),
              ),
            ),
            SizedBox(
              height: 6.h,
            ),
            ShimmerWidget.rectangular(
              height: 18.h,
              width: 100.w,
              shapeBorder: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  const Radius.circular(4).w,
                ),
              ),
            ),
            SizedBox(
              height: 6.h,
            ),
            ShimmerWidget.rectangular(
              height: 10.h,
              width: double.infinity,
              shapeBorder: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  const Radius.circular(4).w,
                ),
              ),
            ),
            SizedBox(
              height: 3.h,
            ),
            ShimmerWidget.rectangular(
              height: 10.h,
              width: double.infinity,
              shapeBorder: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  const Radius.circular(4).w,
                ),
              ),
            ),
            SizedBox(
              height: 6.h,
            ),
            ShimmerWidget.rectangular(
              height: 16.h,
              width: 70.w,
              shapeBorder: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  const Radius.circular(4).w,
                ),
              ),
            ),
            SizedBox(
              height: 6.h,
            ),
            isMain
                ? Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: ShimmerWidget.rectangular(
                      height: 26.h,
                      shapeBorder: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.all(const Radius.circular(7).w),
                      ),
                    ),
                  )
                : const SizedBox(),
          ],
        ),
      );
}
