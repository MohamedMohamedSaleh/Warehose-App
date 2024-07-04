import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiwi/kiwi.dart';
import 'package:warehouse/core/logic/helper_mothods.dart';
import 'package:warehouse/core/widgets/app_image.dart';
import 'package:warehouse/core/widgets/custom_app_bar.dart';
import 'package:warehouse/features/products/models/products_model.dart';
import 'package:warehouse/features/products/show_request_product/show_request_product_bloc.dart';
import 'package:warehouse/training/fake_list.dart';
import 'package:warehouse/views/pages/request_product/product_view.dart';

import '../widgets/shimmer_loading.dart';

class RequestProductPage extends StatefulWidget {
  const RequestProductPage({super.key});

  @override
  State<RequestProductPage> createState() => _RequestProductPageState();
}

class _RequestProductPageState extends State<RequestProductPage> {
  final bloc = KiwiContainer().resolve<ShowRequestProductBloc>()
    ..add(ShowProductEvent(isLoading: true));
  @override
  void dispose() {
    super.dispose();
    bloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Products'),
      body: BlocBuilder(
        bloc: bloc,
        builder: (context, state) {
          if (state is ShowProductLoadingState ||
              state is ShowRequestProductInitial) {
            return const Padding(
              padding: EdgeInsets.only(top: 16),
              child: ShimmerLoadingProduct(),
            );
          } else if (bloc.list.isEmpty) {
            return Center(
              child: Text(
                'No Data',
                style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 26,
                    fontWeight: FontWeight.bold),
              ),
            );
          }
          return GridView.builder(
            padding:
                const EdgeInsets.only(bottom: 16, right: 16, left: 16, top: 16),
            itemCount: bloc.list.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              childAspectRatio: 150 / 250,
              mainAxisSpacing: 12,
            ),
            itemBuilder: (context, index) => _ItemProducts(
              bloc: bloc,
              url: productList[index],
              model: bloc.list[index],
            ),
          );
        },
      ),
    );
  }
}

class _ItemProducts extends StatefulWidget {
  const _ItemProducts(
      {required this.model, required this.url, required this.bloc});
  final ProductModel model;
  final String url;
  final ShowRequestProductBloc bloc;

  @override
  State<_ItemProducts> createState() => _ItemProductsState();
}

class _ItemProductsState extends State<_ItemProducts> {
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(11),
          boxShadow: [
            BoxShadow(blurRadius: 20, color: Colors.black.withOpacity(0.04))
          ]),
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: GestureDetector(
          onTap: () {
            navigateTo(
                toPage: ProductView(
              model: widget.model,
              url: widget.url,
            ));
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(11)),
                child: Hero(
                  tag: widget.model.productid,
                  child: AppImage(
                    widget.url,
                    fit: BoxFit.contain,
                    height: 100,
                    width: double.infinity,
                  ),
                ),
              ),
              const SizedBox(
                height: 3,
              ),
              Text(
                widget.model.name * 2,
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(
                height: 3,
              ),

              Text(
                widget.model.description * 20,
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w400,
                  color: Theme.of(context).primaryColor,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                "Cell Id: ${widget.model.cellid}",
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w700,
                  color: Theme.of(context).primaryColor,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),

              const SizedBox(
                height: 7,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: SizedBox(
                  height: 35,
                  width: double.infinity,
                  child: FilledButton(
                    onPressed: () {
                      widget.bloc
                          .add(RequestProductEvent(id: widget.model.productid));
                    },
                    style: FilledButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 3, vertical: 8),
                      fixedSize: const Size(double.infinity, 45),
                      elevation: 6,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(9),
                      ),
                    ),
                    child: BlocBuilder(
                      bloc: widget.bloc,
                      builder: (context, state) {
                        if (state is RequestProductLoadingState &&
                            state.id == widget.model.productid) {
                          return const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            child: LinearProgressIndicator(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                            ),
                          );
                        }
                        return const Text(
                          'Request Product',
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        );
                      },
                    ),
                  ),
                  //
                  // CustomFilledButton(
                  //   onPressed: () {},
                  //   title: 'Request Product',
                  //   fontSize: 11,
                  //   paddingBottom: 0,
                  //   radias: 9,
                  // ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
