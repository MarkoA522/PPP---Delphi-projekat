unit FinskaBio;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Ani,Unit2;

type
  TFinskaiBiosauna = class(TForm)
    RectAnimation1: TRectAnimation;
    Rectangle1: TRectangle;
    Button2: TButton;
    Button3: TButton;
    Button1: TButton;
    Button4: TButton;
    Kontakt: TButton;
    Image1: TImage;
    Rectangle2: TRectangle;
    Rectangle3: TRectangle;
    Image2: TImage;
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
  FinskaiBiosauna: TFinskaiBiosauna;

implementation

{$R *.fmx}
                                    Uses pocetna,ComboBox;
procedure TFinskaiBiosauna.Button1Click(Sender: TObject);
begin
                          pocetnaStrana.Show;
                          finskaibiosauna.Hide;
end;

procedure TFinskaiBiosauna.Button2Click(Sender: TObject);
begin
form1.Show;
finskaibiosauna.Hide;

end;

procedure TFinskaiBiosauna.FormShow(Sender: TObject);
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
    ParamByName('Naziv').AsString := 'Tepidarijumi';
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
