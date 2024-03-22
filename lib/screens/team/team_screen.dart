import 'package:responsive_config/responsive_config.dart';
import 'package:songhyun/screens/widgets/page_head.dart';
import 'package:songhyun/utils/app_exports.dart';

class TeamScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  const TeamScreen({Key? key, required this.scaffoldKey}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView(
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          children: [
            const PageHead(title: 'Team', image: Assets.imagesBgTopTeam),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(20),
                  vertical: getProportionateScreenHeight(60)),
              child: const Column(
                children: [
                  TeamRow(),
                  TeamRow(),
                  TeamRow(),
                  TeamRow(),
                ],
              ),
            ),
            SizedBox(
              height: getProportionateScreenHeight(40),
            )
          ],
        ),
      ],
    );
  }
}

class TeamRow extends StatelessWidget {
  const TeamRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        children: [
          Container(
            height: 275,
            width: 275,
            padding: const EdgeInsets.only(bottom: 20),
            margin: const EdgeInsets.only(right: 20),
            decoration: const BoxDecoration(
              color: AppColors.kGreen,
            ),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                'Management',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: AppColors.kWhite,
                      fontSize: 40,
                    ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TeamContainer(),
                TeamContainer(),
                // TeamContainer(),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class TeamContainer extends StatelessWidget {
  const TeamContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 275,
      width: 275,
      child: Stack(
        children: [
          // Image
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                border: Border.fromBorderSide(
                  BorderSide(
                    color: Color(0xFFcccccc),
                    width: 1,
                  ),
                ),
                image: DecorationImage(
                  image: AssetImage(Assets.imagesTeam1),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          // Shadow
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 100,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    AppColors.kBlack.withOpacity(0.7),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),
          // Text
          Positioned(
            bottom: 50, // Adjust the position of the text as needed
            left: 20,
            right: 20,
            child: Text(
              'Management Name',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: AppColors.kWhite,
                    fontSize: 26,
                  ),
            ),
          ),
          Positioned(
            bottom: 20, // Adjust the position of the text as needed
            left: 20,
            right: 20,
            child: Text(
              'Chairman',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: const Color(0xFFabd58c),
                    fontSize: 20,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
