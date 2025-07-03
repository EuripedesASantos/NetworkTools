object Form1: TForm1
  Left = 135
  Top = 103
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsDialog
  Caption = 'Form1'
  ClientHeight = 421
  ClientWidth = 770
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 233
    Height = 377
    Caption = 'Lista de Usu'#225'rios'
    TabOrder = 0
    object Label1: TLabel
      Left = 10
      Top = 32
      Width = 57
      Height = 13
      Caption = 'Computador'
    end
    object Label2: TLabel
      Left = 10
      Top = 104
      Width = 201
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = 'USU'#193'RIOS'
    end
    object EditListUserComputer: TEdit
      Left = 72
      Top = 32
      Width = 137
      Height = 21
      TabOrder = 0
    end
    object ListBoxUsers: TListBox
      Left = 10
      Top = 120
      Width = 201
      Height = 241
      ItemHeight = 13
      TabOrder = 1
    end
    object ButtonListUsers: TButton
      Left = 48
      Top = 64
      Width = 113
      Height = 25
      Caption = 'LISTAR'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnClick = ButtonListUsersClick
    end
  end
  object GroupBox2: TGroupBox
    Left = 248
    Top = 8
    Width = 233
    Height = 377
    Caption = 'Lista de Grupos'
    TabOrder = 1
    object Label3: TLabel
      Left = 10
      Top = 32
      Width = 57
      Height = 13
      Caption = 'Computador'
    end
    object Label4: TLabel
      Left = 10
      Top = 104
      Width = 201
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = 'USU'#193'RIOS'
    end
    object EditListGroupComputer: TEdit
      Left = 72
      Top = 32
      Width = 137
      Height = 21
      TabOrder = 0
    end
    object ListBoxGroups: TListBox
      Left = 10
      Top = 120
      Width = 201
      Height = 241
      ItemHeight = 13
      TabOrder = 1
    end
    object ButtonListGroups: TButton
      Left = 48
      Top = 64
      Width = 113
      Height = 25
      Caption = 'LISTAR'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnClick = ButtonListGroupsClick
    end
  end
  object GroupBox3: TGroupBox
    Left = 496
    Top = 8
    Width = 233
    Height = 377
    Caption = 'Lista de Usu'#225'rios do Grupo'
    TabOrder = 2
    object Label5: TLabel
      Left = 10
      Top = 32
      Width = 57
      Height = 13
      Caption = 'Computador'
    end
    object Label6: TLabel
      Left = 10
      Top = 144
      Width = 201
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = 'USU'#193'RIOS'
    end
    object Label7: TLabel
      Left = 10
      Top = 64
      Width = 29
      Height = 13
      Caption = 'Grupo'
    end
    object EditListGroupUserComputer: TEdit
      Left = 72
      Top = 32
      Width = 137
      Height = 21
      TabOrder = 0
    end
    object ListBoxGroupUsers: TListBox
      Left = 18
      Top = 160
      Width = 201
      Height = 201
      ItemHeight = 13
      TabOrder = 1
    end
    object ButtonListGroupUsers: TButton
      Left = 56
      Top = 104
      Width = 113
      Height = 25
      Caption = 'LISTAR'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnClick = ButtonListGroupUsersClick
    end
    object EditListGroupUserGroup: TEdit
      Left = 72
      Top = 64
      Width = 137
      Height = 21
      TabOrder = 3
    end
  end
end
