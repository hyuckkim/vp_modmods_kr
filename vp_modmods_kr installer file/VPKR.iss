; Inno Script Studio Wizard로 생성된 스크립트입니다.
; INNO SETUP 스크립트 파일을 만드는 방법에 대한 자세한 내용은 설명서를 참조하세요!

#define MyAppName "VP 한국어"
#define MyAppVersion "4.22"
#define MyAppPublisher "HANDANI"
#define MyAppURL "https://github.com/handanikr/vp_modmods_kr"
#define SourcePath ".."

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
WizardImageStretch=false
Compression=lzma2
SolidCompression=yes
ShowComponentSizes=true
AllowNoIcons=yes
Uninstallable=no
PrivilegesRequired=admin
DirExistsWarning=no
UsedUserAreasWarning=no

[Languages]
Name: "ko"; MessagesFile: "compiler:Languages\Korean.isl"

[Files]
Source: "{#SourcePath}\(1L) Community Patch INT\*"; DestDir: "{app}\MODS\(1L) Community Patch INT"; Flags: ignoreversion createallsubdirs recursesubdirs; Components: vp
Source: "{#SourcePath}\(2L) Vox Populi INT\*"; DestDir: "{app}\MODS\(2L) Vox Populi INT"; Flags: ignoreversion createallsubdirs recursesubdirs;	Components: vp
Source: "{#SourcePath}\(3aL) VP - EUI Compatibility Files INT\*"; DestDir: "{app}\MODS\(3aL) VP - EUI Compatibility Files INT"; Flags: ignoreversion createallsubdirs recursesubdirs; Components:  vp
Source: "{#SourcePath}\(4aL) Squads for VP INT\*"; DestDir: "{app}\MODS\(4aL) Squads for VP INT"; Flags: ignoreversion createallsubdirs recursesubdirs;	Components: vp
Source: "{#SourcePath}\UI - Promotion Tree for VP\*"; DestDir: "{app}\MODS\UI - Promotion Tree for VP"; Flags: ignoreversion createallsubdirs recursesubdirs;	Components: vppt
Source: "{#SourcePath}\(7) VP Community Events\*"; DestDir: "{app}\MODS\(7) VP Community Events"; Flags: ignoreversion createallsubdirs recursesubdirs;	Components: vpc
Source: "{#SourcePath}\(7) VP Community Events INT\*"; DestDir: "{app}\MODS\(7) VP Community Events INT"; Flags: ignoreversion createallsubdirs recursesubdirs;	Components: vpc
Source: "{#SourcePath}\(over) More Unique Components for VP (v 89)\*"; DestDir: "{app}\MODS\(over) More Unique Components for VP (v 89)"; Flags: ignoreversion createallsubdirs recursesubdirs; Components: vpuc
Source: "{#SourcePath}\(overL) More Unique Components for VP (v 89) INT\*"; DestDir: "{app}\MODS\(overL) More Unique Components for VP (v 89) INT"; Flags: ignoreversion createallsubdirs recursesubdirs; Components: vpuc

