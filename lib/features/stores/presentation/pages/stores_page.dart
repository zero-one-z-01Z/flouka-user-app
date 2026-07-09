import 'package:flouka/core/constants/app_lotties.dart';
import 'package:flouka/core/widgets/empty_animation.dart';
import 'package:flouka/core/widgets/loading_animation_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../../../language/presentation/provider/language_provider.dart';
import '../providers/stores_provider.dart';
import '../widgets/stores_container_home_widget.dart';

class StoresPage extends StatelessWidget {
  const StoresPage({super.key,});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<StoresProvider>(context,);
    provider.pagination();
    return Scaffold(
      appBar: AppBar(
        title: Text(LanguageProvider.translate('home', 'retail_stores')),

      ),
      body: RefreshIndicator(
        onRefresh: () => provider.refresh(),
        child: SingleChildScrollView(
          controller: provider.controller,
          physics:const AlwaysScrollableScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.w,vertical: 2.h),
            child: Builder(
              builder: (context) {
                if(provider.data == null){
                  return const Center(child:  LoadingAnimationWidget(gif:Lotties.loading));
                }else if(provider.data!.isEmpty){
                  return const EmptyAnimation(title: "title", gif: Lotties.noSearch);
                }
                return Column(
                  spacing: 2.h,
                  children: List.generate(provider.data!.length, (index) {
                    return StoresContainerHomeWidget(store: provider.data![index]);
                  }),
                );
              }
            ),
          ),
        ),
      ),
    );
  }
}
