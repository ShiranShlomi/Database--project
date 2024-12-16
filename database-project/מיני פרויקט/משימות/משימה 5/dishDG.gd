
[General]
Version=1

[Preferences]
Username=
Password=2904
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=SSHLOMI
Name=DISH
Count=50

[Record]
Name=ID_DISH
Type=VARCHAR2
Size=10
Data=Sequence(Start, [Inc], [WithinParent])
Master=

[Record]
Name=PRICE
Type=NUMBER
Size=10
Data=Random(10, 80)
Master=

[Record]
Name=NAME
Type=VARCHAR2
Size=20
Data=[aaaa]
Master=

[Record]
Name=TYPE_DISH
Type=VARCHAR2
Size=20
Data=List('first dish', 'main dish', 'last dish')
Master=

