import 'package:songhyun/screens/widgets/page_head.dart';
import 'package:songhyun/utils/app_exports.dart';

class TeamScreen extends StatelessWidget {
  const TeamScreen({Key? key, }) : super(key: key);

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
                  Row(
                    children: [
                      TypeContaner(
                        type: 'Management',
                      ),
                      TeamContainer(
                        name: 'John Doe',
                        position: 'CEO',
                        image: Assets.imagesteamProfile,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      TypeContaner(
                        type: 'Investment Division',
                      ),
                      TeamContainer(
                        name: 'Rebecca Doe',
                        position: 'Vice President',
                        image: Assets.imagesteamProfile,
                      ),
                      TeamContainer(
                        name: 'shock rock',
                        position: 'Executive Managing',
                        image: Assets.imagesteamProfile,
                      ),
                    ],
                  ),
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

class TypeContaner extends StatelessWidget {
  final String type;
  const TypeContaner({
    required this.type,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 275,
      width: 275,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      margin: const EdgeInsets.only(right: 20),
      decoration: const BoxDecoration(
        color: AppColors.kGreen,
      ),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Text(
          type,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: AppColors.kWhite,
                fontSize: 40,
              ),
        ),
      ),
    );
  }
}

class TeamContainer extends StatelessWidget {
  final String name;
  final String position;
  final String image;

  const TeamContainer({
    required this.name,
    required this.position,
    required this.image,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 275,
      width: 275,
      margin: const EdgeInsets.only(right: 20),
      child: Stack(
        children: [
          // Image
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                border: const Border.fromBorderSide(
                  BorderSide(
                    color: Color(0xFFcccccc),
                    width: 1,
                  ),
                ),
                image: DecorationImage(
                  image: AssetImage(image),
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
            bottom: 40,
            left: 20,
            right: 20,
            child: Text(
              name,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: AppColors.kWhite,
                    fontSize: 26,
                  ),
            ),
          ),
          Positioned(
            bottom: 18,
            left: 20,
            right: 20,
            child: Text(
              position,
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