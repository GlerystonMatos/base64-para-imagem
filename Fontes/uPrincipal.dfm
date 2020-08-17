object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Conversor de imagem base 64 para TImage'
  ClientHeight = 665
  ClientWidth = 1098
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  DesignSize = (
    1098
    665)
  PixelsPerInch = 96
  TextHeight = 13
  object Image: TImage
    Left = 87
    Top = 8
    Width = 550
    Height = 649
    Anchors = [akLeft, akTop, akRight, akBottom]
    Stretch = True
  end
  object btnConverter: TBitBtn
    Left = 8
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Converter'
    TabOrder = 0
    OnClick = btnConverterClick
  end
  object Memo: TMemo
    Left = 640
    Top = 8
    Width = 450
    Height = 649
    Anchors = [akTop, akRight, akBottom]
    TabOrder = 1
  end
  object btnSelecionar: TBitBtn
    Left = 8
    Top = 39
    Width = 75
    Height = 25
    Caption = 'Selecionar'
    TabOrder = 2
    OnClick = btnSelecionarClick
  end
  object btnLimpar: TBitBtn
    Left = 8
    Top = 70
    Width = 75
    Height = 25
    Caption = 'Limpar'
    TabOrder = 3
    OnClick = btnLimparClick
  end
  object opdImage: TOpenPictureDialog
    Left = 32
    Top = 104
  end
end
