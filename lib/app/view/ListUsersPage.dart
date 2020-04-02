import 'dart:async';

import 'package:desafio_picpay/app/utils/SliverAppBarDelegate.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ListUsersPage extends StatefulWidget {
  @override
  _ListUsersPageState createState() => _ListUsersPageState();
}

class _ListUsersPageState extends State<ListUsersPage>
    with AutomaticKeepAliveClientMixin {
  //!Trocar Streams pelo MobX

  final _isSearchBarFocused = StreamController<bool>();

  Sink<bool> get isFocusedIn => _isSearchBarFocused.sink;
  Stream<bool> get isFocusedOut => _isSearchBarFocused.stream;

  var _backgroudColor = const Color(0xFF1D1E20);

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: _backgroudColor, body: _body());
  }

  Widget _body() {
    return SafeArea(
      child: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            centerTitle: false,
            flexibleSpace: Container(
              child: _headerTitle(),
            ),
            elevation: 0,
            expandedHeight: 108,
            backgroundColor: _backgroudColor,
          ),
          SliverPersistentHeader(
            pinned: true,
            delegate: SliverAppBarDelegate(
              PreferredSize(
                preferredSize: Size(double.infinity, 60.0),
                child: Container(color: _backgroudColor, child: _searchBar()),
              ),
            ),
          ),
          _listView()
        ],
      ),
    );
  }

  Widget _headerTitle() {
    return Container(
      margin: EdgeInsets.fromLTRB(20, 50, 0, 16),
      child: Text("Contatos",
          style: GoogleFonts.roboto(
            color: Colors.white,
            fontSize: 28,
            fontWeight: FontWeight.bold,
          )),
    );
  }

  Widget _searchBar() {
    return Container(
      child: GestureDetector(
        onTap: () => {isFocusedIn.add(true)},
        child: Container(
            width: double.infinity,
            height: 45,
            margin: EdgeInsets.fromLTRB(16, 8, 16, 8),
            decoration: BoxDecoration(
                color: const Color(0xFF2B2C2F),
                borderRadius: BorderRadius.all(Radius.circular(100))),
            child: StreamBuilder<bool>(
              initialData: false,
              builder: (context, snapshot) {
                return snapshot.data
                    ? _searchBarWithFocus()
                    : _searchBarWithoutFocus();
              },
              stream: isFocusedOut,
            )),
      ),
    );
  }

  Widget _searchBarWithFocus() {
    return TextFormField(
      autofocus: true,
      showCursor: false,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
          contentPadding: EdgeInsets.all(8),
          suffixIcon: InkWell(
            onTap: () => {isFocusedIn.add(false)},
            child: Icon(
              Icons.close,
              color: Colors.white,
            ),
          ),
          prefixIcon: Icon(
            Icons.search,
            color: Colors.white,
          ),
          hintText: "A quem você deseja pagar?",
          hintStyle: TextStyle(color: Color(0xFFACB1BD)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white, width: 1.0),
              borderRadius: BorderRadius.all(Radius.circular(100)))),
    );
  }

  Widget _searchBarWithoutFocus() {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
            child: Icon(
              Icons.search,
              color: Color(0xFFACB1BD),
            ),
          ),
          Text(
            "A quem você deseja pagar?",
            style: TextStyle(color: Color(0xFFACB1BD), fontSize: 14),
          )
        ],
      ),
    );
  }

  Widget _listView() {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return _listTile();
        },
        childCount: 15,
        addAutomaticKeepAlives: true,
      ),
    );
  }

  Widget _listTile() {
    return Container(
      margin: EdgeInsets.fromLTRB(4, 12, 0, 0),
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: Image.network(
            "https://randomuser.me/api/portraits/women/37.jpg",
            height: 52,
            width: 52,
          ),
        ),
        title: Text(
          "@marina.coelho",
          style: GoogleFonts.roboto(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          "Marina Coelho",
          style: GoogleFonts.roboto(
              color: Color.fromARGB(127, 255, 255, 255), fontSize: 14),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;

  @override
  void dispose() {
    super.dispose();
    _isSearchBarFocused.close();
  }
}
