
[General]
Version=1

[Preferences]
Username=
Password=2795
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=SSHLOMI
Name=SALE
Count=30

[Record]
Name=IDSALE
Type=NUMBER
Size=
Data=Sequence(Start, [Inc], [WithinParent])
Master=

[Record]
Name=DISCOUNT
Type=NUMBER
Size=
Data=Random(10, 30)
Master=

[Record]
Name=DATESTARTSALE
Type=DATE
Size=
Data=Random(01-01-2010, 01-01-2017)
Master=

[Record]
Name=DATEENDSALE
Type=DATE
Size=
Data=Random(01-01-2017, 01-01-2020)
Master=

