; Inno Script Studio Wizard로 생성된 스크립트입니다.
; INNO SETUP 스크립트 파일을 만드는 방법에 대한 자세한 내용은 설명서를 참조하세요!

#define MyAppName "VP 한국어 모드 모음"
#define MyAppVersion "5.1.4"
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
WizardImageStretch=no
Compression=lzma2
SolidCompression=yes
ShowComponentSizes=yes
AllowNoIcons=yes
Uninstallable=no
PrivilegesRequired=admin
DirExistsWarning=no
UsedUserAreasWarning=no

[Languages]
Name: "ko"; MessagesFile: "compiler:Languages\Korean.isl"

[Files]
Source: "..\(1L) Community Patch INT\*"; Excludes: "\*.civ5proj,*.civ5sln,*.civ5suo"; DestDir: "{app}\MODS\(1L) Community Patch INT"; Flags: ignoreversion recursesubdirs; Components: vp
Source: "..\(2L) Vox Populi INT\*"; Excludes: "\*.civ5proj,*.civ5sln,*.civ5suo"; DestDir: "{app}\MODS\(2L) Vox Populi INT"; Flags: ignoreversion recursesubdirs;	Components: vp
Source: "..\(3aL) VP - EUI Compatibility Files INT\*"; Excludes: "\*.civ5proj,*.civ5sln,*.civ5suo"; DestDir: "{app}\MODS\(3aL) VP - EUI Compatibility Files INT"; Flags: ignoreversion recursesubdirs; Components:  vp
Source: "..\(4aL) Squads for VP INT\*"; Excludes: "\*.civ5proj,*.civ5sln,*.civ5suo"; DestDir: "{app}\MODS\(4aL) Squads for VP INT"; Flags: ignoreversion recursesubdirs;	Components: vp
Source: "..\UI - Promotion Tree for VP\*"; DestDir: "{app}\MODS\UI - Promotion Tree for VP"; Flags: ignoreversion recursesubdirs;	Components: vppt
Source: "..\JFD's Cultural Diversity - (1) (Core) Utilities (v 21)\*"; DestDir: "{app}\MODS\JFD's Cultural Diversity - (1) (Core) Utilities (v 21)"; Flags: ignoreversion recursesubdirs;	Components: uc
Source: "..\JFD's Cultural Diversity - (2) (Art) Splash Screens (v 1)\*"; DestDir: "{app}\MODS\JFD's Cultural Diversity - (2) (Art) Splash Screens (v 1)"; Flags: ignoreversion recursesubdirs;	Components: uc
Source: "..\JFD's Cultural Diversity - (2) (Sound) Unit Dialogue (v 1)*"; DestDir: "{app}\MODS\JFD's Cultural Diversity - (2) (Sound) Unit Dialogue (v 1)"; Flags: ignoreversion recursesubdirs;	Components: uc
Source: "..\JFD's Cultural Diversity - (2a) (Gameplay) Unique Components\*"; DestDir: "{app}\MODS\JFD's Cultural Diversity - (2a) (Gameplay) Unique Components"; Flags: ignoreversion recursesubdirs;	Components: uc
Source: "..\JFD's Cultural Diversity INT\*"; DestDir: "{app}\MODS\JFD's Cultural Diversity INT"; Flags: ignoreversion recursesubdirs;	Components: uc

