
[General]
Version=1

[Preferences]
Username=
Password=2207
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=SSHLOMI
Name=CHEF
Count=30

[Record]
Name=IDCHEF
Type=NUMBER
Size=
Data=Sequence(Start, [Inc], [WithinParent])
Master=

[Record]
Name=NAMECHEF
Type=VARCHAR2
Size=10
Data=FirstName
Master=

[Record]
Name=TELCHEF
Type=NUMBER
Size=
Data=['05'00000000]
Master=

[Record]
Name=CITYCHEF
Type=VARCHAR2
Size=10
Data=City
Master=

[Record]
Name=STREETCHEF
Type=VARCHAR2
Size=10
Data=List('ETROG', 'BEN DURYON','ASHCHAR','NATHN','SHAPIRA','BEGIN','AFUNA','HOLZBERG')
Master=

[Record]
Name=NUMHOMECHEF
Type=NUMBER
Size=
Data=Random(1, 120)
Master=

[Record]
Name=SALARYCHEF
Type=NUMBER
Size=
Data=Random(5000, 9500)
Master=

