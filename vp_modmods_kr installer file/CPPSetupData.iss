; Inno Script Studio Wizard로 생성된 스크립트입니다.
; INNO SETUP 스크립트 파일을 만드는 방법에 대한 자세한 내용은 설명서를 참조하세요!

#define MyAppName "Vox Populi INT+"
#define MyAppVersion "4.22"
#define MyAppPublisher "디시인사이드 문명 갤러리(DCinside Civilization Gallery)"
#define MyAppURL "https://github.com/hyuckkim/vp_modmods_kr"

[Setup]
; 참고: AppId 값은 이 애플리케이션을 고유하게 식별합니다.
; 다른 애플리케이션의 설치 프로그램에서 동일한 AppId 값을 사용하지 마세요.
; (새로운 GUID를 생성하려면 IDE 내에서 Tools | Generate GUID를 클릭합니다.)
AppId={{1F1C4168-20CF-40A0-8C4A-1DD0DC1B67CB}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
DefaultGroupName={#MyAppName}
VersionInfoVersion={#MyAppVersion}
VersionInfoCompany={#MyAppPublisher}
VersionInfoDescription={#MyAppName}
VersionInfoProductName={#MyAppName}
VersionInfoProductVersion={#MyAppVersion}
VersionInfoCopyright=2025
LicenseFile=License.rtf
InfoBeforeFile=Opener.rtf
OutputBaseFilename={#MyAppName} ({#MyAppVersion})
DefaultDirName={userdocs}\My Games\Sid Meier's Civilization 5\
SetupIconFile=installer.ico
WizardImageStretch=False
Compression=lzma
SolidCompression=yes
ShowComponentSizes=False
AllowNoIcons=yes
Uninstallable=no
PrivilegesRequired=admin
DirExistsWarning=no
UsedUserAreasWarning=no

[Languages]
Name: "korean"; MessagesFile: "compiler:Languages\Korean.isl"

[Files]
Source: "..\(1L) Community Patch INT\*"; DestDir: "{app}\MODS\(1L) Community Patch INT"; Flags: ignoreversion createallsubdirs recursesubdirs; Components: VP34UC VP34UCNVC VP34UCEX VP34UCEXNVC VP34UCMAX VP34UCMAXNVC
Source: "..\(2L) Vox Populi INT\*"; DestDir: "{app}\MODS\(2L) Vox Populi INT"; Flags: ignoreversion createallsubdirs recursesubdirs;	Components: VP34UC VP34UCNVC VP34UCEX VP34UCEXNVC VP34UCMAX VP34UCMAXNVC
Source: "..\(3aL) VP - EUI Compatibility Files INT\*"; DestDir: "{app}\MODS\(3aL) VP - EUI Compatibility Files INT"; Flags: ignoreversion createallsubdirs recursesubdirs; Components: VP34UC VP34UCNVC VP34UCEX VP34UCEXNVC VP34UCMAX VP34UCMAXNVC
Source: "..\(4aL) Squads for VP INT\*"; DestDir: "{app}\MODS\(4aL) Squads for VP INT"; Flags: ignoreversion createallsubdirs recursesubdirs;	Components: VP34UC VP34UCNVC VP34UCEX VP34UCEXNVC VP34UCMAX VP34UCMAXNVC
Source: "..\UI - Promotion Tree for VP\*"; DestDir: "{app}\MODS\UI - Promotion Tree for VP"; Flags: ignoreversion createallsubdirs recursesubdirs;	Components: VP34UC VP34UCNVC VP34UCEX VP34UCEXNVC VP34UCMAX VP34UCMAXNVC
Source: "..\(7) VP Community Events\*"; DestDir: "{app}\MODS\(7) VP Community Events"; Flags: ignoreversion createallsubdirs recursesubdirs;	Components: VP34UC VP34UCNVC VP34UCEX VP34UCEXNVC VP34UCMAX VP34UCMAXNVC
Source: "..\(7) VP Community Events INT\*"; DestDir: "{app}\MODS\(7) VP Community Events INT"; Flags: ignoreversion createallsubdirs recursesubdirs;	Components: VP34UC VP34UCNVC VP34UCEX VP34UCEXNVC VP34UCMAX VP34UCMAXNVC
Source: "..\(over) More Unique Components for VP (v 88)\*"; DestDir: "{app}\MODS\(over) More Unique Components for VP (v 88)"; Flags: ignoreversion createallsubdirs recursesubdirs; Components: VP34UC VP34UCNVC VP34UCEX VP34UCEXNVC VP34UCMAX VP34UCMAXNVC
Source: "..\(overL) More Unique Components for VP (v 88) INT\*"; DestDir: "{app}\MODS\(overL) More Unique Components for VP (v 88) INT"; Flags: ignoreversion createallsubdirs recursesubdirs; Components: VP34UC VP34UCNVC VP34UCEX VP34UCEXNVC VP34UCMAX VP34UCMAXNVC

Source: "..\(ui) Trade Opportunities for VP (v 23)\*"; DestDir: "{app}\MODS\(ui) Trade Opportunities for VP (v 23)"; Flags: ignoreversion createallsubdirs recursesubdirs;	Components: VP34UCEX VP34UCEXNVC VP34UCMAX VP34UCMAXNVC
Source: "..\(ui) Trade Opportunities for VP INT\*"; DestDir: "{app}\MODS\(ui) Trade Opportunities for VP INT"; Flags: ignoreversion createallsubdirs recursesubdirs;	Components: VP34UCEX VP34UCEXNVC VP34UCMAX VP34UCMAXNVC
Source: "..\(ui) Wonder Planner For VP (v 14)\*"; DestDir: "{app}\MODS\(ui) Wonder Planner For VP (v 14)"; Flags: ignoreversion createallsubdirs recursesubdirs;	Components: VP34UCEX VP34UCEXNVC VP34UCMAX VP34UCMAXNVC
Source: "..\(ui) Wonder Planner For VP INT\*"; DestDir: "{app}\MODS\(ui) Wonder Planner For VP INT"; Flags: ignoreversion createallsubdirs recursesubdirs;	Components: VP34UCEX VP34UCEXNVC VP34UCMAX VP34UCMAXNVC
Source: "..\Elephant Sound When Circus Built (v 1)\*"; DestDir: "{app}\MODS\Elephant Sound When Circus Built (v 1)"; Flags: ignoreversion createallsubdirs recursesubdirs;	Components: VP34UCEX VP34UCEXNVC VP34UCMAX VP34UCMAXNVC
Source: "..\InGame Editor+ (v 46)\*"; DestDir: "{app}\MODS\InGame Editor+ (v 46)"; Flags: ignoreversion createallsubdirs recursesubdirs;	Components: VP34UCEX VP34UCEXNVC VP34UCMAX VP34UCMAXNVC
Source: "..\Quick Turns (v 10)\*"; DestDir: "{app}\MODS\Quick Turns (v 10)"; Flags: ignoreversion createallsubdirs recursesubdirs;	Components: VP34UCEX VP34UCEXNVC VP34UCMAX VP34UCMAXNVC
Source: "..\UI - Enhanced Rankings (v 13)\*"; DestDir: "{app}\MODS\UI - Enhanced Rankings (v 13)"; Flags: ignoreversion createallsubdirs recursesubdirs;	Components: VP34UCEX VP34UCEXNVC VP34UCMAX VP34UCMAXNVC
Source: "..\UI - Enhanced Rankings INT\*"; DestDir: "{app}\MODS\UI - Enhanced Rankings INT"; Flags: ignoreversion createallsubdirs recursesubdirs;	Components: VP34UCEX VP34UCEXNVC VP34UCMAX VP34UCMAXNVC
Source: "..\UI - Improved City View (Vox Populi EUI) (v 20)\*"; DestDir: "{app}\MODS\UI - Improved City View (Vox Populi EUI) (v 20)"; Flags: ignoreversion createallsubdirs recursesubdirs;	Components: VP34UCEX VP34UCEXNVC VP34UCMAX VP34UCMAXNVC
Source: "..\UI - Improved City View (Vox Populi EUI) INT\*"; DestDir: "{app}\MODS\UI - Improved City View (Vox Populi EUI) INT"; Flags: ignoreversion createallsubdirs recursesubdirs;	Components: VP34UCEX VP34UCEXNVC VP34UCMAX VP34UCMAXNVC
Source: "..\Upgrade All Units Button In Military Overview (v 2)\*"; DestDir: "{app}\MODS\Upgrade All Units Button In Military Overview (v 2)"; Flags: ignoreversion createallsubdirs recursesubdirs;	Components: VP34UCEX VP34UCEXNVC VP34UCMAX VP34UCMAXNVC
Source: "..\Upgrade All Units Button In Military Overview INT\*"; DestDir: "{app}\MODS\Upgrade All Units Button In Military Overview INT"; Flags: ignoreversion createallsubdirs recursesubdirs;	Components: VP34UCEX VP34UCEXNVC VP34UCMAX VP34UCMAXNVC

Source: "..\(overhaul) Enhanced Air Warfare 4VP (v 1.9)\*"; DestDir: "{app}\MODS\(overhaul) Enhanced Air Warfare 4VP (v 1.9)"; Flags: ignoreversion createallsubdirs recursesubdirs;	Components: VP34UCMAX VP34UCMAXNVC
Source: "..\(overhaul) Enhanced Air Warfare 4VP INT\*"; DestDir: "{app}\MODS\(overhaul) Enhanced Air Warfare 4VP INT"; Flags: ignoreversion createallsubdirs recursesubdirs;	Components: VP34UCMAX VP34UCMAXNVC
Source: "..\(overhaul) Enlightenment Era for VP\*"; DestDir: "{app}\MODS\(overhaul) Enlightenment Era for VP"; Flags: ignoreversion createallsubdirs recursesubdirs;	Components: VP34UCMAX VP34UCMAXNVC
Source: "..\(overhaul) Enlightenment Era for VP INT\*"; DestDir: "{app}\MODS\(overhaul) Enlightenment Era for VP INT"; Flags: ignoreversion createallsubdirs recursesubdirs;	Components: VP34UCMAX VP34UCMAXNVC
Source: "..\Better Lakes for Vox Populi (v 3)\*"; DestDir: "{app}\MODS\Better Lakes for Vox Populi (v 3)"; Flags: ignoreversion createallsubdirs recursesubdirs;	Components: VP34UCMAX VP34UCMAXNVC

Source: "..\Assets\*"; DestDir: "{code:GetCIVDir}\Assets"; Flags: ignoreversion createallsubdirs recursesubdirs; Components: VP34UC VP34UCEX VP34UCMAX
Source: "..\Assets_votes\*"; DestDir: "{code:GetCIVDir}\Assets"; Flags: ignoreversion createallsubdirs recursesubdirs; Components: VP34UCNVC VP34UCEXNVC VP34UCMAXNVC
Source: "..\VT\*"; DestDir: "{code:GetCIVDir}\Assets\DLC\VT"; Flags: ignoreversion createallsubdirs recursesubdirs; Components: VP34UCEX VP34UCEXNVC VP34UCMAX VP34UCMAXNVC
Source: "..\VPUI Text\VPUI_tips_ko_kr.xml"; DestDir: "{app}\Text"; Flags: ignoreversion; Components: VP34UC VP34UCNVC VP34UCEX VP34UCEXNVC VP34UCMAX VP34UCMAXNVC
; 참고: 공유 시스템 파일에서 "Flags: ignoreversion"을 사용하지 마십시오.

[Components]
Name: "VP34UC"; Description: "[기본] Vox Populi + 34UC"; Types: VP34UC; Flags: exclusive disablenouninstallwarning 
Name: "VP34UCNVC"; Description: "[기본] Vox Populi (투표 문명색 제거) + 34UC "; Types: VP34UCNVC; Flags: exclusive disablenouninstallwarning
Name: "VP34UCEX"; Description: "[확장] Vox Populi + 34UC + 편의성 추가"; Types: VP34UCEX; Flags: exclusive disablenouninstallwarning
Name: "VP34UCEXNVC"; Description: "[확장] Vox Populi (투표 문명색 제거) + 34UC + 편의성 추가 "; Types: VP34UCEXNVC; Flags: exclusive disablenouninstallwarning 
Name: "VP34UCMAX"; Description: "[전체] Vox Populi + 34UC + 편의성 추가  + 컨텐츠 추가"; Types: VP34UCMAX; Flags: exclusive disablenouninstallwarning
Name: "VP34UCMAXNVC"; Description: "[전체] Vox Populi (투표 문명색 제거)+ 34UC + 편의성 추가  + 컨텐츠 추가"; Types: VP34UCMAXNVC; Flags: exclusive disablenouninstallwarning 

[Types]
Name: "VP34UC"; Description: "[기본] Vox Populi + 34UC";
Name: "VP34UCNVC"; Description: "[기본] Vox Populi (투표 문명색 제거) + 34UC ";
Name: "VP34UCEX"; Description: "[확장] Vox Populi + 34UC + 편의성 추가";
Name: "VP34UCEXNVC"; Description: "[확장] Vox Populi (투표 문명색 제거) + 34UC + 편의성 추가 ";
Name: "VP34UCMAX"; Description: "[전체] Vox Populi + 34UC + 편의성 추가 + 컨텐츠 추가";
Name: "VP34UCMAXNVC"; Description: "[전체] Vox Populi  (투표 문명색 제거) + 34UC + 편의성 추가 + 컨텐츠 추가";

[InstallDelete]
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\cache"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\Text\VPUI_tips_ko_kr.xml"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\(1L) Community Patch INT"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\(2L) Vox Populi INT"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\(3aL) VP - EUI Compatibility Files INT"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\(4aL) Squads for VP INT"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\(overL) More Unique Components for VP (v 88) INT"

Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\(1a) Community Patch INT"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\(2a) Vox Populi INT"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\(3a) CSD for CBP INT"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\(4a) Civ IV Diplomatic Features INT"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\(4aL) UI - Promotion Tree for VP Localized (v 1)"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\(4bL) UI - Promotion Tree for VP Localized (v 1)"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\(5a) More Luxuries INT"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\(6b) Community Balance Overhaul - CF (EUI) INT"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\(7bL) UI - Promotion Tree for VP Localized (v 1)"

Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\UI - Promotion Tree for VP"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\(7) VP Community Events"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\(7) VP Community Events INT"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\(over) More Unique Components for VP (v 88)"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\(overL) More Unique Components for VP (v 88) INT"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\(ui) Trade Opportunities for VP (v 23)"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\(ui) Trade Opportunities for VP INT"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\(ui) Wonder Planner For VP (v 14)"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\(ui) Wonder Planner For VP INT"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\Elephant Sound When Circus Built (v 1)"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\InGame Editor+ (v 46)"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\UI - Enhanced Rankings (v 13)"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\UI - Enhanced Rankings INT"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\UI - Improved City View (Vox Populi EUI) (v 20)"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\UI - Improved City View (Vox Populi EUI) INT"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\Upgrade All Units Button In Military Overview (v 2)"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\Upgrade All Units Button In Military Overview INT"

Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\(overhaul) Enhanced Air Warfare 4VP (v 1.9)"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\(overhaul) Enhanced Air Warfare 4VP INT"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\(overhaul) Enlightenment Era for VP"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\(overhaul) Enlightenment Era for VP INT"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\Better Lakes for Vox Populi (v 3)"

[Code]
var
  CIVDirPage: TInputDirWizardPage;

procedure CurPageChanged(CurPageID: Integer);
begin
  if CurPageID = wpFinished then
    WizardForm.FinishedLabel.Caption := '설치 프로그램이 컴퓨터에 Vox Populi 한국어 번역 모드 설치를 완료했습니다. 모드를 실행하려면 문명 5를 열고 모드 메뉴에서 설치된 모든 모드를 활성화한 후 ''다음''을 클릭합니다(''뒤로''를 클릭하지 마세요). 즐거운 시간 되세요!';
end;

procedure InitializeWizard;

begin
  // DLC 경로 페이지 만들기

  CIVDirPage := CreateInputDirPage(wpSelectComponents,
    '문명 5 폴더를 선택하세요.', 'UI 파일은 어디에 설치해야 합니까?',
    '문명 5 설치 폴더를 선택한 후 "다음"을 클릭합니다. 설치 프로그램이 기본적으로 폴더를 선택하지 않으면 "찾아보기"를 클릭하고 올바른 폴더를 선택하세요. 찾으려면 스팀에서 Sid Meier''s Civilization V를 마우스 오른쪽 버튼으로 클릭하고 "관리 >" 에서 "로컬 파일 탐색"을 선택하세요.',
    False, '');
  CIVDirPage.Add('');

  CIVDirPage.Values[0] := GetPreviousData('CIVDir', '');
end;

function NextButtonClick(CurPageID: Integer): Boolean;
begin
  // 비어 있으면 기본 폴더를 설정합니다. 게임이 기본 위치에 설치되지 않은 경우 기본 폴더를 선택하지 마세요.
  if CIVDirPage.Values[0] = '' then
    if DirExists(ExpandConstant('{commonpf}\Steam\steamapps\common\Sid Meier''s Civilization V\Assets\DLC')) then
      CIVDirPage.Values[0] := ExpandConstant('{reg:HKCU\SOFTWARE\Firaxis\Civilization5,LastKnownPath|{commonpf}\Steam\steamapps\common\Sid Meier''s Civilization V}');
  Result := not (CurPageID = CIVDirPage.ID) or DirExists(CIVDirPage.Values[0] + '\Assets\DLC');
  if Result = False then
    MsgBox('문명 5 폴더로 가는 올바른 경로를 찾지 못했습니다. 폴더를 찾으려면 스팀에서 Sid Meier''s Civilization V를 마우스 오른쪽 버튼으로 클릭하고 "관리 >" 에서 "로컬 파일 탐색"을 선택하세요.', mbInformation, MB_OK)
  else
  begin
    // 필요한 DLC가 모두 설치되었는지 확인합니다.
    Result := not (CurPageID = CIVDirPage.ID) or (DirExists(CIVDirPage.Values[0] + '\Assets\DLC\DLC_01') and
              DirExists(CIVDirPage.Values[0] + '\Assets\DLC\DLC_02') and
              DirExists(CIVDirPage.Values[0] + '\Assets\DLC\DLC_03') and
              DirExists(CIVDirPage.Values[0] + '\Assets\DLC\DLC_04') and
              DirExists(CIVDirPage.Values[0] + '\Assets\DLC\DLC_05') and
              DirExists(CIVDirPage.Values[0] + '\Assets\DLC\DLC_06') and
              DirExists(CIVDirPage.Values[0] + '\Assets\DLC\DLC_07') and
              DirExists(CIVDirPage.Values[0] + '\Assets\DLC\DLC_Deluxe') and
              DirExists(CIVDirPage.Values[0] + '\Assets\DLC\Expansion') and
              DirExists(CIVDirPage.Values[0] + '\Assets\DLC\Expansion2')); 
    if Result = False then
      MsgBox('필요한 모든 DLC가 설치되어 있지 않습니다. DLC가 없으면 Vox Populi를 설치할 수 없으므로 Vox Populi 한국어 모드도 설치할 수 없습니다.', mbInformation, MB_OK);
  end;
end;

function UpdateReadyMemo(Space, NewLine, MemoUserInfoInfo, MemoDirInfo, MemoTypeInfo,
  MemoComponentsInfo, MemoGroupInfo, MemoTasksInfo: String): String;
var
  S: String;
begin
  // 'Ready Memo'에 일반 설정과 사용자 정의 설정을 입력합니다.
  S := '';

  S := S + MemoDirInfo + NewLine + NewLine;
  S := S + '문명 5 위치:' + NewLine;
  S := S + Space + CIVDirPage.Values[0] + NewLine + NewLine;

  S := S + MemoComponentsInfo
  Result := S;
end;

function GetCIVDir(Param: String): String;
begin
  { Return the selected CIVDir }
  Result := CIVDirPage.Values[0];
end;

function IsUI: Boolean;
begin
  Result := true;
end;

function ShouldSkipPage(CIVDirPageID: Integer): Boolean;
begin
  Result := False;
  if CIVDirPageID = CIVDirPage.ID then
  begin
    Result := not IsUI;
  end;
end;