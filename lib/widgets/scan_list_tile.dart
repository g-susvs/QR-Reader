import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_reader/helpers/url_launcher.dart';
import '../provider/scan_list_provider.dart';

class ScanListTile extends StatelessWidget {
  final String type;
  const ScanListTile({Key? key, required this.type}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final scanListProvider = Provider.of<ScanListProvider>(context);
    final scans = scanListProvider.scans;
    return ListView.builder(
      itemCount: scans.length,
      itemBuilder: (context, index) => Dismissible(
        key: Key('${scans[index].id}'),
        direction: DismissDirection.startToEnd,
        background: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              stops: [0.2,0.8],
              colors: [
              Colors.red,
              Colors.white
            ])
          ),
        ),
        onDismissed: (DismissDirection direction){
          Provider.of<ScanListProvider>(context, listen: false).deleteScanById(scans[index].id!);
        },
        child: ListTile(
          leading: Icon( type == 'geo'?Icons.map_outlined:Icons.location_searching, color: Colors.indigo,),
          title: Text(scans[index].value),
          trailing: const Icon(Icons.arrow_forward_ios),
          onTap: () => urlLauncher(context, scans[index])
          
        ),
      ),
    );
  }
}