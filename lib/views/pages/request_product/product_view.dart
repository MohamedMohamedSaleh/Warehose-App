import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiwi/kiwi.dart';
import 'package:warehouse/core/widgets/app_image.dart';
import 'package:warehouse/features/products/models/products_model.dart';
import 'package:warehouse/features/products/show_request_product/show_request_product_bloc.dart';

class ProductView extends StatefulWidget {
  const ProductView({
    super.key,
    required this.model,
  });

  final ProductModel model;

  @override
  State<ProductView> createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  final bloc = KiwiContainer().resolve<ShowRequestProductBloc>();
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
                    tag: widget.model.productid,
                    child: AppImage(
                      widget.model.image,
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
                              widget.model.name,
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
                                "#${widget.model.productid}",
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
                        child: SizedBox(
                      width: double.infinity,
                      child: Text(
                        widget.model.description,
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Theme.of(context).primaryColor),
                      ),
                    )),
                    const SizedBox(
                      height: 10,
                    ),
                    decorationBox(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          widget.model.time != null
                              ? Description(
                                  title: "Addition Time:",
                                  descripe: widget.model.time!,
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
                                descripe: "${widget.model.weight}kg",
                              ),
                              Description(
                                title: "Cell Id:",
                                descripe: widget.model.cellid,
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
                                descripe: widget.model.category,
                              ),
                              Description(
                                title: "Status:",
                                descripe: widget.model.status,
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
          child: GestureDetector(
            onTap: () {
              bloc.add(RequestProductEvent(id: widget.model.productid));
            },
            child: Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(11)),
              alignment: Alignment.center,
              width: double.infinity,
              height: 45,
              child: BlocBuilder(
                bloc: bloc,
                builder: (context, state) {
                  if (state is RequestProductLoadingState &&
                      state.id == widget.model.productid) {
                    return SizedBox(
                      width: 140,
                      child: LinearProgressIndicator(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(3)),
                        backgroundColor: Colors.white,
                        color: Theme.of(context).primaryColor.withOpacity(.85),
                      ),
                    );
                  }
                  return const Text(
                    "Request Product",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  );
                },
              ),
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
