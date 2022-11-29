§
ÇC:\Users\Radu\Desktop\Back-upRadu\4thYear\CerganRaduMihai_DevEfficient\DevEfficient_ServerSide\Domain\Core\IDatabaseTransaction.cs
	namespace 	
Domain
 
. 
Core 
{ 
public 

	interface  
IDatabaseTransaction )
:* +
IDisposable, 7
{ 
void		 
Commit		 
(		 
)		 
;		 
void

 
Rollback

 
(

 
)

 
;

 
} 
} ã
}C:\Users\Radu\Desktop\Back-upRadu\4thYear\CerganRaduMihai_DevEfficient\DevEfficient_ServerSide\Domain\Core\IItemRepository.cs
	namespace 	
Domain
 
. 
Core 
{		 
public

 

	interface

 
IItemRepository

 $
:

$ %
IRepository

& 1
<

1 2
Item

2 6
>

6 7
{ 
public 
Task 
< 
IEnumerable 
<  
RetrievedItemDto  0
>0 1
>1 2
GetFullItems3 ?
(? @
GetItemsBodyModel@ Q
getItemsBodyModelR c
)c d
;d e
public 
Task 
< 
ItemDetailsDto "
>" #
GetFullItem$ /
(/ 0
Guid0 4
itemId5 ;
); <
;< =
} 
} Ç
ÅC:\Users\Radu\Desktop\Back-upRadu\4thYear\CerganRaduMihai_DevEfficient\DevEfficient_ServerSide\Domain\Core\IItemTypeRepository.cs
	namespace 	
Domain
 
. 
Core 
{ 
public		 

	interface		 
IItemTypeRepository		 (
:		( )
IRepository		* 5
<		5 6
ItemType		6 >
>		> ?
{

 
public 
Task 
< 
ItemType 
> 
GetItemTypeByName /
(/ 0
string0 6
itemTypeName7 C
)C D
;D E
} 
} Ô

yC:\Users\Radu\Desktop\Back-upRadu\4thYear\CerganRaduMihai_DevEfficient\DevEfficient_ServerSide\Domain\Core\IRepository.cs
	namespace 	
Domain
 
. 
Core 
{ 
public 

	interface 
IRepository  
<  !
T! "
>" #
where$ )
T* +
:+ ,
class- 2
{		 
public

 
Task

 
<

 
IEnumerable

 
<

  
T

  !
>

! "
>

" #
GetAll

$ *
(

* +
)

+ ,
;

, -
public 
Task 
< 
T 
> 
GetById 
( 
Guid #
id$ &
)& '
;' (
public 
Task 
< 
int 
> 
Register !
(! "
T" #
dataToRegister$ 2
)2 3
;3 4
public 
Task 
< 
int 
> 
Update 
(  
T  !
dataToUpdate" .
). /
;/ 0
public 
Task 
< 
int 
> 
Delete 
(  
T  !
entity" (
)( )
;) *
} 
} ∏
C:\Users\Radu\Desktop\Back-upRadu\4thYear\CerganRaduMihai_DevEfficient\DevEfficient_ServerSide\Domain\Core\ISprintRepository.cs
	namespace 	
Domain
 
. 
Core 
{		 
public

 

	interface

 
ISprintRepository

 &
:

& '
IRepository

( 3
<

3 4
Sprint

4 :
>

: ;
{ 
public 
Task 
< "
RetrievedCurrentSprint *
>* +%
GetCurrentActivatedSprint, E
(E F
)F G
;G H
public 
Task 
< 
Sprint 
> 
GetCurrentSprint ,
(, -
)- .
;. /
public 
List 
< 
RetrievedItemDto $
>$ %!
GetCurrentSprintItems& ;
(; <
)< =
;= >
} 
} Ô
~C:\Users\Radu\Desktop\Back-upRadu\4thYear\CerganRaduMihai_DevEfficient\DevEfficient_ServerSide\Domain\Core\IStateRepository.cs
	namespace 	
Domain
 
. 
Core 
{ 
public		 

	interface		 
IStateRepository		 %
:		% &
IRepository		' 2
<		2 3
State		3 8
>		8 9
{

 
public 
Task 
< 
State 
> 
GetStateByName )
() *
string* 0
	stateName1 :
): ;
;; <
} 
} …
ÉC:\Users\Radu\Desktop\Back-upRadu\4thYear\CerganRaduMihai_DevEfficient\DevEfficient_ServerSide\Domain\Core\ITeamMemberRepository.cs
	namespace 	
Domain
 
