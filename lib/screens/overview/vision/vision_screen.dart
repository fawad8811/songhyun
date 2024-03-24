import 'package:songhyun/screens/widgets/page_head.dart';
import 'package:songhyun/utils/app_exports.dart';

class VisionScreen extends StatelessWidget {
  final bool isMobile;

  const VisionScreen({
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
          title: 'Vision',
          image: Assets.imagesBgTopVision,
        ),
        SizedBox(height: getProportionateScreenHeight(20)),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(20),
          ),
          child: isMobile
              ? _buildMobileVisionColumns(context)
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: _buildWebVisionColumns(context),
                ),
        ),
        SizedBox(height: getProportionateScreenHeight(150)),
      ],
    );
  }

  Widget _buildVisionColumn(
    BuildContext context,
    String imageAsset,
    String title,
    String description,
  ) {
    return Expanded(
      child: Column(
        children: [
          Image.asset(imageAsset),
          Text(
            title,
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .labelLarge
                ?.copyWith(color: AppColors.kGreenTextColor, height: 2.0),
          ),
          SizedBox(height: getProportionateScreenHeight(10)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              description,
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .labelMedium
                  ?.copyWith(color: AppColors.kBlack, height: 1.5),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildWebVisionColumns(BuildContext context) {
    return [
      _buildVisionColumn(
        context,
        'assets/images/vision_1.png',
        'Principle-based management',
        'SongHyun was built on over 50 years of transparent management philosophy of Hanglas Group and over 40 years of investment experience.',
      ),
      _buildVisionColumn(
        context,
        'assets/images/vision_2.png',
        'Mutual Growth',
        'Management team of SongHyun has helped over 40 portfolio companies to have a successful IPO and achieved strong growth with its managed funds; Through this, the management of Songhyun has been able to return profits to all concerned parties.',
      ),
      _buildVisionColumn(
        context,
        'assets/images/vision_3.png',
        'Long-term perspective Horizon',
        'SongHyun aims to become a world-class investment firm which is committed to a long term investment horizon while strengthening its current growth foundation',
      ),
    ];
  }

  Widget _buildVisionMobileColumn(
    BuildContext context,
    String imageAsset,
    String title,
    String description,
  ) {
    return Column(
      children: [
        Image.asset(imageAsset),
        Text(
          title,
          textAlign: TextAlign.center,
          style: Theme.of(context)
              .textTheme
              .labelLarge
              ?.copyWith(color: AppColors.kGreenTextColor, height: 2.0),
        ),
        SizedBox(height: getProportionateScreenHeight(10)),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            description,
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .labelMedium
                ?.copyWith(color: AppColors.kBlack, height: 1.5),
          ),
        ),
      ],
    );
  }

  Widget _buildMobileVisionColumns(BuildContext context) {
    return Column(
      children: [
        _buildVisionMobileColumn(
          context,
          Assets.imagesVision1,
          'Principle-based management',
          'SongHyun was built on over 50 years of transparent management philosophy of Hanglas Group and over 40 years of investment experience.',
        ),
        SizedBox(height: getProportionateScreenHeight(20)),
        _buildVisionMobileColumn(
          context,
          Assets.imagesVision2,
          'Mutual Growth',
          'Management team of SongHyun has helped over 40 portfolio companies to have a successful IPO and achieved strong growth with its managed funds; Through this, the management of Songhyun has been able to return profits to all concerned parties.',
        ),
        SizedBox(height: getProportionateScreenHeight(20)),
        _buildVisionMobileColumn(
          context,
          Assets.imagesVision3,
          'Long-term perspective Horizon',
          'SongHyun aims to become a world-class investment firm which is committed to a long term investment horizon while strengthening its current growth foundation',
        ),
      ],
    );
  }
}
