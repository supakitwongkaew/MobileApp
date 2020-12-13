import 'package:flutter/material.dart';


class ParentManagesB extends StatefulWidget {
  @override
  _ParentManagesBState createState() => _ParentManagesBState();
}

class _ParentManagesBState extends State<ParentManagesB> {
  bool _isFavorited = true;
  int _favoriteCount = 41;

  void _handleTapboxChanged(bool newValue) {
    setState(() {
    if (_isFavorited) {
      _favoriteCount -= 1;
      _isFavorited = false;
    } else {
      _favoriteCount += 1;
      _isFavorited = true;
    }
  });
}
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TapboxB(
        isFavorited: _isFavorited,
        onChanged: _handleTapboxChanged,
        favoriteCount: _favoriteCount,
      ),
    );
  }
}

//------------------------- TapboxB ----------------------------------

class TapboxB extends StatelessWidget {
  TapboxB({Key key, this.isFavorited: false, @required this.onChanged,this.favoriteCount})
      : super(key: key);

  final bool isFavorited;
  final ValueChanged<bool> onChanged;
  final int favoriteCount;

  void _handleTap() {
    onChanged(!isFavorited);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: EdgeInsets.all(0),
          child: IconButton(
            padding: EdgeInsets.all(0),
            alignment: Alignment.centerRight,
            icon: (isFavorited ? Icon(Icons.star) : Icon(Icons.star_border)),
            color: Colors.red[500],
            onPressed: _handleTap,
          ),
        ),
        Text('$favoriteCount'),
      ],
    );
  }
}