. 
Core 
{		 
public

 

	interface

 !
ITeamMemberRepository

 *
:

* +
IRepository

, 7
<

7 8

TeamMember

8 B
>

B C
{ 
Task 
< 
IEnumerable 
< "
RetrievedTeamMemberDto /
>/ 0
>0 1
GetFullTeamMember2 C
(C D
)D E
;E F
Task 
< 

TeamMember 
> 
GetMemberByName (
(( )
string) /

memberName0 :
): ;
;; <
} 
} í
áC:\Users\Radu\Desktop\Back-upRadu\4thYear\CerganRaduMihai_DevEfficient\DevEfficient_ServerSide\Domain\Core\ITeamMemberRoleRepository.cs
	namespace 	
Domain
 
. 
Core 
{ 
public		 

	interface		 %
ITeamMemberRoleRepository		 .
:		/ 0
IRepository		1 <
<		< =
TeamMemberRole		= K
>		K L
{

 
public 
Task 
< 
TeamMemberRole "
>" #
GetRoleByName$ 1
(1 2
string2 8
roleName9 A
)A B
;B C
} 
} ä

yC:\Users\Radu\Desktop\Back-upRadu\4thYear\CerganRaduMihai_DevEfficient\DevEfficient_ServerSide\Domain\Core\IUnitOfWork.cs
	namespace 	
Domain
 
. 
Core 
{ 
public 

	interface 
IUnitOfWork  
{ 
IItemRepository 
Items 
{ 
get  #
;# $
}% &
IItemTypeRepository 
	ItemTypes %
{& '
get( +
;+ ,
}- .%
ITeamMemberRoleRepository		 !
TeamMemberRoles		" 1
{		2 3
get		4 7
;		7 8
}		9 :
ISprintRepository

 
Sprints

 !
{

" #
get

$ '
;

' (
}

) *
IStateRepository 
States 
{  !
get" %
;% &
}' (
IRepository 
< 
Team 
> 
Teams 
{  !
get" %
;% &
}' (!
ITeamMemberRepository 
TeamMembers )
{* +
get, /
;/ 0
}1 2 
IDatabaseTransaction 
BeginTransaction -
(- .
). /
;/ 0
} 
} •
C:\Users\Radu\Desktop\Back-upRadu\4thYear\CerganRaduMihai_DevEfficient\DevEfficient_ServerSide\Domain\Dtos\GetItemsBodyModel.cs
	namespace 	
Domain
 
. 
Dtos 
{ 
public 

class 
GetItemsBodyModel "
{ 
public		 
string		 

SearchTerm		  
{		! "
get		# &
;		& '
set		( +
;		+ ,
}		- .
public

 
string

 
FilterField

 !
{

" #
get

$ '
;

' (
set

) ,
;

, -
}

. /
public 
string 
FilterValue !
{" #
get$ '
;' (
set) ,
;, -
}. /
} 
} ˜
|C:\Users\Radu\Desktop\Back-upRadu\4thYear\CerganRaduMihai_DevEfficient\DevEfficient_ServerSide\Domain\Dtos\ItemDetailsDto.cs
	namespace 	
Domain
 
. 
Dtos 
{ 
public 

class 
ItemDetailsDto 
{ 
public		 
Guid		 
Id		 
{		 
get		 
;		 
set		 !
;		! "
}		# $
public

 
string

 
Title

 
{

 
get

 !
;

! "
set

# &
;

& '
}

( )
public 
int 
EstimatedHours !
{" #
get# &
;& '
set( +
;+ ,
}, -
public 
string 
EstimatedEffort %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
public 
string 
Priority 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
string 
State 
{ 
get !
;! "
set# &
;& '
}( )
public 
string 
Type 
{ 
get  
;  !
set" %
;% &
}' (
public 
int 
ActualHours 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
string 
? 

SprintName !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
string 
? 
AssignedName #
{$ %
get& )
;) *
set+ .
;. /
}0 1
} 
} ÿ
yC:\Users\Radu\Desktop\Back-upRadu\4thYear\CerganRaduMihai_DevEfficient\DevEfficient_ServerSide\Domain\Dtos\MailRequest.cs
	namespace 	
Domain
 
. 
Dtos 
{ 
public 

class 
MailRequest 
{ 
public		 
string		 
ToEmail		 
{		 
get		  #
;		# $
set		% (
;		( )
}		* +
} 
} ï
ÄC:\Users\Radu\Desktop\Back-upRadu\4thYear\CerganRaduMihai_DevEfficient\DevEfficient_ServerSide\Domain\Dtos\NewItemsOrderModel.cs
	namespace 	
Domain
 
. 
Dtos 
{ 
public 

class 
NewItemsOrderModel #
{ 
public		 
List		 
<		 
Guid		 
>		 
ItemIds		 !
{		" #
get		$ '
;		' (
set		) ,
;		, -
}		. /
}

 
} Ì	
C:\Users\Radu\Desktop\Back-upRadu\4thYear\CerganRaduMihai_DevEfficient\DevEfficient_ServerSide\Domain\Dtos\RegisteredItemDto.cs
	namespace 	
