unit ZakaziTermin;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Colors,
  FMX.Objects, FMX.Controls.Presentation, FMX.StdCtrls, FMX.Ani, FMX.Edit, Unit2,
  FMX.ListBox, FireDAC.Comp.Client, FireDAC.Stan.Def, FireDAC.Stan.Async, FireDAC.Stan.Pool, FireDAC.Phys, FireDAC.DApt, Data.DB, FireDAC.Phys.SQLite;

type
  TZakazi = class(TForm)
    RectAnimation1: TRectAnimation;
    Rectangle1: TRectangle;
    Button1: TButton;
    Image1: TImage;
    Rectangle2: TRectangle;
    ComboBox1: TComboBox;
    ComboBox3: TComboBox;
    ComboBox4: TComboBox;
    Edit1: TEdit;
    Button5: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Rectangle3: TRectangle;
    Label4: TLabel;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit2: TEdit;
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button5Click(Sender: TObject);



  private
    { Private declarations }
    FSelectedTermin: string;


  public
    { Public declarations }
    property SelectedTermin: string read FSelectedTermin write FSelectedTermin;
  end;

var
  Zakazi: TZakazi;

implementation

{$R *.fmx}
uses pocetna;

procedure TZakazi.Button1Click(Sender: TObject);
begin
  pocetnastrana.Show;
  self.Hide;
end;



procedure TZakazi.Button5Click(Sender: TObject);
begin
var
  Query: TFDQuery;
begin
  Query := TFDQuery.Create(nil);
  Query.Connection := dbconn.FDConnection1;
  try
     Query.SQL.Text := 'INSERT INTO Porudzbine (NazivUsluge, Datum, VremeTrajanja, Ime, Prezime, BrLicneKarte, Email, BrojStanja) ' +
                      'VALUES (:NazivUsluge, :Datum, :VremeTrajanja, :Ime, :Prezime, :BrLicneKarte, :Email, :BrojStanja)';
    Query.ParamByName('NazivUsluge').AsString := ComboBox1.Selected.Text;
    Query.ParamByName('Datum').AsString := ComboBox3.selected.Text;
    Query.ParamByName('VremeTrajanja').AsString := ComboBox4.Selected.Text;
    Query.ParamByName('Ime').AsString := Edit4.Text;
    Query.ParamByName('Prezime').AsString := Edit5.Text;
    Query.ParamByName('BrLicneKarte').AsString := Edit6.Text;
    Query.ParamByName('Email').AsString := Edit1.Text;
   Query.ParamByName('BrojStanja').AsString := Edit2.Text	;
    Query.ExecSQL;
    ShowMessage('Podaci su uspešno sačuvani.');
  finally
    Query.Free;
  end;
end;
end;

procedure TZakazi.FormShow(Sender: TObject);
begin
var
  Query: TFDQuery;
begin
  // Kreirajte upit
  Query := TFDQuery.Create(nil);
  Query.Connection := dbconn.FDConnection1	; // Postavite konekciju na vašu bazu podataka
  try
    // Izvršite upit za izvlačenje podataka iz tabele "Termini"
    Query.SQL.Text := 'SELECT SlobodniTermini FROM Termini';
    Query.Open;
    // Prođite kroz rezultat upita i dodajte vrednosti u ComboBox
    while not Query.Eof do
    begin
      ComboBox3.Items.Add(Query.FieldByName('SlobodniTermini').AsString);
      Query.Next;
    end;
  finally
    Query.Free;
  end;
end;
begin
  // Kreirajte upit
  Query := TFDQuery.Create(nil);
  Query.Connection := dbconn.FDConnection1	; // Postavite konekciju na vašu bazu podataka
  try
    // Izvršite upit za izvlačenje podataka iz tabele "Termini"
    Query.SQL.Text := 'SELECT Naziv FROM O_Uslugama';
    Query.Open;
    // Prođite kroz rezultat upita i dodajte vrednosti u ComboBox
    while not Query.Eof do
    begin
      ComboBox1.Items.Add(Query.FieldByName('Naziv').AsString);
      Query.Next;
    end;
  finally
    Query.Free;
  end;
end;
begin
  // Kreirajte upit
  Query := TFDQuery.Create(nil);
  Query.Connection := dbconn.FDConnection1	; // Postavite konekciju na vašu bazu podataka
  try
    // Izvršite upit za izvlačenje podataka iz tabele "Termini"
    Query.SQL.Text := 'SELECT VremeTrajanja from Trajanje';
    Query.Open;
    // Prođite kroz rezultat upita i dodajte vrednosti u ComboBox
    while not Query.Eof do
    begin
      ComboBox4.Items.Add(Query.FieldByName('VremeTrajanja').AsString);
      Query.Next;
    end;
  finally
    Query.Free;
  end;
end;
end;

end.

