ı
åC:\Users\Radu\Desktop\Back-upRadu\4thYear\CerganRaduMihai_DevEfficient\DevEfficient_ServerSide\Application\Interfaces\IEmailSenderService.cs
	namespace 	
Application
 
. 

Interfaces  
{ 
public		 

	interface		 
IEmailSenderService		 (
{

 
Task 
SendEmailAsync 
( 
MailRequest '
mailRequest( 3
)3 4
;4 5
} 
} ‰
ÖC:\Users\Radu\Desktop\Back-upRadu\4thYear\CerganRaduMihai_DevEfficient\DevEfficient_ServerSide\Application\Interfaces\IItemService.cs
	namespace 	
Application
 
. 

Interfaces  
{		 
public

 

	interface

 
IItemService

 !
{ 
public 
Task 
< 
IEnumerable 
<  
RetrievedItemDto  0
>0 1
>1 2
GetAll3 9
(9 :
GetItemsBodyModel: K
getItemsPostModelL ]
)] ^
;^ _
public 
Task 
< 
ItemDetailsDto "
>" #
GetItem$ +
(+ ,
Guid, 0
itemId1 7
)7 8
;8 9
public 
Task 
< 
Guid 
> 
RegisterItem &
(& '
RegisteredItemDto' 8
registeredItemDto9 J
)J K
;K L
public 
Task 
< 
int 
> 

UpdateItem #
(# $
ItemDetailsDto$ 2
itemDetailsDto3 A
)A B
;B C
public 
Task 
< 
int 
> 

DeleteItem #
(# $
Guid$ (
itemId) /
)/ 0
;0 1
public 
Task 
< 
int 
> 
UpdateStateOfItem *
(* +
Guid+ /
itemId0 6
,6 7
string8 >
newState? G
)G H
;H I
public 
Task 
< 
int 
> 
SetSprintOfItem (
(( )
Guid) -
itemId. 4
)4 5
;5 6
public 
Task 
< 
int 
> 
ClearSprintOfItem *
(* +
Guid+ /
itemId0 6
)6 7
;7 8
public 
List 
< 
Guid 
> )
ReorderItemsTopBottomDevboard 7
(7 8&
TopBottomDevboardBodyModel8 R!
topBottomDevBodyModelS h
)h i
;i j
public 
bool #
ChangeItemsOrderInCache +
(+ ,
NewItemsOrderModel, >
newItemsOrderModel? Q
)Q R
;R S
} 
} €
áC:\Users\Radu\Desktop\Back-upRadu\4thYear\CerganRaduMihai_DevEfficient\DevEfficient_ServerSide\Application\Interfaces\ISprintService.cs
	namespace 	
Application
 
. 