Domain
 
. 
Dtos 
{ 
public 

class 
RegisteredItemDto "
{ 
public		 
string		 
Title		 
{		 
get		 !
;		! "
set		# &
;		& '
}		( )
public

 
int

 
EstimatedHours

 !
{

" #
get

$ '
;

' (
set

) ,
;

, -
}

. /
public 
string 
EffortValue !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
string 
Priority 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
string 
State 
{ 
get !
;! "
set# &
;& '
}( )
public 
string 
Type 
{ 
get  
;  !
set" %
;% &
}' (
} 
} Ú
áC:\Users\Radu\Desktop\Back-upRadu\4thYear\CerganRaduMihai_DevEfficient\DevEfficient_ServerSide\Domain\Dtos\RegisteredItemReturnModel.cs
	namespace 	
Domain
 
. 
Dtos 
{ 
public 

class %
RegisteredItemReturnModel *
{ 
public 
Guid 
ItemId 
{ 
get  
;  !
set" %
;% &
}' (
} 
}		 ó
ÅC:\Users\Radu\Desktop\Back-upRadu\4thYear\CerganRaduMihai_DevEfficient\DevEfficient_ServerSide\Domain\Dtos\RegisteredMemberDto.cs
	namespace 	
Domain
 
. 
Dtos 
{ 
public 

class 
RegisteredMemberDto $
{ 
public		 
string		 
Name		 
{		 
get		  
;		  !
set		" %
;		% &
}		' (
public

 
string

 
Email

 
{

 
get

 !
;

! "
set

# &
;

& '
}

( )
public 
string 
Role 
{ 
get  
;  !
set" %
;% &
}' (
} 
} Ñ	
ÅC:\Users\Radu\Desktop\Back-upRadu\4thYear\CerganRaduMihai_DevEfficient\DevEfficient_ServerSide\Domain\Dtos\RegisteredSprintDto.cs
	namespace 	
Domain
 
. 
Dtos 
{ 
public 

class 
RegisteredSprintDto $
{ 
public		 
string		 
Title		 
{		 
get		 !
;		! "
set		# &
;		& '
}		( )
public

 
string

 
Goal

 
{

 
get

  
;

  !
set

" %
;

% &
}

' (
public 
DateTime 
	StartDate !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
DateTime 
EndDate 
{  !
get" %
;% &
set' *
;* +
}, -
public 
List 
< 
Guid 
> 
ItemIds !
{" #
get$ '
;' (
set) ,
;, -
}. /
} 
} ¯
âC:\Users\Radu\Desktop\Back-upRadu\4thYear\CerganRaduMihai_DevEfficient\DevEfficient_ServerSide\Domain\Dtos\RegisteredSprintReturnModel.cs
	namespace 	
Domain
 
. 
Dtos 
{ 
public 

class '
RegisteredSprintReturnModel ,
{ 
public		 
Guid		 
SprintId		 
{		 
get		 "
;		" #
set		$ '
;		' (
}		) *
}

 
} ·
ÑC:\Users\Radu\Desktop\Back-upRadu\4thYear\CerganRaduMihai_DevEfficient\DevEfficient_ServerSide\Domain\Dtos\RetrievedCurrentSprint.cs
	namespace 	
Domain
 
. 
Dtos 
{ 
public 

class "
RetrievedCurrentSprint '
{ 
public		 
Guid		 
?		 
Id		 
{		 
get		 
;		 
set		 "
;		" #
}		$ %
public

 
string

 
Title

 
{

 
get

 !
;

! "
set

# &
;

& '
}

( )
public 
string 
Goal 
{ 
get  
;  !
set" %
;% &
}' (
public 
DateTime 
	StartDate !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
DateTime 
EndDate 
{  !
get" %
;% &
set' *
;* +
}, -
public 
int 
TotalEstimatedHours &
{' (
get) ,
;, -
set. 1
;1 2
}3 4
public 
List 
< 
RetrievedItemDto $
>$ %
SprintItems& 1
{2 3
get3 6
;6 7
set8 ;
;; <
}< =
} 
} ˙

~C:\Users\Radu\Desktop\Back-upRadu\4thYear\CerganRaduMihai_DevEfficient\DevEfficient_ServerSide\Domain\Dtos\RetrievedItemDto.cs
	namespace 	
