  MEMBER('ConverteToHexadecimal.clw')

  PRAGMA('define(init_priority=>3)')

  MAP
    MODULE('CONVEBC0.CLW')
CONVEBC0:DctInit             PROCEDURE
CONVEBC0:DctKill             PROCEDURE
CONVEBC0:FilesInit           PROCEDURE
    END
  END

DctInit PROCEDURE
  CODE
  CONVEBC0:DctInit
  CONVEBC0:FilesInit


DctKill PROCEDURE
  CODE
  CONVEBC0:DctKill