Interfaces  
{ 
public		 

	interface		 
ISprintService		 #
{

 
public 
Task 
< 
Guid 
> 
RegisterSprint (
(( )
RegisteredSprintDto) <
registeredSprintDto= P
)P Q
;Q R
public 
Task 
< 
int 
> 
ActivateSprint '
(' (
RegisteredSprintDto( ;
registeredSprintDto< O
)O P
;P Q
public 
Task 
< "
RetrievedCurrentSprint *
>* +%
GetCurrentActivatedSprint, E
(E F
)F G
;G H
public 
Task 
< 
int 
> '
CloseCurrentActivatedSprint 4
(4 5
)5 6
;6 7
public 
List 
< 
RetrievedItemDto $
>$ %!
GetCurrentSprintItems& ;
(; <
)< =
;= >
public 
Task 
< 
int 
> 
DeleteCurrentSprint ,
(, -
)- .
;. /
} 
} ˛
ãC:\Users\Radu\Desktop\Back-upRadu\4thYear\CerganRaduMihai_DevEfficient\DevEfficient_ServerSide\Application\Interfaces\ITeamMemberService.cs
	namespace 	
Application
 
. 

Interfaces  
{ 
public		 

	interface		 
ITeamMemberService		 '
{

 
Task 
< 
IEnumerable 
< "
RetrievedTeamMemberDto /
>/ 0
>0 1
GetAll2 8
(8 9
)9 :
;: ;
Task 
< 
int 
> 
RegisterMember  
(  !
RegisteredMemberDto! 4
registeredMemberDto5 H
)H I
;I J
} 
} ⁄ó
ÇC:\Users\Radu\Desktop\Back-upRadu\4thYear\CerganRaduMihai_DevEfficient\DevEfficient_ServerSide\Application\Services\ItemService.cs
	namespace

 	
Application


 
.

 
Services

 
{ 
public 

class 
ItemService 
: 
IItemService +
{ 
private 
const 
string !
ITEMS_ORDER_CACHE_KEY 2
=3 4
$str5 I
;I J
private 
readonly 
IUnitOfWork $
_unitOfWork% 0
;0 1
private 
readonly 
IMemoryCache %
_memoryCache& 2
;2 3
public 
ItemService 
( 
IUnitOfWork &

unitOfWork' 1
,1 2
IMemoryCache3 ?
memoryCache@ K
)K L
{ 	
_unitOfWork 
= 

unitOfWork $
;$ %
_memoryCache 
= 
memoryCache &
;& '
} 	
public 
async 
Task 
< 
IEnumerable %
<% &
RetrievedItemDto& 6
>6 7
>7 8
GetAll9 ?
(? @
GetItemsBodyModel@ Q
getItemsBodyModelR c
)c d
{ 	
var 
items 
= 
await 
_unitOfWork )
.) *
Items* /
./ 0
GetFullItems0 <
(< =
getItemsBodyModel= N
)N O
;O P
List 
< 
Guid 
> 

itemsOrder !
=" #
new$ '
List( ,
<, -
Guid- 1
>1 2
(2 3
)3 4
;4 5
if 
( 
_memoryCache 
. 
TryGetValue '
(' (!
ITEMS_ORDER_CACHE_KEY( =
,= >
out? B

itemsOrderC M
)M N
)N O
{ 
List 
< 
RetrievedItemDto %
>% &
orderedItems' 3
=4 5
new6 9
List: >
<> ?
RetrievedItemDto? O
>O P
(P Q
)Q R
;R S
foreach   
(   
var   
itemId   "
in  # %

itemsOrder  & 0
)  0 1
{!! 
var"" 
searchedItem"" $
=""% &
(""' (
(""( )
items"") .
as""/ 1
List""2 6
<""6 7
RetrievedItemDto""7 G
>""G H
)""H I
.""I J
Find""J N
(""N O
item""O S
=>""T V
item""W [
.""[ \
Id""\ ^
==""_ a
itemId""b h
)""h i
)""i j
;""j k
if## 
(## 
searchedItem## #
!=##$ &
null##' +
)##+ ,
{$$ 
orderedItems%% $
.%%$ %
Add%%% (
(%%( )
searchedItem%%) 5
)%%5 6
;%%6 7
}&& 
}'' 
return(( 
orderedItems(( #
;((# $
})) 
return** 
items** 
;** 
},, 	
public.. 
async.. 
Task.. 
<.. 
ItemDetailsDto.. (
>..( )
GetItem..* 1
(..1 2
Guid..2 6
itemId..7 =
)..= >
{// 	
return00 
await00 
_unitOfWork00 $
.00$ %
Items00% *
.00* +
GetFullItem00+ 6
(006 7
itemId007 =
)00= >
;00> ?
}11 	
public33 
List33 
<33 
Guid33 
>33 )
ReorderItemsTopBottomDevboard33 7
(337 8&
TopBottomDevboardBodyModel338 R!
topBottomDevBodyModel33S h
)33h i
{44 	
if55 
(55 !
topBottomDevBodyModel55 $
.55$ %
ItemIds55% ,
.55, -
Contains55- 5
(555 6!
topBottomDevBodyModel556 K
.55K L
ItemId55L R
)55R S
)55S T
{66 !
topBottomDevBodyModel77 %
.77% &
ItemIds77& -
.77- .
Remove77. 4
(774 5!
topBottomDevBodyModel775 J
.77J K
ItemId77K Q
)77Q R
;77R S
}88 
switch99 
(99 !
topBottomDevBodyModel99 (
.99( )
Option99) /
)99/ 0
{:: 
case;; 
$str;; 
:;; !
topBottomDevBodyModel<< )
.<<) *
ItemIds<<* 1
.<<1 2
Insert<<2 8
(<<8 9
$num<<9 :
,<<: ;!
topBottomDevBodyModel<<< Q
.<<Q R
ItemId<<R X
)<<X Y
;<<Y Z
break== 
;== 
case>> 
$str>> 
:>> !
topBottomDevBodyModel?? )
.??) *
ItemIds??* 1
.??1 2
Add??2 5
(??5 6!
topBottomDevBodyModel??6 K
.??K L
ItemId??L R
)??R S
;??S T
break@@ 
;@@ 
}AA 
_memoryCacheBB 
.BB 
SetBB 
(BB !
ITEMS_ORDER_CACHE_KEYBB 2
,BB2 3!
topBottomDevBodyModelBB4 I
.BBI J
ItemIdsBBJ Q
)BBQ R
;BBR S
returnCC !
topBottomDevBodyModelCC (
.CC( )
ItemIdsCC) 0
;CC0 1
}EE 	
publicGG 
boolGG #
ChangeItemsOrderInCacheGG +
(GG+ ,
NewItemsOrderModelGG, >
newItemsOrderModelGG? Q
)GGQ R
{HH 	
_memoryCacheII 
.II 
SetII 
(II !
ITEMS_ORDER_CACHE_KEYII 2
,II2 3
newItemsOrderModelII4 F
.IIF G
ItemIdsIIG N
)IIN O
;IIO P
returnJJ 
trueJJ 
;JJ 
}KK 	
publicMM 
asyncMM 
TaskMM 
<MM 
GuidMM 
>MM 
RegisterItemMM  ,
(MM, -
RegisteredItemDtoMM- >
registeredItemDtoMM? P
)MMP Q
{NN 	
varOO 
itemTypeOO 
=OO 
awaitOO  
_unitOfWorkOO! ,
.OO, -
	ItemTypesOO- 6
.OO6 7
GetItemTypeByNameOO7 H
(OOH I
registeredItemDtoOOI Z
.OOZ [
TypeOO[ _
)OO_ `
;OO` a
varPP 
	itemStatePP 
=PP 
awaitPP !
_unitOfWorkPP" -
.PP- .
StatesPP. 4
.PP4 5
GetStateByNamePP5 C
(PPC D
registeredItemDtoPPD U
.PPU V
StatePPV [
)PP[ \
;PP\ ]
GuidQQ 
currentItemIdQQ 
=QQ  
GuidQQ! %
.QQ% &
NewGuidQQ& -
(QQ- .
)QQ. /
;QQ/ 0
ItemRR 
itemToRegisterRR 
=RR  !
newRR" %
ItemRR& *
{SS 
IdTT 
=TT 
currentItemIdTT "
,TT" #
TitleUU 
=UU 
registeredItemDtoUU )
.UU) *
TitleUU* /
,UU/ 0
EstimatedHoursVV 
=VV  
registeredItemDtoVV! 2
.VV2 3
EstimatedHoursVV3 A
,VVA B
EffortWW 
=WW 
registeredItemDtoWW *
.WW* +
EffortValueWW+ 6
,WW6 7
PriorityXX 
=XX 
registeredItemDtoXX ,
.XX, -
PriorityXX- 5
,XX5 6

ItemTypeIdYY 
=YY 
itemTypeYY %
.YY% &
IdYY& (
,YY( )
StateIdZZ 
=ZZ 
	itemStateZZ #
.ZZ# $
IdZZ$ &
}[[ 
;[[ 
var\\ 
isItemRegistered\\  
=\\! "
await\\# (
_unitOfWork\\) 4
.\\4 5
Items\\5 :
.\\: ;
Register\\; C
(\\C D
itemToRegister\\D R
)\\R S
;\\S T
if]] 
(]] 
isItemRegistered]] 
==]]  "
$num]]# $
)]]$ %
{^^ 
return__ 
await__ 
Task__ !
.__! "

FromResult__" ,
(__, -
currentItemId__- :
)__: ;
;__; <
}`` 
returnaa 
awaitaa 
Taskaa 
.aa 

