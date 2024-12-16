
[General]
Version=1

[Preferences]
Username=
Password=2719
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=SSHLOMI
Name=CUSTOMER
Count=50

[Record]
Name=LNAME
Type=VARCHAR2
Size=20
Data=LastName
Master=

[Record]
Name=FNAME
Type=VARCHAR2
Size=20
Data=FirstName
Master=

[Record]
Name=PHONE
Type=NUMBER
Size=10
Data=['05'00000000]
Master=

[Record]
Name=EMAIL
Type=VARCHAR2
Size=20
Data=Email
Master=

[Record]
Name=CLUB_MEMBER
Type=NUMBER
Size=10
Data=Sequence(Start, [Inc], [WithinParent])
Master=

[Record]
Name=ADDRESS
Type=VARCHAR2
Size=20
Data=Address1
Master=

