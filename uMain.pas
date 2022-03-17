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

'Новый год — это всегда ожидание какой-то сказки'+
'и волшебства. И я хочу Вам пожелать, чтобы все эти'+
'ожидания сбылись. Пусть всё задуманное осуществится.'+
'Пусть всё хорошее множится, а всё плохое остается в'+
'старом году. Пусть каждый день нового года дарит'+
'Вам радость и счастье, превращая каждый день в праздник!',

'Хочется, чтобы в новом году каждый из нас приобрел бы'+
'не лучшее, а свое. Потому что лучшее не всегда может'+
'стать своим, а вот свое — всегда самое лучшее.'+
'Берегите близких и любимых! С Новым годом!',

'Есть древняя японская пословица, которая говорит о том,'+
' что счастье приходит только в тот дом, где есть веселье'+
' и не смолкает смех. Я хочу поднять этот бокал в честь'+
' наступающего Нового года и пожелать всем присутствующим,'+
' чтобы в новом году в ваших домах всегда раздавался смех и было счастье!',

'Давайте выпьем мы за волшебство,'+
'За чудеса, за радость, счастье,'+
'За то, чтоб миром правило добро,'+
'За то, чтоб жили мы в богатстве!',

'За Новый год, за чистый лист,'+
'За то, чтоб все мечты сбывались,'+
'За то, чтоб старые мосты,'+
'Всегда лишь в прошлом оставались!',

'Давайте выпьем за 365 дней, которые ждут нас впереди,'+
'за 365 возможностей, за 365 новых страниц жизни, за 365'+
'чудес, которые с нами случатся! За Новый год, который'+
'всё нам это подарит! Ура!',

'В разных странах этот праздник встречает по-своему.'+
'Иногда выкидывают старые вещи. Хочу пожелать в преддверии'+
'нового года выбросить старые мысли. И войти в будущий год'+
'с новыми светлыми мечтами, которые окрыляют и'+
'вдохновляют на поступки и действия.',

'Выпьем друзья мы за Новый год,'+
'Пусть всем он нам добра принесет,'+
'Пусть положит под елку удачу,'+
'Счастье, успех принесет он в придачу!',

'Пусть он зажжет надежду в домах,'+
'Пусть прошлый год унесет с собой страх,'+
'Пусть он подарит достаток, тепло,'+
'И пусть у нас будет все хорошо!');

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
  TrayIcon.BalloonHint:='Поздравляю всех с Новым 2017 Годом!!!'+#13+
                        'Желаю счастья, здоровья и всего самого лучшего!!!';
  TrayIcon.BalloonTitle:='Новый год 2017!!!';
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
  TrayIcon.BalloonTitle:='Новогодний тост!!!';
  TrayIcon.BalloonTimeout:=100000;
  TrayIcon.ShowBalloonHint;
end;

end.