FromResultaa (
(aa( )
Guidaa) -
.aa- .
Emptyaa. 3
)aa3 4
;aa4 5
}bb 	
publicdd 
asyncdd 
Taskdd 
<dd 
intdd 
>dd 

UpdateItemdd )
(dd) *
ItemDetailsDtodd* 8
itemDetailsDtodd9 G
)ddG H
{ee 	
varff 
itemTypeff 
=ff 
awaitff  
_unitOfWorkff! ,
.ff, -
	ItemTypesff- 6
.ff6 7
GetItemTypeByNameff7 H
(ffH I
itemDetailsDtoffI W
.ffW X
TypeffX \
)ff\ ]
;ff] ^
vargg 
	itemStategg 
=gg 
awaitgg !
_unitOfWorkgg" -
.gg- .
Statesgg. 4
.gg4 5
GetStateByNamegg5 C
(ggC D
itemDetailsDtoggD R
.ggR S
StateggS X
)ggX Y
;ggY Z
varhh 
itemMemberIdhh 
=hh 
Guidhh #
.hh# $
Emptyhh$ )
;hh) *
ifii 
(ii 
itemDetailsDtoii 
.ii 
AssignedNameii *
!=ii+ -
nullii. 2
)ii2 3
{jj 
varkk 

itemMemberkk 
=kk  
awaitkk! &
_unitOfWorkkk' 2
.kk2 3
TeamMemberskk3 >
.kk> ?
GetMemberByNamekk? N
(kkN O
itemDetailsDtokkO ]
.kk] ^
AssignedNamekk^ j
)kkj k
;kkk l
itemMemberIdll 
=ll 

