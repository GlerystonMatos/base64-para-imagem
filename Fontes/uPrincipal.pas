unit uPrincipal;

interface

uses
  Winapi.Windows, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Soap.EncdDecd,
  Vcl.ExtCtrls, JPEG, Vcl.ExtDlgs, IdCoderMIME;

type
  TfrmPrincipal = class(TForm)
    btnConverter: TBitBtn;
    Image: TImage;
    Memo: TMemo;
    btnSelecionar: TBitBtn;
    opdImage: TOpenPictureDialog;
    btnLimpar: TBitBtn;
    procedure btnConverterClick(Sender: TObject);
    procedure btnSelecionarClick(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.btnConverterClick(Sender: TObject);
var
  bytes: TBytes;
  jpegImage: TJPEGImage;
  memoryStream: TMemoryStream;
begin
  jpegImage := TJPEGImage.Create;
  try
    memoryStream := TMemoryStream.Create;
    try
      bytes := DecodeBase64(AnsiString(Memo.Lines.Text));
      if (Length(bytes) > 0) then
      begin
        memoryStream.WriteData(bytes, Length(bytes));
        memoryStream.position := 0;
        jpegImage.LoadFromStream(memoryStream);
        Image.Picture.Assign(jpegImage);
      end;
    finally
      FreeAndNil(memoryStream);
    end;
  finally
    FreeAndNil(jpegImage);
  end;
end;

procedure TfrmPrincipal.btnLimparClick(Sender: TObject);
begin
  Memo.Lines.Clear;
end;

procedure TfrmPrincipal.btnSelecionarClick(Sender: TObject);
var
  stream: TFileStream;
  base64: TIdEncoderMIME;
begin
  opdImage.InitialDir := ExtractFileDir(Application.ExeName) + '\Imagen\';
  if (opdImage.Execute) then
  begin
    base64 := TIdEncoderMIME.Create(nil);
    try
      stream := TFileStream.Create(opdImage.FileName, fmOpenRead);
      try
        Memo.Lines.Text := TIdEncoderMIME.EncodeStream(stream);
      finally
        FreeAndNil(stream);
      end;
    finally
      FreeAndNil(base64);
    end;
  end;
end;

end.
