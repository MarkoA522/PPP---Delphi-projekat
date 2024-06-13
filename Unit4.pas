unit Unit4;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Objects, FMX.Controls.Presentation, FMX.Ani, FireDAC.Comp.Client, Unit2,Unit5;


type
  TForm4 = class(TForm)
    RectAnimation1: TRectAnimation;
    Text1: TText;
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation

{$R *.fmx}
                                  Uses pocetna,combobox;
procedure TForm4.Button1Click(Sender: TObject);

begin
pocetnaStrana.Show;
form4.Hide



end;


procedure TForm4.Button2Click(Sender: TObject);
begin
form1.Show;
form4.Hide;

end;

procedure TForm4.FormShow(Sender: TObject);
begin
  if not dbconn.FDConnection1.Connected then
  begin
    Text1.Text := 'Nema veze sa bazom podataka.';
    Exit;
  end;

  with dbconn.FDQuery1 do
  begin
    Close;
    SQL.Text := 'SELECT Opis FROM O_Uslugama WHERE Naziv = :Naziv';
    ParamByName('Naziv').AsString := 'Bazen';
    Open;
    if not IsEmpty then
    begin
      if not FieldByName('Opis').IsNull then
        Text1.Text := FieldByName('Opis').AsString
      else
        Text1.Text := 'Nema dostupnih informacija.';
    end
    else
      Text1.Text := 'Nema rezultata za traženi naziv.';
  end;

  // Ovde osvežavamo interfejs pozivom Repaint ili Invalidate metode Text1 komponente
  Text1.Repaint; // ili Text1.Invalidate;
end;


end.

