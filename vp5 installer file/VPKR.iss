; Inno Script Studio Wizard로 생성된 스크립트입니다.
; INNO SETUP 스크립트 파일을 만드는 방법에 대한 자세한 내용은 설명서를 참조하세요!

#define MyAppName "VP 한국어"
#define MyAppVersion "5.1.2"
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
;Source: "..\!Jarcast's City States Leaders Ultimate (v 1)\*"; DestDir: "{app}\MODS\!Jarcast's City States Leaders Ultimate (v 1)"; Flags: ignoreversion recursesubdirs;	Components: cslu
Source: "..\!Jarcast's Hidden Wonders (VP)\*"; DestDir: "{app}\MODS\!Jarcast's Hidden Wonders (VP)"; Flags: ignoreversion recursesubdirs;	Components: hw
Source: "..\!Jarcast's Hidden Wonders (VP) INT\*"; DestDir: "{app}\MODS\!Jarcast's Hidden Wonders (VP) INT"; Flags: ignoreversion recursesubdirs;	Components: hw
Source: "..\!Jarcast's Italy for VP (v 3)\*"; DestDir: "{app}\MODS\!Jarcast's Italy for VP (v 3)"; Flags: ignoreversion recursesubdirs;	Components: italy
Source: "..\!Jarcast's Ndongo-Matamba for VP (v 3)\*"; DestDir: "{app}\MODS\!Jarcast's Ndongo-Matamba for VP (v 3)"; Flags: ignoreversion recursesubdirs;	Components: nm
Source: "..\!Jarcast's The Navajo for VP (v 3)\*"; DestDir: "{app}\MODS\!Jarcast's The Navajo for VP (v 3)"; Flags: ignoreversion recursesubdirs;	Components: navajo
Source: "..\!Jarcast's Volcanoes for VP (v 8)\*"; DestDir: "{app}\MODS\!Jarcast's Volcanoes for VP (v 8)"; Flags: ignoreversion recursesubdirs;	Components: vol
Source: "..\!Jarcast's Volcanoes for VP (v 8) INT\*"; DestDir: "{app}\MODS\!Jarcast's Volcanoes for VP (v 8) INT"; Flags: ignoreversion recursesubdirs;	Components: vol
Source: "..\(j) Bare Necessities (v 15)\*"; DestDir: "{app}\MODS\(j) Bare Necessities (v 15)"; Flags: ignoreversion recursesubdirs;	Components: bn
Source: "..\(j) Bare Necessities (v 15) INT\*"; DestDir: "{app}\MODS\(j) Bare Necessities (v 15) INT"; Flags: ignoreversion recursesubdirs;	Components: bn
;Source: "..\(n) Religious Victory\*"; DestDir: "{app}\MODS\(n) Religious Victory"; Flags: ignoreversion recursesubdirs;	Components: rv
;Source: "..\(n) Semper Fidelis\*"; DestDir: "{app}\MODS\(n) Semper Fidelis"; Flags: ignoreversion recursesubdirs;	Components: sf
;Source: "..\(n) Subterfuge\*"; DestDir: "{app}\MODS\(n) Subterfuge"; Flags: ignoreversion recursesubdirs;	Components: stfg
Source: "..\(overhaul) Enlightenment Era for VP\*"; DestDir: "{app}\MODS\(overhaul) Enlightenment Era for VP"; Flags: ignoreversion recursesubdirs;	Components: ee
Source: "..\(overhaul) Enlightenment Era for VP INT\*"; DestDir: "{app}\MODS\(overhaul) Enlightenment Era for VP INT"; Flags: ignoreversion recursesubdirs;	Components: ee
Source: "..\(overhaul) Even More Resources for Vox Populi (v 15)\*"; DestDir: "{app}\MODS\(overhaul) Even More Resources for Vox Populi (v 15)"; Flags: ignoreversion recursesubdirs;	Components: emr\n
Source: "..\(overhaul) Even More Resources for Vox Populi (v 15) INT\*"; DestDir: "{app}\MODS\(overhaul) Even More Resources for Vox Populi (v 15) INT"; Flags: ignoreversion recursesubdirs;	Components: emr\n
;Source: "..\(overhaul) More Wonders for VP\*"; DestDir: "{app}\MODS\(overhaul) More Wonders for VP"; Flags: ignoreversion recursesubdirs;	Components: mw
;Source: "..\(overhaul) Unique City States for VP\*"; DestDir: "{app}\MODS\(overhaul) Unique City States for VP"; Flags: ignoreversion recursesubdirs;	Components: ucs
Source: "..\(Primary) - Gwennog's France - Philippe Auguste for VP (v.9)\*"; DestDir: "{app}\MODS\(Primary) - Gwennog's France - Philippe Auguste for VP (v.9)"; Flags: ignoreversion recursesubdirs;	Components: france
;Source: "..\(text) Promotion Overhaul for VP\*"; DestDir: "{app}\MODS\(text) Promotion Overhaul for VP"; Flags: ignoreversion recursesubdirs;	Components: po
;Source: "..\(ui) City-States Leaders for VP\*"; DestDir: "{app}\MODS\(ui) City-States Leaders for VP"; Flags: ignoreversion recursesubdirs;	Components: csl
Source: "..\(ui) Trade Opportunities for VP\*"; DestDir: "{app}\MODS\(ui) Trade Opportunities for VP"; Flags: ignoreversion recursesubdirs;	Components: to
Source: "..\(ui) Trade Opportunities for VP INT\*"; DestDir: "{app}\MODS\(ui) Trade Opportunities for VP INT"; Flags: ignoreversion recursesubdirs;	Components: to
Source: "..\(ui) Wonder Planner For VP KR\*"; DestDir: "{app}\MODS\(ui) Wonder Planner For VP KR"; Flags: ignoreversion recursesubdirs;	Components: wp
Source: "..\(Unity) - GH's Louisiana - Joseph Beausoleil Broussard for VP (v.13)\*"; DestDir: "{app}\MODS\(Unity) - GH's Louisiana - Joseph Beausoleil Broussard for VP (v.13)"; Flags: ignoreversion recursesubdirs;	Components: louis
Source: "..\Even More Resources for Vox Populi UCS (v 15)\*"; DestDir: "{app}\MODS\Even More Resources for Vox Populi UCS (v 15)"; Flags: ignoreversion recursesubdirs;	Components: emr\u
Source: "..\Even More Resources for Vox Populi UCS INT\*"; DestDir: "{app}\MODS\Even More Resources for Vox Populi UCS INT"; Flags: ignoreversion recursesubdirs;	Components: emr\u
;Source: "..\Hokaths Proposals\*"; DestDir: "{app}\MODS\Hokaths Proposals"; Flags: ignoreversion recursesubdirs;	Components: hp
Source: "..\InGame Editor+ (v 47)\*"; DestDir: "{app}\MODS\InGame Editor+ (v 47)"; Flags: ignoreversion recursesubdirs;	Components: ige
Source: "..\JFD's Civilizations - Papal States for VP (v 11)\*"; DestDir: "{app}\MODS\JFD's Civilizations - Papal States for VP (v 11)"; Flags: ignoreversion recursesubdirs;	Components: papa
Source: "..\Maritime Battles+ (v 50)\*"; DestDir: "{app}\MODS\Maritime Battles+ (v 50)"; Flags: ignoreversion recursesubdirs;	Components: mb\n
Source: "..\Maritime Weather+ (v 51)\*"; DestDir: "{app}\MODS\Maritime Weather+ (v 51)"; Flags: ignoreversion recursesubdirs;	Components: mb\w
Source: "..\Maritime Weather+ (v 51) INT\*"; DestDir: "{app}\MODS\Maritime Weather+ (v 51) INT"; Flags: ignoreversion recursesubdirs;	Components: mb\w
;Source: "..\Misc Tweaks for VP (v 5.1)\*"; DestDir: "{app}\MODS\Misc Tweaks for VP (v 5.1)"; Flags: ignoreversion recursesubdirs;	Components: mt
;Source: "..\Misc Tweaks for VP (v 5.1) INT\*"; DestDir: "{app}\MODS\Misc Tweaks for VP (v 5.1) INT"; Flags: ignoreversion recursesubdirs;	Components: mt
Source: "..\Recon Pay (Core0) Terrain Cost (v 8)\*"; DestDir: "{app}\MODS\Recon Pay (Core0) Terrain Cost (v 8)"; Flags: ignoreversion recursesubdirs;	Components: rp\c0
Source: "..\Recon Pay (Core1) Exploration Balancer (v 4)\*"; DestDir: "{app}\MODS\Recon Pay (Core1) Exploration Balancer (v 4)"; Flags: ignoreversion recursesubdirs;	Components: rp\c1
Source: "..\Recon Pay (Core1) Exploration Balancer (v 4) INT\*"; DestDir: "{app}\MODS\Recon Pay (Core1) Exploration Balancer (v 4) INT"; Flags: ignoreversion recursesubdirs;	Components: rp\c1
Source: "..\Recon Pay (Recommended1) Fast Coast (v 4)\*"; DestDir: "{app}\MODS\Recon Pay (Recommended1) Fast Coast (v 4)"; Flags: ignoreversion recursesubdirs;	Components: rp\r1
Source: "..\Recon Pay (Recommended1) Fast Coast (v 4) INT\*"; DestDir: "{app}\MODS\Recon Pay (Recommended1) Fast Coast (v 4) INT"; Flags: ignoreversion recursesubdirs;	Components: rp\r1
Source: "..\Recon Pay (Recommended2) Fast Rivers (v 7)\*"; DestDir: "{app}\MODS\Recon Pay (Recommended2) Fast Rivers (v 7)"; Flags: ignoreversion recursesubdirs;	Components: rp\r2
Source: "..\Recon Pay (Recommended2) Fast Rivers (v 7) INT\*"; DestDir: "{app}\MODS\Recon Pay (Recommended2) Fast Rivers (v 7) INT"; Flags: ignoreversion recursesubdirs;	Components: rp\r2
Source: "..\Recon Pay (Recommended3) Fast Coastal (v 8)\*"; DestDir: "{app}\MODS\Recon Pay (Recommended3) Fast Coastal (v 8)"; Flags: ignoreversion recursesubdirs;	Components: rp\r3
Source: "..\Recon Pay (Recommended3) Fast Coastal (v 8) INT\*"; DestDir: "{app}\MODS\Recon Pay (Recommended3) Fast Coastal (v 8) INT"; Flags: ignoreversion recursesubdirs;	Components: rp\r3
Source: "..\UI - Horizontal Leaders' Portraits for VP (v 3)\*"; DestDir: "{app}\MODS\UI - Horizontal Leaders' Portraits for VP (v 3)"; Flags: ignoreversion recursesubdirs;	Components: hlp
Source: "..\UI - Improved City View (Vox Populi EUI)\*"; DestDir: "{app}\MODS\UI - Improved City View (Vox Populi EUI)"; Flags: ignoreversion recursesubdirs;	Components: icv
Source: "..\UI - Improved City View (Vox Populi EUI) INT\*"; DestDir: "{app}\MODS\UI - Improved City View (Vox Populi EUI) INT"; Flags: ignoreversion recursesubdirs;	Components: icv
Source: "..\zai4z's Landmark Cultural Variation (v 1)\*"; DestDir: "{app}\MODS\zai4z's Landmark Cultural Variation (v 1)"; Flags: ignoreversion recursesubdirs;	Components: luv

