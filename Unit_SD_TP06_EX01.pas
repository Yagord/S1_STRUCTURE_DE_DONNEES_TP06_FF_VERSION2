unit Unit_SD_TP06_EX01;

interface

  type

    TData = record
      val : Integer;
    end;

    PItem = ^TItem;

    TItem = record
      data : TData;
      pSuiv : PItem;
    end;

    TPile = record
      pSommet : PItem;
      nb : Integer;
    end;

    TFile = file of TData;

    procedure init(var p : TPile);

    function estVide(p : TPile) : Boolean;

    procedure affiche(p : TPile);

    procedure empile(var p : TPile; e : TData);

    procedure sommet(p : TPile; var e : TData; var b : Boolean);

    procedure depile(var p : TPile; var e : TData; var b : Boolean);

    procedure sauvegarde(p : TPile);

    procedure lireFichier();

    function charge(nom : String): TPile;

implementation

  procedure init(var p : TPile);
  begin
    p.nb := 0;
    p.pSommet := NIL;
  end;

  function estVide(p : TPile) : Boolean;
  begin
    estVide := (p.pSommet = NIL);
  end;

  procedure affData(e : TData);
  begin
    writeln(e.val);
  end;

  procedure affiche(p : TPile);
  var
    pCour : PItem;
  begin
    pCour := p.pSommet;
    while (pCour <> NIL) do
    begin
      affData((pCour^).data);
      pCour := (pCour^).pSuiv;
    end;
  end;

  procedure empile(var p : TPile; e : TData);
  var
    pTemp : PItem;
  begin
    new(pTemp);
    pTemp^.data := e;
    pTemp^.pSuiv := p.pSommet;
    p.nb := p.nb + 1;
    p.pSommet := pTemp;
  end;

  procedure sommet(p : TPile; var e : TData; var b : Boolean);
  begin
    if (estVide(p)) then
    begin
      b := False;
    end
    else
    begin
      b := True;
      e := (p.pSommet^).data;
    end;
  end;

  procedure depile(var p : TPile; var e : TData; var b : Boolean);
  var
    pTemp : PItem;
  begin
    if (estVide(p)) then
    begin
      b := False;
    end
    else
    begin
      b := True;
      e := (p.pSommet^).data;
      pTemp := p.pSommet;
      p.nb := p.nb - 1;
      p.pSommet := (pTemp^).pSuiv;
      dispose(pTemp);
    end;
  end;

  procedure sauvegarde(p : TPile);
  var
    f : TFile;
    pCour : PItem;
  begin
    assign(f,'dataTItem.bin');
    rewrite(f);
    pCour := p.pSommet;
    while pCour <> NIL do
    begin
      write(f, (pCour^).data);
      pCour := (pCour^).pSuiv;
    end;
    close(f);
  end;

  procedure lireFichier();
  var
    e : TData;
    f : TFile;
  begin
    assign(f,'dataTItem.bin');
    reset(f);
    while not eof(f) do begin
      read(f, e);
      affData(e);
    end;
  end;

  function charge(nom : String): TPile;
  var
    e : TData;
    f : TFile;
    p : TPile;
  begin
    assign(f, 'dataTItem.bin');
    reset(f);
    init(p);
    while not eof(f) do
    begin
      read(f, e);
      empile(p, e);
    end;
    charge := p;
  end;

end.