Source: "..\!Horem's Aloe Vera bonus resource (v 4)\*"; DestDir: "{app}\MODS\!Horem's Aloe Vera bonus resource (v 4)"; Flags: ignoreversion recursesubdirs;	Components: aloe
Source: "..\!Horem's Aloe Vera bonus resource (v 4) INT\*"; DestDir: "{app}\MODS\!Horem's Aloe Vera bonus resource (v 4) INT"; Flags: ignoreversion recursesubdirs;	Components: aloe
Source: "..\!Jarcast & Hokath's Additional Luxuries (v 4)\*"; DestDir: "{app}\MODS\!Jarcast & Hokath's Additional Luxuries (v 4)"; Flags: ignoreversion recursesubdirs;	Components: al
Source: "..\!Jarcast and Hokath's Additional Luxuries INT\*"; DestDir: "{app}\MODS\!Jarcast and Hokath's Additional Luxuries INT"; Flags: ignoreversion recursesubdirs;	Components: al
Source: "..\!Jarcast & Hokath's Tibet for VP (v 6)\*"; DestDir: "{app}\MODS\!Jarcast & Hokath's Tibet for VP (v 6)"; Flags: ignoreversion recursesubdirs;	Components: tibet
Source: "..\!Jarcast's Cities of Marble for VP (v 4)\*"; DestDir: "{app}\MODS\!Jarcast's Cities of Marble for VP (v 4)"; Flags: ignoreversion recursesubdirs;	Components: cm
Source: "..\!Jarcast's Cities of Marble for VP (v 4) INT\*"; DestDir: "{app}\MODS\!Jarcast's Cities of Marble for VP (v 4) INT"; Flags: ignoreversion recursesubdirs;	Components: cm
Source: "..\!Jarcast's City States Leaders Ultimate (v 2)\*"; DestDir: "{app}\MODS\!Jarcast's City States Leaders Ultimate (v 1)"; Flags: ignoreversion recursesubdirs;	Components: cslu
Source: "..\!Jarcast's City States Leaders Ultimate INT\*"; DestDir: "{app}\MODS\!Jarcast's City States Leaders Ultimate INT"; Flags: ignoreversion recursesubdirs;	Components: cslu
Source: "..\!Jarcast's Hidden Wonders (VP)\*"; DestDir: "{app}\MODS\!Jarcast's Hidden Wonders (VP)"; Flags: ignoreversion recursesubdirs;	Components: hw
Source: "..\!Jarcast's Hidden Wonders (VP) INT\*"; DestDir: "{app}\MODS\!Jarcast's Hidden Wonders (VP) INT"; Flags: ignoreversion recursesubdirs;	Components: hw
Source: "..\!Jarcast's Italy for VP (v 3)\*"; DestDir: "{app}\MODS\!Jarcast's Italy for VP (v 3)"; Flags: ignoreversion recursesubdirs;	Components: italy
Source: "..\!Jarcast's Ndongo-Matamba for VP (v 3)\*"; DestDir: "{app}\MODS\!Jarcast's Ndongo-Matamba for VP (v 3)"; Flags: ignoreversion recursesubdirs;	Components: nm
Source: "..\!Jarcast's Permafrost Alive (v 1)\*"; DestDir: "{app}\MODS\!Jarcast's Permafrost Alive (v 1)"; Flags: ignoreversion recursesubdirs;	Components: pa
Source: "..\!Jarcast's Permafrost Alive (v 1) INT\*"; DestDir: "{app}\MODS\!Jarcast's Permafrost Alive (v 1) INT"; Flags: ignoreversion recursesubdirs;	Components: pa
Source: "..\!Jarcast's The Navajo for VP (v 3)\*"; DestDir: "{app}\MODS\!Jarcast's The Navajo for VP (v 3)"; Flags: ignoreversion recursesubdirs;	Components: navajo
Source: "..\!Jarcast's Volcanoes for VP (v 8)\*"; DestDir: "{app}\MODS\!Jarcast's Volcanoes for VP (v 8)"; Flags: ignoreversion recursesubdirs;	Components: vol
Source: "..\!Jarcast's Volcanoes for VP (v 8) INT\*"; DestDir: "{app}\MODS\!Jarcast's Volcanoes for VP (v 8) INT"; Flags: ignoreversion recursesubdirs;	Components: vol
Source: "..\(j) Bare Necessities (v 15)\*"; DestDir: "{app}\MODS\(j) Bare Necessities (v 15)"; Flags: ignoreversion recursesubdirs;	Components: bn
Source: "..\(j) Bare Necessities (v 15) INT\*"; DestDir: "{app}\MODS\(j) Bare Necessities (v 15) INT"; Flags: ignoreversion recursesubdirs;	Components: bn
;Source: "..\(n) Religious Victory\*"; DestDir: "{app}\MODS\(n) Religious Victory"; Flags: ignoreversion recursesubdirs;	Components: rv
;Source: "..\(n) Semper Fidelis\*"; DestDir: "{app}\MODS\(n) Semper Fidelis"; Flags: ignoreversion recursesubdirs;	Components: sf
;Source: "..\(n) Subterfuge\*"; DestDir: "{app}\MODS\(n) Subterfuge"; Flags: ignoreversion recursesubdirs;	Components: stfg
Source: "..\(overhaul) Enhanced Air Warfare 4VP (v 1.9)\*"; DestDir: "{app}\MODS\(overhaul) Enhanced Air Warfare 4VP (v 1.9)"; Flags: ignoreversion recursesubdirs;	Components: eaw
Source: "..\(overhaul) Enhanced Air Warfare 4VP INT\*"; DestDir: "{app}\MODS\(overhaul) Enhanced Air Warfare 4VP INT"; Flags: ignoreversion recursesubdirs;	Components: eaw
Source: "..\(overhaul) Enlightenment Era for VP\*"; DestDir: "{app}\MODS\(overhaul) Enlightenment Era for VP"; Flags: ignoreversion recursesubdirs;	Components: ee
Source: "..\(overhaul) Enlightenment Era for VP INT\*"; DestDir: "{app}\MODS\(overhaul) Enlightenment Era for VP INT"; Flags: ignoreversion recursesubdirs;	Components: ee
Source: "..\(ui) List Enhancements for VP KR\*"; DestDir: "{app}\MODS\(ui) List Enhancements for VP KR"; Flags: ignoreversion recursesubdirs;	Components: le
Source: "..\(overhaul) More Wonders for VP\*"; DestDir: "{app}\MODS\(overhaul) More Wonders for VP"; Flags: ignoreversion recursesubdirs;	Components: mw
Source: "..\(overhaul) More Wonders for VP INT\*"; DestDir: "{app}\MODS\(overhaul) More Wonders for VP INT"; Flags: ignoreversion recursesubdirs;	Components: mw
Source: "..\(overhaul) Unique City States for VP\*"; DestDir: "{app}\MODS\(overhaul) Unique City States for VP"; Flags: ignoreversion recursesubdirs;	Components: ucs
Source: "..\(overhaul) Unique City States for VP INT\*"; DestDir: "{app}\MODS\(overhaul) Unique City States for VP INT"; Flags: ignoreversion recursesubdirs;	Components: ucs
Source: "..\(Primary) - Gwennog's France - Philippe Auguste for VP (v.9)\*"; DestDir: "{app}\MODS\(Primary) - Gwennog's France - Philippe Auguste for VP (v.9)"; Flags: ignoreversion recursesubdirs;	Components: france
;Source: "..\(text) Promotion Overhaul for VP\*"; DestDir: "{app}\MODS\(text) Promotion Overhaul for VP"; Flags: ignoreversion recursesubdirs;	Components: po
Source: "..\(ui) City-States Leaders for VP\*"; DestDir: "{app}\MODS\(ui) City-States Leaders for VP"; Flags: ignoreversion recursesubdirs;	Components: csl
Source: "..\(ui) City-States Leaders for VP INT\*"; DestDir: "{app}\MODS\(ui) City-States Leaders for VP INT"; Flags: ignoreversion recursesubdirs;	Components: csl
Source: "..\(ui) Trade Opportunities for VP\*"; DestDir: "{app}\MODS\(ui) Trade Opportunities for VP"; Flags: ignoreversion recursesubdirs;	Components: to
Source: "..\(ui) Trade Opportunities for VP INT\*"; DestDir: "{app}\MODS\(ui) Trade Opportunities for VP INT"; Flags: ignoreversion recursesubdirs;	Components: to
Source: "..\(ui) Wonder Planner For VP KR\*"; DestDir: "{app}\MODS\(ui) Wonder Planner For VP KR"; Flags: ignoreversion recursesubdirs;	Components: wp
Source: "..\(Unity) - GH's Louisiana - Joseph Beausoleil Broussard for VP (v.14)\*"; DestDir: "{app}\MODS\(Unity) - GH's Louisiana - Joseph Beausoleil Broussard for VP (v.14)"; Flags: ignoreversion recursesubdirs;	Components: louis
Source: "..\Auto-Sell Buildings (v 1)\*"; DestDir: "{app}\MODS\Auto-Sell Buildings (v 1)"; Flags: ignoreversion recursesubdirs;	Components: asb
Source: "..\Continental Drift (v 3)\*"; DestDir: "{app}\MODS\Continental Drift (v 3)"; Flags: ignoreversion recursesubdirs;	Components: cd
Source: "..\Even More Resources for Vox Populi (v 15)\*"; DestDir: "{app}\MODS\(overhaul) Even More Resources for Vox Populi (v 15)"; Flags: ignoreversion recursesubdirs;	Components: emr\n
Source: "..\Even More Resources for Vox Populi (v 15) INT\*"; DestDir: "{app}\MODS\(overhaul) Even More Resources for Vox Populi (v 15) INT"; Flags: ignoreversion recursesubdirs;	Components: emr\n
Source: "..\Even More Resources for Vox Populi UCS (v 15)\*"; DestDir: "{app}\MODS\Even More Resources for Vox Populi UCS (v 15)"; Flags: ignoreversion recursesubdirs;	Components: emr\u
Source: "..\Even More Resources for Vox Populi UCS INT\*"; DestDir: "{app}\MODS\Even More Resources for Vox Populi UCS INT"; Flags: ignoreversion recursesubdirs;	Components: emr\u
Source: "..\Gedemon's YnAEMP KR\*"; DestDir: "{app}\MODS\Gedemon's YnAEMP KR"; Flags: ignoreversion recursesubdirs;	Components: ynaemp
Source: "..\Historical Religions Complete (BNW or GK) (v 45)\*"; DestDir: "{app}\MODS\Historical Religions Complete (BNW or GK) (v 45)"; Flags: ignoreversion recursesubdirs;	Components: hrc
;Source: "..\Hokaths Proposals\*"; DestDir: "{app}\MODS\Hokaths Proposals"; Flags: ignoreversion recursesubdirs;	Components: hp
Source: "..\InGame Editor+ (v 47)\*"; DestDir: "{app}\MODS\InGame Editor+ (v 47)"; Flags: ignoreversion recursesubdirs;	Components: ige
Source: "..\Jarcast's Bigger Huge Map for Communitu_79a (v 5)\*"; DestDir: "{app}\MODS\Jarcast's Bigger Huge Map for Communitu_79a (v 5)"; Flags: ignoreversion recursesubdirs;	Components: comm
Source: "..\JFD's Civilizations - Papal States for VP (v 11)\*"; DestDir: "{app}\MODS\JFD's Civilizations - Papal States for VP (v 11)"; Flags: ignoreversion recursesubdirs;	Components: papa
Source: "..\Longer Eras - Historic (v 8)\*"; DestDir: "{app}\MODS\Longer Eras - Historic (v 8)"; Flags: ignoreversion recursesubdirs;	Components: his
Source: "..\Longer Eras - Historic (v 8) INT\*"; DestDir: "{app}\MODS\Longer Eras - Historic (v 8) INT"; Flags: ignoreversion recursesubdirs;	Components: his
Source: "..\Maritime Weather+ (v 51)\*"; DestDir: "{app}\MODS\Maritime Weather+ (v 51)"; Flags: ignoreversion recursesubdirs;	Components: mb
Source: "..\Maritime Weather+ (v 51) INT\*"; DestDir: "{app}\MODS\Maritime Weather+ (v 51) INT"; Flags: ignoreversion recursesubdirs;	Components: mb
;Source: "..\Misc Tweaks for VP (v 5.1)\*"; DestDir: "{app}\MODS\Misc Tweaks for VP (v 5.1)"; Flags: ignoreversion recursesubdirs;	Components: mt
;Source: "..\Misc Tweaks for VP (v 5.1) INT\*"; DestDir: "{app}\MODS\Misc Tweaks for VP (v 5.1) INT"; Flags: ignoreversion recursesubdirs;	Components: mt
Source: "..\Mojave Wasteland - Fallout New Vegas (v 101)\*"; DestDir: "{app}\MODS\Mojave Wasteland - Fallout New Vegas (v 101)"; Flags: ignoreversion recursesubdirs;	Components: fnv
Source: "..\Music Changer (v 2)\*"; DestDir: "{app}\MODS\Music Changer (v 2)"; Flags: ignoreversion recursesubdirs;	Components: mc
Source: "..\Quick Turns (v 10)\*"; DestDir: "{app}\MODS\Quick Turns (v 10)"; Flags: ignoreversion recursesubdirs;	Components: qt
Source: "..\Really Advanced Setup (v 15) KR\*"; DestDir: "{app}\MODS\Really Advanced Setup (v 15) KR"; Flags: ignoreversion recursesubdirs;	Components: ras
Source: "..\Recon Pay (Core0) Terrain Cost (v 8)\*"; DestDir: "{app}\MODS\Recon Pay (Core0) Terrain Cost (v 8)"; Flags: ignoreversion recursesubdirs;	Components: rp\c0
Source: "..\Recon Pay (Core1) Exploration Balancer (v 4)\*"; DestDir: "{app}\MODS\Recon Pay (Core1) Exploration Balancer (v 4)"; Flags: ignoreversion recursesubdirs;	Components: rp\c1
Source: "..\Recon Pay (Core1) Exploration Balancer (v 4) INT\*"; DestDir: "{app}\MODS\Recon Pay (Core1) Exploration Balancer (v 4) INT"; Flags: ignoreversion recursesubdirs;	Components: rp\c1
Source: "..\Recon Pay (Recommended1) Fast Coast (v 4)\*"; DestDir: "{app}\MODS\Recon Pay (Recommended1) Fast Coast (v 4)"; Flags: ignoreversion recursesubdirs;	Components: rp\r1
Source: "..\Recon Pay (Recommended1) Fast Coast (v 4) INT\*"; DestDir: "{app}\MODS\Recon Pay (Recommended1) Fast Coast (v 4) INT"; Flags: ignoreversion recursesubdirs;	Components: rp\r1
Source: "..\Recon Pay (Recommended2) Fast Rivers (v 7)\*"; DestDir: "{app}\MODS\Recon Pay (Recommended2) Fast Rivers (v 7)"; Flags: ignoreversion recursesubdirs;	Components: rp\r2
Source: "..\Recon Pay (Recommended2) Fast Rivers (v 7) INT\*"; DestDir: "{app}\MODS\Recon Pay (Recommended2) Fast Rivers (v 7) INT"; Flags: ignoreversion recursesubdirs;	Components: rp\r2
Source: "..\Recon Pay (Recommended3) Fast Coastal (v 8)\*"; DestDir: "{app}\MODS\Recon Pay (Recommended3) Fast Coastal (v 8)"; Flags: ignoreversion recursesubdirs;	Components: rp\r3
Source: "..\Recon Pay (Recommended3) Fast Coastal (v 8) INT\*"; DestDir: "{app}\MODS\Recon Pay (Recommended3) Fast Coastal (v 8) INT"; Flags: ignoreversion recursesubdirs;	Components: rp\r3
Source: "..\Sukritact's Civ VI Style City Names (v 1)\*"; DestDir: "{app}\MODS\Sukritact's Civ VI Style City Names (v 1)"; Flags: ignoreversion recursesubdirs;	Components: civ6
Source: "..\UI - Antiquity Site Tooltips (v 5)\*"; DestDir: "{app}\MODS\UI - Antiquity Site Tooltips (v 5)"; Flags: ignoreversion recursesubdirs;	Components: ast
Source: "..\UI - Auto Map Pins (v 4)\*"; DestDir: "{app}\MODS\UI - Auto Map Pins (v 4)"; Flags: ignoreversion recursesubdirs;	Components: amp
Source: "..\UI - City Happiness (v 17)\*"; DestDir: "{app}\MODS\UI - City Happiness (v 17)"; Flags: ignoreversion recursesubdirs;	Components: ch
Source: "..\UI - City Production (v 15)\*"; DestDir: "{app}\MODS\UI - City Production (v 15)"; Flags: ignoreversion recursesubdirs;	Components: cp
Source: "..\UI - City Religions (v 4)\*"; DestDir: "{app}\MODS\UI - City Religions (v 4)"; Flags: ignoreversion recursesubdirs;	Components: cr
Source: "..\UI - Diary (v 21)\*"; DestDir: "{app}\MODS\UI - Diary (v 21)"; Flags: ignoreversion recursesubdirs;	Components: uid
Source: "..\UI - Enhanced Rankings (v 13)\*"; DestDir: "{app}\MODS\UI - Enhanced Rankings (v 13)"; Flags: ignoreversion recursesubdirs;	Components: er
Source: "..\UI - Enhanced Rankings INT\*"; DestDir: "{app}\MODS\UI - Enhanced Rankings INT"; Flags: ignoreversion recursesubdirs;	Components: er
Source: "..\UI - Gold Alerts (v 10)\*"; DestDir: "{app}\MODS\UI - Gold Alerts (v 10)"; Flags: ignoreversion recursesubdirs;	Components: ga
Source: "..\UI - Horizontal Leaders' Portraits for VP (v 3)\*"; DestDir: "{app}\MODS\UI - Horizontal Leaders' Portraits for VP (v 3)"; Flags: ignoreversion recursesubdirs;	Components: hlp
Source: "..\UI - Improved City View (Vox Populi EUI)\*"; DestDir: "{app}\MODS\UI - Improved City View (Vox Populi EUI)"; Flags: ignoreversion recursesubdirs;	Components: icv
Source: "..\UI - Improved City View (Vox Populi EUI) INT\*"; DestDir: "{app}\MODS\UI - Improved City View (Vox Populi EUI) INT"; Flags: ignoreversion recursesubdirs;	Components: icv
Source: "..\UI - Map Pins (v 17)\*"; DestDir: "{app}\MODS\UI - Map Pins (v 17)"; Flags: ignoreversion recursesubdirs;	Components: mp
Source: "..\UI - No Auto-Embark Workers (v 7)\*"; DestDir: "{app}\MODS\UI - No Auto-Embark Workers (v 7)"; Flags: ignoreversion recursesubdirs;	Components: naew
Source: "..\UI - Notify Exit Resistance (v 1)\*"; DestDir: "{app}\MODS\UI - Notify Exit Resistance (v 1)"; Flags: ignoreversion recursesubdirs;	Components: ner
Source: "..\VP Happiness notifications (v 1) KR\*"; DestDir: "{app}\MODS\VP Happiness notifications (v 1) KR"; Flags: ignoreversion recursesubdirs;	Components: hn
Source: "..\Wake All and Upgrade All Units In Military Overview (v 1)\*"; DestDir: "{app}\MODS\Wake All and Upgrade All Units In Military Overview (v 1)"; Flags: ignoreversion recursesubdirs;	Components: waua
Source: "..\Wake All and Upgrade All Units In Military Overview (v 1) INT\*"; DestDir: "{app}\MODS\Wake All and Upgrade All Units In Military Overview (v 1) INT"; Flags: ignoreversion recursesubdirs;	Components: waua
Source: "..\World of Lore - DragonFable (v 1)\*"; DestDir: "{app}\MODS\World of Lore - DragonFable (v 1)"; Flags: ignoreversion recursesubdirs;	Components: df
Source: "..\zai4z's Landmark Cultural Variation (v 1)\*"; DestDir: "{app}\MODS\zai4z's Landmark Cultural Variation (v 1)"; Flags: ignoreversion recursesubdirs;	Components: luv
Source: "..\zuiLeaderHead KR\*"; DestDir: "{app}\MODS\zuiLeaderHead KR"; Flags: ignoreversion recursesubdirs;	Components: zui

