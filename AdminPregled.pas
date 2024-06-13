unit AdminPregled;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.ListView.Types, FMX.ListView, Data.DB, FireDAC.Comp.Client, Unit2,
  FMX.ListView.Appearances, FMX.ListView.Adapters.Base, FMX.Ani, FMX.DialogService;

type
  TPregled = class(TForm)
    ListView1: TListView;
    procedure ListView1Change(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ListView1ItemClick(const Sender: TObject;
      const AItem: TListViewItem);
  private

  public
    { Public declarations }
  end;

var
  Pregled: TPregled;

implementation

{$R *.fmx}

procedure TPregled.FormShow(Sender: TObject);
var
  ListItem: TListViewItem;
begin
  ListView1.Items.Clear;

  try
    // Kreiranje i konfiguracija upita
    dbconn.FDQuery1.Close;
    dbconn.FDQuery1.SQL.Text := 'SELECT PorudzbineID, NazivUsluge, Datum, VremeTrajanja, Ime, Prezime, BrLicneKarte, Email, BrojStanja FROM Porudzbine';

    // Otvaranje upita i čitanje podataka
    dbconn.FDQuery1.Open;
    dbconn.FDQuery1.First;
    while not dbconn.FDQuery1.Eof do
    begin
      // Dodavanje stavki u ListView
      ListItem := ListView1.Items.Add;
      ListItem.Text := dbconn.FDQuery1.FieldByName('NazivUsluge').AsString;
      ListItem.Detail := Format('Datum: %s, Trajanje: %s, Ime: %s, Prezime: %s, BrLicneKarte: %s, Email: %s, BrojStanja: %s',
        [dbconn.FDQuery1.FieldByName('Datum').AsString,
         dbconn.FDQuery1.FieldByName('VremeTrajanja').AsString,
         dbconn.FDQuery1.FieldByName('Ime').AsString,
         dbconn.FDQuery1.FieldByName('Prezime').AsString,
         dbconn.FDQuery1.FieldByName('BrLicneKarte').AsString,
         dbconn.FDQuery1.FieldByName('Email').AsString,
         dbconn.FDQuery1.FieldByName('BrojStanja').AsString]);

      // Sačuvaj PorudzbineID u Tag
      ListItem.TagString := dbconn.FDQuery1.FieldByName('PorudzbineID').AsString;

      dbconn.FDQuery1.Next;
    end;
  except
    on E: Exception do
    begin
      // Prikaz greške ako dođe do izuzetka
      ShowMessage('Greška prilikom dohvatanja podataka: ' + E.Message);
    end;
  end;
end;

procedure TPregled.ListView1Change(Sender: TObject);
begin
  // Implementacija ove metode, ako je potrebno
end;

procedure TPregled.ListView1ItemClick(const Sender: TObject; const AItem: TListViewItem);
var
  Details, PorudzbineID: string;
begin
  // Dobijanje ID porudžbine iz Tag svojstva odabrane stavke
  PorudzbineID := AItem.TagString;

  // Dobijanje detalja porudžbine iz odabrane stavke
  Details := AItem.Text + #13#10 + AItem.Detail;

  // Prikazivanje detalja u dijalog prozoru sa dugmadima "Ok" i "Obriši"
  TDialogService.MessageDialog(
    'Detalji porudžbine: ' + Details,
    TMsgDlgType.mtConfirmation,
    [TMsgDlgBtn.mbOK, TMsgDlgBtn.mbCancel],
    TMsgDlgBtn.mbOK, // Default button
    0, // Help context
    procedure(const AResult: TModalResult)
    begin
      if AResult = mrCancel then
      begin
        // Implementacija ako korisnik klikne "Obriši"
        try
          // Izvršavanje upita za brisanje porudžbine iz baze
          dbconn.FDQuery1.Close;
          dbconn.FDQuery1.SQL.Text := 'DELETE FROM Porudzbine WHERE PorudzbineID = :ID';
          dbconn.FDQuery1.ParamByName('ID').AsString := PorudzbineID;
          dbconn.FDQuery1.ExecSQL;

          // Osvežavanje prikaza porudžbina
          FormShow(Sender);
        except
          on E: Exception do
          begin
            // Prikazivanje greške ako dođe do izuzetka
            ShowMessage('Greška prilikom brisanja porudžbine: ' + E.Message);
          end;
        end;
      end;
    end
  );
end;

end.

