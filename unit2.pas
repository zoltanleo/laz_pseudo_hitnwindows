unit Unit2;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm2 }

  TForm2 = class(TForm)
    Label1: TLabel;
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
  private

  public
    OnClosed: TNotifyEvent; // ← собственный ивент
  end;

var
  Form2: TForm2;

implementation

//uses Unit1;

{$R *.lfm}

{ TForm2 }

procedure TForm2.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  if Assigned(OnClosed) then OnClosed(Self); // ← вызываем ивент
  CloseAction:= caFree;
end;

procedure TForm2.FormCreate(Sender: TObject);
begin
  Label1.Caption:= FormatDateTime('nn:ss.zzz', Now);
end;

procedure TForm2.FormDeactivate(Sender: TObject);
begin
  Close;
end;

{ TForm2 }


end.