;Source: "{#SourcePath}\(ui) City-States Leaders for VP KR\*"; DestDir: "{app}\MODS\(ui) City-States Leaders for VP KR"; Flags: ignoreversion createallsubdirs recursesubdirs;	Components: csl
Source: "{#SourcePath}\(ui) List Enhancements for VP KR\*"; DestDir: "{app}\MODS\(ui) List Enhancements for VP KR"; Flags: ignoreversion createallsubdirs recursesubdirs;	Components: le
Source: "{#SourcePath}\(ui) Meaningful Colours (v 16)\*"; DestDir: "{app}\MODS\(ui) Meaningful Colours (v 16)"; Flags: ignoreversion createallsubdirs recursesubdirs;	Components: mc
Source: "{#SourcePath}\(ui) Trade Opportunities for VP (v 23)\*"; DestDir: "{app}\MODS\(ui) Trade Opportunities for VP (v 23)"; Flags: ignoreversion createallsubdirs recursesubdirs;	Components: vpto
Source: "{#SourcePath}\(ui) Trade Opportunities for VP INT\*"; DestDir: "{app}\MODS\(ui) Trade Opportunities for VP INT"; Flags: ignoreversion createallsubdirs recursesubdirs;	Components: vpto
Source: "{#SourcePath}\(ui) Wonder Planner For VP KR\*"; DestDir: "{app}\MODS\(ui) Wonder Planner For VP KR"; Flags: ignoreversion createallsubdirs recursesubdirs;	Components: vpwp
Source: "{#SourcePath}\Auto-Sell Buildings (v 1)\*"; DestDir: "{app}\MODS\Auto-Sell Buildings (v 1)"; Flags: ignoreversion createallsubdirs recursesubdirs;	Components: asb
Source: "{#SourcePath}\Elephant Sound When Circus Built (v 1)\*"; DestDir: "{app}\MODS\Elephant Sound When Circus Built (v 1)"; Flags: ignoreversion createallsubdirs recursesubdirs;	Components: ele
Source: "{#SourcePath}\InGame Editor+ (v 46)\*"; DestDir: "{app}\MODS\InGame Editor+ (v 46)"; Flags: ignoreversion createallsubdirs recursesubdirs;	Components: ige
Source: "{#SourcePath}\Large Minimap for VP wth EUI only (v 1)\*"; DestDir: "{app}\MODS\Large Minimap for VP wth EUI only (v 1)"; Flags: ignoreversion createallsubdirs recursesubdirs;	Components: lm
Source: "{#SourcePath}\Longer Eras - Historic (v 8)\*"; DestDir: "{app}\MODS\Longer Eras - Historic (v 8)"; Flags: ignoreversion createallsubdirs recursesubdirs;	Components: leh
Source: "{#SourcePath}\Longer Eras - Historic (v 8) INT\*"; DestDir: "{app}\MODS\Longer Eras - Historic (v 8) INT"; Flags: ignoreversion createallsubdirs recursesubdirs;	Components: leh
Source: "{#SourcePath}\Music Changer (v 2)\*"; DestDir: "{app}\MODS\Music Changer (v 2)"; Flags: ignoreversion createallsubdirs recursesubdirs;	Components: music
Source: "{#SourcePath}\Notification Settings (v 1)\*"; DestDir: "{app}\MODS\Notification Settings (v 1)"; Flags: ignoreversion createallsubdirs recursesubdirs;	Components: ns
Source: "{#SourcePath}\Quick Animations (v 1)\*"; DestDir: "{app}\MODS\Quick Animations (v 1)"; Flags: ignoreversion createallsubdirs recursesubdirs;	Components: qa
Source: "{#SourcePath}\Quick Turns (v 10)\*"; DestDir: "{app}\MODS\Quick Turns (v 10)"; Flags: ignoreversion createallsubdirs recursesubdirs;	Components: qt
Source: "{#SourcePath}\Route Planner for VP (v 1)\*"; DestDir: "{app}\MODS\Route Planner for VP (v 1)"; Flags: ignoreversion createallsubdirs recursesubdirs;	Components: rp
Source: "{#SourcePath}\Route Planner for VP (v 1) INT\*"; DestDir: "{app}\MODS\Route Planner for VP (v 1) INT"; Flags: ignoreversion createallsubdirs recursesubdirs;	Components: rp
Source: "{#SourcePath}\Sukritact's Civ VI Style City Names (v 1)\*"; DestDir: "{app}\MODS\Sukritact's Civ VI Style City Names (v 1)"; Flags: ignoreversion createallsubdirs recursesubdirs;	Components: civ6
Source: "{#SourcePath}\UI - Antiquity Site Tooltips (v 5)\*"; DestDir: "{app}\MODS\UI - Antiquity Site Tooltips (v 5)"; Flags: ignoreversion createallsubdirs recursesubdirs;	Components: uiast
Source: "{#SourcePath}\UI - Auto Map Pins (v 4)\*"; DestDir: "{app}\MODS\UI - Auto Map Pins (v 4)"; Flags: ignoreversion createallsubdirs recursesubdirs;	Components: uiamp
Source: "{#SourcePath}\UI - City Happiness (v 17)\*"; DestDir: "{app}\MODS\UI - City Happiness (v 17)"; Flags: ignoreversion createallsubdirs recursesubdirs;	Components: uich
Source: "{#SourcePath}\UI - City Production (v 15)\*"; DestDir: "{app}\MODS\UI - City Production (v 15)"; Flags: ignoreversion createallsubdirs recursesubdirs;	Components: uicp
Source: "{#SourcePath}\UI - City Religions (v 4)\*"; DestDir: "{app}\MODS\UI - City Religions (v 4)"; Flags: ignoreversion createallsubdirs recursesubdirs;	Components: uicr
Source: "{#SourcePath}\UI - Diplomacy Log (v 3)\*"; DestDir: "{app}\MODS\UI - Diplomacy Log (v 3)"; Flags: ignoreversion createallsubdirs recursesubdirs;	Components: uidl
Source: "{#SourcePath}\UI - Enhanced Rankings (v 13)\*"; DestDir: "{app}\MODS\UI - Enhanced Rankings (v 13)"; Flags: ignoreversion createallsubdirs recursesubdirs;	Components: er
Source: "{#SourcePath}\UI - Enhanced Rankings INT\*"; DestDir: "{app}\MODS\UI - Enhanced Rankings INT"; Flags: ignoreversion createallsubdirs recursesubdirs;	Components: er
Source: "{#SourcePath}\UI - Gold Alerts (v 10)\*"; DestDir: "{app}\MODS\UI - Gold Alerts (v 10)"; Flags: ignoreversion createallsubdirs recursesubdirs;	Components: uiga
Source: "{#SourcePath}\UI - Improved City View (Vox Populi EUI) (v 20)\*"; DestDir: "{app}\MODS\UI - Improved City View (Vox Populi EUI) (v 20)"; Flags: ignoreversion createallsubdirs recursesubdirs;	Components: icv
Source: "{#SourcePath}\UI - Improved City View (Vox Populi EUI) INT\*"; DestDir: "{app}\MODS\UI - Improved City View (Vox Populi EUI) INT"; Flags: ignoreversion createallsubdirs recursesubdirs;	Components: icv
Source: "{#SourcePath}\UI - Map Pins (v 17)\*"; DestDir: "{app}\MODS\UI - Map Pins (v 17)"; Flags: ignoreversion createallsubdirs recursesubdirs;	Components: uimp
Source: "{#SourcePath}\UI - No Auto-Embark Workers (v 7)\*"; DestDir: "{app}\MODS\UI - No Auto-Embark Workers (v 7)"; Flags: ignoreversion createallsubdirs recursesubdirs;	Components: uinaew
Source: "{#SourcePath}\UI - Notify Exit Resistance (v 1)\*"; DestDir: "{app}\MODS\UI - Notify Exit Resistance (v 1)"; Flags: ignoreversion createallsubdirs recursesubdirs;	Components: uiner
Source: "{#SourcePath}\UI - Overlay Barbarians (v 8)\*"; DestDir: "{app}\MODS\UI - Overlay Barbarians (v 8)"; Flags: ignoreversion createallsubdirs recursesubdirs;	Components: uiob
Source: "{#SourcePath}\UI - Overlay City Limits (v 8)\*"; DestDir: "{app}\MODS\UI - Overlay City Limits (v 8)"; Flags: ignoreversion createallsubdirs recursesubdirs;	Components: uiocl
Source: "{#SourcePath}\UI - Overlay Continents (v 8)\*"; DestDir: "{app}\MODS\UI - Overlay Continents (v 8)"; Flags: ignoreversion createallsubdirs recursesubdirs;	Components: uioc
Source: "{#SourcePath}\UI - Overlay Harbours And Airports (v 1)\*"; DestDir: "{app}\MODS\UI - Overlay Harbours And Airports (v 1)"; Flags: ignoreversion createallsubdirs recursesubdirs;	Components: uiohaa
Source: "{#SourcePath}\UI - Overlay Luxuries (v 3)\*"; DestDir: "{app}\MODS\UI - Overlay Luxuries (v 3)"; Flags: ignoreversion createallsubdirs recursesubdirs;	Components: uiol
Source: "{#SourcePath}\UI - Overlay Resources (v 11)\*"; DestDir: "{app}\MODS\UI - Overlay Resources (v 11)"; Flags: ignoreversion createallsubdirs recursesubdirs;	Components: uior
Source: "{#SourcePath}\UI - Overlay Road And Rail (v 9)\*"; DestDir: "{app}\MODS\UI - Overlay Road And Rail (v 9)"; Flags: ignoreversion createallsubdirs recursesubdirs;	Components: uiorar
Source: "{#SourcePath}\UI - Overlay Unimproved Tiles (v 1)\*"; DestDir: "{app}\MODS\UI - Overlay Unimproved Tiles (v 1)"; Flags: ignoreversion createallsubdirs recursesubdirs;	Components: uiout
Source: "{#SourcePath}\UI - Overlay Wonders (v 7)\*"; DestDir: "{app}\MODS\UI - Overlay Wonders (v 7)"; Flags: ignoreversion createallsubdirs recursesubdirs;	Components: uiow
Source: "{#SourcePath}\UI - Summary Clock (v 11)\*"; DestDir: "{app}\MODS\UI - Summary Clock (v 11)"; Flags: ignoreversion createallsubdirs recursesubdirs;	Components: uisc
Source: "{#SourcePath}\VP Happiness notifications (v 1) KR\*"; DestDir: "{app}\MODS\VP Happiness notifications (v 1) KR"; Flags: ignoreversion createallsubdirs recursesubdirs;	Components: hn
Source: "{#SourcePath}\Wake All and Upgrade All Units In Military Overview (v 1)\*"; DestDir: "{app}\MODS\Wake All and Upgrade All Units In Military Overview (v 1)"; Flags: ignoreversion createallsubdirs recursesubdirs;	Components: waua
Source: "{#SourcePath}\Wake All and Upgrade All Units In Military Overview (v 1) INT\*"; DestDir: "{app}\MODS\Wake All and Upgrade All Units In Military Overview (v 1) INT"; Flags: ignoreversion createallsubdirs recursesubdirs;	Components: waua
Source: "{#SourcePath}\Wonder Race (v 7) KR\*"; DestDir: "{app}\MODS\Wonder Race (v 7) KR"; Flags: ignoreversion createallsubdirs recursesubdirs;	Components: wr

