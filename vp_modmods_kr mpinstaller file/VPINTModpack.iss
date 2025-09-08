; Inno Script Studio Wizard로 생성된 스크립트입니다.
; INNO SETUP 스크립트 파일을 만드는 방법에 대한 자세한 내용은 설명서를 참조하세요!

#define MyAppName "VP INT+ Modpack"
#define MyAppVersion "4.22"
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
WizardImageStretch=False
Compression=lzma
SolidCompression=yes
ShowComponentSizes=False
AllowNoIcons=yes
Uninstallable=no
PrivilegesRequired=admin
UsedUserAreasWarning=no
CreateAppDir=False

[Languages]
Name: "korean"; MessagesFile: "compiler:Languages\Korean.isl"

[Files]
Source: "..\AssetsMP\*"; DestDir: "{code:GetCIVDir}\Assets"; Flags: ignoreversion createallsubdirs recursesubdirs; Components: vp
Source: "..\Assets_votesMP\*"; DestDir: "{code:GetCIVDir}\Assets"; Flags: ignoreversion createallsubdirs recursesubdirs; Components: nvc
Source: "..\MPMaps\*"; DestDir: "{code:GetCIVDir}\Assets\Maps"; Flags: ignoreversion createallsubdirs recursesubdirs; Components: map
Source: "..\UI\CivSelection\Backup\*"; DestDir: "{code:GetCIVDir}\Assets"; Flags: ignoreversion createallsubdirs recursesubdirs; Components: csbu

; 참고: 공유 시스템 파일에서 "Flags: ignoreversion"을 사용하지 마십시오.

[Components]
Name: "vp"; Description: "Vox Populi + 34UC + 편의성 추가 + 컨텐츠 추가"; Types: VP Custom; Flags: disablenouninstallwarning fixed
Name: "nvc"; Description: "세계 의회 투표 문명 이름 색상 제거 패치"; Types: Custom; Flags: disablenouninstallwarning
Name: "csbu"; Description: "문명 선택 개선 제거 (문명 선택 기본 화면)"; Types: Custom; Flags: disablenouninstallwarning
Name: "map"; Description: "추가 지도"; Types: Custom; Flags: disablenouninstallwarning

[Types]
Name: "VP"; Description: "Vox Populi + 34UC + 편의성 추가 + 컨텐츠 추가";
Name: "Custom"; Description: "사용자 정의 설치"; Flags: iscustom

[InstallDelete]
Type: filesandordirs; Name: "{code:GetCIVDir}\Assets\DLC\MP_MODSPACK"
Type: filesandordirs; Name: "{code:GetCIVDir}\Assets\DLC\VT"
Type: filesandordirs; Name: "{code:GetCIVDir}\Assets\DLC\UI_SukMainMenu"
Type: filesandordirs; Name: "{code:GetCIVDir}\Assets\DLC\UI_CustomModScreen"
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

;Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\(ui) City-States Leaders for VP KR"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\(ui) List Enhancements for VP"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\(ui) List Enhancements for VP INT"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\(ui) List Enhancements for VP KR"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\(ui) Meaningful Colours (v 16)"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\(ui) Trade Opportunities for VP (v 23)"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\(ui) Trade Opportunities for VP INT"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\(ui) Wonder Planner For VP (v 14)"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\(ui) Wonder Planner For VP INT"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\(ui) Wonder Planner For VP (v 14) KR"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\(ui) Wonder Planner For VP KR"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\Auto-Sell Buildings (v 1)"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\Elephant Sound When Circus Built (v 1)"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\InGame Editor+ (v 46)"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\Large Minimap for VP wth EUI only (v 1)"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\More Right Click Shortcuts (v 1)"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\Quick Animations (v 1)"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\Quick Turns (v 10)"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\Route Planner for VP (v 1)"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\Route Planner for VP (v 1) INT"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\UI - Antiquity Site Tooltips (v 5)"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\UI - Auto Map Pins (v 4)"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\UI - City Happiness (v 17)"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\UI - City Production (v 15)"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\UI - City Religions (v 4)"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\UI - Diplomacy Log (v 3)"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\UI - Enhanced Rankings (v 13)"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\UI - Enhanced Rankings INT"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\UI - Gold Alerts (v 10)"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\UI - Horizontal Leaders' Portraits for VP (v2.1)"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\UI - Improved City View (Vox Populi EUI) (v 20)"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\UI - Improved City View (Vox Populi EUI) INT"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\UI - Map Pins (v 17)"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\UI - No Auto-Embark Workers (v 7)"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\UI - Notify Exit Resistance (v 1)"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\UI - Overlay Barbarians (v 8)"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\UI - Overlay City Limits (v 8)"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\UI - Overlay Harbours And Airports (v 1)"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\UI - Overlay Luxuries (v 3)"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\UI - Overlay Resources (v 11)"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\UI - Overlay Road And Rail (v 9)"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\UI - Overlay Unimproved Tiles (v 1)"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\UI - Overlay Wonders (v 7)"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\UI - Summary Clock (v 11)"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\Upgrade All Units Button In Military Overview (v 2)"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\Upgrade All Units Button In Military Overview INT"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\VP Happiness notifications (v 1) KR"

;Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\!Jarcast's Cities of Marble for VP (v 3)"
;Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\!Jarcast's Cities of Marble for VP (v 3) INT"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\!Jarcast's Hidden Wonders (VP) KR (v 2)"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\!Jarcast's Hidden Wonders (VP) (v 2)"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\!Jarcast's Hidden Wonders (VP) INT"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\!Jarcast's Volcanoes for VP (v 7)"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\!Jarcast's Volcanoes for VP (v 7) INT"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\(6) Future Age for VP"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\(6) Future Age for VP INT (AI)"
;Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\(8) Events and Decisions (CBO) (v 14)"
;Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\(8) Events and Decisions (CBO) (v 14) INT"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\(game) Capture+++ (v 5)"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\(n) Religious Victory KR"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\(n) Subterfuge KR"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\(overhaul) Enhanced Air Warfare 4VP (v 1.9)"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\(overhaul) Enhanced Air Warfare 4VP INT"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\(overhaul) Enlightenment Era for VP"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\(overhaul) Enlightenment Era for VP INT"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\(overhaul) Even More Resources for Vox Populi UCS (v 14)"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\(overhaul) Even More Resources for Vox Populi UCS (v 14) INT"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\(overhaul) Even More Resources for Vox Populi UCS INT"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\(overhaul) More Wonders for VP"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\(overhaul) More Wonders for VP INT (AI)"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\(overhaul) Unique City States for VP"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\(overhaul) Unique City States for VP INT"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\(overhaul) Unique City States for VP INT (AI)"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\(text) Promotion Overhaul for VP"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\(text) Promotion Overhaul for VP INT (AI)"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\(visual) Unit Scaling and Formation for VP (v 12)"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\_Named Ethnic Units_ (v 600)"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\Better Lakes for Vox Populi (v 3)"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\Better Lakes for Vox Populi INT"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\Civic And Reform (v 22)"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\Civic And Reform (v 22) INT"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\Civic And Reform (v 22) KR"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\Continental Drift (v 3)"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\Even More Resources for Vox Populi UCS (v 14)"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\Even More Resources for Vox Populi UCS INT"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\Gedemon's YnAEMP"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\Gedemon's YnAEMP INT"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\Gedemon's YnAEMP KR"
;Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\Hex Conquer VP (v 7) KR"
;Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\Historical Religions Complete (BNW or GK) (v 45)"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\Hokaths Proposals"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\Hokaths Proposals (INT)"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\Hokaths Proposals INT"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\Horem's Aloe Vera bonus resource (v 4)"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\Horem's Aloe Vera bonus resource (v 4) INT"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\Jarcast & Hokath's Additional Luxuries (v 3)"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\Jarcast & Hokath's Additional Luxuries (v 3) INT"
;Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\Jarcast's Bigger Huge Map for Communitu_79a (v 5)"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\Jarcast's Extraction Outpost (v 3)"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\Jarcast's Pikeman Tweak (v 2)"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\Jarcast's Pikeman Tweak (v 2) INT"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\JFD's Sovereignty for VP (v 15a)"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\JFD's Sovereignty for VP (v 15a) INT"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\JFD's Sovereignty for VP (v 15a) KR"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\Landmines for BNW (v 3)"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\Longer Eras - Historic (v 8)"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\Longer Eras - Historic (v 8) INT"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\Maritime Weather+ (v 6)"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\Maritime Weather+ (v 6) INT"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\Mechanized Infantry with Soldiers, Resized (v 2)"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\Misc Tweaks for VP (v 4.10)"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\Misc Tweaks for VP (v 4.10) INT"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\Mojave Wasteland - Fallout New Vegas (v 101)"
;Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\NavalMod(v5)"
;Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\NavalMod(v5) INT"
;Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\New Beliefs Mods KR"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\Notification Settings (v 1)"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\Pontoon Bridges for VP (v 2)"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\Pontoon Bridges for VP (v 2) INT"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\Really Advanced Setup (v 15)"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\Really Advanced Setup (v 15) INT"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\Really Advanced Setup INT"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\Really Advanced Setup (v 15) KR"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\Reforestation (v 9)"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\Religion - Permanent Pantheons (v 1)"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\Sukritact's Civ VI Style City Names (v 1)"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\TreeSuccession (v 44)"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\TreeSuccession (v 44) INT"
;Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\TorpedoBoat (v19)"
;Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\TorpedoBoat (v19) INT"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\Vox Populi's Bare Necessities (v 12)"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\Vox Populi's Bare Necessities INT"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\Wake All and Upgrade All Units In Military Overview (v 1)"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\Wake All and Upgrade All Units In Military Overview (v 1) INT"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\Whale Battles (v 1)"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\Whale Battles (v 1) INT"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\Wonder Race (v 7)"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\Wonder Race (v 7) INT"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\Wonder Race (v 7) KR"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\World Congress Reformation (v 12)"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\World Congress Reformation INT"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\Worker Mountaineering (v 3)"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\Worker Mountaineering (v 3) INT"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\World of Lore - DragonFable (v 1)"

Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\Counter-Reconnaissance (v 44)"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\Counter-Reconnaissance (v 44) INT"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\Exploration Heritage (v 46)"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\Exploration Heritage (v 46) INT"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\Recon Pay (Core0) Terrain Cost (v 7)"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\Recon Pay (Core1) Exploration Balancer (v 3)"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\Recon Pay (Core1) Exploration Balancer (v 3) INT"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\Recon Pay (Recommended1) Fast Coast (v 3)"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\Recon Pay (Recommended1) Fast Coast (v 3) INT"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\Recon Pay (Recommended2) Fast Rivers (v 6)"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\Recon Pay (Recommended2) Fast Rivers (v 6) INT"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\Recon Pay (Recommended3) Fast Coastal (v 7)"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\Recon Pay (Recommended3) Fast Coastal (v 7) INT"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\Recon Pay (Xtra1) Arctician (v 2)"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\Recon Pay (Xtra1) Arctician (v 2) INT"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\Recon Pay (Xtra2) Free ZoC (v 3)"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\Recon Pay (Xtra2) Free ZoC (v 3) INT"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\Recon Pay (Xtra3) Trees Obstruct Mounted Armor (v 6)"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\Recon Pay (Xtra3) Trees Obstruct Mounted Armor (v 6) INT"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\Recon Pay (Xtra4) Change Port (v 2)"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\Recon Pay (Xtra5) Horse Thieves (v 1)"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\Recon Pay (Xtra5) Horse Thieves (v 1) INT"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\Recon Pay (xtra6) Exploration Specialization (v 1)"