Source: "..\Assets\*"; DestDir: "{code:GetCIVDir}\Assets"; Flags: ignoreversion recursesubdirs; Components: vp
Source: "..\Assets_votes\*"; DestDir: "{code:GetCIVDir}\Assets"; Flags: ignoreversion recursesubdirs; Components: vpnvc
Source: "..\Maps\*"; DestDir: "{code:GetCIVDir}\Assets\Maps"; Flags: ignoreversion recursesubdirs; Components: map
Source: "..\Textures\Artful Textures\*"; DestDir: "{code:GetCIVDir}\Assets\DLC\Artful Textures"; Flags: ignoreversion recursesubdirs; Components: textures\at
Source: "..\Textures\VT\*"; DestDir: "{code:GetCIVDir}\Assets\DLC\VT"; Flags: ignoreversion recursesubdirs; Components: textures\vt
Source: "..\UI\CivSelection\DLC\*"; DestDir: "{code:GetCIVDir}\Assets\DLC"; Flags: ignoreversion recursesubdirs; Components: civselect\cs
Source: "..\UI\CivSelection\UI\*"; DestDir: "{code:GetCIVDir}\Assets\UI"; Flags: ignoreversion recursesubdirs; Components: civselect\cs
Source: "..\UI\CivSelection\Backup\*"; DestDir: "{code:GetCIVDir}\Assets"; Flags: ignoreversion recursesubdirs; Components: civselect\csbu
Source: "..\UI\UI_SukMainMenu\*"; DestDir: "{code:GetCIVDir}\Assets\DLC\UI_SukMainMenu"; Flags: ignoreversion recursesubdirs; Components: smm
Source: "..\UI\UI_CustomModScreen\*"; DestDir: "{code:GetCIVDir}\Assets\DLC\UI_CustomModScreen"; Flags: ignoreversion recursesubdirs; Components: cms
Source: "..\VPUI Text\VPUI_tips_ko_kr.xml"; DestDir: "{app}\Text"; Flags: ignoreversion recursesubdirs; Components: vp
; 참고: 공유 시스템 파일에서 "Flags: ignoreversion"을 사용하지 마십시오.