itemMemberll )
.ll) *
Idll* ,
;ll, -
}mm 
Itemnn 
itemToUpdatenn 
=nn 
nullnn  $
;nn$ %
ifoo 
(oo 
itemDetailsDtooo 
.oo 
AssignedNameoo *
!=oo+ -
nulloo. 2
)oo2 3
{pp 
itemToUpdateqq 
=qq 
newqq "
Itemqq# '
{rr 
Idss 
=ss 
itemDetailsDtoss '
.ss' (
Idss( *
,ss* +
Titlett 
=tt 
itemDetailsDtott *
.tt* +
Titlett+ 0
,tt0 1
EstimatedHoursuu "
=uu# $
itemDetailsDtouu% 3
.uu3 4
EstimatedHoursuu4 B
,uuB C
Effortvv 
=vv 
itemDetailsDtovv +
.vv+ ,
EstimatedEffortvv, ;
,vv; <
Priorityww 
=ww 
itemDetailsDtoww -
.ww- .
Priorityww. 6
,ww6 7
ActualHoursxx 
=xx  !
itemDetailsDtoxx" 0
.xx0 1
ActualHoursxx1 <
,xx< =

ItemTypeIdyy 
=yy  
itemTypeyy! )
.yy) *
Idyy* ,
,yy, -
StateIdzz 
=zz 
	itemStatezz '
.zz' (
Idzz( *
,zz* +
TeamMemberId{{  
={{! "
itemMemberId{{# /
}|| 
;|| 
}}} 
else~~ 
{ 
itemToUpdate
ÄÄ 
=
ÄÄ 
new
ÄÄ "
Item
ÄÄ# '
{
ÅÅ 
Id
ÇÇ 
=
ÇÇ 
itemDetailsDto
ÇÇ '
.
ÇÇ' (
Id
ÇÇ( *
,
ÇÇ* +
Title
ÉÉ 
=
ÉÉ 
itemDetailsDto
ÉÉ *
.
ÉÉ* +
Title
ÉÉ+ 0
,
ÉÉ0 1
EstimatedHours
ÑÑ "
=
ÑÑ# $
itemDetailsDto
ÑÑ% 3
.
ÑÑ3 4
EstimatedHours
ÑÑ4 B
,
ÑÑB C
Effort
ÖÖ 
=
ÖÖ 
itemDetailsDto
ÖÖ +
.
ÖÖ+ ,
EstimatedEffort
ÖÖ, ;
,
ÖÖ; <
Priority
ÜÜ 
=
ÜÜ 
itemDetailsDto
ÜÜ -
.
ÜÜ- .
Priority
ÜÜ. 6
,
ÜÜ6 7
ActualHours
áá 
=
áá  !
itemDetailsDto
áá" 0
.
áá0 1
ActualHours
áá1 <
,
áá< =

ItemTypeId
àà 
=
àà  
itemType
àà! )
.
àà) *
Id
àà* ,
,
àà, -
StateId
ââ 
=
ââ 
	itemState
ââ '
.
ââ' (
Id
ââ( *
,
ââ* +
}
ää 
;
ää 
}
ãã 
return
çç 
await
çç 
_unitOfWork
çç $
.
çç$ %
Items
çç% *
.
çç* +
Update
çç+ 1
(
çç1 2
itemToUpdate
çç2 >
)
çç> ?
;
çç? @
}
éé 	
public
êê 
async
êê 
Task
êê 
<
êê 
int
êê 
>
êê 
UpdateStateOfItem
êê 0
(
êê0 1
Guid
êê1 5
itemId
êê6 <
,
êê< =
string
êê> D
newState
êêE M
)
êêM N
{
ëë 	
var
íí 
currentItem
íí 
=
íí 
await
íí #
_unitOfWork
íí$ /
.
íí/ 0
Items
íí0 5
.
íí5 6
GetById
íí6 =
(
íí= >
itemId
íí> D
)
ííD E
;
ííE F
var
ìì 
currentState
ìì 
=
ìì 
await
ìì $
_unitOfWork
ìì% 0
.
ìì0 1
States
ìì1 7
.
ìì7 8
GetStateByName
ìì8 F
(
ììF G
newState
ììG O
)
ììO P
;
ììP Q
currentItem
îî 
.
îî 
State
îî 
=
îî 
currentState
îî  ,
;
îî, -
return
ïï 
await
ïï 
_unitOfWork
ïï $
.
ïï$ %
Items
ïï% *
.
ïï* +
Update
ïï+ 1
(
ïï1 2
currentItem
ïï2 =
)
ïï= >
;
ïï> ?
}
ññ 	
public
òò 
async
òò 
Task
òò 
<
òò 
int
òò 
>
òò 
SetSprintOfItem
òò .
(
òò. /
Guid
òò/ 3
itemId
òò4 :
)
òò: ;
{
ôô 	
using
öö 
(
öö 
var
öö 
transaction
öö "
=
öö# $
_unitOfWork
öö% 0
.
öö0 1
BeginTransaction
öö1 A
(
ööA B
)
ööB C
)
ööC D
{
õõ 
try
úú 
{
ùù 
var
ûû $
isTransactionSucceeded
ûû .
=
ûû/ 0
true
ûû1 5
;
ûû5 6
var
üü 
currentItem
üü #
=
üü$ %
await
üü& +
_unitOfWork
üü, 7
.
üü7 8
Items
üü8 =
.
üü= >
GetById
üü> E
(
üüE F
itemId
üüF L
)
üüL M
;
üüM N
var
†† 
currentSprint
†† %
=
††& '
await
††( -
_unitOfWork
††. 9
.
††9 :
Sprints
††: A
.
††A B
GetCurrentSprint
††B R
(
††R S
)
††S T
;
††T U
currentItem
°° 
.
°°  
SprintId
°°  (
=
°°) *
currentSprint
°°+ 8
.
°°8 9
Id
°°9 ;
;
°°; <
var
¢¢ "
isCurrentItemUpdated
¢¢ ,
=
¢¢- .
await
¢¢/ 4
_unitOfWork
¢¢5 @
.
¢¢@ A
Items
¢¢A F
.
¢¢F G
Update
¢¢G M
(
¢¢M N
currentItem
¢¢N Y
)
¢¢Y Z
;
¢¢Z [
if
££ 
(
££ "
isCurrentItemUpdated
££ +
==
££, .
$num
££/ 0
)
££0 1
{
§§ $
isTransactionSucceeded
•• .
=
••/ 0
false
••1 6
;
••6 7
}
¶¶ 
currentSprint
ßß !
.
ßß! "!
TotalEstimatedHours
ßß" 5
+=
ßß6 8
currentItem
ßß9 D
.
ßßD E
EstimatedHours
ßßE S
;
ßßS T
var
®® $
isCurrentSprintUpdated
®® .
=
®®/ 0
await
®®1 6
_unitOfWork
®®7 B
.
®®B C
Sprints
®®C J
.
®®J K
Update
®®K Q
(
®®Q R
currentSprint
®®R _
)
®®_ `
;
®®` a
if
©© 
(
©© $
isTransactionSucceeded
©© -
==
©©. 0
true
©©1 5
)
©©5 6
{
™™ 
transaction
´´ #
.
´´# $
Commit
´´$ *
(
´´* +
)
´´+ ,
;
´´, -
return
¨¨ 
await
¨¨ $
Task
¨¨% )
.
¨¨) *

FromResult
¨¨* 4
(
¨¨4 5
$num
¨¨5 6
)
¨¨6 7
;
¨¨7 8
}
≠≠ 
return
ÆÆ 
await
ÆÆ  
Task
ÆÆ! %
.
ÆÆ% &

FromResult
ÆÆ& 0
(
ÆÆ0 1
$num
ÆÆ1 2
)
ÆÆ2 3
;
ÆÆ3 4
}
ØØ 
catch
∞∞ 
(
∞∞ 
	Exception
∞∞ 
ex
∞∞  "
)
∞∞" #
{
±± 
transaction
≤≤ 
.
≤≤  
Rollback
≤≤  (
(
≤≤( )
)
≤≤) *
;
≤≤* +
return
≥≥ 
await
≥≥  
Task
≥≥! %
.
≥≥% &

FromResult
≥≥& 0
(
≥≥0 1
$num
≥≥1 2
)
≥≥2 3
;
≥≥3 4
}
¥¥ 
}
µµ 
}
∂∂ 	
public
∑∑ 
async
∑∑ 
Task
∑∑ 
<
∑∑ 
int
∑∑ 
>
∑∑ 
ClearSprintOfItem
∑∑ 0
(
∑∑0 1
Guid
∑∑1 5
itemId
∑∑6 <
)
∑∑< =
{
∏∏ 	
var
ππ 
currentItem
ππ 
=
ππ 
await
ππ #
_unitOfWork
ππ$ /
.
ππ/ 0
Items
ππ0 5
.
ππ5 6
GetById
ππ6 =
(
ππ= >
itemId
ππ> D
)
ππD E
;
ππE F
currentItem
∫∫ 
.
∫∫ 
SprintId
∫∫  
=
∫∫! "
null
∫∫# '
;
∫∫' (
return
ªª 
await
ªª 
_unitOfWork
ªª $
.
ªª$ %
Items
ªª% *
.
ªª* +
Update
ªª+ 1
(
ªª1 2
currentItem
ªª2 =
)
ªª= >
;
ªª> ?
}
ºº 	
public
ææ 
async
ææ 
Task
ææ 
<
ææ 
int
ææ 
>
ææ 

DeleteItem
ææ )
(
ææ) *
Guid
ææ* .
itemId
ææ/ 5
)
ææ5 6
{
øø 	
var
¿¿ 
currentItem
¿¿ 
=
¿¿ 
await
¿¿ #
_unitOfWork
¿¿$ /
.
¿¿/ 0
Items
¿¿0 5
.
¿¿5 6
GetById
¿¿6 =
(
¿¿= >
itemId
¿¿> D
)
¿¿D E
;
¿¿E F
return
¡¡ 
await
¡¡ 
_unitOfWork
¡¡ $
.
¡¡$ %
Items
¡¡% *
.
¡¡* +
Delete
¡¡+ 1
(
¡¡1 2
currentItem
¡¡2 =
)
¡¡= >
;
¡¡> ?
}
¬¬ 	
}
√√ 
}ƒƒ êT
ÑC:\Users\Radu\Desktop\Back-upRadu\4thYear\CerganRaduMihai_DevEfficient\DevEfficient_ServerSide\Application\Services\SprintService.cs
	namespace		 	
