import 'package:flutter/material.dart';

class NutrientList {
  final double ENERC_KCAL; //Energy | kcal
  final double FAT; //Total Fat | g
  final double FASAT; //Saturated Fat | g
  final double FATRN; //Trans Fat | g
  final double FAMS; //Monounsaturated Fat | g
  final double FAPU; //Polyunsaturated Fat | g
  final double CHOCDF; //Carbs | g
  final double FIBTG; //Fiber | g
  final double SUGAR; //Sugar | g
  final double PROCNT; //Protein | g
  final double CHOLE; //Cholesterol | mg
  final double NA; //Sodium | mg
  final double CA; //Calcium | mg
  final double K; //Potassium | mg
  final double FE; //Iron | mg
  final double VITC; //Vitamin C | mg
  final double FOLDFE; //Folate | aeg
  final double MG; //Magnesium | mg
  final double NIA; //Niacin | mg
  final double P; //Phosphorus | mg
  final double RIBF; //Ribofalvin | mg
  final double THIA; //Thiamin | mg
  final double TOCPHA; //Vitamin E | aeg
  final double VITA_RAE; //Vitamin A | aeg
  final double VITB12; //Vitamin B12 | aeg
  final double VITB6A; //Vitamin B6 | mg
  final double VITD; //Vitamin D | aeg
  final double VITK1; //Vitamin K | aeg

  NutrientList(
      {@required this.ENERC_KCAL,
      @required this.FAT,
      @required this.FASAT,
      @required this.FATRN,
      @required this.FAMS,
      @required this.FAPU,
      @required this.CHOCDF,
      @required this.FIBTG,
      @required this.SUGAR,
      @required this.PROCNT,
      @required this.CHOLE,
      @required this.NA,
      @required this.CA,
      @required this.K,
      @required this.FE,
      @required this.VITC,
      @required this.FOLDFE,
      @required this.MG,
      @required this.NIA,
      @required this.P,
      @required this.RIBF,
      @required this.THIA,
      @required this.TOCPHA,
      @required this.VITA_RAE,
      @required this.VITB12,
      @required this.VITB6A,
      @required this.VITD,
      @required this.VITK1});

  factory NutrientList.fromJson(Map<String, dynamic> json) {
    return NutrientList(
        ENERC_KCAL: json['hints'][0]['food']['nutrients']['ENERC_KCAL'] ?? -1,
        FAT: json['hints'][0]['food']['nutrients']['FAT'] ?? -1,
        FASAT: json['hints'][0]['food']['nutrients']['FASAT'] ?? -1,
        FATRN: json['hints'][0]['food']['nutrients']['FATRN'] ?? -1,
        FAMS: json['hints'][0]['food']['nutrients']['FAMS'] ?? -1,
        FAPU: json['hints'][0]['food']['nutrients']['FAPU'] ?? -1,
        CHOCDF: json['hints'][0]['food']['nutrients']['CHOCDF'] ?? -1,
        FIBTG: json['hints'][0]['food']['nutrients']['FIBTG'] ?? -1,
        SUGAR: json['hints'][0]['food']['nutrients']['SUGAR'] ?? -1,
        PROCNT: json['hints'][0]['food']['nutrients']['PROCNT'] ?? -1,
        CHOLE: json['hints'][0]['food']['nutrients']['CHOLE'] ?? -1,
        NA: json['hints'][0]['food']['nutrients']['NA'] ?? -1,
        CA: json['hints'][0]['food']['nutrients']['CA'] ?? -1,
        K: json['hints'][0]['food']['nutrients']['K'] ?? -1,
        FE: json['hints'][0]['food']['nutrients']['FE'] ?? -1,
        VITC: json['hints'][0]['food']['nutrients']['VITC'] ?? -1,
        FOLDFE: json['hints'][0]['food']['nutrients']['FOLDFE'] ?? -1,
        MG: json['hints'][0]['food']['nutrients']['MG'] ?? -1,
        NIA: json['hints'][0]['food']['nutrients']['NIA'] ?? -1,
        P: json['hints'][0]['food']['nutrients']['P'] ?? -1,
        RIBF: json['hints'][0]['food']['nutrients']['RIBF'] ?? -1,
        THIA: json['hints'][0]['food']['nutrients']['THIA'] ?? -1,
        TOCPHA: json['hints'][0]['food']['nutrients']['TOCPHA'] ?? -1,
        VITA_RAE: json['hints'][0]['food']['nutrients']['VITA_RAE'] ?? -1,
        VITB12: json['hints'][0]['food']['nutrients']['VITB12'] ?? -1,
        VITB6A: json['hints'][0]['food']['nutrients']['VITB6A'] ?? -1,
        VITD: json['hints'][0]['food']['nutrients']['VITD'] ?? -1,
        VITK1: json['hints'][0]['food']['nutrients']['VITK1'] ?? -1);
  }
}

var NutrientUnit = {
  'ENERC_KCAL': 'kcal',
  'FAT': 'g',
  'FASAT': 'g',
  'FATRN': 'g',
  'FAMS': 'g',
  'FAPU': 'g',
  'CHOCDF': 'g',
  'FIBTG': 'g',
  'SUGAR': 'g',
  'PROCNT': 'g',
  'CHOLE': 'mg',
  'NA': 'mg',
  'CA': 'mg',
  'K': 'mg',
  'FE': 'mg',
  'VITC': 'mg',
  'FOLDFE': 'aeg',
  'MG': 'mg',
  'NIA': 'mg',
  'P': 'mg',
  'RIBF': 'mg',
  'THIA': 'mg',
  'TOCPHA': 'aeg',
  'VITA_RAE': 'aeg',
  'VITB12': 'aeg',
  'VITB6A': 'mg',
  'VITD': 'aeg',
  'VITK1': 'aeg',
};

var NutrientName = {
  'ENERC_KCAL': 'Energy',
  'FAT': 'Total Fat',
  'FASAT': 'Saturated Fat',
  'FATRN': 'Trans Fat',
  'FAMS': 'Monounsaturated Fat',
  'FAPU': 'Polyunsaturated Fat',
  'CHOCDF': 'Carbs',
  'FIBTG': 'Fiber',
  'SUGAR': 'Sugar',
  'PROCNT': 'Protien',
  'CHOLE': 'Cholesterol',
  'NA': 'Sodium',
  'CA': 'Calcium',
  'K': 'Potassium',
  'FE': 'Iron',
  'VITC': 'Vitamin C',
  'FOLDFE': 'Folate',
  'MG': 'Magnesium',
  'NIA': 'Niacin',
  'P': 'Phosphorus',
  'RIBF': 'Ribofalvin',
  'THIA': 'Thamin',
  'TOCPHA': 'Vitamin E',
  'VITA_RAE': 'Vitamin A',
  'VITB12': 'Vitamin B12',
  'VITB6A': 'Vitamin B6',
  'VITD': 'Vitamin D',
  'VITK1': 'Vitamin K',
};
