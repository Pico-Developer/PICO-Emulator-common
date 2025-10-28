
@echo off

REM Update vulkan binaries from SDK and Runtime

set "folderTarget=%cd%"

REM Update runtime binaries
set "folderSourceRT=%VULKAN_RT%\x64"
for %%f in ("%folderSourceRT%\*") do (
  if exist "%folderTarget%\%%~nxf" (
    copy /y "%folderSourceRT%\%%~nxf" "%folderTarget%" /b
    echo Copied file: "%folderSourceRT%\%%~nxf"
  )
)


REM Update SDK binaries
set "folderSourceSDK=%VULKAN_SDK%\Bin"
for %%f in ("%folderSourceSDK%\*") do (
  if exist "%folderTarget%\%%~nxf" (
    copy /y "%folderSourceSDK%\%%~nxf" "%folderTarget%" /b
    echo Copied file: "%folderSourceSDK%\%%~nxf"
  )
)

REM Update layer binaries
set "folderTarget=%cd%\layers"
for %%f in ("%folderSourceSDK%\VkLayer_*.dll") do (
  if exist "%folderTarget%\%%~nxf" (
    copy /y "%folderSourceSDK%\%%~nxf" "%folderTarget%" /b
    echo Copied file: "%folderSourceSDK%\%%~nxf"
  )
)
set "folderTarget=%cd%\layers"
for %%f in ("%folderSourceSDK%\VkLayer_*.json") do (
  if exist "%folderTarget%\%%~nxf" (
    copy /y "%folderSourceSDK%\%%~nxf" "%folderTarget%" /b
    echo Copied file: "%folderSourceSDK%\%%~nxf"
  )
)