Application		
 
.		 
Services		 
{

 
public 

class 
SprintService 
: 
ISprintService  .
{ 
private 
readonly 
IUnitOfWork $
_unitOfWork% 0
;0 1
public 
readonly 
DateTime  
currentDateTime! 0
;0 1
public 
SprintService 
( 
IUnitOfWork (

unitOfWork) 3
)3 4
{ 	
_unitOfWork 
= 

unitOfWork $
;$ %
currentDateTime 
= 
DateTime &
.& '
UtcNow' -
;- .
} 	
public 
async 
Task 
< "
RetrievedCurrentSprint 0
>0 1%
GetCurrentActivatedSprint2 K
(K L
)L M
{ 	
return 
await 
_unitOfWork $
.$ %
Sprints% ,
., -%
GetCurrentActivatedSprint- F
(F G
)G H
;H I
} 	
public 
List 
< 
RetrievedItemDto $
>$ %!
GetCurrentSprintItems& ;
(; <
)< =
{ 	
return 
_unitOfWork 
.  
Sprints  '
.' (!
GetCurrentSprintItems( =
(= >
)> ?
;? @
} 	
public   
async   
Task   
<   
Guid   
>   
RegisterSprint    .
(  . /
RegisteredSprintDto  / B
registeredSprintDto  C V
)  V W
{!! 	
using"" 
("" 
var"" 
transaction"" "
=""# $
_unitOfWork""% 0
.""0 1
BeginTransaction""1 A
(""A B
)""B C
)""C D
{## 
try$$ 
{%% 
var&& 
sprintId&&  
=&&! "
Guid&&# '
.&&' (
NewGuid&&( /
(&&/ 0
)&&0 1
;&&1 2
Sprint'' 
sprintToRegister'' +
='', -
new''. 1
Sprint''2 8
{(( 
Id)) 
=)) 
sprintId)) %
,))% &
Title** 
=** 
registeredSprintDto**  3
.**3 4
Title**4 9
,**9 :
Goal++ 
=++ 
registeredSprintDto++ 2
.++2 3
Goal++3 7
,++7 8
	StartDate,, !
=,," #
registeredSprintDto,,$ 7
.,,7 8
	StartDate,,8 A
,,,A B
EndDate-- 
=--  !
registeredSprintDto--" 5
.--5 6
EndDate--6 =
,--= >
IsActive..  
=..! "
false..# (
}// 
;// 
var00 "
isTransactionSucceeded00 .
=00/ 0
true001 5
;005 6
var11 
isSprintRegistered11 *
=11+ ,
await11- 2
_unitOfWork113 >
.11> ?
Sprints11? F
.11F G
Register11G O
(11O P
sprintToRegister11P `
)11` a
;11a b
if22 
(22 
isSprintRegistered22 *
==22+ -
$num22. /
)22/ 0
{33 "
isTransactionSucceeded44 .
=44/ 0
false441 6
;446 7
}55 
int66 
totalEstimatedHours66 +
=66, -
$num66. /
;66/ 0
foreach77 
(77 
var77  
itemId77! '
in77( *
registeredSprintDto77+ >
.77> ?
ItemIds77? F
)77F G
{88 
var99 
currentItem99 '
=99( )
await99* /
_unitOfWork990 ;
.99; <
Items99< A
.99A B
GetById99B I
(99I J
itemId99J P
)99P Q
;99Q R
totalEstimatedHours:: +
+=::, .
currentItem::/ :
.::: ;
EstimatedHours::; I
;::I J
currentItem;; #
.;;# $
SprintId;;$ ,
=;;- .
sprintId;;/ 7
;;;7 8
var<< 
isItemUpdated<< )
=<<* +
await<<, 1
_unitOfWork<<2 =
.<<= >
Items<<> C
.<<C D
Update<<D J
(<<J K
currentItem<<K V
)<<V W
;<<W X
if== 
(== 
isItemUpdated== )
====* ,
$num==- .
)==. /
{>> "
isTransactionSucceeded?? 2
=??3 4
false??5 :
;??: ;
}@@ 
}AA 
sprintToRegisterBB $
.BB$ %
TotalEstimatedHoursBB% 8
=BB9 :
totalEstimatedHoursBB; N
;BBN O
varCC 
isSprintUpdatedCC '
=CC( )
awaitCC* /
_unitOfWorkCC0 ;
.CC; <
SprintsCC< C
.CCC D
UpdateCCD J
(CCJ K
sprintToRegisterCCK [
)CC[ \
;CC\ ]
ifDD 
(DD 
isSprintUpdatedDD '
==DD( *
$numDD+ ,
)DD, -
{EE "
isTransactionSucceededFF .
=FF/ 0
falseFF1 6
;FF6 7
}GG 
ifHH 
(HH "
isTransactionSucceededHH .
)HH. /
{II 
transactionJJ #
.JJ# $
CommitJJ$ *
(JJ* +
)JJ+ ,
;JJ, -
returnKK 
awaitKK $
TaskKK% )
.KK) *

FromResultKK* 4
(KK4 5
sprintIdKK5 =
)KK= >
;KK> ?
}LL 
returnMM 
awaitMM  
TaskMM! %
.MM% &

FromResultMM& 0
(MM0 1
GuidMM1 5
.MM5 6
EmptyMM6 ;
)MM; <
;MM< =
}NN 
catchOO 
(OO 
	ExceptionOO 
exOO  "
)OO" #
{PP 
transactionQQ 
.QQ  
RollbackQQ  (
(QQ( )
)QQ) *
;QQ* +
returnRR 
awaitRR  
TaskRR! %
.RR% &

FromResultRR& 0
(RR0 1
GuidRR1 5
.RR5 6
EmptyRR6 ;
)RR; <
;RR< =
}SS 
}TT 
}UU 	
publicWW 
asyncWW 
TaskWW 
<WW 
intWW 
>WW 
ActivateSprintWW -
(WW- .
RegisteredSprintDtoWW. A
registeredSprintDtoWWB U
)WWU V
{XX 	
varYY 
activatedSprintYY 
=YY  !
awaitYY" '
_unitOfWorkYY( 3
.YY3 4
SprintsYY4 ;
.YY; <%
GetCurrentActivatedSprintYY< U
(YYU V
)YYV W
;YYW X
ifZZ 
(ZZ 
activatedSprintZZ 
!=ZZ !
nullZZ" &
)ZZ& '
{[[ 
return\\ 
await\\ 
Task\\ !
.\\! "

FromResult\\" ,
(\\, -
$num\\- .
)\\. /
;\\/ 0
}]] 
var^^ 
currentSprint^^ 
=^^ 
await^^  %
_unitOfWork^^& 1
.^^1 2
Sprints^^2 9
.^^9 :
GetCurrentSprint^^: J
(^^J K
)^^K L
;^^L M
currentSprint__ 
.__ 
IsActive__ "
=__# $
true__% )
;__) *
currentSprint`` 
.`` 
Title`` 
=``  !
registeredSprintDto``" 5
.``5 6
Title``6 ;
;``; <
currentSprintaa 
.aa 
Goalaa 
=aa  
registeredSprintDtoaa! 4
.aa4 5
Goalaa5 9
;aa9 :
currentSprintbb 
.bb 
	StartDatebb #