Source: "..\Assets\*"; DestDir: "{code:GetCIVDir}\Assets"; Flags: ignoreversion recursesubdirs; Components: vp
Source: "..\Assets_votes\*"; DestDir: "{code:GetCIVDir}\Assets"; Flags: ignoreversion recursesubdirs; Components: vpnvc
Source: "..\Maps\*"; DestDir: "{code:GetCIVDir}\Assets\Maps"; Flags: ignoreversion recursesubdirs; Components: map
Source: "..\Textures\Artful Textures\*"; DestDir: "{code:GetCIVDir}\Assets\DLC\Artful Textures"; Flags: ignoreversion recursesubdirs; Components: textures\at
Source: "..\Textures\VT\*"; DestDir: "{code:GetCIVDir}\Assets\DLC\VT"; Flags: ignoreversion recursesubdirs; Components: textures\vt
Source: "..\UI\CivSelection\Backup\*"; DestDir: "{code:GetCIVDir}\Assets"; Flags: ignoreversion recursesubdirs; Components: civselect
Source: "..\VPUI Text\VPUI_tips_ko_kr.xml"; DestDir: "{app}\Text"; Flags: ignoreversion recursesubdirs; Components: vp
; 참고: 공유 시스템 파일에서 "Flags: ignoreversion"을 사용하지 마십시오.

