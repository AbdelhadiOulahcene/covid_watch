import 'package:flutter/cupertino.dart';

abstract class Articleab{
  final String imagePath;
  final String title;
  final String core;
  final String details;

  Articleab(this.imagePath, this.title, this.core, this.details);
}
class Article extends Articleab{
  Article(String imagePath, String title, String core, String details) : super(imagePath, title, core, details);
}
final articles=[
  Article("assets/images/viruz.png","La découverte du virus","Rage, variole, fièvre jaune, dengue, poliomyélite, grippe, Sida, la liste des maladies virales se lit comme un catalogue de la misère humaine","Les virus occupent une étrange position, entre vivant et non-vivant. Ils ne possèdent pas toute la machinerie moléculaire nécessaire à leur propre reproduction, et doivent détourner le fonctionnement des cellules de leur hôte (animal, plante, champignon ou bactérie) de manière à leur faire fabriquer de nombreuses copies virales. Certains virus peuvent entraîner leurs cellules hôtes dans une multiplication non contrôlée, source de cancer. Nous savons aujourd'hui que la plupart des virus sont trop petits pour être observés au microscope ordinaire, la taille moyenne des virus étant environ le centième de celle des bactéries. Les virions (particules virales) consistent en matériel génétique sous forme d'ADN ou d'ARN et d'une enveloppe protéique externe."),
  Article("assets/images/viruz.png","La découverte du virus","Rage, variole, fièvre jaune, dengue, poliomyélite, grippe, Sida, la liste des maladies virales se lit comme un catalogue de la misère humaine","Les virus occupent une étrange position, entre vivant et non-vivant. Ils ne possèdent pas toute la machinerie moléculaire nécessaire à leur propre reproduction, et doivent détourner le fonctionnement des cellules de leur hôte (animal, plante, champignon ou bactérie) de manière à leur faire fabriquer de nombreuses copies virales. Certains virus peuvent entraîner leurs cellules hôtes dans une multiplication non contrôlée, source de cancer. Nous savons aujourd'hui que la plupart des virus sont trop petits pour être observés au microscope ordinaire, la taille moyenne des virus étant environ le centième de celle des bactéries. Les virions (particules virales) consistent en matériel génétique sous forme d'ADN ou d'ARN et d'une enveloppe protéique externe."),
  Article("assets/images/viruz.png","La découverte du virus","Rage, variole, fièvre jaune, dengue, poliomyélite, grippe, Sida, la liste des maladies virales se lit comme un catalogue de la misère humaine","Les virus occupent une étrange position, entre vivant et non-vivant. Ils ne possèdent pas toute la machinerie moléculaire nécessaire à leur propre reproduction, et doivent détourner le fonctionnement des cellules de leur hôte (animal, plante, champignon ou bactérie) de manière à leur faire fabriquer de nombreuses copies virales. Certains virus peuvent entraîner leurs cellules hôtes dans une multiplication non contrôlée, source de cancer. Nous savons aujourd'hui que la plupart des virus sont trop petits pour être observés au microscope ordinaire, la taille moyenne des virus étant environ le centième de celle des bactéries. Les virions (particules virales) consistent en matériel génétique sous forme d'ADN ou d'ARN et d'une enveloppe protéique externe."),
  Article("assets/images/viruz.png","La découverte du virus","Rage, variole, fièvre jaune, dengue, poliomyélite, grippe, Sida, la liste des maladies virales se lit comme un catalogue de la misère humaine","Les virus occupent une étrange position, entre vivant et non-vivant. Ils ne possèdent pas toute la machinerie moléculaire nécessaire à leur propre reproduction, et doivent détourner le fonctionnement des cellules de leur hôte (animal, plante, champignon ou bactérie) de manière à leur faire fabriquer de nombreuses copies virales. Certains virus peuvent entraîner leurs cellules hôtes dans une multiplication non contrôlée, source de cancer. Nous savons aujourd'hui que la plupart des virus sont trop petits pour être observés au microscope ordinaire, la taille moyenne des virus étant environ le centième de celle des bactéries. Les virions (particules virales) consistent en matériel génétique sous forme d'ADN ou d'ARN et d'une enveloppe protéique externe."),
  Article("assets/images/viruz.png","La découverte du virus","Rage, variole, fièvre jaune, dengue, poliomyélite, grippe, Sida, la liste des maladies virales se lit comme un catalogue de la misère humaine","Les virus occupent une étrange position, entre vivant et non-vivant. Ils ne possèdent pas toute la machinerie moléculaire nécessaire à leur propre reproduction, et doivent détourner le fonctionnement des cellules de leur hôte (animal, plante, champignon ou bactérie) de manière à leur faire fabriquer de nombreuses copies virales. Certains virus peuvent entraîner leurs cellules hôtes dans une multiplication non contrôlée, source de cancer. Nous savons aujourd'hui que la plupart des virus sont trop petits pour être observés au microscope ordinaire, la taille moyenne des virus étant environ le centième de celle des bactéries. Les virions (particules virales) consistent en matériel génétique sous forme d'ADN ou d'ARN et d'une enveloppe protéique externe."),
  Article("assets/images/viruz.png","La découverte du virus","Rage, variole, fièvre jaune, dengue, poliomyélite, grippe, Sida, la liste des maladies virales se lit comme un catalogue de la misère humaine","Les virus occupent une étrange position, entre vivant et non-vivant. Ils ne possèdent pas toute la machinerie moléculaire nécessaire à leur propre reproduction, et doivent détourner le fonctionnement des cellules de leur hôte (animal, plante, champignon ou bactérie) de manière à leur faire fabriquer de nombreuses copies virales. Certains virus peuvent entraîner leurs cellules hôtes dans une multiplication non contrôlée, source de cancer. Nous savons aujourd'hui que la plupart des virus sont trop petits pour être observés au microscope ordinaire, la taille moyenne des virus étant environ le centième de celle des bactéries. Les virions (particules virales) consistent en matériel génétique sous forme d'ADN ou d'ARN et d'une enveloppe protéique externe."),
];