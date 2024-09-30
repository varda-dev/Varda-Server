@echo off
cls

set forge_ver=1.20.1-47.3.10
set varda_dir=%userprofile%\curseforge\minecraft\Instances\Varda
set varda_srv=%cd%\varda-server
set zip_file=%cd%\varda-server.zip

::echo Varda project files located in %varda_dir%

if exist %varda_srv% rd /s /q %varda_srv%
md %varda_srv%
xcopy /s %varda_dir% %varda_srv%

del %varda_srv%\usernamecache.json
del %varda_srv%\usercache.json
del %varda_srv%\servers.dat
del %varda_srv%\rhino.local.properties
del %varda_srv%\patchouli_data.json
del %varda_srv%\options.txt
del %varda_srv%\minecraftinstance.json
rd /s /q %varda_srv%\shaderpacks
rd /s /q %varda_srv%\saves
rd /s /q %varda_srv%\profileimage
rd /s /q %varda_srv%\modernfix
rd /s /q %varda_srv%\logs
rd /s /q %varda_srv%\local
rd /s /q %varda_srv%\fancymenu_data
del "%varda_srv%\resourcepacks\Quark Programmer Art.zip"
rd /s /q %varda_srv%\kubejs\assets
rd /s /q %varda_srv%\kubejs\config
rd /s /q %varda_srv%\kubejs\data
rd /s /q %varda_srv%\kubejs\client_scripts

del %varda_srv%\mods\aether_emissivity-*.jar
del %varda_srv%\mods\BetterAdvancements-*.jar
del %varda_srv%\mods\BetterF3-*.jar
del %varda_srv%\mods\clean_tooltips-*.jar
del %varda_srv%\mods\cleanview-*.jar
del %varda_srv%\mods\Controlling-forge-*.jar
del %varda_srv%\mods\craftingtweaks-*.jar
del %varda_srv%\mods\Ding-*.jar
del %varda_srv%\mods\durabilitytooltip-*.jar
del %varda_srv%\mods\embeddium-*.jar
del %varda_srv%\mods\EnchantmentDescriptions-*.jar
del %varda_srv%\mods\entityculling-*.jar
del %varda_srv%\mods\Fallingleaves-*.jar
del %varda_srv%\mods\fancymenu_*.jar
del %varda_srv%\mods\fast-ip-ping-*.jar
del %varda_srv%\mods\findme-*.jar
del %varda_srv%\mods\inventoryessentials-*.jar
del %varda_srv%\mods\Jade-*.jar
del %varda_srv%\mods\JadeAddons-*.jar
::del %varda_srv%
del %varda_srv%\mods\lucent-*.jar
::del %varda_srv%
del %varda_srv%\mods\melody_*.jar
del %varda_srv%\mods\moreoverlays-*.jar
del %varda_srv%\mods\MouseTweaks-*.jar
del %varda_srv%\mods\NekosEnchantedBooks-*.jar
del %varda_srv%\mods\oculus-*.jar
del %varda_srv%\mods\Searchables-*.jar
::del %varda_srv%
del %varda_srv%\mods\TipTheScales-*.jar
del %varda_srv%\mods\ToastControl-*.jar
del %varda_srv%\mods\TravelersTitles-*.jar
del %varda_srv%\mods\zmedievalmusic-*.jar

curl -o %varda_srv%\forge-%forge_ver%-installer.jar https://maven.minecraftforge.net/net/minecraftforge/forge/%forge_ver%/forge-%forge_ver%-installer.jar

if exist %zip_file% del %zip_file%
::tar -cvzf %zip_file% --format ustar %varda_dir%\*
jar -cMfv %zip_file% -C %varda_srv% .

pause