import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ListUsersPage extends StatefulWidget {
  @override
  _ListUsersPageState createState() => _ListUsersPageState();
}

class _ListUsersPageState extends State<ListUsersPage> {
  //!Arrumar o bug ao clicar no field. Mudar de setState.

  bool isSearchBarFocused = false;
  var _backgroudColor = const Color(0xFF1D1E20);

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: _backgroudColor, body: _body());
  }

  Widget _body() {
    return NestedScrollView(
      body: _listView(),
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return [
          SliverAppBar(
              centerTitle: false,
              flexibleSpace: Container(
                child: _headerTitle(),
              ),
              pinned: true,
              expandedHeight: 164,
              backgroundColor: _backgroudColor,
              bottom: PreferredSize(
                preferredSize: Size(20.0, 20.0),
                child: _searchBar(),
              ))
        ];
      },
    );
  }

  Widget _headerTitle() {
    return Container(
      margin: EdgeInsets.fromLTRB(20, 70, 20, 16),
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
        onTap: () => {
          //TODO Setar o estado pela viewModel
          setState(() {
            isSearchBarFocused = true;
          })
        },
        child: Container(
          width: double.infinity,
          height: 45,
          margin: EdgeInsets.fromLTRB(16, 8, 16, 8),
          decoration: BoxDecoration(
              color: const Color(0xFF2B2C2F),
              borderRadius: BorderRadius.all(Radius.circular(100))),
          child: isSearchBarFocused
              ? _searchBarWithFocus()
              : _searchBarWithoutFocus(),
        ),
      ),
    );
  }

  Widget _searchBarWithFocus() {
    return TextField(
      autofocus: true,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
          contentPadding: EdgeInsets.all(8),
          suffixIcon: GestureDetector(
            onTap: () => {
              setState(() {
                isSearchBarFocused = false;
              })
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
    return Container(
        child: ListView.builder(
      itemCount: 15,
      itemBuilder: (context, index) {
        return _listTile();
      },
    ));
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
}
