unit Unit_SD_TP06_EXSUPP01;

interface

  type
  TData = record
    val : Integer;
  end;

  PItem = ^TItem;

  TItem = record
    data : TData;
    pPrec : PItem;
    pSuiv : PItem;
  end;

  TRing = record
    pDeb : PItem;
    pCour : PItem;
    pFin : PItem;
    nb : Integer;
  end;

  procedure init(var r : TRing);

  function estVide(r : TRing): Boolean;


implementation

  procedure init(var r : TRing);
  begin
    r.pDeb := NIL;
    r.pCour := NIL;
    r.pFin := NIL;
    r.nb := 0;
  end;

  function estVide(r : TRing): Boolean;
  begin
    estVide := (r.pDeb = NIL) OR (r.pFin = NIL);
  end;

  procedure affData(e : TData);
  begin
    writeln(e.val);
  end;

  procedure affiche(r : TRing);
  var
    i : Integer;
  begin
    if estVide(r) then
    begin
      writeln('La liste est vide.');
    end
    else
    begin
      r.pCour := r.pDeb;
      for i := 1 to r.nb do
      begin
        affData(r.pCour^.data);
        r.pCour := r.pCour^.pSuiv;
      end;
    end;
  end;

end.