[Components]
Name: "vp"; Description: "Vox Populi 한국어 번역"; Types: VP VPUI VPEX VPMAX Custom; Flags: disablenouninstallwarning fixed
Name: "map"; Description: "추가 지도: 문명 5 지도 폴더에 복사"; Types: VPMAX Custom; Flags: disablenouninstallwarning
Name: "vpnvc"; Description: "세계 의회 투표 문명 색상 제거"; Types: VPMAX Custom; Flags: disablenouninstallwarning

Name: "textures"; Description: "지도 텍스처"; Types: Custom; Flags: disablenouninstallwarning
Name: "textures\vt"; Description: "선명한 질감"; Types: VPMAX Custom; Flags: exclusive disablenouninstallwarning
Name: "textures\at"; Description: "예술적인 질감"; Types: Custom; Flags: exclusive disablenouninstallwarning
Name: "civselect"; Description: "지도자 선택 화면"; Types: Custom; Flags: disablenouninstallwarning
Name: "civselect\cs"; Description: "진정한 대체 지도자"; Types: VPMAX Custom; Flags: exclusive disablenouninstallwarning
Name: "civselect\csbu"; Description: "진정한 대체 지도자 제거 (문명 선택 기본 화면)"; Types: Custom; Flags: exclusive disablenouninstallwarning
Name: "smm"; Description: "새로운 메인 메뉴"; Types: VPMAX Custom; Flags: disablenouninstallwarning
Name: "cms"; Description: "사용자 정의 모드 메뉴"; Types: VPMAX Custom; Flags: disablenouninstallwarning

