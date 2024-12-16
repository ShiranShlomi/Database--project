
[General]
Version=1

[Preferences]
Username=
Password=2217
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=SSHLOMI
Name=WAITER_PHONE
Count=50

[Record]
Name=PHONE
Type=NUMBER
Size=10
Data=['05'00000000]
Master=

[Record]
Name=ID_WAITER
Type=VARCHAR2
Size=10
Data=List(select id_waiter from waiter)
Master=