=bb$ %
registeredSprintDtobb& 9
.bb9 :
	StartDatebb: C
;bbC D
currentSprintcc 
.cc 
EndDatecc !
=cc" #
registeredSprintDtocc$ 7
.cc7 8
EndDatecc8 ?
;cc? @
returndd 
awaitdd 
_unitOfWorkdd $
.dd$ %
Sprintsdd% ,
.dd, -
Updatedd- 3
(dd3 4
currentSprintdd4 A
)ddA B
;ddB C
}ee 	
publicgg 
asyncgg 
Taskgg 
<gg 
intgg 
>gg '
CloseCurrentActivatedSprintgg :
(gg: ;
)gg; <
{hh 	
varii 
activatedSprintii 
=ii  !
awaitii" '
_unitOfWorkii( 3
.ii3 4
Sprintsii4 ;
.ii; <%
GetCurrentActivatedSprintii< U
(iiU V
)iiV W
;iiW X
ifjj 
(jj 
activatedSprintjj 
==jj  "
nulljj# '
)jj' (
{kk 
returnll 
awaitll 
Taskll !
.ll! "

FromResultll" ,
(ll, -
$numll- .
)ll. /
;ll/ 0
}mm 
varnn  
activatedSprintModelnn $
=nn% &
awaitnn' ,
_unitOfWorknn- 8
.nn8 9
Sprintsnn9 @
.nn@ A
GetByIdnnA H
(nnH I
(nnI J
GuidnnJ N
)nnN O
activatedSprintnnO ^
.nn^ _
Idnn_ a
)nna b
;nnb c 
activatedSprintModeloo  
.oo  !
IsActiveoo! )
=oo* +
falseoo, 1
;oo1 2 
activatedSprintModelpp  
.pp  !
IsClosedpp! )
=pp* +
truepp, 0
;pp0 1
returnqq 
awaitqq 
_unitOfWorkqq $
.qq$ %
Sprintsqq% ,
.qq, -
Updateqq- 3
(qq3 4 
activatedSprintModelqq4 H
)qqH I
;qqI J
}rr 	
publictt 
asynctt 
Tasktt 
<tt 
inttt 
>tt 
DeleteCurrentSprinttt 2
(tt2 3
)tt3 4
{uu 	
varvv 
currentSprintvv 
=vv 
awaitvv  %
_unitOfWorkvv& 1
.vv1 2
Sprintsvv2 9
.vv9 :
GetCurrentSprintvv: J
(vvJ K
)vvK L
;vvL M
returnww 
awaitww 
_unitOfWorkww $
.ww$ %
Sprintsww% ,
.ww, -
Deleteww- 3
(ww3 4
currentSprintww4 A
)wwA B
;wwB C
}xx 	
}yy 
}zz ≥
àC:\Users\Radu\Desktop\Back-upRadu\4thYear\CerganRaduMihai_DevEfficient\DevEfficient_ServerSide\Application\Services\TeamMemberService.cs
	namespace

 	