Name: "vppt"; Description: "VP 승급 트리 (Promotion Tree)"; Types: VPUI VPEX VPMAX Custom; Flags: disablenouninstallwarning
Name: "icv"; Description: "VP 개선된 도시 화면 UI (Improved City View)"; Types: VPUI VPEX VPMAX Custom; Flags: disablenouninstallwarning
Name: "ige"; Description: "인게임 에디터(InGame Editor+)"; Types: VPUI VPEX VPMAX Custom; Flags: disablenouninstallwarning
Name: "to"; Description: "교역 기회(Trade Opportunities)"; Types: VPUI VPEX VPMAX Custom; Flags: disablenouninstallwarning
Name: "wp"; Description: "불가사의 계획서(Wonder Planner)"; Types: VPUI VPEX VPMAX Custom; Flags: disablenouninstallwarning
Name: "hlp"; Description: "수평 지도자 초상화(Horizontal Leaders' Portraits)"; Types: VPUI VPEX VPMAX Custom; Flags: disablenouninstallwarning

Name: "uc"; Description: "문화 요소(5/6 UC)"; Types: VPEX VPMAX Custom; Flags: disablenouninstallwarning
Name: "ee"; Description: "계몽 시대(Enlightenment Era)"; Types: VPEX VPMAX Custom; Flags: disablenouninstallwarning

