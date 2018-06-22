program SD_TP06_EX02;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  Unit_SD_TP06_EX02 in 'Unit_SD_TP06_EX02.pas';

Var
  l : Liste;
  cadeau : String;
  prenom : String;
  prix : Real;
  nb : Integer;
  i : Integer;

begin

  {writeln('Saisir le nombre de valeurs à entrée au début de la liste doublement chaines :');
  readln(nb);

  for i := 1 to nb do
  begin
    writeln('Saisir un cadeau :');
    readln(cadeau);
    writeln('Saisir un prenom :');
    readln(prenom);
    writeln('Saisir un prix :');
    readln(prix);
    ajoutDebutListe(l, cadeau, prenom, prix);
  end;

  writeln(chr(10));

  writeln('Saisir le nombre de valeurs à entrée à la fin de la liste doublement chaines :');
  readln(nb);

  for i := 1 to nb do
  begin
    writeln('Saisir un cadeau :');
    readln(cadeau);
    writeln('Saisir un prenom :');
    readln(prenom);
    writeln('Saisir un prix :');
    readln(prix);
    ajoutFinListe(l, cadeau, prenom, prix);
  end;

  writeln(chr(10));

  writeln('Le contenu de la liste dans l''ordre est :');
  afficheOrdre(l);

  writeln(chr(10));

  writeln('Le contenu de la liste dans l''ordre inverse est :');
  afficheOrdreInverse(l);}

  ajoutDebutListe(l, 'bijou', 'pn', 45);
  ajoutDebutListe(l, 'livre', 'lo', 45);

  {writeln('Saisir un prenom dont on souhaite connaitre le cadeau :');
  readln(prenom);
  if estContenu(l, prenom) = NIL then
  begin
    writeln('Ce prenom n''est pas dans la liste.');
  end
  else
  begin
    writeln('Ce prenom est dans la liste.');
  end;}

  afficheOrdre(l);

   writeln(chr(10));

  supprimeCadeau(l, 'pn');

  afficheOrdre(l);

  readln;

end.