[Code]

var
  CIVDirPage: TInputDirWizardPage;

procedure CurPageChanged(CurPageID: Integer);
begin
  if CurPageID = wpFinished then
    WizardForm.FinishedLabel.Caption := '설치 프로그램이 컴퓨터에 Vox Populi 한국어+ 모드팩 설치를 완료했습니다. 모드팩은 모드 메뉴를 쓰지 않고, 평상시 문명 5를 할 때 처럼 싱글과 멀티를 하시면 됩니다. 즐거운 시간 되세요!';
end;

procedure InitializeWizard;

begin
  // 설치 경로 페이지 만들기

  CIVDirPage := CreateInputDirPage(wpSelectComponents,
    '문명 5 폴더를 선택하세요.', 'Vox Populi 한국어+ 모드팩을 어디에 설치해야 합니까?',
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
      MsgBox('필요한 모든 DLC가 설치되어 있지 않습니다. DLC가 없으면 Vox Populi를 설치할 수 없으므로 Vox Populi 한국어+ 모드팩도 설치할 수 없습니다.', mbInformation, MB_OK);
  end;
end;

function UpdateReadyMemo(Space, NewLine, MemoUserInfoInfo, MemoDirInfo, MemoTypeInfo,
  MemoComponentsInfo, MemoGroupInfo, MemoTasksInfo: String): String;
var
  S: String;
begin
  // 'Ready Memo'에 일반 설정과 사용자 정의 설정을 입력합니다.
  S := '';

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