;Source: "{#SourcePath}\!Jarcast's Cities of Marble for VP (v 3)\*"; DestDir: "{app}\MODS\!Jarcast's Cities of Marble for VP (v 3)"; Flags: ignoreversion createallsubdirs recursesubdirs;	Components: jcm
;Source: "{#SourcePath}\!Jarcast's Cities of Marble for VP (v 3) INT\*"; DestDir: "{app}\MODS\!Jarcast's Cities of Marble for VP (v 3) INT"; Flags: ignoreversion createallsubdirs recursesubdirs;	Components: jcm
Source: "{#SourcePath}\!Jarcast's Hidden Wonders (VP) (v 2)\*"; DestDir: "{app}\MODS\!Jarcast's Hidden Wonders (VP) (v 2)"; Flags: ignoreversion createallsubdirs recursesubdirs;	Components: jhw
Source: "{#SourcePath}\!Jarcast's Hidden Wonders (VP) INT\*"; DestDir: "{app}\MODS\!Jarcast's Hidden Wonders (VP) INT"; Flags: ignoreversion createallsubdirs recursesubdirs;	Components: jhw
Source: "{#SourcePath}\!Jarcast's Ndongo-Matamba for VP (v 1)\*"; DestDir: "{app}\MODS\!Jarcast's Ndongo-Matamba for VP (v 1)"; Flags: ignoreversion createallsubdirs recursesubdirs;	Components: jnm
Source: "{#SourcePath}\!Jarcast's The Navajo for VP (v 2)\*"; DestDir: "{app}\MODS\!Jarcast's The Navajo for VP (v 2)"; Flags: ignoreversion createallsubdirs recursesubdirs;	Components: jtn
Source: "{#SourcePath}\!Jarcast's Volcanoes for VP (v 7)\*"; DestDir: "{app}\MODS\!Jarcast's Volcanoes for VP (v 7)"; Flags: ignoreversion createallsubdirs recursesubdirs;	Components: jv
Source: "{#SourcePath}\!Jarcast's Volcanoes for VP (v 7) INT\*"; DestDir: "{app}\MODS\!Jarcast's Volcanoes for VP (v 7) INT"; Flags: ignoreversion createallsubdirs recursesubdirs;	Components: jv
;Source: "{#SourcePath}\(n) Subterfuge KR\*"; DestDir: "{app}\MODS\(n) Subterfuge KR"; Flags: ignoreversion createallsubdirs recursesubdirs;	Components: sf
Source: "{#SourcePath}\(6) Future Age for VP\*"; DestDir: "{app}\MODS\(6) Future Age for VP"; Flags: ignoreversion createallsubdirs recursesubdirs;	Components: fa
;Source: "{#SourcePath}\(8) Events and Decisions (CBO) (v 14)\*"; DestDir: "{app}\MODS\(8) Events and Decisions (CBO) (v 14)"; Flags: ignoreversion createallsubdirs recursesubdirs;	Components: ed
;Source: "{#SourcePath}\(8) Events and Decisions (CBO) (v 14) INT\*"; DestDir: "{app}\MODS\(8) Events and Decisions (CBO) (v 14) INT"; Flags: ignoreversion createallsubdirs recursesubdirs;	Components: ed
Source: "{#SourcePath}\(game) Capture+++ (v 5)\*"; DestDir: "{app}\MODS\(game) Capture+++ (v 5)"; Flags: ignoreversion createallsubdirs recursesubdirs;	Components: gc
Source: "{#SourcePath}\(overhaul) Enhanced Air Warfare 4VP (v 1.9)\*"; DestDir: "{app}\MODS\(overhaul) Enhanced Air Warfare 4VP (v 1.9)"; Flags: ignoreversion createallsubdirs recursesubdirs;	Components: eaw
Source: "{#SourcePath}\(overhaul) Enhanced Air Warfare 4VP INT\*"; DestDir: "{app}\MODS\(overhaul) Enhanced Air Warfare 4VP INT"; Flags: ignoreversion createallsubdirs recursesubdirs;	Components: eaw
Source: "{#SourcePath}\(overhaul) Enlightenment Era for VP\*"; DestDir: "{app}\MODS\(overhaul) Enlightenment Era for VP"; Flags: ignoreversion createallsubdirs recursesubdirs;	Components: ee
Source: "{#SourcePath}\(overhaul) Enlightenment Era for VP INT\*"; DestDir: "{app}\MODS\(overhaul) Enlightenment Era for VP INT"; Flags: ignoreversion createallsubdirs recursesubdirs;	Components: ee
Source: "{#SourcePath}\(overhaul) More Wonders for VP\*"; DestDir: "{app}\MODS\(overhaul) More Wonders for VP"; Flags: ignoreversion createallsubdirs recursesubdirs;	Components: mw
Source: "{#SourcePath}\(overhaul) More Wonders for VP INT (AI)\*"; DestDir: "{app}\MODS\(overhaul) More Wonders for VP INT (AI)"; Flags: ignoreversion createallsubdirs recursesubdirs;	Components: mw
Source: "{#SourcePath}\(overhaul) Unique City States for VP\*"; DestDir: "{app}\MODS\(overhaul) Unique City States for VP"; Flags: ignoreversion createallsubdirs recursesubdirs;	Components: ucs
Source: "{#SourcePath}\(overhaul) Unique City States for VP INT (AI)\*"; DestDir: "{app}\MODS\(overhaul) Unique City States for VP INT (AI)"; Flags: ignoreversion createallsubdirs recursesubdirs;	Components: ucs
Source: "{#SourcePath}\(Primary) - Gwennog's France - Philippe Auguste for VP (v.6)\*"; DestDir: "{app}\MODS\(Primary) - Gwennog's France - Philippe Auguste for VP (v.6)"; Flags: ignoreversion createallsubdirs recursesubdirs;	Components: gfpa
Source: "{#SourcePath}\(Unity) - GH's Louisiana - Joseph Beausoleil Broussard for VP (v.12)\*"; DestDir: "{app}\MODS\(Unity) - GH's Louisiana - Joseph Beausoleil Broussard for VP (v.12)"; Flags: ignoreversion createallsubdirs recursesubdirs;	Components: gl
Source: "{#SourcePath}\(visual) Unit Scaling and Formation for VP (v 12)\*"; DestDir: "{app}\MODS\(visual) Unit Scaling and Formation for VP (v 12)"; Flags: ignoreversion createallsubdirs recursesubdirs;	Components: usf
Source: "{#SourcePath}\3 Units per Tile (v 1)\*"; DestDir: "{app}\MODS\3 Units per Tile (v 1)"; Flags: ignoreversion createallsubdirs recursesubdirs;	Components: upt
Source: "{#SourcePath}\Better Lakes for Vox Populi (v 3)\*"; DestDir: "{app}\MODS\Better Lakes for Vox Populi (v 3)"; Flags: ignoreversion createallsubdirs recursesubdirs;	Components: bl
Source: "{#SourcePath}\Better Lakes for Vox Populi INT\*"; DestDir: "{app}\MODS\Better Lakes for Vox Populi INT"; Flags: ignoreversion createallsubdirs recursesubdirs;	Components: bl
Source: "{#SourcePath}\Civic And Reform (v 22) KR\*"; DestDir: "{app}\MODS\Civic And Reform (v 22) KR"; Flags: ignoreversion createallsubdirs recursesubdirs;	Components: car
Source: "{#SourcePath}\Colonialist Legacies' Inuit for VP\*"; DestDir: "{app}\MODS\Colonialist Legacies' Inuit for VP"; Flags: ignoreversion createallsubdirs recursesubdirs;	Components: cli
Source: "{#SourcePath}\Continental Drift (v 3)\*"; DestDir: "{app}\MODS\Continental Drift (v 3)"; Flags: ignoreversion createallsubdirs recursesubdirs;	Components: cd
Source: "{#SourcePath}\Counter-Reconnaissance (v 44)\*"; DestDir: "{app}\MODS\Counter-Reconnaissance (v 44)"; Flags: ignoreversion createallsubdirs recursesubdirs;	Components: cr
Source: "{#SourcePath}\Counter-Reconnaissance (v 44) INT\*"; DestDir: "{app}\MODS\Counter-Reconnaissance (v 44) INT"; Flags: ignoreversion createallsubdirs recursesubdirs;	Components: cr
Source: "{#SourcePath}\Even More Resources for Vox Populi UCS (v 14)\*"; DestDir: "{app}\MODS\Even More Resources for Vox Populi UCS (v 14)"; Flags: ignoreversion createallsubdirs recursesubdirs;	Components: emr
Source: "{#SourcePath}\Even More Resources for Vox Populi UCS INT\*"; DestDir: "{app}\MODS\Even More Resources for Vox Populi UCS INT"; Flags: ignoreversion createallsubdirs recursesubdirs;	Components: emr
Source: "{#SourcePath}\Exploration Heritage (v 46)\*"; DestDir: "{app}\MODS\Exploration Heritage (v 46)"; Flags: ignoreversion createallsubdirs recursesubdirs;	Components: eh
Source: "{#SourcePath}\Exploration Heritage (v 46) INT\*"; DestDir: "{app}\MODS\Exploration Heritage (v 46) INT"; Flags: ignoreversion createallsubdirs recursesubdirs;	Components: eh
Source: "{#SourcePath}\Gedemon's YnAEMP KR\*"; DestDir: "{app}\MODS\Gedemon's YnAEMP KR"; Flags: ignoreversion createallsubdirs recursesubdirs;	Components: gy
Source: "{#SourcePath}\Global Warming (v 7)\*"; DestDir: "{app}\MODS\Global Warming (v 7)"; Flags: ignoreversion createallsubdirs recursesubdirs;	Components: gw
;Source: "{#SourcePath}\Hex Conquer VP (v 7) KR\*"; DestDir: "{app}\MODS\Hex Conquer VP (v 7) KR"; Flags: ignoreversion createallsubdirs recursesubdirs;	Components: hc
;Source: "{#SourcePath}\Historical Religions Complete (BNW or GK) (v 45)\*"; DestDir: "{app}\MODS\Historical Religions Complete (BNW or GK) (v 45)"; Flags: ignoreversion createallsubdirs recursesubdirs;	Components: hrc
Source: "{#SourcePath}\Horem's Aloe Vera bonus resource (v 4)\*"; DestDir: "{app}\MODS\Horem's Aloe Vera bonus resource (v 4)"; Flags: ignoreversion createallsubdirs recursesubdirs;	Components: vb
Source: "{#SourcePath}\Horem's Aloe Vera bonus resource (v 4) INT\*"; DestDir: "{app}\MODS\Horem's Aloe Vera bonus resource (v 4) INT"; Flags: ignoreversion createallsubdirs recursesubdirs;	Components: vb
;Source: "{#SourcePath}\Hokaths Proposals\*"; DestDir: "{app}\MODS\Hokaths Proposals"; Flags: ignoreversion createallsubdirs recursesubdirs;	Components: hp
;Source: "{#SourcePath}\Hokaths Proposals INT\*"; DestDir: "{app}\MODS\Hokaths Proposals INT"; Flags: ignoreversion createallsubdirs recursesubdirs;	Components: hp
Source: "{#SourcePath}\Jarcast & Hokath's Additional Luxuries (v 3)\*"; DestDir: "{app}\MODS\Jarcast & Hokath's Additional Luxuries (v 3)"; Flags: ignoreversion createallsubdirs recursesubdirs;	Components: jhal
Source: "{#SourcePath}\Jarcast and Hokath's Additional Luxuries INT\*"; DestDir: "{app}\MODS\Jarcast and Hokath's Additional Luxuries INT"; Flags: ignoreversion createallsubdirs recursesubdirs;	Components: jhal
Source: "{#SourcePath}\Jarcast & Hokath's Tibet for VP (v 5)\*"; DestDir: "{app}\MODS\Jarcast & Hokath's Tibet for VP (v 5)"; Flags: ignoreversion createallsubdirs recursesubdirs;	Components: jhkt
;Source: "{#SourcePath}\Jarcast's Bigger Huge Map for Communitu_79a (v 5)\*"; DestDir: "{app}\MODS\Jarcast's Bigger Huge Map for Communitu_79a (v 5)"; Flags: ignoreversion createallsubdirs recursesubdirs;	Components: jbhmc
Source: "{#SourcePath}\Jarcast's Extraction Outpost (v 3)\*"; DestDir: "{app}\MODS\Jarcast's Extraction Outpost (v 3)"; Flags: ignoreversion createallsubdirs recursesubdirs;	Components: jeo
Source: "{#SourcePath}\Jarcast's Italy for VP (v 2)\*"; DestDir: "{app}\MODS\Jarcast's Italy for VP (v 2)"; Flags: ignoreversion createallsubdirs recursesubdirs;	Components: ji
Source: "{#SourcePath}\Jarcast's Pikeman Tweak (v 2)\*"; DestDir: "{app}\MODS\Jarcast's Pikeman Tweak (v 2)"; Flags: ignoreversion createallsubdirs recursesubdirs;	Components: jpt
Source: "{#SourcePath}\Jarcast's Pikeman Tweak (v 2) INT\*"; DestDir: "{app}\MODS\Jarcast's Pikeman Tweak (v 2) INT"; Flags: ignoreversion createallsubdirs recursesubdirs;	Components: jpt
Source: "{#SourcePath}\JFD's Papal States for VP (v 10)\*"; DestDir: "{app}\MODS\JFD's Papal States for VP (v 10)"; Flags: ignoreversion createallsubdirs recursesubdirs;	Components: jps
Source: "{#SourcePath}\JFD's Sovereignty for VP (v 15a) KR\*"; DestDir: "{app}\MODS\JFD's Sovereignty for VP (v 15a) KR"; Flags: ignoreversion createallsubdirs recursesubdirs;	Components: jfds
Source: "{#SourcePath}\Landmines for BNW (v 3)\*"; DestDir: "{app}\MODS\Landmines for BNW (v 3)"; Flags: ignoreversion createallsubdirs recursesubdirs;	Components: mine
Source: "{#SourcePath}\Leugi's Israel for VP\*"; DestDir: "{app}\MODS\Leugi's Israel for VP"; Flags: ignoreversion createallsubdirs recursesubdirs;	Components: li
Source: "{#SourcePath}\Maritime Weather+ (v 6)\*"; DestDir: "{app}\MODS\Maritime Weather+ (v 6)"; Flags: ignoreversion createallsubdirs recursesubdirs;	Components: Mariw
Source: "{#SourcePath}\Maritime Weather+ (v 6) INT\*"; DestDir: "{app}\MODS\Maritime Weather+ (v 6) INT"; Flags: ignoreversion createallsubdirs recursesubdirs;	Components: Mariw
Source: "{#SourcePath}\Mechanized Infantry with Soldiers, Resized (v 2)\*"; DestDir: "{app}\MODS\Mechanized Infantry with Soldiers, Resized (v 2)"; Flags: ignoreversion createallsubdirs recursesubdirs;	Components: miwsr
Source: "{#SourcePath}\Misc Tweaks for VP (v 4.10)\*"; DestDir: "{app}\MODS\Misc Tweaks for VP (v 4.10)"; Flags: ignoreversion createallsubdirs recursesubdirs;	Components: mt
Source: "{#SourcePath}\Misc Tweaks for VP (v 4.10) INT\*"; DestDir: "{app}\MODS\Misc Tweaks for VP (v 4.10) INT"; Flags: ignoreversion createallsubdirs recursesubdirs;	Components: mt
Source: "{#SourcePath}\Mojave Wasteland - Fallout New Vegas (v 101)\*"; DestDir: "{app}\MODS\Mojave Wasteland - Fallout New Vegas (v 101)"; Flags: ignoreversion createallsubdirs recursesubdirs;	Components: fnv
;Source: "{#SourcePath}\NavalMod(v5)\*"; DestDir: "{app}\MODS\NavalMod(v5)"; Flags: ignoreversion createallsubdirs recursesubdirs;	Components: nm
;Source: "{#SourcePath}\NavalMod(v5) INT\*"; DestDir: "{app}\MODS\NavalMod(v5) INT"; Flags: ignoreversion createallsubdirs recursesubdirs;	Components: nm
;Source: "{#SourcePath}\New Beliefs Mods KR\*"; DestDir: "{app}\MODS\New Beliefs Mods KR"; Flags: ignoreversion createallsubdirs recursesubdirs;	Components: nbm
Source: "{#SourcePath}\Pontoon Bridges for VP (v 2)\*"; DestDir: "{app}\MODS\Pontoon Bridges for VP (v 2)"; Flags: ignoreversion createallsubdirs recursesubdirs;	Components: pb
Source: "{#SourcePath}\Pontoon Bridges for VP (v 2) INT\*"; DestDir: "{app}\MODS\Pontoon Bridges for VP (v 2) INT"; Flags: ignoreversion createallsubdirs recursesubdirs;	Components: pb
Source: "{#SourcePath}\Really Advanced Setup (v 15) KR\*"; DestDir: "{app}\MODS\Really Advanced Setup (v 15) KR"; Flags: ignoreversion createallsubdirs recursesubdirs;	Components: ras
Source: "{#SourcePath}\Recon Pay (Core0) Terrain Cost (v 7)\*"; DestDir: "{app}\MODS\Recon Pay (Core0) Terrain Cost (v 7)"; Flags: ignoreversion createallsubdirs recursesubdirs;	Components: rpc0
Source: "{#SourcePath}\Recon Pay (Core1) Exploration Balancer (v 3)\*"; DestDir: "{app}\MODS\Recon Pay (Core1) Exploration Balancer (v 3)"; Flags: ignoreversion createallsubdirs recursesubdirs;	Components: rpc1
Source: "{#SourcePath}\Recon Pay (Core1) Exploration Balancer (v 3) INT\*"; DestDir: "{app}\MODS\Recon Pay (Core1) Exploration Balancer (v 3) INT"; Flags: ignoreversion createallsubdirs recursesubdirs;	Components: rpc1
Source: "{#SourcePath}\Recon Pay (Recommended1) Fast Coast (v 3)\*"; DestDir: "{app}\MODS\Recon Pay (Recommended1) Fast Coast (v 3)"; Flags: ignoreversion createallsubdirs recursesubdirs;	Components: rpr1
Source: "{#SourcePath}\Recon Pay (Recommended1) Fast Coast (v 3) INT\*"; DestDir: "{app}\MODS\Recon Pay (Recommended1) Fast Coast (v 3) INT"; Flags: ignoreversion createallsubdirs recursesubdirs;	Components: rpr1
Source: "{#SourcePath}\Recon Pay (Recommended2) Fast Rivers (v 6)\*"; DestDir: "{app}\MODS\Recon Pay (Recommended2) Fast Rivers (v 6)"; Flags: ignoreversion createallsubdirs recursesubdirs;	Components: rpr2
Source: "{#SourcePath}\Recon Pay (Recommended2) Fast Rivers (v 6) INT\*"; DestDir: "{app}\MODS\Recon Pay (Recommended2) Fast Rivers (v 6) INT"; Flags: ignoreversion createallsubdirs recursesubdirs;	Components: rpr2
Source: "{#SourcePath}\Recon Pay (Recommended3) Fast Coastal (v 7)\*"; DestDir: "{app}\MODS\Recon Pay (Recommended3) Fast Coastal (v 7)"; Flags: ignoreversion createallsubdirs recursesubdirs;	Components: rpr3
Source: "{#SourcePath}\Recon Pay (Recommended3) Fast Coastal (v 7) INT\*"; DestDir: "{app}\MODS\Recon Pay (Recommended3) Fast Coastal (v 7) INT"; Flags: ignoreversion createallsubdirs recursesubdirs;	Components: rpr3
Source: "{#SourcePath}\Recon Pay (Xtra1) Arctician (v 2)\*"; DestDir: "{app}\MODS\Recon Pay (Xtra1) Arctician (v 2)"; Flags: ignoreversion createallsubdirs recursesubdirs;	Components: rpx1
Source: "{#SourcePath}\Recon Pay (Xtra1) Arctician (v 2) INT\*"; DestDir: "{app}\MODS\Recon Pay (Xtra1) Arctician (v 2) INT"; Flags: ignoreversion createallsubdirs recursesubdirs;	Components: rpx1
Source: "{#SourcePath}\Recon Pay (Xtra2) Free ZoC (v 3)\*"; DestDir: "{app}\MODS\Recon Pay (Xtra2) Free ZoC (v 3)"; Flags: ignoreversion createallsubdirs recursesubdirs;	Components: rpx2
Source: "{#SourcePath}\Recon Pay (Xtra2) Free ZoC (v 3) INT\*"; DestDir: "{app}\MODS\Recon Pay (Xtra2) Free ZoC (v 3) INT"; Flags: ignoreversion createallsubdirs recursesubdirs;	Components: rpx2
Source: "{#SourcePath}\Recon Pay (Xtra3) Trees Obstruct Mounted Armor (v 6)\*"; DestDir: "{app}\MODS\Recon Pay (Xtra3) Trees Obstruct Mounted Armor (v 6)"; Flags: ignoreversion createallsubdirs recursesubdirs;	Components: rpx3
Source: "{#SourcePath}\Recon Pay (Xtra3) Trees Obstruct Mounted Armor (v 6) INT\*"; DestDir: "{app}\MODS\Recon Pay (Xtra3) Trees Obstruct Mounted Armor (v 6) INT"; Flags: ignoreversion createallsubdirs recursesubdirs;	Components: rpx3
Source: "{#SourcePath}\Recon Pay (Xtra4) Change Port (v 2)\*"; DestDir: "{app}\MODS\Recon Pay (Xtra4) Change Port (v 2)"; Flags: ignoreversion createallsubdirs recursesubdirs;	Components: rpx4
Source: "{#SourcePath}\Recon Pay (Xtra5) Horse Thieves (v 1)\*"; DestDir: "{app}\MODS\Recon Pay (Xtra5) Horse Thieves (v 1)"; Flags: ignoreversion createallsubdirs recursesubdirs;	Components: rpx5
Source: "{#SourcePath}\Recon Pay (Xtra5) Horse Thieves (v 1) INT\*"; DestDir: "{app}\MODS\Recon Pay (Xtra5) Horse Thieves (v 1) INT"; Flags: ignoreversion createallsubdirs recursesubdirs;	Components: rpx5
Source: "{#SourcePath}\Recon Pay (xtra6) Exploration Specialization (v 1)\*"; DestDir: "{app}\MODS\Recon Pay (xtra6) Exploration Specialization (v 1)"; Flags: ignoreversion createallsubdirs recursesubdirs;	Components: rpx6
Source: "{#SourcePath}\Reforestation (v 9)\*"; DestDir: "{app}\MODS\Reforestation (v 9)"; Flags: ignoreversion createallsubdirs recursesubdirs;	Components: rf
Source: "{#SourcePath}\Religion - Permanent Pantheons (v 1)\*"; DestDir: "{app}\MODS\Religion - Permanent Pantheons (v 1)"; Flags: ignoreversion createallsubdirs recursesubdirs;	Components: rpp
;Source: "{#SourcePath}\TorpedoBoat (v19)\*"; DestDir: "{app}\MODS\TorpedoBoat (v19)"; Flags: ignoreversion createallsubdirs recursesubdirs;	Components: tb
;Source: "{#SourcePath}\TorpedoBoat (v19) INT\*"; DestDir: "{app}\MODS\TorpedoBoat (v19) INT"; Flags: ignoreversion createallsubdirs recursesubdirs;	Components: tb
Source: "{#SourcePath}\TreeSuccession (v 44)\*"; DestDir: "{app}\MODS\TreeSuccession (v 44)"; Flags: ignoreversion createallsubdirs recursesubdirs;	Components: ts
Source: "{#SourcePath}\TreeSuccession (v 44) INT\*"; DestDir: "{app}\MODS\TreeSuccession (v 44) INT"; Flags: ignoreversion createallsubdirs recursesubdirs;	Components: ts
Source: "{#SourcePath}\(j) Bare Necessities (v 14)\*"; DestDir: "{app}\MODS\(j) Bare Necessities (v 14)"; Flags: ignoreversion createallsubdirs recursesubdirs;	Components: bn
Source: "{#SourcePath}\(j) Bare Necessities (v 14) INT\*"; DestDir: "{app}\MODS\(j) Bare Necessities (v 14) INT"; Flags: ignoreversion createallsubdirs recursesubdirs;	Components: bn 
Source: "{#SourcePath}\Whale Battles (v 1)\*"; DestDir: "{app}\MODS\Whale Battles (v 1)"; Flags: ignoreversion createallsubdirs recursesubdirs;	Components: wb
Source: "{#SourcePath}\Whale Battles (v 1) INT\*"; DestDir: "{app}\MODS\Whale Battles (v 1) INT"; Flags: ignoreversion createallsubdirs recursesubdirs;	Components: wb
Source: "{#SourcePath}\World Congress Reformation (v 12)\*"; DestDir: "{app}\MODS\World Congress Reformation (v 12)"; Flags: ignoreversion createallsubdirs recursesubdirs;	Components: wcr
Source: "{#SourcePath}\World Congress Reformation INT\*"; DestDir: "{app}\MODS\World Congress Reformation INT"; Flags: ignoreversion createallsubdirs recursesubdirs;	Components: wcr 
Source: "{#SourcePath}\Worker Mountaineering (v 3)\*"; DestDir: "{app}\MODS\Worker Mountaineering (v 3)"; Flags: ignoreversion createallsubdirs recursesubdirs;	Components: wm
Source: "{#SourcePath}\Worker Mountaineering (v 3) INT\*"; DestDir: "{app}\MODS\Worker Mountaineering (v 3) INT"; Flags: ignoreversion createallsubdirs recursesubdirs;	Components: wm
Source: "{#SourcePath}\World of Lore - DragonFable (v 1)\*"; DestDir: "{app}\MODS\World of Lore - DragonFable (v 1)"; Flags: ignoreversion createallsubdirs recursesubdirs;	Components: df
Source: "{#SourcePath}\zai4z's Landmark Cultural Variation (v 1)\*"; DestDir: "{app}\MODS\zai4z's Landmark Cultural Variation (v 1)"; Flags: ignoreversion createallsubdirs recursesubdirs;	Components: lcv

