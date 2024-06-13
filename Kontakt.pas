unit Kontakt;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Colors,
  FMX.Objects, FMX.Controls.Presentation, FMX.StdCtrls, FMX.Ani, FMX.Edit,
  Data.DB, FireDAC.Comp.Client, Unit2; // Dodajte Unit2 ovde

type
  TContact = class(TForm)
    RectAnimation1: TRectAnimation;
    Rectangle1: TRectangle;
    Button1: TButton;
    Kontakt: TButton;
    Image1: TImage;
    Rectangle2: TRectangle;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Button5: TButton;
    procedure Button5Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Contact: TContact;

implementation

{$R *.fmx}
         uses pocetna;
procedure TContact.Button1Click(Sender: TObject);
begin
self.Hide;
pocetnastrana.Show ;

end;

procedure TContact.Button5Click(Sender: TObject);
var
  Ime, Prezime, Email, OstavitePoruku: string;
  FDQuery: TFDQuery;
begin
  // Uzimanje vrednosti iz Edit polja
  Ime := Edit1.Text;
  Prezime := Edit2.Text;
  Email := Edit3.Text;
  OstavitePoruku := Edit4.Text;

  // Kreiranje i postavljanje upita
  FDQuery := TFDQuery.Create(nil);
  try
    FDQuery.Connection := dbconn.FDConnection1; // Koristimo konekciju iz Unit2
    FDQuery.SQL.Text := 'INSERT INTO Poruka (Ime, Prezime, Email, OstavitePoruku) VALUES (:Ime, :Prezime, :Email, :OstavitePoruku)';
    FDQuery.Params.ParamByName('Ime').AsString := edit1.Text	;
    FDQuery.Params.ParamByName('Prezime').AsString :=edit2.Text	;
    FDQuery.Params.ParamByName('Email').AsString := edit3.Text	;
    FDQuery.Params.ParamByName('OstavitePoruku').AsString := edit4.Text	;
    FDQuery.ExecSQL;
  finally
    FDQuery.Free;
  end;

  // Obaveštavanje korisnika da je unos uspešan
  ShowMessage('Uspesno ste poslali e-mail administratorima.');
end;

end.

