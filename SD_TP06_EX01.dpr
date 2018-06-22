program SD_TP06_EX01;

{$APPTYPE CONSOLE}

{$R *.res}

uses                   //Pile
  System.SysUtils,
  Unit_SD_TP06_EX01 in 'Unit_SD_TP06_EX01.pas';

Var
  p : TPile;
  cpt : Integer;
  nb : Integer;
  valeur : TData;
  res : Boolean;
  valeurContenue : TData;

begin

  valeurContenue.val := -1;

  init(p);

  writeln('Est-ce que la pile est vide?');

  if estVide(p)= True then
  begin
    writeln('Oui, la pile est vide.');
  end
  else
  begin
    writeln('Non, la pile n''est pas vide.');
  end;

  writeln('Combien de valeur souhaitez-vous ajouter à la pile?');
  readln(nb);

  for cpt := 1 to nb do
  begin
    writeln('Saisir la valeur :');
    readln(valeur.val);
    empile(p, valeur);
  end;

  sommet(p, valeurContenue, res);
  if res = True then
  begin
    writeln('La valeur du sommet de cette pile est : ', valeurContenue.val);
  end
  else
  begin
    writeln('Il n''y a pas de sommet car la pile est vide.');
  end;

  depile(p, valeurContenue, res);
  writeln('La valeur supprimée au sommet de la pile est : ', valeurContenue.val);
  if res = True then
  begin
    sommet(p, valeurContenue, res);
    writeln('La valeur du nouveau sommet de cette pile est : ', valeurContenue.val);
  end
  else
  begin
    writeln('On ne peut pas depiler une pile vide.');
  end;

  writeln(chr(10));

  writeln('Le contenue de la pile :');
  affiche(p);

  writeln('Le fichier a été sauvegardé');
  sauvegarde(p);

  //lireFichier();

  charge('dataTItem');

  affiche(charge('dataTItem.bin'));

  readln;

end.