;Source: "{#SourcePath}\lua51_Win32.dll"; DestDir: "{code:GetCIVDir}"; Flags: ignoreversion createallsubdirs recursesubdirs; Components: vp
Source: "{#SourcePath}\Assets\*"; DestDir: "{code:GetCIVDir}\Assets"; Flags: ignoreversion createallsubdirs recursesubdirs; Components: vp
Source: "{#SourcePath}\Assets_votes\*"; DestDir: "{code:GetCIVDir}\Assets"; Flags: ignoreversion createallsubdirs recursesubdirs; Components: vpnvc
Source: "{#SourcePath}\Maps\*"; DestDir: "{code:GetCIVDir}\Assets\Maps"; Flags: ignoreversion createallsubdirs recursesubdirs; Components: map
Source: "{#SourcePath}\Textures\Artful Textures\*"; DestDir: "{code:GetCIVDir}\Assets\DLC\Artful Textures"; Flags: ignoreversion createallsubdirs recursesubdirs; Components: textures\at
Source: "{#SourcePath}\Textures\VT\*"; DestDir: "{code:GetCIVDir}\Assets\DLC\VT"; Flags: ignoreversion createallsubdirs recursesubdirs; Components: textures\vt
Source: "{#SourcePath}\UI\CivSelection\DLC\*"; DestDir: "{code:GetCIVDir}\Assets\DLC"; Flags: ignoreversion createallsubdirs recursesubdirs; Components: civselect\cs
Source: "{#SourcePath}\UI\CivSelection\UI\*"; DestDir: "{code:GetCIVDir}\Assets\UI"; Flags: ignoreversion createallsubdirs recursesubdirs; Components: civselect\cs
Source: "{#SourcePath}\UI\CivSelection\Backup\*"; DestDir: "{code:GetCIVDir}\Assets"; Flags: ignoreversion createallsubdirs recursesubdirs; Components: civselect\csbu
Source: "{#SourcePath}\UI\UI_SukMainMenu\*"; DestDir: "{code:GetCIVDir}\Assets\DLC\UI_SukMainMenu"; Flags: ignoreversion createallsubdirs recursesubdirs; Components: smm
Source: "{#SourcePath}\UI\UI_CustomModScreen\*"; DestDir: "{code:GetCIVDir}\Assets\DLC\UI_CustomModScreen"; Flags: ignoreversion createallsubdirs recursesubdirs; Components: cms
Source: "{#SourcePath}\VPUI Text\VPUI_tips_ko_kr.xml"; DestDir: "{app}\Text"; Flags: ignoreversion; Components: vp
; 참고: 공유 시스템 파일에서 "Flags: ignoreversion"을 사용하지 마십시오.

