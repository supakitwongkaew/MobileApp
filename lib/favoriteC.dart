import 'package:flutter/material.dart';
//---------------------------- ParentWidget ----------------------------

class ParentManagesC extends StatefulWidget {
  @override
  _ParentManagesCState createState() => _ParentManagesCState();
}

class _ParentManagesCState extends State<ParentManagesC> {
  int _favoriteCount = 41;

  void _handleTapboxChanged(bool newValue) {
    setState(() {
    if (newValue) {
      _favoriteCount += 1; 
    } else {
      _favoriteCount -= 1;
    }
  });
}

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FavoriteC(
        onChanged: _handleTapboxChanged,
        favoriteCount: _favoriteCount,
      ),
    );
  }
}

//----------------------------- TapboxC ------------------------------

class FavoriteC extends StatefulWidget {
  FavoriteC({Key key, @required this.onChanged,this.favoriteCount})
      : super(key: key);

  final int favoriteCount;
  final ValueChanged<bool> onChanged;

  @override
  _FavoriteCState createState() => _FavoriteCState();
}

class _FavoriteCState extends State<FavoriteC> {
  bool isFavorited = true;

  get favoriteCount => widget.favoriteCount;

  void _handleTap() {
    setState(() {
      widget.onChanged(!isFavorited);
      isFavorited = !isFavorited;
    });
  }

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