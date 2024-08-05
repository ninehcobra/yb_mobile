import '../../../common_libs.dart';

class CustomLogoButton extends StatefulWidget {
  final String logoUrl;
  final String logoHoveredUrl;
  final String title;
  final Color hoveredColor;

  const CustomLogoButton(
      {super.key,
      required this.logoUrl,
      required this.logoHoveredUrl,
      required this.title,
      required this.hoveredColor});

  @override
  State<CustomLogoButton> createState() => _CustomLogoButtonState();
}

class _CustomLogoButtonState extends State<CustomLogoButton> {
  bool _isBtnHovered = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: InkWell(
        onTap: () {},
        onHover: (value) {
          setState(() {
            _isBtnHovered = value;
          });
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          decoration: BoxDecoration(
              border: Border.all(
                  color: _isBtnHovered ? widget.hoveredColor : Colors.grey),
              borderRadius: BorderRadius.circular(4)),
          child: Row(
            children: [
              AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  decoration: BoxDecoration(
                    border: Border(
                      right: BorderSide(
                        color:
                            _isBtnHovered ? widget.hoveredColor : Colors.grey,
                      ),
                    ),
                    color: _isBtnHovered
                        ? widget.hoveredColor
                        : Colors.transparent,
                  ),
                  height: 40,
                  width: 40,
                  child: Center(
                      child: Image.asset(
                    _isBtnHovered ? widget.logoHoveredUrl : widget.logoUrl,
                    height: 24,
                    width: 24,
                  ))),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  widget.title,
                  style: TextStyle(
                      color:
                          _isBtnHovered ? widget.hoveredColor : Colors.black),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
