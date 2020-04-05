import 'dart:async';

import 'package:desafio_picpay/app/utils/AppColors.dart';
import 'package:desafio_picpay/app/utils/SliverAppBarDelegate.dart';
import 'package:desafio_picpay/app/view/list_users/ListUsersViewModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';

class ListUsersPage extends StatefulWidget {
  @override
  _ListUsersPageState createState() => _ListUsersPageState();
}

class _ListUsersPageState extends State<ListUsersPage>
    with AutomaticKeepAliveClientMixin {
  final model = GetIt.I<ListUsersViewModel>();

  TextEditingController controller = new TextEditingController();

  @override
  void initState() {
    super.initState();
    model.getUsers();

    controller.addListener(() {
      print("Chamou Listener");
      model.setFilter(controller.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: AppColors.backgroudColor, body: _body());
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
            backgroundColor: AppColors.backgroudColor,
          ),
          SliverPersistentHeader(
            pinned: true,
            delegate: SliverAppBarDelegate(
              PreferredSize(
                preferredSize: Size(double.infinity, 60.0),
                child: Container(
                    color: AppColors.backgroudColor, child: _searchBar()),
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
        onTap: () => {model.setFocus(true)},
        child: Container(
            width: double.infinity,
            height: 45,
            margin: EdgeInsets.fromLTRB(16, 8, 16, 8),
            decoration: BoxDecoration(
                color: const Color(0xFF2B2C2F),
                borderRadius: BorderRadius.all(Radius.circular(100))),
            child: Observer(
              builder: (BuildContext context) {
                return model.isFocused
                    ? _searchBarWithFocus()
                    : _searchBarWithoutFocus();
              },
            )),
      ),
    );
  }

  Widget _searchBarWithFocus() {
    return TextFormField(
      controller: controller,
      autofocus: true,
      showCursor: false,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
          contentPadding: EdgeInsets.all(8),
          suffixIcon: InkWell(
            onTap: () {
              controller.clear();
              model.setFocus(false);
            },
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
    return Observer(
      builder: (BuildContext context) {
        var users = model.users;
        return SliverList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return _listTile(
                  users[index].name, users[index].img, users[index].username);
            },
            childCount: users.length,
            addAutomaticKeepAlives: true,
          ),
        );
      },
    );
  }

  Widget _listTile(String name, String img, String username) {
    return Container(
      margin: EdgeInsets.fromLTRB(4, 12, 0, 0),
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: Image.network(
            img,
            height: 52,
            width: 52,
          ),
        ),
        title: Text(
          username,
          style: GoogleFonts.roboto(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          name,
          style: GoogleFonts.roboto(
              color: Color.fromARGB(127, 255, 255, 255), fontSize: 14),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
