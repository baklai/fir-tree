unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Menus,
  Vcl.Imaging.GIFImg, Vcl.StdCtrls, Math;

type
  TfMain = class(TForm)
    TrayIcon: TTrayIcon;
    PopupMenu: TPopupMenu;
    N1: TMenuItem;
    nExit: TMenuItem;
    Image: TImage;
    TimerTost: TTimer;
    nTost: TMenuItem;
    nHi: TMenuItem;
    nAbout: TMenuItem;
    N6: TMenuItem;
    procedure nExitClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
     procedure FormToGo(Sender: TObject; Button: TMouseButton; Shift: TShiftState;X, Y: Integer);
    procedure TimerTostTimer(Sender: TObject);
    procedure nTostClick(Sender: TObject);
    procedure nAboutClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fMain: TfMain;

const
  n: integer = 8;
  tost: array[0..8] of string = (

'����� ��� � ��� ������ �������� �����-�� ������'+
'� ����������. � � ���� ��� ��������, ����� ��� ���'+
'�������� �������. ����� �� ���������� ������������.'+
'����� �� ������� ��������, � �� ������ �������� �'+
'������ ����. ����� ������ ���� ������ ���� �����'+
'��� ������� � �������, ��������� ������ ���� � ��������!',

'�������, ����� � ����� ���� ������ �� ��� �������� ��'+
'�� ������, � ����. ������ ��� ������ �� ������ �����'+
'����� �����, � ��� ���� � ������ ����� ������.'+
'�������� ������� � �������! � ����� �����!',

'���� ������� �������� ���������, ������� ������� � ���,'+
' ��� ������� �������� ������ � ��� ���, ��� ���� �������'+
' � �� �������� ����. � ���� ������� ���� ����� � �����'+
' ������������ ������ ���� � �������� ���� ��������������,'+
' ����� � ����� ���� � ����� ����� ������ ���������� ���� � ���� �������!',

'������� ������ �� �� ����������,'+
'�� ������, �� �������, �������,'+
'�� ��, ���� ����� ������� �����,'+
'�� ��, ���� ���� �� � ���������!',

'�� ����� ���, �� ������ ����,'+
'�� ��, ���� ��� ����� ���������,'+
'�� ��, ���� ������ �����,'+
'������ ���� � ������� ����������!',

'������� ������ �� 365 ����, ������� ���� ��� �������,'+
'�� 365 ������������, �� 365 ����� ������� �����, �� 365'+
'�����, ������� � ���� ��������! �� ����� ���, �������'+
'�� ��� ��� �������! ���!',

'� ������ ������� ���� �������� ��������� ��-������.'+
'������ ���������� ������ ����. ���� �������� � ����������'+
'������ ���� ��������� ������ �����. � ����� � ������� ���'+
'� ������ �������� �������, ������� �������� �'+
'����������� �� �������� � ��������.',

'������ ������ �� �� ����� ���,'+
'����� ���� �� ��� ����� ��������,'+
'����� ������� ��� ���� �����,'+
'�������, ����� �������� �� � �������!',

'����� �� ������ ������� � �����,'+
'����� ������� ��� ������ � ����� �����,'+
'����� �� ������� ��������, �����,'+
'� ����� � ��� ����� ��� ������!');

implementation

{$R *.dfm}

procedure TfMain.FormShow(Sender: TObject);
begin
  (Image.Picture.Graphic as TGIFImage).Animate:=True;
  (Image.Picture.Graphic as TGIFImage).AnimationSpeed:=100;
  fMain.DoubleBuffered := True;

  TimerTost.Enabled:=nTost.Checked;
end;

procedure TfMain.FormToGo(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  ReleaseCapture; perform(WM_SysCommand,$F012,0);
end;

procedure TfMain.nAboutClick(Sender: TObject);
begin
  TrayIcon.BalloonHint:='���������� ���� � ����� 2017 �����!!!'+#13+
                        '����� �������, �������� � ����� ������ �������!!!';
  TrayIcon.BalloonTitle:='����� ��� 2017!!!';
  TrayIcon.BalloonTimeout:=100000;
  TrayIcon.ShowBalloonHint;
end;

procedure TfMain.nExitClick(Sender: TObject);
begin
  Application.MainForm.Close;
end;

procedure TfMain.nTostClick(Sender: TObject);
begin
  TimerTost.Enabled:=not TimerTost.Enabled;
end;

procedure TfMain.TimerTostTimer(Sender: TObject);
begin
  TrayIcon.BalloonHint:=tost[RandomRange(0,n)];
  TrayIcon.BalloonTitle:='���������� ����!!!';
  TrayIcon.BalloonTimeout:=100000;
  TrayIcon.ShowBalloonHint;
end;

end.
