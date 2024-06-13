unit ComboBox;

interface

uses
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Colors,
  FMX.Objects, FMX.Controls.Presentation, FMX.StdCtrls, FMX.Ani, FMX.ListBox,
  System.Classes,
  FMX.EditBox, FMX.ComboTrackBar, FMX.Edit, FMX.ComboEdit, Unit2,FireDAC.Comp.Client,Unit4,Unit5,FinskaBio;


type
  TForm1 = class(TForm)
    Kontakt: TButton;
    Image1: TImage;
    Rectangle2: TRectangle;
    ComboBox1: TComboBox;
    Label1: TLabel;
    Rectangle3: TRectangle;
    Label2: TLabel;
    procedure ComboBox1Change(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}
                                      Uses pocetna;
procedure TForm1.Button1Click(Sender: TObject);
begin
Form1.hide;
pocetnaStrana.Show;
end;

procedure TForm1.ComboBox1Change(Sender: TObject);
var
  Query: TFDQuery;
  selectedService: string;
  selectedIndex: Integer;
begin
  // Dobijanje indeksa trenutno odabrane stavke
  selectedIndex := ComboBox1.ItemIndex;

  Query := TFDQuery.Create(nil);
  try
    // Povezivanje TFDQuery-a sa TFDConnection komponentom iz Forme 1
    Query.Connection := dbconn.FDConnection1;

    // Priprema SQL upita
    Query.SQL.Text := 'SELECT Naziv FROM O_Uslugama';

    // Otvori upit da bi se izvršio
    Query.Open;

    // Isprazni ComboBox pre dodavanja novih stavki
    ComboBox1.Items.Clear;

    // Dodaj svaki naziv usluge u ComboBox
    while not Query.Eof do
    begin
      ComboBox1.Items.Add(Query.FieldByName('Naziv').AsString);
      Query.Next;
    end;
  finally
    // Zatvori upit i oslobodi resurse
    Query.Free;
  end;

  // Provera da li je izabrana neka stavka u ComboBox-u
  if (selectedIndex >= 0) and (selectedIndex < ComboBox1.Items.Count) then
  begin
    // Dobijanje naziva izabrane stavke
    selectedService := ComboBox1.Items[selectedIndex];

    // Otvaranje odgovarajuće forme na osnovu izabrane stavke
    if selectedService = 'Bazen' then
      Form4.Show;
      Form1.Hide;
      if selectedService='Tepidarijumi' then
      Tepidarijumi.Show	;
      Form1.Hide;
      if selectedService='Finska i Bio sauna' then
      FinskaibioSauna.Show	;
      Form1.Hide;

  end;
end;
        end.