[Components]
Name: "vp"; Description: "Vox Populi 한국어 번역"; Types: VP VPUI VPEX VPMAX Custom; Flags: disablenouninstallwarning fixed
Name: "vpnvc"; Description: "세계 의회 투표 문명 색상 제거"; Types: Custom; Flags: disablenouninstallwarning

Name: "ynaemp"; Description: "Gedemon의 YnAEMP"; Types: VPMAX Custom; Flags: disablenouninstallwarning
Name: "ras"; Description: "진정한 고급 설정(Really Advanced Setup)"; Types: VPMAX Custom; Flags: disablenouninstallwarning
Name: "map"; Description: "추가 지도: 문명 5 지도 폴더에 복사"; Types: VPMAX Custom; Flags: disablenouninstallwarning
Name: "comm"; Description: "지도: Jarcast의 더 거대한 Communitu (Huge Map for Communitu_79a)"; Types: VPMAX Custom; Flags: disablenouninstallwarning
Name: "cd"; Description: "지도: 대륙 이동설"; Types: VPMAX Custom; Flags: disablenouninstallwarning
Name: "fnv"; Description: "지도: 모하비 황무지 - 폴아웃 뉴 베가스"; Types: VPMAX Custom; Flags: disablenouninstallwarning
Name: "df"; Description: "지도: 월드 오브 로어 - 드래곤페이블"; Types: VPMAX Custom; Flags: disablenouninstallwarning

