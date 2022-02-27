<#rem RoboCopy source Dest /MIR /Z /XJ /MT#>

SET LOG=C:TempROBOCOPY.LOG

SET FILE=*.*

SET SOURCE=D:\tmp\D1

SET DESTINATION=D:\tmp\D2


<#REM ------------------   @Backup Laptop_PC   ------------------#>

SET SRC=%SOURCE%*.*

SET DEST=%DESTINATION%*.*

robocopy  "%SRC%" "%DEST%" "%FILE%" /MIR /Z /XJ  /MT
<#
<#REM ------------------   Logiciels   ------------------#

SET SRC=%SOURCE%*

SET DEST=%DESTINATION%*

robocopy  "%SRC%" "%DEST%" "%FILE%" /MIR /Z /XJ /MT

<#REM ------------------   Mes Documents   ------------------#

SET SRC=%SOURCE%Mes Documents

SET DEST=%DESTINATION%Mes Documents

robocopy  "%SRC%" "%DEST%" "%FILE%" /MIR /Z /E /XJ /MT
#>