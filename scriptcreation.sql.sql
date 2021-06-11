create database DataBaseTR1V2BoutissanteIssam
go
use DataBaseTR1V2BoutissanteIssam
go
--Ville(Id_ville ,Nom_Ville ,Pays)
create table Ville(
Id_ville int primary key,
Nom_Ville varchar(30),
Pays varchar(30)
)
insert into Ville values(1,'Marrakech','Maroc')
insert into Ville values(2,'Casablanca','Maroc')
--Volontaire(Id_Vlt, Nom_Vlt,Prenom_Vlt,Mail,Mot_Passe,#Id_Ville,Actif)
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
insert into Volontaire values(1,'Boutissante','Issam','Boutissante.issam.dev@gmail.com','issam1234',1,1)
insert into Volontaire values(2,'Mazzouz','Chaimae','Mazzouz.chaimae.dev@gmail.com','chaimae1234',1,1)

--Association (Id_Ass,Nàm_Ass,RaisonSocial,Adresse,Telephone,#Id_Ville)
create table Association(
Id_Ass int primary key,
Nam_Ass varchar(30),
RaisonSocial varchar(10),
Adresse varchar(30),
Telephone varchar(10),
Id_Ville int,
constraint fk_Id_ville_Association_Ville foreign key(Id_Ville) references Ville(Id_Ville)
)
insert into Association values(1,'dotNetNinja','SARL','rue.marrakech','0523423423',1)
insert into Association values(2,'TraversyMedia','SARL','rue.casablanca','0523423433',2)
--Stage (Id_Stage,Date_Debut,Date_Fin,#Id_Ass)
create table Stage(
Id_Stage int primary key,
Date_Debut date,
Date_Fin date,
Id_Ass int,
constraint fk_Id_Ass_Stage_Association foreign key(Id_Ass) references Association(Id_Ass)
)
insert into Stage values(2,GETDATE(),DATEADD(YEAR,1,GETDATE()),1)
insert into Stage values(1,GETDATE(),DATEADD(YEAR,1,GETDATE()),2)
--Demande_Inscription (Id_Inscription,Date_Demande,#Id_Vlt,#Id_Stage,Etat)
create table Demande_Inscription(
Id_Inscription int primary key identity(1,1),
Date_Demande date,
Id_Vlt int,
Id_Stage int,
Etat varchar(20) check(Etat='En attente' or Etat='Valide' or Etat='refusé' or Etat='accepté'),
constraint fk_Id_Vlt_Demande_Inscription_Volontaire foreign key(Id_Vlt) references Volontaire(Id_Vlt),
constraint fk_Id_Stage_Demade_Inscription_Stage foreign key(Id_Stage) references Stage(Id_Stage)
)
insert into Demande_Inscription values(DATEADD(DAY,12,GETDATE()),2,1,'Valide')
insert into Demande_Inscription values(GETDATE(),1,1,'En attente')
