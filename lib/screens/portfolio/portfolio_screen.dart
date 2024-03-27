import 'package:songhyun/screens/widgets/page_head.dart';
import 'package:songhyun/utils/app_exports.dart';

class PortfolioScreen extends StatelessWidget {
  final bool isMobile;

  const PortfolioScreen({Key? key, this.isMobile = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> imagePaths = [
      Assets.imagesDsht,
      Assets.imagesFadu,
      Assets.imagesIvwprks,
      Assets.imagesInnotherapy,
      Assets.imagesPlasma,
      Assets.imagesDanbi,
      Assets.imagesHana,
      Assets.imagesBluekorealogo,
      Assets.imagesSaltlux,
      Assets.imagesSeegane,
      Assets.imagesCevo,
      Assets.imagesInfoworks,
      Assets.imagesAcetechnologies,
      Assets.imagesBetterial,
      Assets.imagesSeohaegreen,
      Assets.imagesTrinno,
      Assets.imagesSocar,
      Assets.imagesViewone,
      Assets.imagesAirpoint,
      Assets.imagesAkiiiclassic,
      Assets.imagesDaewongsi,
      Assets.imagesClo,
      Assets.imagesTerafunding,
      Assets.imagesTne,
      Assets.imagesBdi,
      Assets.imagesGraphy,
      Assets.imagesSpotlight,
      Assets.imagesObiga,
      Assets.imagesRaontech,
      Assets.imagesSeowontech,
      Assets.imagesFirstsilicon,
      Assets.imagesJaanh,
      Assets.imagesInnopia,
      Assets.imagesGitt,
      Assets.imagesNkmax,
      Assets.imagesGeneralbid,
      Assets.imagesDeardahlia,
      Assets.imagesMyb,
      Assets.imagesWatcha,
      Assets.imagesNgelgames,
      Assets.imagesPanax,
      Assets.imagesNewsystock,
      Assets.imagesLakematerials,
      Assets.imagesChunbo,
      Assets.imagesCrusialmachines,
      Assets.imagesNovachips,
      Assets.imagesUti,
      Assets.imagesRidi,
      Assets.imagesDlemon,
      Assets.imagesSeoulstore,
      Assets.imagesMate,
      Assets.imagesDigen,
      Assets.imagesYas,
      Assets.imagesHavit,
      Assets.imagesCorechips,
      Assets.imagesCiel,
      Assets.imagesAIMT,
      Assets.imagesKps,
      Assets.imagesKaratica,
      Assets.imagesAcross,
      Assets.imagesHycore,
      Assets.imagesMbgreen,
      Assets.imagesClio,
      Assets.imagesMklaudap,
      Assets.imagesNovarex,
      Assets.imagesEnchem,
      Assets.imagesMpnics,
      Assets.imagesImt,
      Assets.imagesAstg,
      Assets.imagesOct,
      Assets.imagesTNf,
      Assets.imagesAtied,
      Assets.imagesMrp,
      Assets.imagesCIS,
      Assets.imagesMrinnovation,
      Assets.imagesNanobricks,
      Assets.imagesItt,
      Assets.imagesHileben,
      Assets.imagesFlitto,
      Assets.imagesUicorporation,
      Assets.imagesCremotech,
      Assets.imagesBnf,
      Assets.imagesDoubleugames,
      Assets.imagesPlaworks,
      Assets.imagesSolueta,
      Assets.imagesKoreantwogreentree,
      Assets.imagesPhiloptics,
      Assets.imagesMidong,
      Assets.imagesEmtech,
      Assets.imagesSiliconworkstwo,
      Assets.imagesNepes,
      Assets.imagesGolfzon,
    ];
    return ListView(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      children: [
        const PageHead(title: 'Portfolio', image: Assets.imagesBgTopPortfolio),
        SizedBox(height: getProportionateScreenHeight(20)),
        Padding(
          padding: EdgeInsets.only(
              left: getProportionateScreenWidth(30),
              right: getProportionateScreenWidth(30)),
          child: Container(
            color: AppColors.kMainBackgroundColor,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(10),
                vertical: getProportionateScreenHeight(60),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Image.asset(Assets.imagesBtnPort1),
                        const SizedBox(
                          width: 6,
                        ),
                        Image.asset(Assets.imagesBtnPort2),
                        const SizedBox(
                          width: 6,
                        ),
                        Image.asset(Assets.imagesBtnPort3),
                        const SizedBox(
                          width: 6,
                        ),
                        Image.asset(Assets.imagesBtnPort4),
                      ],
                    ),
                  ),
                  GridView.builder(
                    itemCount: imagePaths.length,
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: isMobile ? 2 : 4,
                      mainAxisSpacing: 20,
                    ),
                    itemBuilder: (context, index) {
                      return TypeContainer(image: imagePaths[index]);
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(height: getProportionateScreenHeight(40)),
      ],
    );
  }
}

class TypeContainer extends StatelessWidget {
  final String image;

  const TypeContainer({
    required this.image,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getProportionateScreenHeight(275),
      width: getProportionateScreenWidth(275),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      margin: const EdgeInsets.only(right: 20),
      decoration: const BoxDecoration(
        color: AppColors.kWhite,
        border: Border.fromBorderSide(
          BorderSide(
            color: Color(0xFFcccccc),
            width: 1,
          ),
        ),
      ),
      child: Center(
        child: Image.asset(image),
      ),
    );
  }
}
