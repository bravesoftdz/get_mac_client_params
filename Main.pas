unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  StdCtrls, ComCtrls, ExtCtrls;

type
  TForm1 = class(TForm)
    pgc1: TPageControl;
    ts1: TTabSheet;
    edt1: TEdit;
    edt2: TEdit;
    ts2: TTabSheet;
    IdTCPClient1: TIdTCPClient;
    edt3: TEdit;
    tmr1: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure tmr1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}



procedure TForm1.FormCreate(Sender: TObject);
begin
edt1.Text :=ParamStr(1);
end;

procedure TForm1.tmr1Timer(Sender: TObject);
begin
 Idtcpclient1.Host:=edt3.Text;
 Idtcpclient1.Port:=777;
 Idtcpclient1.Connect;
 Idtcpclient1.Write(edt1.Text);
 edt2.Text:= Idtcpclient1.ReadLn;
 Idtcpclient1.Disconnect;
end;

end.