[Components]
Name: "vp"; Description: "Vox Populi 한국어 번역"; Types: VP VPUI VPEX VPMAX Custom; Flags: disablenouninstallwarning fixed

Name: "map"; Description: "추가 지도: 문명 5 지도 폴더에 복사"; Types: Custom; Flags: disablenouninstallwarning
Name: "vpnvc"; Description: "세계 의회 투표 문명 색상 제거"; Types: Custom; Flags: disablenouninstallwarning
Name: "textures"; Description: "지도 텍스처 선택"; Types: Custom; Flags: disablenouninstallwarning
Name: "textures\at"; Description: "예술적인 질감 (Artful Textures)"; Types: Custom; Flags: exclusive disablenouninstallwarning
Name: "textures\vt"; Description: "선명한 질감 (Vibrant Textures)"; Types: Custom; Flags: exclusive disablenouninstallwarning
Name: "civselect"; Description: "지도자 선택 화면"; Types: Custom; Flags: disablenouninstallwarning
Name: "civselect\cs"; Description: "진정한 대체 지도자 (True Alternative Leaders)"; Types: Custom; Flags: exclusive disablenouninstallwarning
Name: "civselect\csbu"; Description: "진정한 대체 지도자 제거 (문명 선택 기본 화면)"; Types: Custom; Flags: exclusive disablenouninstallwarning
Name: "usf"; Description: "VP 유닛 크기와 대형 (Unit Scaling and Formation for VP)"; Types: Custom; Flags: disablenouninstallwarning
Name: "lm"; Description: "VP 큰 미니맵 (Large Minimap for VP wth EUI only)"; Types: Custom; Flags: disablenouninstallwarning

