; Inno Script Studio Wizard로 생성된 스크립트입니다.
; INNO SETUP 스크립트 파일을 만드는 방법에 대한 자세한 내용은 설명서를 참조하세요!

#define MyAppName "VP 한국어 엄선된 모드팩"
#define MyAppVersion "5.1.4"
#define MyAppPublisher "HANDANI"
#define MyAppURL "https://github.com/handanikr/vp_modmods_kr"

[Setup]
; 참고: AppId 값은 이 애플리케이션을 고유하게 식별합니다.
; 다른 애플리케이션의 설치 프로그램에서 동일한 AppId 값을 사용하지 마세요.
; (새로운 GUID를 생성하려면 IDE 내에서 Tools | Generate GUID를 클릭합니다.)
AppId={{CF4B0F66-5649-4AB6-990F-FE192DD056E3}
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
SetupIconFile=installer.ico
WizardImageStretch=no
Compression=lzma2
SolidCompression=yes
ShowComponentSizes=yes
AllowNoIcons=yes
Uninstallable=no
PrivilegesRequired=admin
UsedUserAreasWarning=no
CreateAppDir=no

[Languages]
Name: "korean"; MessagesFile: "compiler:Languages\Korean.isl"

[Files]
Source: "..\AssetsMP\*"; DestDir: "{code:GetCIVDir}\Assets"; Flags: ignoreversion recursesubdirs; Components: vp
Source: "..\Assets_votesMP\*"; DestDir: "{code:GetCIVDir}\Assets"; Flags: ignoreversion recursesubdirs; Components: nvc
Source: "..\MPMaps\*"; DestDir: "{code:GetCIVDir}\Assets\Maps"; Flags: ignoreversion recursesubdirs; Components: maps
Source: "..\UI\CivSelection\Backup\*"; DestDir: "{code:GetCIVDir}\Assets"; Flags: ignoreversion recursesubdirs; Components: civselect
Source: "..\Textures\Artful Textures\*"; DestDir: "{code:GetCIVDir}\Assets\DLC\Artful Textures"; Flags: ignoreversion recursesubdirs; Components: texture\at
Source: "..\Textures\VT\*"; DestDir: "{code:GetCIVDir}\Assets\DLC\VT"; Flags: ignoreversion recursesubdirs; Components: texture\vt

; 참고: 공유 시스템 파일에서 "Flags: ignoreversion"을 사용하지 마십시오.

[Components]
Name: "vp"; Description: "VP + UI + 5/6 UC + 계몽"; Types: VP Custom; Flags: disablenouninstallwarning fixed
Name: "maps"; Description: "추가 지도: 문명 5 지도 폴더에 복사"; Types: VP Custom; Flags: disablenouninstallwarning
Name: "nvc"; Description: "세계 의회 투표 문명 이름 색상 제거"; Types: Custom; Flags: disablenouninstallwarning
Name: "civselect"; Description: "문명 선택 기본 화면"; Types: Custom; Flags: disablenouninstallwarning
Name: "texture"; Description: "지도 텍스처"; Types: Custom; Flags: disablenouninstallwarning
Name: "texture\vt"; Description: "선명한 텍스처 (Vibrant Textures)"; Types: VP Custom; Flags: exclusive disablenouninstallwarning
Name: "texture\at"; Description: "예술적인 텍스처 (Artful Textures)"; Types: Custom; Flags: exclusive disablenouninstallwarning

[Types]
Name: "VP"; Description: "Vox Populi 한국어 번역";
Name: "Custom"; Description: "사용자 정의 설치"; Flags: iscustom

[InstallDelete]
Type: filesandordirs; Name: "{code:GetCIVDir}\Assets\DLC\MP_MODSPACK"
Type: filesandordirs; Name: "{code:GetCIVDir}\Assets\DLC\Artful Textures"
Type: filesandordirs; Name: "{code:GetCIVDir}\Assets\DLC\VT"
Type: filesandordirs; Name: "{code:GetCIVDir}\Assets\DLC\UI_SukMainMenu"
Type: filesandordirs; Name: "{code:GetCIVDir}\Assets\DLC\UI_SukMainMenu_KR"
Type: filesandordirs; Name: "{code:GetCIVDir}\Assets\DLC\UI_CustomModScreen"
Type: filesandordirs; Name: "{code:GetCIVDir}\Assets\DLC\UI_CustomModScreen_KR"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\cache"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\Text\VPUI_tips_ko_kr.xml"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\(1L) Community Patch INT"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\(2L) Vox Populi INT"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\(3aL) VP - EUI Compatibility Files INT"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\(4aL) Squads for VP INT"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\(1a) Community Patch INT"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\(2a) Vox Populi INT"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\(3a) CSD for CBP INT"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\(4a) Civ IV Diplomatic Features INT"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\(4aL) UI - Promotion Tree for VP Localized (v 1)"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\(4bL) UI - Promotion Tree for VP Localized (v 1)"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\(4b) Promotion Tree for VP"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\(5a) More Luxuries INT"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\(6b) Community Balance Overhaul - CF (EUI) INT"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\(7bL) UI - Promotion Tree for VP Localized (v 1)"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\UI - Promotion Tree for VP"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\(7) VP Community Events"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\(7) VP Community Events INT"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\(over) More Unique Components for VP (v 88)"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\(overL) More Unique Components for VP (v 88) INT"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\(over) More Unique Components for VP (v 89)"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\(overL) More Unique Components for VP (v 89) INT"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\JFD's Cultural Diversity - (1) (Core) Utilities (v 21)"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\JFD's Cultural Diversity - (2) (Art) Splash Screens (v 1)"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\JFD's Cultural Diversity - (2) (Sound) Unit Dialogue (v 1)"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\JFD's Cultural Diversity - (2a) (Gameplay) Unique Components"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\JFD's Cultural Diversity INT"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\!Horem's Aloe Vera bonus resource (v 4)"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\!Horem's Aloe Vera bonus resource (v 4) INT"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\!Jarcast & Hokath's Additional Luxuries (v 4)"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\!Jarcast and Hokath's Additional Luxuries INT"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\!Jarcast & Hokath's Tibet for VP (v 6)"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\!Jarcast's Cities of Marble for VP (v 4)"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\!Jarcast's Cities of Marble for VP (v 4) INT"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\!Jarcast's City States Leaders Ultimate (v 1)"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\!Jarcast's City States Leaders Ultimate (v 1) INT"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\!Jarcast's City States Leaders Ultimate INT"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\!Jarcast's Hidden Wonders (VP)"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\!Jarcast's Hidden Wonders (VP) INT"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\!Jarcast's Italy for VP (v 3)"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\!Jarcast's Ndongo-Matamba for VP (v 3)"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\!Jarcast's Permafrost Alive (v 1)"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\!Jarcast's Permafrost Alive (v 1) INT"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\!Jarcast's The Navajo for VP (v 3)"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\!Jarcast's Volcanoes for VP (v 8)"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\!Jarcast's Volcanoes for VP (v 8) INT"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\(j) Bare Necessities (v 15)"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\(j) Bare Necessities (v 15) INT"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\(overhaul) Enhanced Air Warfare 4VP (v 1.9)"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\(overhaul) Enhanced Air Warfare 4VP INT"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\(overhaul) Enlightenment Era for VP"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\(overhaul) Enlightenment Era for VP INT"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\(overhaul) More Wonders for VP"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\(overhaul) More Wonders for VP INT"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\(overhaul) Unique City States for VP"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\(overhaul) Unique City States for VP INT"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\(overhaul) Even More Resources for Vox Populi (v 15)"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\(overhaul) Even More Resources for Vox Populi (v 15) INT"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\(ui) City-States Leaders for VP"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\(ui) City-States Leaders for VP INT"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\(ui) List Enhancements for VP KR"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\(Primary) - Gwennog's France - Philippe Auguste for VP (v.9)"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\(ui) Trade Opportunities for VP"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\(ui) Trade Opportunities for VP INT"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\(ui) Wonder Planner For VP KR"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\(Unity) - GH's Louisiana - Joseph Beausoleil Broussard for VP (v.13)"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\(Unity) - GH's Louisiana - Joseph Beausoleil Broussard for VP (v.14)"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\Auto-Sell Buildings (v 1)"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\Continental Drift (v 3)"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\Even More Resources for Vox Populi UCS (v 15)"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\Even More Resources for Vox Populi UCS INT"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\Gedemon's YnAEMP KR"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\Historical Religions Complete (BNW or GK) (v 45)"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\InGame Editor+ (v 47)"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\Jarcast's Bigger Huge Map for Communitu_79a (v 5)"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\JFD's Civilizations - Papal States for VP (v 11)"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\Longer Eras - Historic (v 8)"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\Longer Eras - Historic (v 8) INT"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\Maritime Battles+ (v 50)"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\Maritime Weather+ (v 51)"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\Maritime Weather+ (v 51) INT"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\Mojave Wasteland - Fallout New Vegas (v 101)"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\Music Changer (v 2)"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\Quick Turns (v 10)"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\Really Advanced Setup (v 15) KR"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\Recon Pay (Core0) Terrain Cost (v 8)"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\Recon Pay (Core1) Exploration Balancer (v 4)"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\Recon Pay (Core1) Exploration Balancer (v 4) INT"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\Recon Pay (Recommended1) Fast Coast (v 4)"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\Recon Pay (Recommended1) Fast Coast (v 4) INT"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\Recon Pay (Recommended2) Fast Rivers (v 7)"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\Recon Pay (Recommended2) Fast Rivers (v 7) INT"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\Recon Pay (Recommended3) Fast Coastal (v 8)"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\Recon Pay (Recommended3) Fast Coastal (v 8) INT"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\Sukritact's Civ VI Style City Names (v 1)"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\UI - Antiquity Site Tooltips (v 5)"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\UI - Auto Map Pins (v 4)"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\UI - City Happiness (v 17)"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\UI - City Production (v 15)"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\UI - City Religions (v 4)"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\UI - Diary (v 21)"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\UI - Enhanced Rankings (v 13)"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\UI - Enhanced Rankings INT"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\UI - Gold Alerts (v 10)"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\UI - Horizontal Leaders' Portraits for VP (v 3)"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\UI - Improved City View (Vox Populi EUI)"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\UI - Improved City View (Vox Populi EUI) INT"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\UI - Map Pins (v 17)"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\UI - No Auto-Embark Workers (v 7)"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\UI - Notify Exit Resistance (v 1)"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\VP Happiness notifications (v 1) KR"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\Wake All and Upgrade All Units In Military Overview (v 1)"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\Wake All and Upgrade All Units In Military Overview (v 1) INT"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\World of Lore - DragonFable (v 1)"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\zai4z's Landmark Cultural Variation (v 1)"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\zuiLeaderHead"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\zuiLeaderHead KR"

[Code]

var
  CIVDirPage: TInputDirWizardPage;

procedure CurPageChanged(CurPageID: Integer);
begin
  if CurPageID = wpFinished then
  begin
    if WizardIsComponentSelected('Uninstall') then
    begin
      WizardForm.FinishedLabel.Caption := '제거 완료';
    end
    else
    begin
      WizardForm.FinishedLabel.Caption := '설치 프로그램이 컴퓨터에 Vox Populi 한국어 모드 설치를 완료했습니다. 모드를 실행하려면 문명 5를 열고 모드 메뉴에서 설치된 모든 모드를 활성화한 후 ''다음''을 클릭합니다(''뒤로''를 클릭하지 마세요). 즐거운 시간 되세요!';
    end;
  end; 
end;

procedure InitializeWizard;
begin
  // DLC 경로 페이지 만들기

  CIVDirPage := CreateInputDirPage(wpSelectComponents,
    '문명 5 폴더를 선택하세요.', '',
    '문명 5 설치 폴더를 선택한 후 "다음"을 클릭합니다. 설치 프로그램이 기본적으로 폴더를 선택하지 않으면 "찾아보기"를 클릭하고 올바른 폴더를 선택하세요. 찾으려면 스팀에서 Sid Meier''s Civilization V를 마우스 오른쪽 버튼으로 클릭하고 "관리 >" 에서 "로컬 파일 탐색"을 선택하세요.',
    False, '');
  CIVDirPage.Add('');

  CIVDirPage.Values[0] := GetPreviousData('CIVDir', '');
end;
(*
procedure RegisterPreviousData(PreviousDataKey: Integer);
begin
  // 선택한 폴더를 향후 재설치/업그레이드를 위해 저장합니다. //balparmak: 지금은 이것을 보관할 필요가 없습니다.
  SetPreviousData(PreviousDataKey, 'CIVDir', CIVDirPage.Values[0]);
end;
 *)
function NextButtonClick(CurPageID: Integer): Boolean;
var
  MissingFolders: TStringList;
  BaseDir: string;
begin
  // 비어 있으면 기본 폴더를 설정합니다. 게임이 기본 위치에 설치되지 않은 경우 기본 폴더를 선택하지 마세요.
  if CIVDirPage.Values[0] = '' then
    if DirExists(ExpandConstant('{commonpf}\Steam\steamapps\common\Sid Meier''s Civilization V\Assets\DLC')) then
      CIVDirPage.Values[0] := ExpandConstant('{reg:HKCU\SOFTWARE\Firaxis\Civilization5,LastKnownPath|{commonpf}\Steam\steamapps\common\Sid Meier''s Civilization V}');
  Result := not (CurPageID = CIVDirPage.ID) or DirExists(CIVDirPage.Values[0] + '\Assets\DLC');
  if Result = False then
    MsgBox('문명 5 폴더로 가는 올바른 경로를 찾지 못했습니다. 폴더를 찾으려면 스팀에서 Sid Meier''s Civilization V를 마우스 오른쪽 버튼으로 클릭하고 "관리 >" 에서 "로컬 파일 탐색"을 선택하세요.', mbInformation, MB_OK)
  else if CurPageID = CIVDirPage.ID then
  begin
    // check if all required DLC are installed
    MissingFolders := TStringList.Create;
    BaseDir := CIVDirPage.Values[0] + '\Assets\DLC\';
    
    if not DirExists(BaseDir + 'DLC_01') then
      MissingFolders.Add('문명 & 시나리오: 몽골 (칭기즈 칸)');
    if not DirExists(BaseDir + 'DLC_02') then
      MissingFolders.Add('더블 문명 & 시나리오: 스페인, 잉카');
    if not DirExists(BaseDir + 'DLC_03') then
      MissingFolders.Add('문명 & 시나리오: 폴리네시아');
    if not DirExists(BaseDir + 'DLC_04') then
      MissingFolders.Add('문명 & 시나리오: 덴마크 - 바이킹');
    if not DirExists(BaseDir + 'DLC_05') then
      MissingFolders.Add('문명 & 시나리오: 한국');
    if not DirExists(BaseDir + 'DLC_06') then
      MissingFolders.Add('시나리오: 고대 세계의 불가사의');
    if not DirExists(BaseDir + 'DLC_07') then
      MissingFolders.Add('시나리오: 신대륙 정복');
    if not DirExists(BaseDir + 'DLC_Deluxe') then
      MissingFolders.Add('문명: 바빌론 (네부카드네자르 2세)');
    if not DirExists(BaseDir + 'Expansion') then
      MissingFolders.Add('신과 왕');
    if not DirExists(BaseDir + 'Expansion2') then
      MissingFolders.Add('멋진 신세계');

    if MissingFolders.Count > 0 then
    begin
      MsgBox('필수 DLC가 모두 설치되어 있지 않습니다. 다음 DLC가 누락되었습니다:' + #13#10 + #13#10 + MissingFolders.Text + #13#10 + #13#10 + 'Vox Populi는 DLC가 누락된 경우 설치할 수 없으므로 Vox Populi 한국어 모드도 설치할 수 없습니다.', mbInformation, MB_OK);
      Result := False;
    end
    else
    begin
      Result := True;
    end;

    MissingFolders.Free;
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
  S := S + '문명 5 위치' + NewLine;
  S := S + Space + CIVDirPage.Values[0] + NewLine + NewLine;

  S := S + MemoComponentsInfo
  Result := S;
end;

function GetCIVDir(Param: String): String;
begin
  { Return the selected CIVDir }
  Result := CIVDirPage.Values[0];
end;
