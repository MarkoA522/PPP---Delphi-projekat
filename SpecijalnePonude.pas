unit SpecijalnePonude;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Ani, Unit2;

type
  TSpecPonude = class(TForm)
    RectAnimation1: TRectAnimation;
    Rectangle1: TRectangle;
    Button1: TButton;
    Image1: TImage;
    Rectangle2: TRectangle;
    Rectangle4: TRectangle;
    Rectangle5: TRectangle;
    Rectangle3: TRectangle;
    Rectangle6: TRectangle;
    Rectangle7: TRectangle;
    Rectangle8: TRectangle;
    Rectangle9: TRectangle;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Button5: TButton;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Button6: TButton;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Button7: TButton;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Button2: TButton;

    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

  end;

var
  SpecPonude: TSpecPonude;

implementation

{$R *.fmx}

                 uses pocetna;
procedure TSpecPonude.Button1Click(Sender: TObject);
begin
pocetnastrana.Show;
self.hide  ;

end;

procedure TSpecPonude.FormShow(Sender: TObject);

begin
  if not dbconn.FDConnection1.Connected then
  begin
    Label1.Text := 'Nema veze sa bazom podataka.';
    Exit;
  end;

  with dbconn.FDQuery1 do
  begin
    Close;
    SQL.Text := 'SELECT Naziv FROM Specijalne_Ponude';

    Open;
    if not IsEmpty then
    begin
      if not FieldByName('Naziv').IsNull then
        Label1.Text := FieldByName('Naziv').AsString
      else
        Label1.Text := 'Nema dostupnih informacija.';
    end
    else
      Label1.Text := 'Nema rezultata za traženi naziv.';
  end;

  // Ovde osvežavamo interfejs pozivom Repaint ili Invalidate metode Text1 komponente
 label1.Repaint; // ili Text1.Invalidate;



  (*

      *)



begin
  if not dbconn.FDConnection1.Connected then
  begin
    Label2.Text := 'Nema veze sa bazom podataka.';
    Exit;
  end;

  with dbconn.FDQuery1 do
  begin
    Close;
    SQL.Text := 'SELECT Usluga FROM Specijalne_Ponude';

    Open;
    if not IsEmpty then
    begin
      if not FieldByName('Usluga').IsNull then
        Label2.Text := FieldByName('Usluga').AsString
      else
        Label2.Text := 'Nema dostupnih informacija.';
    end
    else
      Label2.Text := 'Nema rezultata za traženi naziv.';
  end;






 label2.Repaint;

 begin
  if not dbconn.FDConnection1.Connected then
  begin
    Label3.Text := 'Nema veze sa bazom podataka.';
    Exit;
  end;

  with dbconn.FDQuery1 do
  begin
    Close;
    SQL.Text := 'SELECT Cena FROM Specijalne_Ponude';

    Open;
    if not IsEmpty then
    begin
      if not FieldByName('Cena').IsNull then
        Label3.Text := FieldByName('Cena').AsString
      else
        Label3.Text := 'Nema dostupnih informacija.';
    end
    else
      Label3.Text := 'Nema rezultata za traženi naziv.';
  end;

  // Ovde osvežavamo interfejs pozivom Repaint ili Invalidate metode Text1 komponente
 label3.Repaint; // ili Text1.Invalidate;

begin
  if not dbconn.FDConnection1.Connected then
  begin
    Label4.Text := 'Nema veze sa bazom podataka.';
    Exit;
  end;

  with dbconn.FDQuery1 do
  begin
    Close;
    SQL.Text := 'SELECT Naziv FROM Specijalne_Ponude WHERE SpecijalnePonude_ID = 2';

    Open;
    if not IsEmpty then
    begin
      if not FieldByName('Naziv').IsNull then
        Label4.Text := FieldByName('Naziv').AsString
      else
        Label4.Text := 'Nema dostupnih informacija.';
    end
    else
      Label4.Text := 'Nema rezultata za traženi naziv.';
  end;

  // Ovde osvežavamo interfejs pozivom Repaint ili Invalidate metode Text1 komponente
 label4.Repaint; // ili Text1.Invalidate;


                 begin
  if not dbconn.FDConnection1.Connected then
  begin
    Label5.Text := 'Nema veze sa bazom podataka.';
    Exit;
  end;

  with dbconn.FDQuery1 do
  begin
    Close;
    SQL.Text := 'SELECT Usluga FROM Specijalne_Ponude WHERE SpecijalnePonude_ID = 2';

    Open;
    if not IsEmpty then
    begin
      if not FieldByName('Usluga').IsNull then
        Label5.Text := FieldByName('Usluga').AsString
      else
        Label5.Text := 'Nema dostupnih informacija.';
    end
    else
      Label5.Text := 'Nema rezultata za traženi naziv.';
  end;

  // Ovde osvežavamo interfejs pozivom Repaint ili Invalidate metode Text1 komponente
 label5.Repaint; // ili Text1.Invalidate;
                  begin
  if not dbconn.FDConnection1.Connected then
  begin
    Label6.Text := 'Nema veze sa bazom podataka.';
    Exit;
  end;

  with dbconn.FDQuery1 do
  begin
    Close;
    SQL.Text := 'SELECT Cena FROM Specijalne_Ponude WHERE SpecijalnePonude_ID = 2';

    Open;
    if not IsEmpty then
    begin
      if not FieldByName('Cena').IsNull then
        Label6.Text := FieldByName('Cena').AsString
      else
        Label6.Text := 'Nema dostupnih informacija.';
    end
    else
      Label6.Text := 'Nema rezultata za traženi naziv.';
  end;

  // Ovde osvežavamo interfejs pozivom Repaint ili Invalidate metode Text1 komponente
 label6.Repaint; // ili Text1.Invalidate;
                   begin
  if not dbconn.FDConnection1.Connected then
  begin
    Label7.Text := 'Nema veze sa bazom podataka.';
    Exit;
  end;

  with dbconn.FDQuery1 do
  begin
    Close;
    SQL.Text := 'SELECT Naziv FROM Specijalne_Ponude WHERE SpecijalnePonude_ID = 3';

    Open;
    if not IsEmpty then
    begin
      if not FieldByName('Naziv').IsNull then
        Label7.Text := FieldByName('Naziv').AsString
      else
        Label7.Text := 'Nema dostupnih informacija.';
    end
    else
      Label7.Text := 'Nema rezultata za traženi naziv.';
  end;

  // Ovde osvežavamo interfejs pozivom Repaint ili Invalidate metode Text1 komponente
 label7.Repaint; // ili Text1.Invalidate;
    begin
  if not dbconn.FDConnection1.Connected then
  begin
    Label8.Text := 'Nema veze sa bazom podataka.';
    Exit;
  end;

  with dbconn.FDQuery1 do
  begin
    Close;
    SQL.Text := 'SELECT Usluga FROM Specijalne_Ponude WHERE SpecijalnePonude_ID = 3';

    Open;
    if not IsEmpty then
    begin
      if not FieldByName('Usluga').IsNull then
        Label8.Text := FieldByName('Usluga').AsString
      else
        Label8.Text := 'Nema dostupnih informacija.';
    end
    else
      Label8.Text := 'Nema rezultata za traženi naziv.';
  end;

  // Ovde osvežavamo interfejs pozivom Repaint ili Invalidate metode Text1 komponente
 label8.Repaint; // ili Text1.Invalidate;




