[Default]

  RoutingGrid     = 2mil

  ; Trace Parameters:

  tpViaShape      = Round

  ; Preferred Directions:

  PrefDir.1       = *
  PrefDir.2       = 0
  PrefDir.3       = 0
  PrefDir.4       = 0
  PrefDir.5       = 0
  PrefDir.6       = 0
  PrefDir.7       = 0
  PrefDir.8       = 0
  PrefDir.9       = 0
  PrefDir.10      = 0
  PrefDir.11      = 0
  PrefDir.12      = 0
  PrefDir.13      = 0
  PrefDir.14      = 0
  PrefDir.15      = 0
  PrefDir.16      = *

  Active          =    1
  ; Cost Factors:

  cfVia           =   50
  cfNonPref       =    5
  cfChangeDir     =    2
  cfOrthStep      =    2
  cfDiagStep      =    3
  cfExtdStep      =    0
  cfBonusStep     =    1
  cfMalusStep     =    1
  cfPadImpact     =    4
  cfSmdImpact     =    4
  cfBusImpact     =    0
  cfHugging       =    3
  cfAvoid         =    4
  cfPolygon       =   10

  cfBase.1        =    0
  cfBase.2        =    1
  cfBase.3        =    1
  cfBase.4        =    1
  cfBase.5        =    1
  cfBase.6        =    1
  cfBase.7        =    1
  cfBase.8        =    1
  cfBase.9        =    1
  cfBase.10       =    1
  cfBase.11       =    1
  cfBase.12       =    1
  cfBase.13       =    1
  cfBase.14       =    1
  cfBase.15       =    1
  cfBase.16       =    5

  ; Maximum Number of...:

  mnVias          =   20
  mnSegments      = 9999
  mnExtdSteps     = 9999
  mnRipupLevel    =   50
  mnRipupSteps    =  300
  mnRipupTotal    =  500

[Follow-me]

  @Route

  Active          =    1
  cfVia           =    8
  cfBase.16       =    0
  mnRipupLevel    =   10
  mnRipupSteps    =  100
  mnRipupTotal    =  100

[Busses]

  @Route

  Active          =    1
  cfVia           =   10
  cfChangeDir     =    5
  cfBusImpact     =    4
  cfPolygon       =   25
  cfBase.16       =   10
  mnVias          =    0
  mnRipupLevel    =   10
  mnRipupSteps    =  100
  mnRipupTotal    =  100

[Route]

  @Default

  Active          =    1

[Optimize1]

  @Route

  Active          =    1
  cfVia           =   99
  cfNonPref       =    4
  cfChangeDir     =    4
  cfExtdStep      =    1
  cfHugging       =    1
  cfPolygon       =   30
  cfBase.16       =   10
  mnExtdSteps     =   20
  mnRipupLevel    =    0
  mnRipupSteps    =  100
  mnRipupTotal    =  100

[Optimize2]

  @Optimize1

  Active          =    1
  cfNonPref       =    3
  cfChangeDir     =    3
  cfBonusStep     =    2
  cfMalusStep     =    2
  cfPadImpact     =    2
  cfSmdImpact     =    2
  cfHugging       =    0
  cfPolygon       =   40
  mnExtdSteps     =   15

[Optimize3]

  @Optimize2

  Active          =    1
  cfVia           =   80
  cfNonPref       =    2
  cfChangeDir     =    2
  cfPadImpact     =    0
  cfSmdImpact     =    0
  cfPolygon       =   50
  mnExtdSteps     =   10

[Optimize4]

  @Optimize3

  Active          =    1
  cfVia           =   60
  cfNonPref       =    1
  cfPolygon       =   60
  cfBase.16       =   12

[Optimize5]

  @Optimize4

  Active          =    1
  cfVia           =   40
  cfNonPref       =    0
  cfPolygon       =   70
  cfBase.16       =   14
  mnExtdSteps     =    5

[Optimize6]

  @Optimize5

  Active          =    1
  cfVia           =   20
  cfBase.16       =   16

[Optimize7]

  @Optimize6

  Active          =    1
  cfBase.16       =   18

[Optimize8]

  @Optimize7

  Active          =    1
  cfBase.16       =   20