Domain
 
. 
Dtos 
{ 
public 

class 
RetrievedItemDto !
{ 
public		 
Guid		 
Id		 
{		 
get		 
;		 
set		 !
;		! "
}		# $
public

 
string

 
Title

 
{

 
get

 !
;

! "
set

# &
;

& '
}

( )
public 
string 
Priority 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
int 
EstimatedHours !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
string 
Effort 
{ 
get "
;" #
set$ '
;' (
}) *
public 
string 
State 
{ 
get !
;! "
set# &
;& '
}( )
public 
string 
Type 
{ 
get  
;  !
set" %
;% &
}' (
} 
} ±
ÑC:\Users\Radu\Desktop\Back-upRadu\4thYear\CerganRaduMihai_DevEfficient\DevEfficient_ServerSide\Domain\Dtos\RetrievedTeamMemberDto.cs
	namespace 	
Domain
 
. 
Dtos 
{ 
public 

class "
RetrievedTeamMemberDto '
{ 
public		 
Guid		 
Id		 
{		 
get		 
;		 
set		 !
;		! "
}		# $
public

 
string

 
Name

 
{

 
get

  
;

  !
set

" %
;

% &
}

' (
public 
string 
Email 
{ 
get !
;! "
set# &
;& '
}( )
public 
string 
Role 
{ 
get  
;  !
set" %
;% &
}' (
} 
} ◊
àC:\Users\Radu\Desktop\Back-upRadu\4thYear\CerganRaduMihai_DevEfficient\DevEfficient_ServerSide\Domain\Dtos\TopBottomDevboardBodyModel.cs
	namespace 	
Domain
 
. 
Dtos 
{ 
public 

class &
TopBottomDevboardBodyModel +
{ 
public		 
List		 
<		 
Guid		 
>		 
ItemIds		 !
{		" #
get		$ '
;		' (
set		) ,
;		, -
}		. /
public

 
Guid

 
ItemId

 
{

 
get

  
;

  !
set

" %
;

% &
}

' (
public 
string 
Option 
{ 
get "
;" #
set$ '
;' (
}) *
} 
} Ì
ÑC:\Users\Radu\Desktop\Back-upRadu\4thYear\CerganRaduMihai_DevEfficient\DevEfficient_ServerSide\Domain\Dtos\UpdateStateOfItemModel.cs
	namespace 	
Domain
 
. 
Dtos 
{ 
public 

class "
UpdateStateOfItemModel '
{ 
public		 
string		 
State		 
{		 
get		 !
;		! "
set		# &
;		& '
}		( )
}

 
} “
vC:\Users\Radu\Desktop\Back-upRadu\4thYear\CerganRaduMihai_DevEfficient\DevEfficient_ServerSide\Domain\Entities\Item.cs
	namespace 	
Domain
 
. 
Entities 
{ 
public 

class 
Item 
{ 
public		 
Guid		 
Id		 
{		 
get		 
;		 
set		 !
;		! "
}		# $
public 
string 
Title 
{ 
get !
;! "
set# &
;& '
}( )
public 
int 
ActualHours 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
int 
EstimatedHours !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
string 
Effort 
{ 
get "
;" #
set$ '
;' (
}) *
public 
string 
Priority 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
Guid 
? 
SprintId 
{ 
get  #
;# $
set% (
;( )
}* +
public 
Guid 
StateId 
{ 
get !
;! "
set# &
;& '
}( )
public 
Guid 

ItemTypeId 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
Guid 
? 
TeamMemberId !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
Sprint 
Sprint 
{ 
get "
;" #
set$ '
;' (
}) *
public 
State 
State 
{ 
get  
;  !
set" %
;% &
}' (
public 
ItemType 
ItemType  
{! "
get# &
;& '
set( +
;+ ,
}- .
public 

TeamMember 

TeamMember $
{% &
get' *
;* +
set, /
;/ 0
}1 2
} 
} Ì
zC:\Users\Radu\Desktop\Back-upRadu\4thYear\CerganRaduMihai_DevEfficient\DevEfficient_ServerSide\Domain\Entities\ItemType.cs
	namespace 	
Domain
 
. 
Entities 
{ 
public 

class 
ItemType 
{ 
public		 
Guid		 
Id		 
{		 
get		 
;		 
set		 !
;		! "
}		# $
public

 
string

 
Name

 
{

 
get

  
;

  !
set

" %
;

% &
}

' (
public 
string 
Description !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
virtual 
ICollection "
<" #
Item# '
>' (
Items) .
{/ 0
get1 4
;4 5
set6 9
;9 :
}; <
} 
} ß
xC:\Users\Radu\Desktop\Back-upRadu\4thYear\CerganRaduMihai_DevEfficient\DevEfficient_ServerSide\Domain\Entities\Sprint.cs
	namespace 	