Name: "bn"; Description: "필수 품목(Bare Necessities)"; Types: VPMAX Custom; Flags: disablenouninstallwarning
Name: "Aloe"; Description: "Horem의 알로에 베라 보너스 자원(Aloe Vera Bonus Resource)"; Types: VPMAX Custom; Flags: disablenouninstallwarning
Name: "al"; Description: "Jarcast와 Hokath의 추가 사치(Additional Luxuries)"; Types: VPMAX Custom; Flags: disablenouninstallwarning
Name: "emr"; Description: "더 많은 자원(Even More Resources)"; Types: VPMAX Custom; Flags: disablenouninstallwarning
Name: "emr\n"; Description: "일반 VP용"; Types: VPMAX Custom; Flags: exclusive disablenouninstallwarning
Name: "emr\u"; Description: "UCS(고유 도시 국가)용"; Types: Custom; Flags: exclusive disablenouninstallwarning
Name: "cm"; Description: "Jarcast의 대리석의 도시(Cities of Marble)"; Types: VPMAX Custom; Flags: disablenouninstallwarning
Name: "hw"; Description: "Jarcast의 숨겨진 불가사의(Hidden Wonders)"; Types: VPMAX Custom; Flags: disablenouninstallwarning
Name: "vol"; Description: "Jarcast의 화산(Volcanoes)"; Types: VPMAX Custom; Flags: disablenouninstallwarning
Name: "mb"; Description: "해상 전투(Maritime Battles+)"; Types: VPMAX Custom; Flags: disablenouninstallwarning
Name: "mb\n"; Description: "전체 설치"; Types: VPMAX Custom; Flags: exclusive disablenouninstallwarning
Name: "mb\w"; Description: "날씨(Maritime Weather+)만 설치"; Types: Custom; Flags: exclusive disablenouninstallwarning
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
Name: "VPEX"; Description: "Vox Populi 한국어 + UI + 56UC + 계몽";
Name: "VPMAX"; Description: "**충돌 위험** 전체 설치";
Name: "Custom"; Description: "사용자 정의 설치"; Flags: iscustom

[InstallDelete]
Type: filesandordirs; Name: "{code:GetCIVDir}\Assets\DLC\MP_MODSPACK"
Type: filesandordirs; Name: "{code:GetCIVDir}\Assets\DLC\Artful Textures"
Type: filesandordirs; Name: "{code:GetCIVDir}\Assets\DLC\VT"
Type: filesandordirs; Name: "{code:GetCIVDir}\Assets\DLC\UI_SukMainMenu"
Type: filesandordirs; Name: "{code:GetCIVDir}\Assets\DLC\UI_SukMainMenu_KR"
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
  S := S + 'Civilization V path' + NewLine;
  S := S + Space + CIVDirPage.Values[0] + NewLine + NewLine;

  S := S + MemoComponentsInfo
  Result := S;
end;

function GetCIVDir(Param: String): String;
begin
  { Return the selected CIVDir }
  Result := CIVDirPage.Values[0];
end;