Name: "textures"; Description: "지도 텍스처"; Types: Custom; Flags: disablenouninstallwarning
Name: "textures\vt"; Description: "선명한 텍스처"; Types: VPMAX Custom; Flags: exclusive disablenouninstallwarning
Name: "textures\at"; Description: "예술적인 텍스처"; Types: Custom; Flags: exclusive disablenouninstallwarning
Name: "civselect"; Description: "문명 선택 기본 화면"; Types: Custom; Flags: disablenouninstallwarning

Name: "icv"; Description: "개선된 도시 화면 (Improved City View)"; Types: VPUI VPEX VPMAX Custom; Flags: disablenouninstallwarning
Name: "ige"; Description: "인게임 에디터(InGame Editor+)"; Types: VPUI VPEX VPMAX Custom; Flags: disablenouninstallwarning
Name: "vppt"; Description: "승급 트리 (Promotion Tree)"; Types: VPUI VPEX VPMAX Custom; Flags: disablenouninstallwarning
Name: "qt"; Description: "빠른 턴 (Quick Turns)"; Types: VPUI VPEX VPMAX Custom; Flags: disablenouninstallwarning
Name: "his"; Description: "게임 속도: 역사적 (Longer Eras - Historic)"; Types: VPUI VPEX VPMAX Custom; Flags: disablenouninstallwarning
Name: "asb"; Description: "건물 자동 판매(Auto-Sell Buildings)"; Types: VPUI VPEX VPMAX Custom; Flags: disablenouninstallwarning
Name: "ast"; Description: "고대 유적지 도움말(Antiquity Site Tooltips)"; Types: VPUI VPEX VPMAX Custom; Flags: disablenouninstallwarning
Name: "amp"; Description: "자동 지도 핀(Auto Map Pins)"; Types: VPUI VPEX VPMAX Custom; Flags: disablenouninstallwarning
Name: "ch"; Description: "도시 행복도(City Happiness)"; Types: VPUI VPEX VPMAX Custom; Flags: disablenouninstallwarning
Name: "cp"; Description: "도시 생산력(City Production)"; Types: VPUI VPEX VPMAX Custom; Flags: disablenouninstallwarning
Name: "cr"; Description: "도시 종교(City Religions)"; Types: VPUI VPEX VPMAX Custom; Flags: disablenouninstallwarning
Name: "csl"; Description: "도시 국가 지도자(City-States Leaders)"; Types: VPUI VPEX VPMAX Custom; Flags: disablenouninstallwarning
Name: "uid"; Description: "일기장(Diary)"; Types: VPUI VPEX VPMAX Custom; Flags: disablenouninstallwarning
Name: "er"; Description: "개선된 순위(Enhanced Rankings)"; Types: VPUI VPEX VPMAX Custom; Flags: disablenouninstallwarning
Name: "ga"; Description: "골드 알림(Gold Alerts)"; Types: VPUI VPEX VPMAX Custom; Flags: disablenouninstallwarning
Name: "hlp"; Description: "수평 지도자 초상화(Horizontal Leaders' Portraits)"; Types: VPUI VPEX VPMAX Custom; Flags: disablenouninstallwarning
Name: "le"; Description: "목록 개선(List Enhancements)"; Types: VPUI VPEX VPMAX Custom; Flags: disablenouninstallwarning
Name: "mp"; Description: "지도 핀(Map Pins)"; Types: VPUI VPEX VPMAX Custom; Flags: disablenouninstallwarning
Name: "mc"; Description: "배경음 바꾸기(Music Changer)"; Types: VPUI VPEX VPMAX Custom; Flags: disablenouninstallwarning
Name: "naew"; Description: "노동자 자동 승선 막기(No Auto-Embark Workers)"; Types: VPUI VPEX VPMAX Custom; Flags: disablenouninstallwarning
Name: "ner"; Description: "저항 탈출 알림(Notify Exit Resistance)"; Types: VPUI VPEX VPMAX Custom; Flags: disablenouninstallwarning
Name: "to"; Description: "교역 기회(Trade Opportunities)"; Types: VPUI VPEX VPMAX Custom; Flags: disablenouninstallwarning
Name: "hn"; Description: "행복 알림(Happiness notifications)"; Types: VPUI VPEX VPMAX Custom; Flags: disablenouninstallwarning
Name: "waua"; Description: "전체 깨우기와 전체 업그레이드(Wake All and Upgrade All Units In Military Overview)"; Types: VPUI VPEX VPMAX Custom; Flags: disablenouninstallwarning
Name: "wp"; Description: "불가사의 계획서(Wonder Planner)"; Types: VPUI VPEX VPMAX Custom; Flags: disablenouninstallwarning
Name: "zui"; Description: "ZUI 지도자 화면(zuiLeaderHead)"; Types: VPUI VPEX VPMAX Custom; Flags: disablenouninstallwarning