Name: "vpuc"; Description: "VP 더 많은 고유 요소 (More Unique Components for VP)"; Types: VP VPUI VPEX VPMAX Custom; Flags: disablenouninstallwarning
Name: "vpc"; Description: "VP 커뮤니티 이벤트 (VP Community Events)"; Types: VP VPUI VPEX VPMAX Custom; Flags: disablenouninstallwarning
Name: "vppt"; Description: "VP 승급 트리 (Promotion Tree for VP)"; Types: VP VPUI VPEX VPMAX Custom; Flags: disablenouninstallwarning
Name: "icv"; Description: "VP 개선된 도시 화면 UI (Improved City View (Vox Populi EUI))"; Types: VPUI VPEX VPMAX Custom; Flags: disablenouninstallwarning

Name: "cms"; Description: "개선된 모딩 화면 (Enhanced Modding Screen)"; Types: VPUI VPEX VPMAX Custom; Flags: disablenouninstallwarning
Name: "er"; Description: "개선된 순위 UI (Enhanced Rankings)"; Types: VPUI VPEX VPMAX Custom; Flags: disablenouninstallwarning
Name: "le"; Description: "VP 목록 개선 (List Enhancements for VP)"; Types: VPUI VPEX VPMAX Custom; Flags: disablenouninstallwarning
Name: "mc"; Description: "의미있는 색깔 (Meaningful Colours)"; Types: VPUI VPEX VPMAX Custom; Flags: disablenouninstallwarning
Name: "ns"; Description: "알림 설정 (Notification Settings)"; Types: VPUI VPEX VPMAX Custom; Flags: disablenouninstallwarning
Name: "qa"; Description: "빠른 애니메이션 (Quick Animations)"; Types: VPUI VPEX VPMAX Custom; Flags: disablenouninstallwarning
Name: "qt"; Description: "빠른 턴 (Quick Turns)"; Types: VPUI VPEX VPMAX Custom; Flags: disablenouninstallwarning
Name: "ras"; Description: "진짜 고급 설정 (Really Advanced Setup)"; Types: VPUI VPEX VPMAX Custom; Flags: disablenouninstallwarning
Name: "smm"; Description: "메인 메뉴 배경+ (Main Menu BG+)"; Types: VPUI VPEX VPMAX Custom; Flags: disablenouninstallwarning

Name: "asb"; Description: "자동 건물 팔기 (Auto-Sell Buildings)"; Types: VPUI VPEX VPMAX Custom; Flags: disablenouninstallwarning
;Name: "csl"; Description: "VP 도시 국가 지도자 (City-States Leaders for VP)"; Types: VPUI VPMAX Custom; Flags: disablenouninstallwarning
Name: "hn"; Description: "VP 행복도 알림 (VP Happiness notifications)"; Types: VPUI VPEX VPMAX Custom; Flags: disablenouninstallwarning
Name: "ige"; Description: "인게임 편집기 (InGame Editor+)"; Types: VPUI VPEX VPMAX Custom; Flags: disablenouninstallwarning
Name: "leh"; Description: "늘어난 시대 - 역사적 (Longer Eras - Historic)"; Types: VPUI VPEX VPMAX Custom; Flags: disablenouninstallwarning
Name: "rp"; Description: "VP 경로 계획서 (Route Planner for VP)"; Types: VPUI VPEX VPMAX Custom; Flags: disablenouninstallwarning
Name: "vpto"; Description: "VP 무역 기회 (Trade Opportunities for VP)"; Types: VPUI VPEX VPMAX Custom; Flags: disablenouninstallwarning
Name: "vpwp"; Description: "VP 불가사의 계획서 (Wonder Planner For VP)"; Types: VPUI VPEX VPMAX Custom; Flags: disablenouninstallwarning
Name: "wr"; Description: "불가사의 경쟁 (Wonder Race)"; Types: VPUI VPEX VPMAX Custom; Flags: disablenouninstallwarning

Name: "uiast"; Description: "유적 도움말 (Antiquity Site Tooltips)"; Types: VPUI VPEX VPMAX Custom; Flags: disablenouninstallwarning
Name: "uich"; Description: "도시 행복도 (City Happiness)"; Types: VPUI VPEX VPMAX Custom; Flags: disablenouninstallwarning
Name: "uicp"; Description: "도시 생산력 (City Production)"; Types: VPUI VPEX VPMAX Custom; Flags: disablenouninstallwarning
Name: "uicr"; Description: "도시 종교 (City Religions)"; Types: VPUI VPEX VPMAX Custom; Flags: disablenouninstallwarning
Name: "uidl"; Description: "외교 기록 (Diplomacy Log)"; Types: VPUI VPEX VPMAX Custom; Flags: disablenouninstallwarning
Name: "uiga"; Description: "골드 알림 (Gold Alerts)"; Types: VPUI VPEX VPMAX Custom; Flags: disablenouninstallwarning
Name: "uimp"; Description: "지도 핀 (Map Pins)"; Types: VPUI VPEX VPMAX Custom; Flags: disablenouninstallwarning
Name: "uiob"; Description: "야만인 오버레이 (Overlay Barbarians)"; Types: VPUI VPEX VPMAX Custom; Flags: disablenouninstallwarning
Name: "uioc"; Description: "대륙 오버레이 (Overlay Continents)"; Types: VPUI VPEX VPMAX Custom; Flags: disablenouninstallwarning
Name: "uiocl"; Description: "도시 제한 오버레이 (Overlay City Limits)"; Types: VPUI VPEX VPMAX Custom; Flags: disablenouninstallwarning
Name: "uiohaa"; Description: "항구와 공항 오버레이 (Overlay Harbours And Airports)"; Types: VPUI VPEX VPMAX Custom; Flags: disablenouninstallwarning
Name: "uiol"; Description: "사치 자원 오버레이 (Overlay Luxuries)"; Types: VPUI VPEX VPMAX Custom; Flags: disablenouninstallwarning
Name: "uior"; Description: "자원 오버레이 (Overlay Resources)"; Types: VPUI VPEX VPMAX Custom; Flags: disablenouninstallwarning
Name: "uiorar"; Description: "도로와 철도 오버레이 (Overlay Road And Rail)"; Types: VPUI VPEX VPMAX Custom; Flags: disablenouninstallwarning
Name: "uiout"; Description: "시설 없는 타일 오버레이 (Overlay Unimproved Tiles)"; Types: VPUI VPEX VPMAX Custom; Flags: disablenouninstallwarning
Name: "uiow"; Description: "불가사의 오버레이 (Overlay Wonders)"; Types: VPUI VPEX VPMAX Custom; Flags: disablenouninstallwarning
Name: "uisc"; Description: "시계 요약 (Summary Clock)"; Types: VPUI VPEX VPMAX Custom; Flags: disablenouninstallwarning

