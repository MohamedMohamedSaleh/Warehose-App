import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:warehouse/core/widgets/app_image.dart';
import 'package:warehouse/features/products/models/products_model.dart';

class ProductView extends StatelessWidget {
  const ProductView({
    super.key,
    required this.model,
  });

  final ProductModel model;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 300,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15),
                  ),
                  child: Hero(
                    tag: model.productid,
                    child: AppImage(
                      model.image,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    decorationBox(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Flexible(
                            flex: 100,
                            child: Text(
                              model.name,
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontSize: 16,
                                  overflow: TextOverflow.ellipsis,
                                  fontWeight: FontWeight.bold),
                              maxLines: 4,
                            ),
                          ),
                          const Spacer(),
                          DecoratedBox(
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black.withOpacity(.05),
                                      blurRadius: 5)
                                ],
                                borderRadius: BorderRadius.circular(3),
                                color: Colors.grey.withOpacity(.1)),
                            child: Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Text(
                                "#${model.productid}",
                                style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontSize: 14,
                                    overflow: TextOverflow.ellipsis,
                                    fontWeight: FontWeight.bold),
                                maxLines: 1,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    decorationBox(
                        child: Text(
                      model.description,
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Theme.of(context).primaryColor),
                    )),
                    const SizedBox(
                      height: 10,
                    ),
                    decorationBox(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          model.time != null
                              ? Description(
                                  title: "Addition Time:",
                                  descripe: model.time!,
                                )
                              : const SizedBox(),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Description(
                                title: "Weight:",
                                descripe: "${model.weight}kg",
                              ),
                              Description(
                                title: "Cell Id:",
                                descripe: model.cellid,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Description(
                                title: "Type:",
                                descripe: model.category,
                              ),
                              Description(
                                title: "Status:",
                                descripe: model.status,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Container(
            decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(11)),
            alignment: Alignment.center,
            width: double.infinity,
            height: 45,
            child: const Text(
              "Request Product",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}

class Description extends StatelessWidget {
  const Description({
    super.key,
    required this.title,
    required this.descripe,
  });
  final String title;
  final String descripe;

  @override
  Widget build(BuildContext context) {
    return Text.rich(TextSpan(children: [
      TextSpan(
        text: "$title  ",
        style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontSize: 14,
            overflow: TextOverflow.ellipsis,
            fontWeight: FontWeight.bold),
      ),
      TextSpan(
        text: descripe,
        style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontSize: 14,
            overflow: TextOverflow.ellipsis,
            fontWeight: FontWeight.w500),
      ),
    ])
        // child: Text(
        //   "Weight:  ${model.weight} kg",
        //   style: const TextStyle(
        //       color: Theme.of(context).primaryColor,
        //       fontSize: 14,
        //       overflow: TextOverflow.ellipsis,
        //       fontWeight: FontWeight.bold),
        // ),
        );
  }
}

Widget decorationBox({required Widget child}) {
  return DecoratedBox(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(9),
      color: Colors.white,
      boxShadow: [
        BoxShadow(color: Colors.black.withOpacity(.05), blurRadius: 16),
      ],
    ),
    child: Padding(
      padding: const EdgeInsets.all(6.0),
      child: child,
    ),
  );
}
