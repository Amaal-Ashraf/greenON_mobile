// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:grad/network/remote/dio_helper.dart';

class Ports extends StatefulWidget
{
  @override
  State<Ports> createState() => _PortsState();
}

class _PortsState extends State<Ports> {

  var portsOne= {
    'name':'',
    'status':'',
  };
  var portTwo = {
    'name':'',
    'status':'',
  };
  var portThree = {
    'name':'',
    'status':'',
  };

  Future fetchPanelOData() async {

    var response= await DioHelper.getHttp(endPoint: 'ports');
    print('Response from ports widget');
    print(response);
    setState(() {
      portsOne = {
        'name':response['ports']['name'].toString(),
        'status':response['ports']['status'].toString(),
      };
      portTwo = {
        'name':response['ports']['name'].toString(),
        'status':response['ports']['status'].toString(),
      };
      portThree = {
        'name':response['ports']['name'].toString(),
        'status':response['ports']['status'].toString(),
      };
    });
  }

  @override
  void initState() {
    super.initState();
    // Add listeners to this class

    fetchPanelOData();

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: DataTable(
        showBottomBorder: true,

        columns: const <DataColumn>
      [
        DataColumn(label: Text('Port'),),
        DataColumn(label: Text('Status'),),
      ],
          rows: const <DataRow>
        [
            DataRow(cells: <DataCell>
              [
                DataCell(Text('DC_1')),
                DataCell(Text('Available')),

          ],
          ),
            DataRow(cells: <DataCell>
            [
              DataCell(Text('DC_2')),
              DataCell(Text('Available')),

            ],
            ),
            DataRow(cells: <DataCell>
            [
              DataCell(Text('DC_3')),
              DataCell(Text('Available')),

            ],
            ),
          ],
      ),

    );
  }
}