Name: "uiamp"; Description: "자동 지도 핀 (Auto Map Pins)"; Types: VPUI VPEX VPMAX Custom; Flags: disablenouninstallwarning
Name: "uinaew"; Description: "노동자 자동 승선 막기 (No Auto-Embark Workers)"; Types: VPUI VPEX VPMAX Custom; Flags: disablenouninstallwarning
Name: "uiner"; Description: "저항 벗어남 알림 (Notify Exit Resistance)"; Types: VPUI VPEX VPMAX Custom; Flags: disablenouninstallwarning
Name: "waua"; Description: "전체 기상 & 전체 승급 (Wake All and Upgrade All Units In Military Overview)"; Types: VPUI VPEX VPMAX Custom; Flags: disablenouninstallwarning

Name: "civ6"; Description: "Sukritact의 문명 6 방식 도시명 (Sukritact's Civ VI Style City Names)"; Types: VPUI VPEX VPMAX Custom; Flags: disablenouninstallwarning
Name: "ele"; Description: "서커스 건설 후 코끼리 소리 (Elephant Sound When Circus Built)"; Types: VPUI VPEX VPMAX Custom; Flags: disablenouninstallwarning
Name: "music"; Description: "음악 바꾸기 (Music Changer)"; Types: VPUI VPEX VPMAX Custom; Flags: disablenouninstallwarning

Name: "gy"; Description: "Gedemon의 YnAEMP (Gedemon's YnAEMP)"; Types: VPUI VPEX VPMAX Custom; Flags: disablenouninstallwarning
Name: "fnv"; Description: "모하비 황무지 (Mojave Wasteland)"; Types: VPUI VPEX VPMAX Custom; Flags: disablenouninstallwarning
Name: "df"; Description: "전설의 세계 (World of Lore)"; Types: VPUI VPEX VPMAX Custom; Flags: disablenouninstallwarning

Name: "eaw"; Description: "VP 개선된 항공 전쟁 (Enhanced Air Warfare 4VP)"; Types: VPEX VPMAX Custom; Flags: disablenouninstallwarning
Name: "ee"; Description: "VP 계몽 시대 (Enlightenment Era for VP)"; Types: VPEX VPMAX Custom; Flags: disablenouninstallwarning
Name: "fa"; Description: "VP 미래 시대 (Future Age for VP)"; Types: VPEX VPMAX Custom; Flags: disablenouninstallwarning

Name: "car"; Description: "정책과 개혁 (Civic And Reform)"; Types: VPMAX Custom; Flags: disablenouninstallwarning
;Name: "ed"; Description: "이벤트와 결정 (Events and Decisions)"; Types: VPMAX Custom; Flags: disablenouninstallwarning
;Name: "hrc"; Description: "역사적 종교 완전판 (Historical Religions Complete)"; Types: VPMAX Custom; Flags: disablenouninstallwarning
Name: "jfds"; Description: "VP JFD의 주권 (JFD's Sovereignty for VP)"; Types: VPMAX Custom; Flags: disablenouninstallwarning
;Name: "nbm"; Description: "새로운 신앙 모드 (New Beliefs Mods)"; Types: VPMAX Custom; Flags: disablenouninstallwarning
Name: "rpp"; Description: "영구 판테온 (Permanent Pantheons)"; Types: VPMAX Custom; Flags: disablenouninstallwarning
;Name: "sf"; Description: "속임수 (Subterfuge)"; Types: VPMAX Custom; Flags: disablenouninstallwarning
Name: "wcr"; Description: "세계 의회 개선 (World Congress Reformation)"; Types: VPMAX Custom; Flags: disablenouninstallwarning

;Name: "jcm"; Description: "VP Jarcast의 대리석 도시 (Jarcast's Cities of Marble for VP)"; Types: VPMAX Custom; Flags: disablenouninstallwarning
Name: "jhw"; Description: "VP Jarcast의 숨겨진 불가사의 (Jarcast's Hidden Wonders VP)"; Types: VPMAX Custom; Flags: disablenouninstallwarning
Name: "mw"; Description: "VP 더 많은 불가사의 (More Wonders for VP)"; Types: VPMAX Custom; Flags: disablenouninstallwarning
Name: "pb"; Description: "VP 부교 (Pontoon Bridges for VP)"; Types: VPMAX Custom; Flags: disablenouninstallwarning

Name: "bl"; Description: "VP 더 나은 호수 (Better Lakes for Vox Populi)"; Types: VPMAX Custom; Flags: disablenouninstallwarning
Name: "cd"; Description: "대륙 이동설 (Continental Drift)"; Types: VPUI VPMAX Custom; Flags: disablenouninstallwarning
Name: "emr"; Description: "VP + UCS 한층 더 많은 자원 (Even More Resources for Vox Populi UCS)"; Types: VPMAX Custom; Flags: disablenouninstallwarning
Name: "gw"; Description: "지구 온난화 (Global Warming)"; Types: VPMAX Custom; Flags: disablenouninstallwarning
Name: "jhal"; Description: "Jarcast와 Hokath의 추가 사치 자원 (Jarcast & Hokath's Additional Luxuries)"; Types: VPMAX Custom; Flags: disablenouninstallwarning
Name: "jv"; Description: "Jarcast의 VP 화산 (Jarcast's Volcanoes for VP)"; Types: VPMAX Custom; Flags: disablenouninstallwarning
Name: "lcv"; Description: "zai4z의 랜드마크 문화적 변화 (zai4z's Landmark Cultural Variation)"; Types: VPMAX Custom; Flags: disablenouninstallwarning
Name: "Mariw"; Description: "해양 날씨 (Maritime Weather+)"; Types: VPMAX Custom; Flags: disablenouninstallwarning
Name: "rf"; Description: "재식림 (Reforestation)"; Types: VPMAX Custom; Flags: disablenouninstallwarning
Name: "ts"; Description: "산림 천이 (TreeSuccession)"; Types: VPMAX Custom; Flags: disablenouninstallwarning
Name: "ucs"; Description: "VP 고유 도시 국가 (Unique City States for VP)"; Types: VPMAX Custom; Flags: disablenouninstallwarning
Name: "vb"; Description: "Horem의 알로에 베라 보너스 자원 (Horem's Aloe Vera bonus resource)"; Types: VPMAX Custom; Flags: disablenouninstallwarning

Name: "upt"; Description: "타일당 유닛 3개 (3 Units per Tile)"; Types: VPMAX Custom; Flags: disablenouninstallwarning
Name: "gc"; Description: "포획+++ (Capture+++)"; Types: VPMAX Custom; Flags: disablenouninstallwarning
;Name: "hc"; Description: "VP 육각 타일 정복 (Hex Conquer VP)"; Types: VPMAX Custom; Flags: disablenouninstallwarning
Name: "jpt"; Description: "Jarcast의 장창병 수정 (Jarcast's Pikeman Tweak)"; Types: VPMAX Custom; Flags: disablenouninstallwarning
Name: "mine"; Description: "멋진 신세계용 지뢰 (Landmines for BNW)"; Types: VPMAX Custom; Flags: disablenouninstallwarning
Name: "miwsr"; Description: "군인이 포함된 기계화 보병 (Mechanized Infantry with Soldiers, Resized)"; Types: VPMAX Custom; Flags: disablenouninstallwarning
;Name: "nm"; Description: "해군 모드 (NavalMod)"; Types: VPMAX Custom; Flags: disablenouninstallwarning
;Name: "tb"; Description: "어뢰정 (TorpedoBoat)"; Types: VPMAX Custom; Flags: disablenouninstallwarning
Name: "wb"; Description: "포경 (Whale Battles)"; Types: VPMAX Custom; Flags: disablenouninstallwarning
Name: "wm"; Description: "노동자 등산 (Worker Mountaineering)"; Types: VPMAX Custom; Flags: disablenouninstallwarning

