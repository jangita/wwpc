[Files]
Source: "bin\Release\wwpc.exe"; DestDir: "{app}"; Flags: ignoreversion

[Setup]
PrivilegesRequired=lowest
AppName=Windows Wallpaper Changer
AppVersion=2020.09.10
AppCopyright=(c) Chris Ochieng
AppId={{0163E423-0C13-47D3-B107-22E4BA306367}
LicenseFile=C:\Users\jangi\src\wwpc\LICENSE
AllowCancelDuringInstall=False
ShowLanguageDialog=no
UsePreviousGroup=False
DisableProgramGroupPage=yes
AppPublisher=Chris Ochieng
AppContact=jangita.nyagudi@gmail.com
CloseApplications=False
SolidCompression=True
InternalCompressLevel=ultra64
DefaultDirName={userappdata}\wwpc
AppendDefaultGroupName=False
UninstallLogMode=overwrite
UninstallDisplayIcon={uninstallexe}
DisableReadyPage=True
DisableFinishedPage=True
RestartIfNeededByRun=False
UsePreviousAppDir=False
DisableDirPage=yes
RestartApplications=False
DisableReadyMemo=True
AllowUNCPath=False
AppendDefaultDirName=False
TerminalServicesAware=False
OutputBaseFilename=wwpc-setup-2020-09-10

[Run]
Filename: "{app}\wwpc.exe"; WorkingDir: "{app}"
Filename: "schtasks"; Parameters: "/Create /F /SC HOURLY /TN ""Windows Wallpaper Changer"" /TR ""{app}\wwpc.exe"""; Flags: runhidden
Filename: "schtasks"; Parameters: "/Create /F /SC ONLOGON /TN ""Windows Wallpaper Changer Logon"" /TR ""{app}\wwpc.exe"""; Flags: runhidden

[UninstallRun]
Filename: "schtasks"; Parameters: "/Delete /F /TN ""Windows Wallpaper Changer"""; Flags: runhidden
Filename: "schtasks"; Parameters: "/Delete /F /TN ""Windows Wallpaper Changer Logon"""; Flags: runhidden