Application


 
.

 
Services

 
{ 
public 

class 
TeamMemberService "
:" #
ITeamMemberService$ 6
{ 
private 
readonly 
IUnitOfWork $
_unitOfWork% 0
;0 1
public 
TeamMemberService  
(  !
IUnitOfWork! ,

unitOfWork- 7
)7 8
{ 	
_unitOfWork 
= 

unitOfWork $
;$ %
} 	
public 
async 
Task 
< 
IEnumerable %
<% &"
RetrievedTeamMemberDto& <
>< =
>= >
GetAll? E
(E F
)F G
{ 	
return 
await 
_unitOfWork $
.$ %
TeamMembers% 0
.0 1
GetFullTeamMember1 B
(B C
)C D
;D E
} 	
public 
async 
Task 
< 
int 
> 
RegisterMember -
(- .
RegisteredMemberDto. A
registeredMemberDtoB U
)U V
{ 	
var 
teamMemberRole 
=  
await! &
_unitOfWork' 2
.2 3
TeamMemberRoles3 B
.B C
GetRoleByNameC P
(P Q
registeredMemberDtoQ d
.d e
Rolee i
)i j
;j k

TeamMember 
memberToRegister '
=( )
new* -

TeamMember. 8
{ 
Id 
= 
Guid 
. 
NewGuid !
(! "
)" #
,# $
Name 
= 
registeredMemberDto *
.* +
Name+ /
,/ 0
Email   
=   
registeredMemberDto   +
.  + ,
Email  , 1
,  1 2
TeamMemberRoleId!!  
=!!! "
teamMemberRole!!# 1
.!!1 2
Id!!2 4
,!!4 5
TeamId"" 
="" 
Guid"" 
."" 
Parse"" #
(""# $
$str""$ J
)""J K
}## 
;## 
return$$ 
await$$ 
_unitOfWork$$ $
.$$$ %
TeamMembers$$% 0
.$$0 1
Register$$1 9
($$9 :
memberToRegister$$: J
)$$J K
;$$K L
}%% 	
}'' 
}(( 