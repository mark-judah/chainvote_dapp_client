import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:election_app/clientConfig/client_config_bloc.dart';
import 'package:election_app/loginBloc/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ClientConfig extends StatefulWidget {
  List counties;
  List constituencies;
  List wards;
  List polling_stations;

  ClientConfig(this.counties, this.constituencies, this.wards, this.polling_stations, {super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<ClientConfig> {
  @override
  void initState() {
    print(widget.counties[0]["name"]);
    super.initState();
  }

  final GlobalKey<FormState> configFormKey = GlobalKey<FormState>();
  late String county,countyID;
  late String constituency,constituencyID;
  late String ward,wardID;
  late String polling_station,pollingStationID;

  final ClientConfigBloc configBloc = ClientConfigBloc();

  String? selectedValue;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ClientConfigBloc, ClientConfigState>(
        bloc: configBloc,
        //listen for emitted action states and perform an action
        listenWhen: (previous, current) => current is ClientConfigActionState,
        //build when there is no action state
        buildWhen: (previous, current) => current is! ClientConfigActionState,
        listener: (context, state) {
          if (state is NavigateToHomeStateWithSuccess) {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => Login("ConfiguredClient")));
          }
          if (state is NavigateToHomeStateWithFailed) {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => Login("ClientNotConfigured")));
          }
        },
        builder: (context, state) {
          switch (state.runtimeType) {
            case LoadingState:
              return Container(
                color: Colors.white,
                child: const Center(
                  child: SpinKitWave(
                    color: Colors.black,
                    size: 50.0,
                  ),
                ),
              );

            default:
           
              return MaterialApp(
                  debugShowCheckedModeBanner: false,
                  home: Scaffold(
                      appBar: AppBar(
                        title: const Text("ChainVote"),
                        titleSpacing: 00.0,
                        centerTitle: true,
                        toolbarHeight: 60.2,
                        toolbarOpacity: 0.8,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(25),
                              bottomLeft: Radius.circular(25)),
                        ),
                        elevation: 0.00,
                        backgroundColor: Colors.black,
                        leading: IconButton(
                            icon: Icon(Icons.arrow_back, color: Colors.white),
                            onPressed: () => Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context) => Login("")))),
                      ),
                      resizeToAvoidBottomInset: false,
                      body: Center(
                          child: Form(
                        key: configFormKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              padding: const EdgeInsets.only(
                                  bottom: 50, left: 30.0, right: 20.0),
                              child: const Text(
                                "Chainvote Client Configuration",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 40,
                                    decoration: TextDecoration.none),
                              ),
                            ),
                            Container(
                                width: 400.0,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 15, right: 15, top: 5),
                                    child: DropdownButtonFormField2<String>(
                                      isExpanded: true,
                                      decoration: InputDecoration(
                                        // Add Horizontal padding using menuItemStyleData.padding so it matches
                                        // the menu padding when button's width is not specified.
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                                vertical: 16),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        // Add more decoration..
                                      ),
                                      hint: const Text(
                                        'County',
                                        style: TextStyle(fontSize: 14),
                                      ),
                                      items: widget.counties.asMap().keys.toList()
                                          .map((index) =>
                                              DropdownMenuItem<String>(
                                                value:widget.counties[index]["name"],
                                                child: Text(
                                                  widget.counties[index]["name"],
                                                  style: const TextStyle(
                                                    fontSize: 14,
                                                  ),
                                                ),
                                              ))
                                          .toList(),
                                          
                                      validator: (value) {
                                        if (value == null) {
                                          return 'Please specify a county';
                                        }
                                        return null;
                                      },
                                      onChanged: (value) {
                                        //Do something when selected item is changed.
                                      },
                                      onSaved: (value) {
                                        selectedValue = value.toString();
                                        county = value.toString();
                                        for (var i = 0; i < widget.counties.length; i++) {
                                          if (widget.counties[i]["name"]==county){
                                            countyID=widget.counties[i]["ID"].toString();
                                          }
                                        }
                                      },
                                      buttonStyleData: const ButtonStyleData(
                                        padding: EdgeInsets.only(right: 8),
                                      ),
                                      iconStyleData: const IconStyleData(
                                        icon: Icon(
                                          Icons.arrow_drop_down,
                                          color: Colors.black45,
                                        ),
                                        iconSize: 24,
                                      ),
                                      dropdownStyleData: DropdownStyleData(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                      ),
                                      menuItemStyleData:
                                          const MenuItemStyleData(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 16),
                                      ),
                                    ))),
                            const SizedBox(
                              height: 15,
                            ),
                            Container(
                                width: 400.0,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 15, right: 15, top: 5),
                                    child: DropdownButtonFormField2<String>(
                                      isExpanded: true,
                                      decoration: InputDecoration(
                                        // Add Horizontal padding using menuItemStyleData.padding so it matches
                                        // the menu padding when button's width is not specified.
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                                vertical: 16),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        // Add more decoration..
                                      ),
                                      hint: const Text(
                                        'Constituency',
                                        style: TextStyle(fontSize: 14),
                                      ),
                                      items: widget.constituencies.asMap().keys.toList()
                                          .map((index) =>
                                              DropdownMenuItem<String>(
                                                value: widget.constituencies[index]["name"],
                                                child: Text(
                                                  widget.constituencies[index]["name"],
                                                  style: const TextStyle(
                                                    fontSize: 14,
                                                  ),
                                                ),
                                              ))
                                          .toList(),
                                      validator: (value) {
                                        if (value == null) {
                                          return 'Please specify a constituency';
                                        }
                                        return null;
                                      },
                                      onChanged: (value) {
                                        //Do something when selected item is changed.
                                      },
                                      onSaved: (value) {
                                        selectedValue = value.toString();
                                        constituency = value.toString();
                                        for (var i = 0; i < widget.constituencies.length; i++) {
                                          if (widget.constituencies[i]["name"]==constituency){
                                            constituencyID=widget.constituencies[i]["ID"].toString();
                                          }
                                        }
                                      },
                                      buttonStyleData: const ButtonStyleData(
                                        padding: EdgeInsets.only(right: 8),
                                      ),
                                      iconStyleData: const IconStyleData(
                                        icon: Icon(
                                          Icons.arrow_drop_down,
                                          color: Colors.black45,
                                        ),
                                        iconSize: 24,
                                      ),
                                      dropdownStyleData: DropdownStyleData(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                      ),
                                      menuItemStyleData:
                                          const MenuItemStyleData(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 16),
                                      ),
                                    ))),
                            const SizedBox(
                              height: 15,
                            ),
                            Container(
                                width: 400.0,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 15, right: 15, top: 5),
                                    child: DropdownButtonFormField2<String>(
                                      isExpanded: true,
                                      decoration: InputDecoration(
                                        // Add Horizontal padding using menuItemStyleData.padding so it matches
                                        // the menu padding when button's width is not specified.
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                                vertical: 16),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        // Add more decoration..
                                      ),
                                      hint: const Text(
                                        'Ward',
                                        style: TextStyle(fontSize: 14),
                                      ),
                                      items: widget.wards.asMap().keys.toList()
                                          .map((index) =>
                                              DropdownMenuItem<String>(
                                                value: widget.wards[index]["name"],
                                                child: Text(
                                                  widget.wards[index]["name"],
                                                  style: const TextStyle(
                                                    fontSize: 14,
                                                  ),
                                                ),
                                              ))
                                          .toList(),
                                      validator: (value) {
                                        if (value == null) {
                                          return 'Please specify a ward';
                                        }
                                        return null;
                                      },
                                      onChanged: (value) {
                                        //Do something when selected item is changed.
                                      },
                                      onSaved: (value) {
                                        selectedValue = value.toString();
                                        ward = value.toString();
                                        for (var i = 0; i < widget.wards.length; i++) {
                                          if (widget.wards[i]["name"]==ward){
                                            wardID=widget.wards[i]["ID"].toString();
                                          }
                                        }
                                      },
                                      buttonStyleData: const ButtonStyleData(
                                        padding: EdgeInsets.only(right: 8),
                                      ),
                                      iconStyleData: const IconStyleData(
                                        icon: Icon(
                                          Icons.arrow_drop_down,
                                          color: Colors.black45,
                                        ),
                                        iconSize: 24,
                                      ),
                                      dropdownStyleData: DropdownStyleData(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                      ),
                                      menuItemStyleData:
                                          const MenuItemStyleData(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 16),
                                      ),
                                    ))),
                            const SizedBox(
                              height: 15,
                            ),
                            Container(
                                width: 400.0,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 15, right: 15, top: 5),
                                    child: DropdownButtonFormField2<String>(
                                      isExpanded: true,
                                      decoration: InputDecoration(
                                        // Add Horizontal padding using menuItemStyleData.padding so it matches
                                        // the menu padding when button's width is not specified.
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                                vertical: 16),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        // Add more decoration..
                                      ),
                                      hint: const Text(
                                        'Polling Station',
                                        style: TextStyle(fontSize: 14),
                                      ),
                                      items: widget.polling_stations.asMap().keys.toList()
                                          .map((index) =>
                                              DropdownMenuItem<String>(
                                                value: widget.polling_stations[index]["name"],
                                                child: Text(
                                                  widget.polling_stations[index]["name"],
                                                  style: const TextStyle(
                                                    fontSize: 14,
                                                  ),
                                                ),
                                              ))
                                          .toList(),
                                      validator: (value) {
                                        if (value == null) {
                                          return 'Please specify a polling station';
                                        }
                                        return null;
                                      },
                                      onChanged: (value) {
                                        //Do something when selected item is changed.
                                      },
                                      onSaved: (value) {
                                        selectedValue = value.toString();
                                        polling_station = value.toString();
                                        for (var i = 0; i < widget.polling_stations.length; i++) {
                                          if (widget.polling_stations[i]["name"]==polling_station){
                                            pollingStationID=widget.polling_stations[i]["ID"].toString();
                                          }
                                        }
                                      },
                                      buttonStyleData: const ButtonStyleData(
                                        padding: EdgeInsets.only(right: 8),
                                      ),
                                      iconStyleData: const IconStyleData(
                                        icon: Icon(
                                          Icons.arrow_drop_down,
                                          color: Colors.black45,
                                        ),
                                        iconSize: 24,
                                      ),
                                      dropdownStyleData: DropdownStyleData(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                      ),
                                      menuItemStyleData:
                                          const MenuItemStyleData(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 16),
                                      ),
                                    ))),
                            const SizedBox(
                              height: 15,
                            ),
                            MaterialButton(
                              child: const Text("Save"),
                              color: Colors.black,
                              textColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                              ),
                              onPressed: () {
                                if (configFormKey.currentState!.validate()) {
                                  configFormKey.currentState!.save();
                                  //submit
                                  configBloc.add(SaveConfiguration(countyID,constituencyID,wardID,pollingStationID));
                                }
                              },
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                          ],
                        ),
                      ))));
          }
        });
  }
}