Name: "bn"; Description: "VP 아주 적은 필수품 (Bare Necessities for VP)"; Types: VPMAX Custom; Flags: disablenouninstallwarning
;Name: "hp"; Description: "Hokath의 제안 (Hokaths Proposals)"; Types: VPMAX Custom; Flags: disablenouninstallwarning
Name: "jbhmc"; Description: "Jarcast의 더 큰 Communitu_79a (Jarcast's Bigger Huge Map for Communitu_79a)"; Types: VPMAX Custom; Flags: disablenouninstallwarning
Name: "jeo"; Description: "Jarcast의 자원 추출기지 (Jarcast's Extraction Outpost)"; Types: VPMAX Custom; Flags: disablenouninstallwarning
Name: "mt"; Description: "VP 기타 수정 (Misc Tweaks for VP)"; Types: VPMAX Custom; Flags: disablenouninstallwarning

Name: "cli"; Description: "식민지 유산 VP 이누이트 (Colonialist Legacies' Inuit for VP)"; Types: VPMAX Custom; Flags: disablenouninstallwarning
Name: "gfpa"; Description: "Gwennog의 VP 프랑스 - 필리프 오귀스트 (Gwennog's France - Philippe Auguste for VP)"; Types: VPMAX Custom; Flags: disablenouninstallwarning
Name: "gl"; Description: "Gwennog & Hinin의 루이지애나 (GH's Louisiana - Joseph Beausoleil Broussard for VP)"; Types: VPMAX Custom; Flags: disablenouninstallwarning
Name: "ji"; Description: "Jarcast의 VP 이탈리아 (Jarcast's Italy for VP)"; Types: VPMAX Custom; Flags: disablenouninstallwarning
Name: "jhkt"; Description: "Jarcast와 Hokath의 VP 티베트 (Jarcast & Hokath's Tibet for VP)"; Types: VPMAX Custom; Flags: disablenouninstallwarning
Name: "jnm"; Description: "Jarcast의 VP 은동고 왕국 (Jarcast's Ndongo-Matamba for VP)"; Types: VPMAX Custom; Flags: disablenouninstallwarning
Name: "jps"; Description: "JFD의 VP 교황령 (JFD's Papal States for VP (v 10))"; Types: VPMAX Custom; Flags: disablenouninstallwarning
Name: "jtn"; Description: "Jarcast의 VP 나바호 (Jarcast's The Navajo for VP)"; Types: VPMAX Custom; Flags: disablenouninstallwarning
Name: "li"; Description: "Leugi의 VP 이스라엘 (Leugi's Israel for VP)"; Types: VPMAX Custom; Flags: disablenouninstallwarning

Name: "cr"; Description: "역정찰 (Counter-Reconnaissance)"; Types: VPMAX Custom; Flags: disablenouninstallwarning
Name: "eh"; Description: "탐험 유산 (Exploration Heritage)"; Types: VPMAX Custom; Flags: disablenouninstallwarning
Name: "rpc0"; Description: "정찰 강화 지형 비용 (Recon Pay (Core0) Terrain Cost)"; Types: VPMAX Custom; Flags: disablenouninstallwarning
Name: "rpc1"; Description: "정찰 강화 탐사 밸런스 (Recon Pay (Core1) Exploration Balancer)"; Types: VPMAX Custom; Flags: disablenouninstallwarning
Name: "rpr1"; Description: "정찰 강화 빠른 연안 (Recon Pay (Recommended1) Fast Coast)"; Types: VPMAX Custom; Flags: disablenouninstallwarning
Name: "rpr2"; Description: "정찰 강화 빠른 강 (Recon Pay (Recommended2) Fast Rivers)"; Types: VPMAX Custom; Flags: disablenouninstallwarning
Name: "rpr3"; Description: "정찰 강화 빠른 연안의 (Recon Pay (Recommended3) Fast Coastal)"; Types: VPMAX Custom; Flags: disablenouninstallwarning
Name: "rpx1"; Description: "정찰 강화 극지인 (Recon Pay (Xtra1) Arctician)"; Types: VPMAX Custom; Flags: disablenouninstallwarning
Name: "rpx2"; Description: "정찰 강화 통제 구역 무시 (Recon Pay (Xtra2) Free ZoC)"; Types: VPMAX Custom; Flags: disablenouninstallwarning
Name: "rpx3"; Description: "정찰 강화 산림 이동 방해 (Recon Pay (Xtra3) Trees Obstruct Mounted Armor)"; Types: VPMAX Custom; Flags: disablenouninstallwarning
Name: "rpx4"; Description: "정찰 강화 항구 변경 (Recon Pay (Xtra4) Change Port)"; Types: VPMAX Custom; Flags: disablenouninstallwarning
Name: "rpx5"; Description: "정찰 강화 말 도둑 (Recon Pay (Xtra5) Horse Thieves)"; Types: VPMAX Custom; Flags: disablenouninstallwarning
Name: "rpx6"; Description: "정찰 강화 탐사 전문화 (Recon Pay (xtra6) Exploration Specialization)"; Types: VPMAX Custom; Flags: disablenouninstallwarning

[Types]
Name: "VP"; Description: "Vox Populi 한국어";
Name: "VPUI"; Description: "VP + UI";
Name: "VPEX"; Description: "VP + UI + 계몽 + 미래";
Name: "VPMAX"; Description: "위험을 무릅쓰고 전체 설치";
Name: "Custom"; Description: "사용자 정의 설치"; Flags: iscustom

[InstallDelete]
Type: filesandordirs; Name: "{code:GetCIVDir}\Assets\DLC\MP_MODSPACK"
Type: filesandordirs; Name: "{code:GetCIVDir}\Assets\DLC\Artful Textures"
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
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\!Jarcast's Ndongo-Matamba for VP (v 1)"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\!Jarcast's The Navajo for VP (v 2)"
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
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\(Primary) - Gwennog's France - Philippe Auguste for VP (v.6)"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\(text) Promotion Overhaul for VP"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\(text) Promotion Overhaul for VP INT (AI)"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\(Unity) - GH's Louisiana - Joseph Beausoleil Broussard for VP (v.12)"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\(visual) Unit Scaling and Formation for VP (v 12)"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\_Named Ethnic Units_ (v 600)"

Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\3 Units per Tile (v 1)"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\Better Lakes for Vox Populi (v 3)"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\Better Lakes for Vox Populi INT"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\Civic And Reform (v 22)"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\Civic And Reform (v 22) INT"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\Civic And Reform (v 22) KR"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\Colonialist Legacies' Inuit for VP"
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
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\Jarcast & Hokath's Tibet for VP (v 5)"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\Jarcast and Hokath's Additional Luxuries INT"
;Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\Jarcast's Bigger Huge Map for Communitu_79a (v 5)"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\Jarcast's Extraction Outpost (v 3)"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\JJarcast's Italy for VP (v 2)"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\Jarcast's Pikeman Tweak (v 2)"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\Jarcast's Pikeman Tweak (v 2) INT"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\JFD's Papal States for VP (v 10)"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\JFD's Sovereignty for VP (v 15a)"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\JFD's Sovereignty for VP (v 15a) INT"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\JFD's Sovereignty for VP (v 15a) KR"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\Landmines for BNW (v 3)"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\Leugi's Israel for VP"
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
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\(j) Bare Necessities for VP (v 13)"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\(j) Bare Necessities for VP (v 13) INT"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\(j) Bare Necessities for VP (v 14)"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\(j) Bare Necessities for VP (v 14) INT"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\(j) Bare Necessities (v 13)"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\(j) Bare Necessities (v 13) INT"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\(j) Bare Necessities (v 14)"
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\(j) Bare Necessities (v 14) INT"
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
Type: filesandordirs; Name: "{userdocs}\My Games\Sid Meier's Civilization 5\MODS\zai4z's Landmark Cultural Variation (v 1)"

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
    WizardForm.FinishedLabel.Caption := '설치 프로그램이 컴퓨터에 Vox Populi 한국어 모드 설치를 완료했습니다. 모드를 실행하려면 문명 5를 열고 모드 메뉴에서 설치된 모든 모드를 활성화한 후 ''다음''을 클릭합니다(''뒤로''를 클릭하지 마세요). 즐거운 시간 되세요!';
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