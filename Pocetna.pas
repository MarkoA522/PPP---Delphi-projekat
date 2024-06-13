unit Pocetna;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Ani, FMX.Controls.Presentation, FMX.StdCtrls, FMX.Colors,ComboBox,admin,Cenovni,specijalnePonude,ZakaziTermin,Kontakt;

type
  TpocetnaStrana = class(TForm)
    RectAnimation1: TRectAnimation;
    Rectangle1: TRectangle;
    Image1: TImage;
    Button2: TButton;
    Button3: TButton;
    Button1: TButton;
    Button4: TButton;
    Kontakt: TButton;
    Rectangle2: TRectangle;
    Text1: TText;
    Rectangle3: TRectangle;
    Text2: TText;
    Text3: TText;
    Image2: TImage;
    ColorButton1: TColorButton;
    Text4: TText;
    Text5: TText;
    W: TText;
    Rectangle4: TRectangle;
    Rectangle5: TRectangle;
    Image3: TImage;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Image3Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Text4Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure KontaktClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  pocetnaStrana: TpocetnaStrana;

implementation

{$R *.fmx}

procedure TpocetnaStrana.Button1Click(Sender: TObject);
begin
self.Recreate;
end;

procedure TpocetnaStrana.Button2Click(Sender: TObject);
begin
pocetnaStrana.Hide;                                                      //SELECT Naziv FROM Specijalne_Ponude WHERE ID = 2
Form1.Show;
end;

procedure TpocetnaStrana.Button3Click(Sender: TObject);
begin
          specponude.Show;
          pocetnastrana.Hide;
end;

procedure TpocetnaStrana.Button4Click(Sender: TObject);
begin
Self.Hide;
Cenovnik.Show;

end;

procedure TpocetnaStrana.Image3Click(Sender: TObject);
begin
Adminlogin.Show;
pocetnaStrana.Hide;
end;

procedure TpocetnaStrana.KontaktClick(Sender: TObject);
begin
Contact.Show;
self.Hide;
end;

procedure TpocetnaStrana.Text4Click(Sender: TObject);
begin
pocetnaStrana.Hide;
zakazi.Show;
end;

end.
