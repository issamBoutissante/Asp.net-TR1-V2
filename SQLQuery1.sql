create database DataBaseTR1V2BoutissanteIssam
go
use DataBaseTR1V2BoutissanteIssam
go
create table Ville(
Id_ville int primary key,
Nom_Ville varchar(30),
Pays varchar(30)
)
create table Volontaire(
Id_Vlt int primary key,
Nom_Vlt varchar(30),
Prenom_Vlt varchar(30),
Mail varchar(60),
Mot_Passe varchar(30),
Id_Ville int,
Actif bit,
constraint fk_id_Ville_Volontaire_Ville foreign key(Id_Ville) references Ville(Id_ville)
)
create table Association(
Id_Ass int primary key,
Nam_Ass varchar(30),
RaisonSocial varchar(10),
Adresse varchar(30),
Telephone varchar(10),
Id_Ville int,
constraint fk_Id_ville_Association_Ville foreign key(Id_Ville) references Ville(Id_Ville)
)
create table Stage(
Id_Stage int primary key,
Date_Debut date,
Date_Fin date,
Id_Ass int,
constraint fk_Id_Ass_Stage_Association foreign key(Id_Ass) references Association(Id_Ass)
)
create table Demande_Inscription(
Id_Inscription int primary key identity(1,1),
Date_Demande date,
Id_Vlt int,
Id_Stage int,
Etat varchar(20) check(Etat='En attente' or Etat='Valide' or Etat='refusé' or Etat='accepté'),
constraint fk_Id_Vlt_Demande_Inscription_Volontaire foreign key(Id_Vlt) references Volontaire(Id_Vlt),
constraint fk_Id_Stage_Demade_Inscription_Stage foreign key(Id_Stage) references Stage(Id_Stage)
)
