program fir_tree;

uses
  Winapi.Windows,
  Vcl.Forms,
  uMain in 'uMain.pas' {fMain},
  Vcl.Themes,
  Vcl.Styles;

{$R *.res}

procedure AppOnTaskBar(AMainForm: TForm; const AVisible: boolean = false);
var
  AppHandle: HWND;
begin
  AppHandle:=AMainForm.Handle;
  ShowWindow(AppHandle, SW_HIDE);
  if AVisible then ShowWindow(AppHandle, SW_SHOW)
  else SetWindowLong(AppHandle, GWL_EXSTYLE, GetWindowLong(AppHandle, GWL_EXSTYLE) and (not WS_EX_APPWINDOW) or WS_EX_TOOLWINDOW);
end;

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Tablet Light');
  Application.Title := 'С новым 2017 годом!';
  Application.CreateForm(TfMain, fMain);
  AppOnTaskBar(fMain,false);
  Application.Run;
end.