end;
  begin
  if not dbconn.FDConnection1.Connected then
  begin
    Label9.Text := 'Nema veze sa bazom podataka.';
    Exit;
  end;

  with dbconn.FDQuery1 do
  begin
    Close;
    SQL.Text := 'SELECT Cena FROM Specijalne_Ponude WHERE SpecijalnePonude_ID = 3';

    Open;
    if not IsEmpty then
    begin
      if not FieldByName('Cena').IsNull then
        Label9.Text := FieldByName('Cena').AsString
      else
        Label9.Text := 'Nema dostupnih informacija.';
    end
    else
      Label9.Text := 'Nema rezultata za traženi naziv.';
  end;

  // Ovde osvežavamo interfejs pozivom Repaint ili Invalidate metode Text1 komponente
 label9.Repaint; // ili Text1.Invalidate;
   begin
  if not dbconn.FDConnection1.Connected then
  begin
    Label10.Text := 'Nema veze sa bazom podataka.';
    Exit;
  end;

  with dbconn.FDQuery1 do
  begin
    Close;
    SQL.Text := 'SELECT Naziv FROM Specijalne_Ponude WHERE SpecijalnePonude_ID = 4';

    Open;
    if not IsEmpty then
    begin
      if not FieldByName('Naziv').IsNull then
        Label10.Text := FieldByName('Naziv').AsString
      else
        Label10.Text := 'Nema dostupnih informacija.';
    end
    else
      Label10.Text := 'Nema rezultata za traženi naziv.';
  end;

  // Ovde osvežavamo interfejs pozivom Repaint ili Invalidate metode Text1 komponente
 label10.Repaint; // ili Text1.Invalidate;



end;
 begin
  if not dbconn.FDConnection1.Connected then
begin
    Label11.Text := 'Nema veze sa bazom podataka.';
    Exit;
  end;

  with dbconn.FDQuery1 do
  begin
    Close;
    SQL.Text := 'SELECT Usluga FROM Specijalne_Ponude WHERE SpecijalnePonude_ID = 4';

    Open;
    if not IsEmpty then
    begin
      if not FieldByName('Usluga').IsNull then
        Label11.Text := FieldByName('Usluga').AsString
      else
        Label11.Text := 'Nema dostupnih informacija.';
    end
    else
      Label11.Text := 'Nema rezultata za traženi naziv.';
  end;

  // Ovde osvežavamo interfejs pozivom Repaint ili Invalidate metode Text1 komponente
 label11.Repaint; // ili Text1.Invalidate;




end;
             begin
  if not dbconn.FDConnection1.Connected then
begin
    Label12.Text := 'Nema veze sa bazom podataka.';
    Exit;
  end;

  with dbconn.FDQuery1 do
  begin
    Close;
    SQL.Text := 'SELECT Cena FROM Specijalne_Ponude WHERE SpecijalnePonude_ID = 4';

    Open;
    if not IsEmpty then
    begin
      if not FieldByName('Cena').IsNull then
        Label12.Text := FieldByName('Cena').AsString
      else
        Label12.Text := 'Nema dostupnih informacija.';
    end
    else
      Label12.Text := 'Nema rezultata za traženi naziv.';
  end;

  // Ovde osvežavamo interfejs pozivom Repaint ili Invalidate metode Text1 komponente
 label12.Repaint; // ili Text1.Invalidate;




end;





end;







end;



                                                                   //SELECT Naziv FROM Specijalne_Ponude WHERE SpecijalnePonude_ID = 2





 end;
end;




  (*

      *)
end;
end;


end;
end;

end.
 (*

      *)