Domain
 
. 
Entities 
{ 
public 

class 
Sprint 
{ 
public		 
Guid		 
Id		 
{		 
get		 
;		 
set		 !
;		! "
}		# $
public

 
string

 
Title

 
{

 
get

 !
;

! "
set

# &
;

& '
}

( )
public 
string 
Goal 
{ 
get  
;  !
set" %
;% &
}' (
public 
DateTime 
	StartDate !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
DateTime 
EndDate 
{  !
get" %
;% &
set' *
;* +
}, -
public 
int 
? 
TotalWorkedHours $
{% &
get' *
;* +
set, /
;/ 0
}1 2
public 
int 
TotalEstimatedHours &
{' (
get) ,
;, -
set. 1
;1 2
}3 4
public 
bool 
IsActive 
{ 
get "
;" #
set$ '
;' (
}) *
public 
bool 
IsClosed 
{ 
get "
;" #
set$ '
;' (
}) *
public 
virtual 
ICollection "
<" #
Item# '
>' (
Items) .
{/ 0
get1 4
;4 5
set6 9
;9 :
}; <
} 
} Á
wC:\Users\Radu\Desktop\Back-upRadu\4thYear\CerganRaduMihai_DevEfficient\DevEfficient_ServerSide\Domain\Entities\State.cs
	namespace 	
Domain
 
. 
Entities 
{ 
public 

class 
State 
{ 
public		 
Guid		 
Id		 
{		 
get		 
;		 
set		 !
;		! "
}		# $
public

 
string

 
Name

 
{

 
get

  
;

  !
set

" %
;

% &
}

' (
public 
string 
Description !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
virtual 
ICollection "
<" #
Item# '
>' (
Items) .
{/ 0
get1 4
;4 5
set6 9
;9 :
}; <
} 
} “
vC:\Users\Radu\Desktop\Back-upRadu\4thYear\CerganRaduMihai_DevEfficient\DevEfficient_ServerSide\Domain\Entities\Team.cs
	namespace 	
Domain
 
. 
Entities 
{ 
public 

class 
Team 
{ 
public		 
Guid		 
Id		 
{		 
get		 
;		 
set		 !
;		! "
}		# $
public

 
string

 
Name

 
{

 
get

  
;

  !
set

" %
;

% &
}

' (
public 
virtual 
ICollection "
<" #

TeamMember# -
>- .
TeamMembers/ :
{; <
get= @
;@ A
setB E
;E F
}G H
} 
} Â
|C:\Users\Radu\Desktop\Back-upRadu\4thYear\CerganRaduMihai_DevEfficient\DevEfficient_ServerSide\Domain\Entities\TeamMember.cs
	namespace 	
Domain
 
. 
Entities 
{ 
public 

class 

TeamMember 
{ 
public		 
Guid		 
Id		 
{		 
get		 
;		 
set		 !
;		! "
}		# $
public

 
string

 
Name

 
{

 
get

  
;

  !
set

" %
;

% &
}

' (
public 
Guid 
TeamMemberRoleId $
{% &
get' *
;* +
set, /
;/ 0
}1 2
public 
Guid 
TeamId 
{ 
get  
;  !
set" %
;% &
}' (
public 
string 
Email 
{ 
get !
;! "
set# &
;& '
}( )
public 
TeamMemberRole 
TeamMemberRole ,
{- .
get/ 2
;2 3
set4 7
;7 8
}9 :
public 
Team 
Team 
{ 
get 
; 
set  #
;# $
}% &
public 
virtual 
ICollection "
<" #
Item# '
>' (
Items) .
{/ 0
get1 4
;4 5
set6 9
;9 :
}; <
} 
} Ü
ÄC:\Users\Radu\Desktop\Back-upRadu\4thYear\CerganRaduMihai_DevEfficient\DevEfficient_ServerSide\Domain\Entities\TeamMemberRole.cs
	namespace 	
Domain
 
. 
Entities 
{ 
public 

class 
TeamMemberRole 
{ 
public		 
Guid		 
Id		 
{		 
get		 
;		 
set		 !
;		! "
}		# $
public

 
string

 
Name

 
{

 
get

  
;

  !
set

" %
;

% &
}

' (
public 
string 
Description !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
virtual 
ICollection "
<" #

TeamMember# -
>- .
TeamMembers/ :
{; <
get= @
;@ A
setB E
;E F
}G H
} 
} 