Name: "uc"; Description: "문화 요소(5/6 UC)"; Types: VPEX VPMAX Custom; Flags: disablenouninstallwarning
Name: "ee"; Description: "계몽 시대(Enlightenment Era)"; Types: VPEX VPMAX Custom; Flags: disablenouninstallwarning
Name: "eaw"; Description: "개선된 항공전(Enhanced Air Warfare)"; Types: VPEX VPMAX Custom; Flags: disablenouninstallwarning

Name: "bn"; Description: "필수 품목(Bare Necessities)"; Types: VPMAX Custom; Flags: disablenouninstallwarning
Name: "mw"; Description: "더 많은 불가사의(More Wonders)"; Types: VPMAX Custom; Flags: disablenouninstallwarning
Name: "ucs"; Description: "고유 도시 국가(Unique City States)"; Types: VPMAX Custom; Flags: disablenouninstallwarning
Name: "cslu"; Description: "Jarcast의 도시 국가 지도자 얼티메이트(City States Leaders Ultimate)"; Types: VPMAX Custom; Flags: disablenouninstallwarning
Name: "hrc"; Description: "역사적 종교 컴플리트(Historical Religions Complete)"; Types: VPMAX Custom; Flags: disablenouninstallwarning
Name: "Aloe"; Description: "Horem의 알로에 베라 보너스 자원(Aloe Vera Bonus Resource)"; Types: VPMAX Custom; Flags: disablenouninstallwarning
Name: "al"; Description: "Jarcast와 Hokath의 추가 사치(Additional Luxuries)"; Types: VPMAX Custom; Flags: disablenouninstallwarning
Name: "emr"; Description: "더 많은 자원(Even More Resources)"; Types: VPMAX Custom; Flags: disablenouninstallwarning
Name: "emr\n"; Description: "일반 VP용"; Types: VPMAX Custom; Flags: exclusive disablenouninstallwarning
Name: "emr\u"; Description: "UCS(고유 도시 국가)용"; Types: Custom; Flags: exclusive disablenouninstallwarning
Name: "cm"; Description: "Jarcast의 대리석의 도시(Cities of Marble)"; Types: VPMAX Custom; Flags: disablenouninstallwarning
Name: "hw"; Description: "Jarcast의 숨겨진 불가사의(Hidden Wonders)"; Types: VPMAX Custom; Flags: disablenouninstallwarning
Name: "vol"; Description: "Jarcast의 화산(Volcanoes)"; Types: VPMAX Custom; Flags: disablenouninstallwarning
Name: "pa"; Description: "Jarcast의 영구동토층 생존(Permafrost Alive)"; Types: VPMAX Custom; Flags: disablenouninstallwarning
Name: "mb"; Description: "해상 날씨(Maritime Weather+)"; Types: VPMAX Custom; Flags: disablenouninstallwarning
Name: "civ6"; Description: "Sukritact의 문명 6 스타일 도시 이름(Sukritact's Civ VI Style City Names)"; Types: VPMAX Custom; Flags: disablenouninstallwarning
Name: "luv"; Description: "zai4z의 랜드마크 문화 다양성(Landmark Cultural Variation)"; Types: VPMAX Custom; Flags: disablenouninstallwarning

