unit Admin;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Colors,
  FMX.Objects, FMX.Controls.Presentation, FMX.StdCtrls, FMX.Ani, FMX.Edit,
  Data.DB, FireDAC.Comp.Client, Unit2; // Dodajemo Unit2

type
  TAdminlogin = class(TForm)
    RectAnimation1: TRectAnimation;
    Rectangle2: TRectangle;
    Edit1: TEdit;
    Edit2: TEdit;
    Text1: TText;
    Image1: TImage;
    Image2: TImage;
    procedure Image1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Adminlogin: TAdminlogin;

implementation

{$R *.fmx}

uses
  AdminPanel; // Pretpostavljamo da je forma za panel u jedinici "PanelForm"

procedure TAdminlogin.Image1Click(Sender: TObject);
var
  UserName, Password: string;
  FDQuery1: TFDQuery; // Dinamički stvaramo TFDQuery
begin
  UserName := Edit1.Text;
  Password := Edit2.Text;

  FDQuery1 := TFDQuery.Create(nil); // Stvaramo instancu TFDQuery
  try
    FDQuery1.Connection :=dbconn.FDConnection1; // Koristimo vezu iz Unit2
    FDQuery1.SQL.Text := 'SELECT * FROM admin WHERE korisnickoIme = :UserName AND Password = :Password';
    FDQuery1.ParamByName('UserName').AsString := UserName;
    FDQuery1.ParamByName('Password').AsString := Password;
    FDQuery1.Open;

    if not FDQuery1.IsEmpty then
    begin
     // Prikazujemo formu za panel
      Self.Hide;
      Panel.show // Sakrivamo trenutnu formu
    end
    else
    begin
      ShowMessage('Neispravno korisničko ime ili lozinka.');
    end;
  finally
    FDQuery1.Free; // Oslobađamo memoriju
  end;
end;

end.

