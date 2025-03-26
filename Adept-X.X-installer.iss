
#define MyAppName "Adept"
#define MyAppVersion "X.X"
#define MyAppPublisher "Isaac Shelton"
#define MyAppURL "https://github.com/AdeptLanguage/Adept"
#define MyAppExeName "adept.exe"
#define MyFullAppName "Adept X.X"

[Setup]
AppId={{7D143E16-9268-4F20-A0FA-8B30D8B14ECA}}
AppName={#MyFullAppName}
AppVersion={#MyAppVersion}
AppVerName={#MyFullAppName}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
DefaultDirName=C:\Adept\X.X
DefaultGroupName={#MyFullAppName}
AllowNoIcons=yes
LicenseFile=__STAGING_AREA__\LICENSE
OutputDir=__OUTPUT_DIRECTORY__
OutputBaseFilename=Adept-X.X-installer
SetupIconFile=__FAVICON_DIRECTORY__\favicon.ico
Compression=lzma
SolidCompression=yes
WizardStyle=modern
ChangesEnvironment=yes

[Code]

function NeedsAddPath(Param: string): boolean;
var
  OrigPath: string;
begin
  if not RegQueryStringValue(HKEY_LOCAL_MACHINE,
    'SYSTEM\CurrentControlSet\Control\Session Manager\Environment',
    'Path', OrigPath)
  then begin
    Result := True;
    exit;
  end;
  // Look for the path with leading and trailing semicolon
  // Pos() returns 0 if not found
  Result := Pos(';' + Param + ';', ';' + OrigPath + ';') = 0;
end;

[Registry]
Root: HKLM; Subkey: "SYSTEM\CurrentControlSet\Control\Session Manager\Environment"; \
    ValueType: expandsz; ValueName: "Path"; ValueData: "{olddata};{app}"; \
    Check: NeedsAddPath('{app}')

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Files]
Source: "__STAGING_AREA__\adept.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "__STAGING_AREA__\adeptX-X.bat"; DestDir: "{app}"; Flags: ignoreversion
Source: "__STAGING_AREA__\adept.config"; DestDir: "{app}"; Flags: ignoreversion
Source: "__STAGING_AREA__\crt2.o"; DestDir: "{app}"; Flags: ignoreversion
Source: "__STAGING_AREA__\crtbegin.o"; DestDir: "{app}"; Flags: ignoreversion
Source: "__STAGING_AREA__\curl-ca-bundle.crt"; DestDir: "{app}"; Flags: ignoreversion
Source: "__STAGING_AREA__\libdep.a"; DestDir: "{app}"; Flags: ignoreversion
Source: "__STAGING_AREA__\libgcc_s_seh-1.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "__STAGING_AREA__\libstdc++-6.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "__STAGING_AREA__\libwinpthread-1.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "__STAGING_AREA__\libcurl-4.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "__STAGING_AREA__\libzstd.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "__STAGING_AREA__\libmsvcrt.a"; DestDir: "{app}"; Flags: ignoreversion

; MSYS2 Shenanigans
Source: "__STAGING_AREA__\libbrotlicommon.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "__STAGING_AREA__\libbrotlidec.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "__STAGING_AREA__\libcrypto-3-x64.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "__STAGING_AREA__\libiconv-2.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "__STAGING_AREA__\libidn2-0.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "__STAGING_AREA__\libintl-8.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "__STAGING_AREA__\libnghttp2-14.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "__STAGING_AREA__\libnghttp3-9.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "__STAGING_AREA__\libpsl-5.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "__STAGING_AREA__\libssh2-1.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "__STAGING_AREA__\libssl-3-x64.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "__STAGING_AREA__\libunistring-5.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "__STAGING_AREA__\zlib1.dll"; DestDir: "{app}"; Flags: ignoreversion

Source: "__STAGING_AREA__\bin\*"; DestDir: "{app}\bin"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "__STAGING_AREA__\libexec\*"; DestDir: "{app}\libexec"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "__STAGING_AREA__\include\*"; DestDir: "{app}\include"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "__STAGING_AREA__\import\*"; DestDir: "{app}\import"; Flags: ignoreversion recursesubdirs createallsubdirs
; NOTE: Don't use "Flags: ignoreversion" on any shared system files

[Icons]
Name: "{group}\{#MyFullAppName}"; Filename: "{app}\{#MyAppExeName}"
