import '../../core/export/_.dart';

class CircularImage extends StatelessWidget {
  final String? img;
  final double hw;

  const CircularImage({
    Key? key,
    this.img,
    this.hw = 80,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(50),
      child: Container(
          padding: EdgeInsets.all(hw / 35),
          decoration: BoxDecoration(
            color: KC.primary,
            borderRadius: BorderRadius.circular(50),
          ),
          child: img != null
              ? SizedBox(
                  width: hw,
                  height: hw,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.asset(
                      img!,
                    ),
                  ),
                )
              : SizedBox(
                  width: hw,
                  height: hw,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.asset(
                      "assets/icons/emptyimg.png",
                    ),
                  ),
                )),
    );
  }
}
