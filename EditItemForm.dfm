object EditItemProjectForm: TEditItemProjectForm
  Left = 360
  Top = 346
  BorderStyle = bsToolWindow
  Caption = 'Edit Window'
  ClientHeight = 72
  ClientWidth = 434
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object edit: TEdit
    Left = 8
    Top = 16
    Width = 417
    Height = 21
    TabOrder = 0
  end
  object btn_ok: TButton
    Left = 136
    Top = 40
    Width = 75
    Height = 25
    Caption = 'OK'
    TabOrder = 1
    OnClick = btn_okClick
  end
  object btn_cancel: TButton
    Left = 224
    Top = 40
    Width = 75
    Height = 25
    Caption = 'Cancel'
    TabOrder = 2
    OnClick = btn_cancelClick
  end
end