Name: "rp"; Description: "정찰 유닛 조정(Recon Pay)"; Types: VPMAX Custom; Flags: disablenouninstallwarning
Name: "rp\c0"; Description: "(핵심 0) 지형 비용"; Types: VPMAX Custom; Flags: disablenouninstallwarning
Name: "rp\c1"; Description: "(핵심 1) 탐험 밸런서"; Types: VPMAX Custom; Flags: disablenouninstallwarning
Name: "rp\r1"; Description: "(권장 1) 빠른 해안"; Types: VPMAX Custom; Flags: disablenouninstallwarning
Name: "rp\r2"; Description: "(권장 2) 빠른 강"; Types: VPMAX Custom; Flags: disablenouninstallwarning
Name: "rp\r3"; Description: "(권장 3) 빠른 해안의"; Types: VPMAX Custom; Flags: disablenouninstallwarning
;Name: "mt"; Description: "기타 조정(Misc Tweaks)"; Types: VPMAX Custom; Flags: disablenouninstallwarning

Name: "tibet"; Description: "Jarcast와 Hokath의 티베트"; Types: VPMAX Custom; Flags: disablenouninstallwarning
Name: "italy"; Description: "Jarcast의 이탈리아"; Types: VPMAX Custom; Flags: disablenouninstallwarning
Name: "nm"; Description: "Jarcast의 은동고-마탐바"; Types: VPMAX Custom; Flags: disablenouninstallwarning
Name: "navajo"; Description: "Jarcast의 나바호"; Types: VPMAX Custom; Flags: disablenouninstallwarning
Name: "france"; Description: "Gwennog의 프랑스"; Types: VPMAX Custom; Flags: disablenouninstallwarning
Name: "louis"; Description: "GH의 루이지애나"; Types: VPMAX Custom; Flags: disablenouninstallwarning
Name: "papa"; Description: "JFD의 교황령"; Types: VPMAX Custom; Flags: disablenouninstallwarning

[Types]
Name: "VP"; Description: "Vox Populi 한국어";
Name: "VPUI"; Description: "Vox Populi 한국어 + UI";
Name: "VPEX"; Description: "Vox Populi 한국어 + UI + 5/6 UC + 계몽";
Name: "VPMAX"; Description: "**충돌 위험** 전체 설치";
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
  S := S + '문명 5 경로' + NewLine;
  S := S + Space + CIVDirPage.Values[0] + NewLine + NewLine;

  S := S + MemoComponentsInfo
  Result := S;
end;

function GetCIVDir(Param: String): String;
begin
  { Return the selected CIVDir }
  Result := CIVDirPage.Values[0];
end;
