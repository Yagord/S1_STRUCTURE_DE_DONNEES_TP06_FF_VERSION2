unit Unit_SD_TP06_EX02;

interface

  Type
    PCellule = ^Cellule;

    Cellule = record
      cadeau : String;
      prenom : String;
      prix : Real;
      precedent : PCellule;
      suivant : PCellule;
    end;

    Liste = record
      pDeb : PCellule;
      pCour : PCellule;
      pFin : PCellule;
    end;

  Procedure ajoutDebutListe(var l : Liste; cadeau : String; prenom : String; prix : Real);

  Procedure ajoutFinListe(var l : Liste; cadeau : String; prenom : String; prix : Real);

  Procedure afficheOrdre(l : Liste);

  Procedure afficheOrdreInverse(l : Liste);

  Function estContenu(l : liste; prenom : String) : PCellule;

  Procedure supprimeCadeau(var l : liste; prenom : String);


implementation

  Procedure ajoutDebutListe(var l : Liste; cadeau : String; prenom : String; prix : Real);

  Var
    p, r : PCellule;

  begin
    new(p);
    p^.cadeau := cadeau;
    p^.prenom := prenom;
    p^.prix := prix;
    p^.precedent :=  NIL;
    p^.suivant := l.pDeb;
    l.pDeb := p;
    l.pCour := p;
    if (l.pFin=NIL) then  //Si la liste est vide.
    begin
    l.pFin := p
    end
    else   //Sinon
    begin
    (p^.suivant)^.precedent := p;
    end;

  end;

  Procedure ajoutFinListe(var l : Liste; cadeau : String; prenom : String; prix : Real);

  Var
    p, r : PCellule;

  begin
    new(p);
    p^.cadeau := cadeau;
    p^.prenom := prenom;
    p^.prix := prix;
    p^.precedent :=  l.pFin;
    p^.suivant := NIL;
    l.pCour := p;
    l.pFin := p;
    if (l.pFin=NIL) then  //Si la liste est vide.
    begin
    l.pDeb := p
    end
    else   //Sinon
    begin
    (p^.precedent)^.suivant := p;
    end;

  end;

  Procedure afficheOrdre(l : Liste);

  begin
    l.pCour := l.pDeb;

    while (l.pCour <> NIL) do
    begin
      writeln((l.pCour)^.cadeau);
      writeln((l.pCour)^.prenom);
      writeln((l.pCour)^.prix);
      l.pCour := (l.pCour)^.suivant;
    end;
  end;

  Procedure afficheOrdreInverse(l : Liste);

    begin
    l.pCour := l.pFin;

    while (l.pCour <> NIL) do
    begin
      writeln((l.pCour)^.cadeau);
      writeln((l.pCour)^.prenom);
      writeln((l.pCour)^.prix);
      l.pCour := (l.pCour)^.precedent;
    end;
  end;

  Function estContenu(l : liste; prenom : String) : PCellule;

  Var
    fini : Boolean;
    adresse : PCellule;

  begin
    fini := False;
    l.pCour := l.pDeb;

    while (fini = False) do
    begin

      if l.pCour = NIL then
      begin
        fini := True;
        adresse := NIL;
      end

      else
      begin
        if (l.pCour)^.prenom = prenom then
        begin
          fini := True;
          adresse := l.pCour;
        end
        else
        begin
          l.pCour := (l.pCour)^.suivant;
        end;
      end;

    end;

    Result := adresse;

  end;

  Procedure supprimeCadeau(var l : liste; prenom : String);

  Var
    fini : Boolean;
    p, r : PCellule;

  begin
    fini := False;
    l.pCour := l.pDeb;

    while (fini = False) do
    begin

      if l.pCour = NIL then
      begin
        fini := True;
        writeln('Le prenom n''est pas dans la liste');
      end

      else
      begin
        if (l.pCour)^.prenom = prenom then
        begin
          fini := True;
          if l.pCour = l.pDeb then
          begin
            (l.pCour)^.precedent := NIL;
          end
          else if l.pCour = l.pFin then
          begin
            (l.pCour)^.suivant := NIL;
            l.pCour := l.pDeb;
          end
          else
          begin
            {p := (l.pCour)^.precedent;
            r := (l.pCour)^.suivant;
            r.precedent := p;
            r.suivant := r;
            dispose(l.pDeb);
            l.pCour := l.pDeb; }
          end;
          dispose(l.pCour);
        end
        else
        begin
          l.pCour := (l.pCour)^.suivant;
        end;
      end;

    end;

  end;


end.
