unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, LCLType, StdCtrls,
  Unit2;

type

  { TForm1 }

  TForm1 = class(TForm)
    Label1: TLabel;
    procedure FormDblClick(Sender: TObject);
  private
    procedure OnForm2Closed(Sender: TObject); // ← обработчик ивента
  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }
procedure TForm1.FormDblClick(Sender: TObject);
var
  tmpFrm: TForm2 = nil;
begin
  tmpFrm:= TForm2.Create(Self);
  tmpFrm.OnClosed := @OnForm2Closed; // ← подписываемся
  tmpFrm.Show;
end;

procedure TForm1.OnForm2Closed(Sender: TObject);
begin
  Label1.Caption := TForm2(Sender).Label1.Caption; // ← присвоение по событию
end;

end.

