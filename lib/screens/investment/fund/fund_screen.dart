import 'package:easy_localization/easy_localization.dart';
import 'package:songhyun/screens/widgets/page_head.dart';
import 'package:songhyun/utils/app_exports.dart';

class FundScreen extends StatelessWidget {
  final bool isMobile;

  const FundScreen({
    Key? key,
    this.isMobile = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      children: [
        const PageHead(
          title: 'Fund',
          image: Assets.imagesBgTopFund,
        ),
        SizedBox(height: getProportionateScreenHeight(100)),
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: Column(
            children: [
              Image.asset(Assets.imagesFund1En),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(5),
                  vertical: getProportionateScreenHeight(40),
                ),
                child: Text(
                  'fundDescription'.tr(),
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      height: 2.0, color: AppColors.kBlack, fontSize: 20),
                ),
              ),
              Image.asset(Assets.imagesFund2En),
            ],
          ),
        ),
        SizedBox(height: getProportionateScreenHeight(150)),
      ],
    );
  }
}
