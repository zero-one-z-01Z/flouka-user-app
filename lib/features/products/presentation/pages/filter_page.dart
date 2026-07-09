import 'package:flouka/core/config/app_color.dart';
import 'package:flouka/core/config/app_styles.dart';
import 'package:flouka/core/helper_function/navigation.dart';
import 'package:flouka/core/widgets/button_widget.dart';
import 'package:flouka/features/language/presentation/provider/language_provider.dart';
import 'package:flouka/features/products/presentation/pages/brand_filter_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../providers/categories_product_search_provider.dart';
import '../providers/search_filter_provider.dart';
import '../widgets/filter_children_widget.dart';

class FilterPage extends StatelessWidget {
  const FilterPage({super.key});

  @override
  Widget build(BuildContext context) {
    SearchFilterProvider provider = Provider.of(context,);

    return Scaffold(
      appBar: AppBar(
        // automaticallyImplyLeading: false,
        title: Text(LanguageProvider.translate('filters', 'filter')),
        // leading: const BackButton(),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView.separated(
                itemCount: provider.mainFilters.length,
                separatorBuilder: (_, __) =>
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 4.w,vertical: 0.2.h),
                      child:  Divider(height: 1, color: Colors.grey.shade500),
                    ),
                itemBuilder: (context, index) {
                  final text = provider.mainFilters[index];
                  return ExpansionTile(title: Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 4.w),
                    child: Row(
                      children: [
                        Text(
                          LanguageProvider.translate('filter', text['title']),
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        if(text['value']!=null )...[
                          SizedBox(width: 4.w,),
                          Expanded(child: Text(
                            provider.getFilterLabel(text['value']),
                            style:TextStyleClass.normalStyle(color: AppColor.primaryColor).copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),),
                        ],

                      ],
                    ),
                  ),
                    children: [Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 10.w),
                      child: FilterChildrenWidget(data: text),
                    ),],);
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: 4.h,
                horizontal: 4.w,
              ).copyWith(bottom: 5.h),
              child: Row(
                children: [
                  ButtonWidget(
                    onTap: () {
                      provider.resetFilters();
                    },
                    text: 'reset',
                    width: 32.w,
                    height: 5.h,
                    color: Colors.transparent,
                    borderRadius: 10,
                    borderColor: AppColor.primaryColor,
                    textStyle: TextStyleClass.normalStyle().copyWith(
                      color: AppColor.primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 4.w),
                  ButtonWidget(
                    onTap: () {
                      Provider.of<CategoriesProductSearchProvider>(context,listen: false).getProductsFromFilter();
                    },
                    text: 'apply',
                    width: 54.w,
                    height: 5.h,
                    borderRadius: 10,
                    textStyle: TextStyleClass.normalStyle().copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
