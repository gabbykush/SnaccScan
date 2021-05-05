import 'package:csci380project/resources/nutrient.dart';
import 'package:csci380project/resources/nutrientlist.dart';
import 'package:csci380project/rest_api/rest_api.dart';

Future<List<Nutrient>> listAllNutrients(String upc) async {
  List<Nutrient> listOfNutrients = [];
  NutrientList nutrientList = await fetchFood(upc);
  Nutrient nutrient;

  for (var key in nutrientList.toMap().keys) {
    if (nutrientList.toMap()[key] != -1) {
      nutrient = new Nutrient(
          name: NutrientName[key],
          value: double.parse(nutrientList.toMap()[key].toStringAsFixed(2)),
          unit: NutrientUnit[key]);
      listOfNutrients.add(nutrient);
      // print(NutrientName[0]);
      // print(nutrient);
      // print(NutrientUnit[0]);
    }
  }

  // if (nutrientList.ENERC_KCAL != -1)
  //   listOfNutrients.add(NutrientName['ENERC_KCAL'] +
  //       ': ' +
  //       nutrientList.ENERC_KCAL.toString() +
  //       ' ' +
  //       NutrientUnit['ENERC_KCAL']);

  // if (nutrientList.FAT != -1)
  //   listOfNutrients.add(NutrientName['FAT'] +
  //       ': ' +
  //       nutrientList.FAT.toString() +
  //       ' ' +
  //       NutrientUnit['FAT']);

  // if (nutrientList.FASAT != -1)
  //   listOfNutrients.add(NutrientName['FASAT'] +
  //       ': ' +
  //       nutrientList.FASAT.toString() +
  //       ' ' +
  //       NutrientUnit['FASAT']);

  // if (nutrientList.FATRN != -1)
  //   listOfNutrients.add(NutrientName['FATRN'] +
  //       ': ' +
  //       nutrientList.FATRN.toString() +
  //       ' ' +
  //       NutrientUnit['FATRN']);

  // if (nutrientList.FAMS != -1)
  //   listOfNutrients.add(NutrientName['FAMS'] +
  //       ': ' +
  //       nutrientList.FAMS.toString() +
  //       ' ' +
  //       NutrientUnit['FAMS']);

  // if (nutrientList.FAPU != -1)
  //   listOfNutrients.add(NutrientName['FAPU'] +
  //       ': ' +
  //       nutrientList.FAPU.toString() +
  //       ' ' +
  //       NutrientUnit['FAPU']);

  // if (nutrientList.CHOCDF != -1)
  //   listOfNutrients.add(NutrientName['CHOCDF'] +
  //       ': ' +
  //       nutrientList.CHOCDF.toString() +
  //       ' ' +
  //       NutrientUnit['CHOCDF']);

  // if (nutrientList.FIBTG != -1)
  //   listOfNutrients.add(NutrientName['FIBTG'] +
  //       ': ' +
  //       nutrientList.FIBTG.toString() +
  //       ' ' +
  //       NutrientUnit['FIBTG']);

  // if (nutrientList.SUGAR != -1)
  //   listOfNutrients.add(NutrientName['SUGAR'] +
  //       ': ' +
  //       nutrientList.SUGAR.toString() +
  //       ' ' +
  //       NutrientUnit['SUGAR']);

  // if (nutrientList.PROCNT != -1)
  //   listOfNutrients.add(NutrientName['PROCNT'] +
  //       ': ' +
  //       nutrientList.PROCNT.toString() +
  //       ' ' +
  //       NutrientUnit['PROCNT']);

  // if (nutrientList.CHOLE != -1)
  //   listOfNutrients.add(NutrientName['CHOLE'] +
  //       ': ' +
  //       nutrientList.CHOLE.toString() +
  //       ' ' +
  //       NutrientUnit['CHOLE']);

  // if (nutrientList.NA != -1)
  //   listOfNutrients.add(NutrientName['NA'] +
  //       ': ' +
  //       nutrientList.NA.toString() +
  //       ' ' +
  //       NutrientUnit['NA']);

  // if (nutrientList.CA != -1)
  //   listOfNutrients.add(NutrientName['CA'] +
  //       ': ' +
  //       nutrientList.CA.toString() +
  //       ' ' +
  //       NutrientUnit['CA']);

  // if (nutrientList.K != -1)
  //   listOfNutrients.add(NutrientName['K'] +
  //       ': ' +
  //       nutrientList.K.toString() +
  //       ' ' +
  //       NutrientUnit['K']);

  // if (nutrientList.FE != -1)
  //   listOfNutrients.add(NutrientName['FE'] +
  //       ': ' +
  //       nutrientList.FE.toString() +
  //       ' ' +
  //       NutrientUnit['FE']);

  // if (nutrientList.VITC != -1)
  //   listOfNutrients.add(NutrientName['VITC'] +
  //       ': ' +
  //       nutrientList.VITC.toString() +
  //       ' ' +
  //       NutrientUnit['VITC']);

  // if (nutrientList.FOLDFE != -1)
  //   listOfNutrients.add(NutrientName['FOLDFE'] +
  //       ': ' +
  //       nutrientList.FOLDFE.toString() +
  //       ' ' +
  //       NutrientUnit['FOLDFE']);

  // if (nutrientList.MG != -1)
  //   listOfNutrients.add(NutrientName['MG'] +
  //       ': ' +
  //       nutrientList.MG.toString() +
  //       ' ' +
  //       NutrientUnit['MG']);

  // if (nutrientList.NIA != -1)
  //   listOfNutrients.add(NutrientName['NIA'] +
  //       ': ' +
  //       nutrientList.NIA.toString() +
  //       ' ' +
  //       NutrientUnit['NIA']);

  // if (nutrientList.P != -1)
  //   listOfNutrients.add(NutrientName['P'] +
  //       ': ' +
  //       nutrientList.P.toString() +
  //       ' ' +
  //       NutrientUnit['P']);

  // if (nutrientList.RIBF != -1)
  //   listOfNutrients.add(NutrientName['RIBF'] +
  //       ': ' +
  //       nutrientList.RIBF.toString() +
  //       ' ' +
  //       NutrientUnit['RIBF']);

  // if (nutrientList.THIA != -1)
  //   listOfNutrients.add(NutrientName['THIA'] +
  //       ': ' +
  //       nutrientList.THIA.toString() +
  //       ' ' +
  //       NutrientUnit['THIA']);

  // if (nutrientList.TOCPHA != -1)
  //   listOfNutrients.add(NutrientName['TOCPHA'] +
  //       ': ' +
  //       nutrientList.TOCPHA.toString() +
  //       ' ' +
  //       NutrientUnit['TOCPHA']);

  // if (nutrientList.VITA_RAE != -1)
  //   listOfNutrients.add(NutrientName['VITA_RAE'] +
  //       ': ' +
  //       nutrientList.VITA_RAE.toString() +
  //       ' ' +
  //       NutrientUnit['VITA_RAE']);

  // if (nutrientList.VITB12 != -1)
  //   listOfNutrients.add(NutrientName['VITB12'] +
  //       ': ' +
  //       nutrientList.VITB12.toString() +
  //       ' ' +
  //       NutrientUnit['VITB12']);

  // if (nutrientList.VITB6A != -1)
  //   listOfNutrients.add(NutrientName['VITB6A'] +
  //       ': ' +
  //       nutrientList.VITB6A.toString() +
  //       ' ' +
  //       NutrientUnit['VITB6A']);

  // if (nutrientList.VITD != -1)
  //   listOfNutrients.add(NutrientName['VITD'] +
  //       ': ' +
  //       nutrientList.VITD.toString() +
  //       ' ' +
  //       NutrientUnit['VITD']);

  // if (nutrientList.VITK1 != -1)
  //   listOfNutrients.add(NutrientName['VITK1'] +
  //       ': ' +
  //       nutrientList.VITK1.toString() +
  //       ' ' +
  //       NutrientUnit['VITK1']);

  if (listOfNutrients.isEmpty) throw Exception('Nothing in NutrientList');
  return listOfNutrients;
}
