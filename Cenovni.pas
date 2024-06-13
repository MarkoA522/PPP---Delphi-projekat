unit Cenovni;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Edit,
  FMX.ListBox, FMX.Objects, FMX.Controls.Presentation, FMX.StdCtrls, FMX.Ani, Unit2;

type
  TCenovnik = class(TForm)
    RectAnimation1: TRectAnimation;
    Rectangle1: TRectangle;
    Button1: TButton;
    Image1: TImage;
    Rectangle2: TRectangle;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    procedure FetchData;
  public
    { Public declarations }
  end;

var
  Cenovnik: TCenovnik;

implementation

{$R *.fmx}
uses
  pocetna;

procedure TCenovnik.Button1Click(Sender: TObject);
begin
  pocetnastrana.Show;
  self.Hide;
end;

procedure TCenovnik.FormShow(Sender: TObject);
begin
  FetchData;
end;

procedure TCenovnik.FetchData;
var
  SQLQueryTipUsluge, SQLQueryCena,SQLQueryOpis: string;
begin
  if not dbconn.FDConnection1.Connected then
  begin
    Label2.Text := 'Nema veze sa bazom podataka.';
    Label3.Text := '';
    Exit;
  end;

  SQLQueryTipUsluge := 'SELECT Tip_Usluge FROM Cena WHERE CenaID BETWEEN 1 AND 18';
  SQLQueryCena := 'SELECT Cenaa FROM Cena WHERE CenaID BETWEEN 1 AND 18';
  SQLQueryOpis := 'SELECT Opis FROM Cena WHERE CenaID BETWEEN 5 AND 18';

  with dbconn.FDQuery1 do
  begin
    // Fetch Tip_Usluge
    try
      Close;
      SQL.Text := SQLQueryTipUsluge;
      Open;
      if not IsEmpty then
      begin
        Label2.Text := '';
        while not Eof do
        begin
          Label2.Text := Label2.Text + FieldByName('Tip_Usluge').AsString + #13#10;
          Next;
        end;
      end
      else
        Label2.Text := 'Nema rezultata za traženi naziv.';
    except
      on E: Exception do
        Label2.Text := 'Greška pri čitanju podataka: ' + E.Message;
    end;

    // Fetch Cenaa
    try
      Close;
      SQL.Text := SQLQueryCena;
      Open;
      if not IsEmpty then
      begin
        Label3.Text := '';
        while not Eof do
        begin
          Label3.Text := Label3.Text + FieldByName('Cenaa').AsString + #13#10;
          Next;
        end;
      end
      else
        Label3.Text := 'Nema rezultata za traženi naziv.';
    except
      on E: Exception do
        Label3.Text := 'Greška pri čitanju podataka: ' + E.Message;
    end;

   try
      Close;
      SQL.Text := SQLQueryOpis;
      Open;
      if not IsEmpty then
      begin
        Label4.Text := '';
        while not Eof do
        begin
          Label4.Text := Label4.Text + FieldByName('Opis').AsString + #13#10;
          Next;
        end;
      end
      else
        Label4.Text := 'Nema rezultata za traženi naziv.';
    except
      on E: Exception do
        Label4.Text := 'Greška pri čitanju podataka: ' + E.Message;

end;
end;
end;


end.


