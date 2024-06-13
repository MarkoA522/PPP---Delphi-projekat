program Project2;

uses
  System.StartUpCopy,
  FMX.Forms,
  Pocetna in 'Pocetna.pas' {pocetnaStrana},
  ComboBox in 'ComboBox.pas' {Form1},
  Unit2 in 'Unit2.pas' {dbconn},
  Unit4 in 'Unit4.pas' {Form4},
  Unit5 in 'Unit5.pas' {Tepidarijumi},
  FinskaBio in 'FinskaBio.pas' {FinskaiBiosauna},
  Admin in 'Admin.pas' {Adminlogin},
  AdminPanel in 'AdminPanel.pas' {Panel},
  SpecijalnePonude in 'SpecijalnePonude.pas' {SpecPonude},
  ZakaziTermin in 'ZakaziTermin.pas' {Zakazi},
  Cenovni in 'Cenovni.pas' {Cenovnik},
  Kontakt in 'Kontakt.pas' {Contact},
  AdminPregled in 'AdminPregled.pas' {Pregled};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TpocetnaStrana, pocetnaStrana);
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(Tdbconn, dbconn);
  Application.CreateForm(TForm4, Form4);
  Application.CreateForm(TTepidarijumi, Tepidarijumi);
  Application.CreateForm(TFinskaiBiosauna, FinskaiBiosauna);
  Application.CreateForm(TAdminlogin, Adminlogin);
  Application.CreateForm(TPanel, Panel);
  Application.CreateForm(TSpecPonude, SpecPonude);
  Application.CreateForm(TZakazi, Zakazi);
  Application.CreateForm(TCenovnik, Cenovnik);
  Application.CreateForm(TContact, Contact);
  Application.CreateForm(TPregled, Pregled);
  Application.Run;
end.
