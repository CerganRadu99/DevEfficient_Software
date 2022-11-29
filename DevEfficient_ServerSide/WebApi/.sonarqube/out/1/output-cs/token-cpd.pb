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
} ∏ó
ÇC:\Users\Radu\Desktop\Back-upRadu\4thYear\CerganRaduMihai_DevEfficient\DevEfficient_ServerSide\Application\Services\ItemService.cs
	namespace 	
Application
 
. 
Services 
{ 
public 

class 
ItemService 
: 
IItemService +
{ 
private 
const 
string !
ITEMS_ORDER_CACHE_KEY 2
=3 4
$str5 I
;I J
private 
readonly 
IUnitOfWork $
_unitOfWork% 0
;0 1
private 
readonly 
IMemoryCache %
_memoryCache& 2
;2 3
public 
ItemService 
( 
IUnitOfWork &

unitOfWork' 1
,1 2
IMemoryCache3 ?
memoryCache@ K
)K L
{ 	
_unitOfWork 
= 

unitOfWork $
;$ %
_memoryCache 
= 
memoryCache &
;& '
} 	
public 
async 
Task 
< 
IEnumerable %
<% &
RetrievedItemDto& 6
>6 7
>7 8
GetAll9 ?
(? @
GetItemsBodyModel@ Q
getItemsBodyModelR c
)c d
{ 	
var 
items 
= 
await 
_unitOfWork )
.) *
Items* /
./ 0
GetFullItems0 <
(< =
getItemsBodyModel= N
)N O
;O P
List 
< 
Guid 
> 

itemsOrder !
=" #
new$ '
List( ,
<, -
Guid- 1
>1 2
(2 3
)3 4
;4 5
if 
( 
_memoryCache 
. 
TryGetValue '
(' (!
ITEMS_ORDER_CACHE_KEY( =
,= >
out? B

itemsOrderC M
)M N
)N O
{   
List!! 
<!! 
RetrievedItemDto!! %
>!!% &
orderedItems!!' 3
=!!4 5
new!!6 9
List!!: >
<!!> ?
RetrievedItemDto!!? O
>!!O P
(!!P Q
)!!Q R
;!!R S
foreach"" 
("" 
var"" 
itemId"" "
in""# %

itemsOrder""& 0
)""0 1
{## 
var$$ 
searchedItem$$ $
=$$% &
($$' (
($$( )
items$$) .
as$$/ 1
List$$2 6
<$$6 7
RetrievedItemDto$$7 G
>$$G H
)$$H I
.$$I J
Find$$J N
($$N O
item$$O S
=>$$T V
item$$W [
.$$[ \
Id$$\ ^
==$$_ a
itemId$$b h
)$$h i
)$$i j
;$$j k
if%% 
(%% 
searchedItem%% #
!=%%$ &
null%%' +
)%%+ ,
{&& 
orderedItems'' $
.''$ %
Add''% (
(''( )
searchedItem'') 5
)''5 6
;''6 7
}(( 
})) 
return** 
orderedItems** #
;**# $
}++ 
return,, 
items,, 
;,, 
}.. 	
public00 
async00 
Task00 
<00 
ItemDetailsDto00 (
>00( )
GetItem00* 1
(001 2
Guid002 6
itemId007 =
)00= >
{11 	
return22 
await22 
_unitOfWork22 $
.22$ %
Items22% *
.22* +
GetFullItem22+ 6
(226 7
itemId227 =
)22= >
;22> ?
}33 	
public55 
List55 
<55 
Guid55 
>55 )
ReorderItemsTopBottomDevboard55 7
(557 8&
TopBottomDevboardBodyModel558 R!
topBottomDevBodyModel55S h
)55h i
{66 	
if77 
(77 !
topBottomDevBodyModel77 $
.77$ %
ItemIds77% ,
.77, -
Contains77- 5
(775 6!
topBottomDevBodyModel776 K
.77K L
ItemId77L R
)77R S
)77S T
{88 !
topBottomDevBodyModel99 %
.99% &
ItemIds99& -
.99- .
Remove99. 4
(994 5!
topBottomDevBodyModel995 J
.99J K
ItemId99K Q
)99Q R
;99R S
}:: 
switch;; 
(;; !
topBottomDevBodyModel;; (
.;;( )
Option;;) /
);;/ 0
{<< 
case== 
$str== 
:== !
topBottomDevBodyModel>> )
.>>) *
ItemIds>>* 1
.>>1 2
Insert>>2 8
(>>8 9
$num>>9 :
,>>: ;!
topBottomDevBodyModel>>< Q
.>>Q R
ItemId>>R X
)>>X Y
;>>Y Z
break?? 
;?? 
case@@ 
$str@@ 
:@@ !
topBottomDevBodyModelAA )
.AA) *
ItemIdsAA* 1
.AA1 2
AddAA2 5
(AA5 6!
topBottomDevBodyModelAA6 K
.AAK L
ItemIdAAL R
)AAR S
;AAS T
breakBB 
;BB 
}CC 
_memoryCacheDD 
.DD 
SetDD 
(DD !
ITEMS_ORDER_CACHE_KEYDD 2
,DD2 3!
topBottomDevBodyModelDD4 I
.DDI J
ItemIdsDDJ Q
)DDQ R
;DDR S
returnEE !
topBottomDevBodyModelEE (
.EE( )
ItemIdsEE) 0
;EE0 1
}GG 	
publicII 
boolII #
ChangeItemsOrderInCacheII +
(II+ ,
NewItemsOrderModelII, >
newItemsOrderModelII? Q
)IIQ R
{JJ 	
_memoryCacheKK 
.KK 
SetKK 
(KK !
ITEMS_ORDER_CACHE_KEYKK 2
,KK2 3
newItemsOrderModelKK4 F
.KKF G
ItemIdsKKG N
)KKN O
;KKO P
returnLL 
trueLL 
;LL 
}MM 	
publicOO 
asyncOO 
TaskOO 
<OO 
GuidOO 
>OO 
RegisterItemOO  ,
(OO, -
RegisteredItemDtoOO- >
registeredItemDtoOO? P
)OOP Q
{PP 	
varQQ 
itemTypeQQ 
=QQ 
awaitQQ  
_unitOfWorkQQ! ,
.QQ, -
	ItemTypesQQ- 6
.QQ6 7
GetItemTypeByNameQQ7 H
(QQH I
registeredItemDtoQQI Z
.QQZ [
TypeQQ[ _
)QQ_ `
;QQ` a
varRR 
	itemStateRR 
=RR 
awaitRR !
_unitOfWorkRR" -
.RR- .
StatesRR. 4
.RR4 5
GetStateByNameRR5 C
(RRC D
registeredItemDtoRRD U
.RRU V
StateRRV [
)RR[ \
;RR\ ]
GuidSS 
currentItemIdSS 
=SS  
GuidSS! %
.SS% &
NewGuidSS& -
(SS- .
)SS. /
;SS/ 0
ItemTT 
itemToRegisterTT 
=TT  !
newTT" %
ItemTT& *
{UU 
IdVV 
=VV 
currentItemIdVV "
,VV" #
TitleWW 
=WW 
registeredItemDtoWW )
.WW) *
TitleWW* /
,WW/ 0
EstimatedHoursXX 
=XX  
registeredItemDtoXX! 2
.XX2 3
EstimatedHoursXX3 A
,XXA B
EffortYY 
=YY 
registeredItemDtoYY *
.YY* +
EffortValueYY+ 6
,YY6 7
PriorityZZ 
=ZZ 
registeredItemDtoZZ ,
.ZZ, -
PriorityZZ- 5
,ZZ5 6

ItemTypeId[[ 
=[[ 
itemType[[ %
.[[% &
Id[[& (
,[[( )
StateId\\ 
=\\ 
	itemState\\ #
.\\# $
Id\\$ &
}]] 
;]] 
var^^ 
isItemRegistered^^  
=^^! "
await^^# (
_unitOfWork^^) 4
.^^4 5
Items^^5 :
.^^: ;
Register^^; C
(^^C D
itemToRegister^^D R
)^^R S
;^^S T
if__ 
(__ 
isItemRegistered__ 
==__  "
$num__# $
)__$ %
{`` 
returnaa 
awaitaa 
Taskaa !
.aa! "

FromResultaa" ,
(aa, -
currentItemIdaa- :
)aa: ;
;aa; <
}bb 
returncc 
awaitcc 
Taskcc 
.cc 

FromResultcc (
(cc( )
Guidcc) -
.cc- .
Emptycc. 3
)cc3 4
;cc4 5
}dd 	
publicff 
asyncff 
Taskff 
<ff 
intff 
>ff 

UpdateItemff )
(ff) *
ItemDetailsDtoff* 8
itemDetailsDtoff9 G
)ffG H
{gg 	
varhh 
itemTypehh 
=hh 
awaithh  
_unitOfWorkhh! ,
.hh, -
	ItemTypeshh- 6
.hh6 7
GetItemTypeByNamehh7 H
(hhH I
itemDetailsDtohhI W
.hhW X
TypehhX \
)hh\ ]
;hh] ^
varii 
	itemStateii 
=ii 
awaitii !
_unitOfWorkii" -
.ii- .
Statesii. 4
.ii4 5
GetStateByNameii5 C
(iiC D
itemDetailsDtoiiD R
.iiR S
StateiiS X
)iiX Y
;iiY Z
varjj 
itemMemberIdjj 
=jj 
Guidjj #
.jj# $
Emptyjj$ )
;jj) *
ifkk 
(kk 
itemDetailsDtokk 
.kk 
AssignedNamekk *
!=kk+ -
nullkk. 2
)kk2 3
{ll 
varmm 

itemMembermm 
=mm  
awaitmm! &
_unitOfWorkmm' 2
.mm2 3
TeamMembersmm3 >
.mm> ?
GetMemberByNamemm? N
(mmN O
itemDetailsDtommO ]
.mm] ^
AssignedNamemm^ j
)mmj k
;mmk l
itemMemberIdnn 
=nn 

itemMembernn )
.nn) *
Idnn* ,
;nn, -
}oo 
Itempp 
itemToUpdatepp 
=pp 
nullpp  $
;pp$ %
ifqq 
(qq 
itemDetailsDtoqq 
.qq 
AssignedNameqq *
!=qq+ -
nullqq. 2
)qq2 3
{rr 
itemToUpdatess 
=ss 
newss "
Itemss# '
{tt 
Iduu 
=uu 
itemDetailsDtouu '
.uu' (
Iduu( *
,uu* +
Titlevv 
=vv 
itemDetailsDtovv *
.vv* +
Titlevv+ 0
,vv0 1
EstimatedHoursww "
=ww# $
itemDetailsDtoww% 3
.ww3 4
EstimatedHoursww4 B
,wwB C
Effortxx 
=xx 
itemDetailsDtoxx +
.xx+ ,
EstimatedEffortxx, ;
,xx; <
Priorityyy 
=yy 
itemDetailsDtoyy -
.yy- .
Priorityyy. 6
,yy6 7
ActualHourszz 
=zz  !
itemDetailsDtozz" 0
.zz0 1
ActualHourszz1 <
,zz< =

ItemTypeId{{ 
={{  
itemType{{! )
.{{) *
Id{{* ,
,{{, -
StateId|| 
=|| 
	itemState|| '
.||' (
Id||( *
,||* +
TeamMemberId}}  
=}}! "
itemMemberId}}# /
}~~ 
;~~ 
} 
else
ÄÄ 
{
ÅÅ 
itemToUpdate
ÇÇ 
=
ÇÇ 
new
ÇÇ "
Item
ÇÇ# '
{
ÉÉ 
Id
ÑÑ 
=
ÑÑ 
itemDetailsDto
ÑÑ '
.
ÑÑ' (
Id
ÑÑ( *
,
ÑÑ* +
Title
ÖÖ 
=
ÖÖ 
itemDetailsDto
ÖÖ *
.
ÖÖ* +
Title
ÖÖ+ 0
,
ÖÖ0 1
EstimatedHours
ÜÜ "
=
ÜÜ# $
itemDetailsDto
ÜÜ% 3
.
ÜÜ3 4
EstimatedHours
ÜÜ4 B
,
ÜÜB C
Effort
áá 
=
áá 
itemDetailsDto
áá +
.
áá+ ,
EstimatedEffort
áá, ;
,
áá; <
Priority
àà 
=
àà 
itemDetailsDto
àà -
.
àà- .
Priority
àà. 6
,
àà6 7
ActualHours
ââ 
=
ââ  !
itemDetailsDto
ââ" 0
.
ââ0 1
ActualHours
ââ1 <
,
ââ< =

ItemTypeId
ää 
=
ää  
itemType
ää! )
.
ää) *
Id
ää* ,
,
ää, -
StateId
ãã 
=
ãã 
	itemState
ãã '
.
ãã' (
Id
ãã( *
,
ãã* +
}
åå 
;
åå 
}
çç 
return
èè 
await
èè 
_unitOfWork
èè $
.
èè$ %
Items
èè% *
.
èè* +
Update
èè+ 1
(
èè1 2
itemToUpdate
èè2 >
)
èè> ?
;
èè? @
}
êê 	
public
íí 
async
íí 
Task
íí 
<
íí 
int
íí 
>
íí 
UpdateStateOfItem
íí 0
(
íí0 1
Guid
íí1 5
itemId
íí6 <
,
íí< =
string
íí> D
newState
ííE M
)
ííM N
{
ìì 	
var
îî 
currentItem
îî 
=
îî 
await
îî #
_unitOfWork
îî$ /
.
îî/ 0
Items
îî0 5
.
îî5 6
GetById
îî6 =
(
îî= >
itemId
îî> D
)
îîD E
;
îîE F
var
ïï 
currentState
ïï 
=
ïï 
await
ïï $
_unitOfWork
ïï% 0
.
ïï0 1
States
ïï1 7
.
ïï7 8
GetStateByName
ïï8 F
(
ïïF G
newState
ïïG O
)
ïïO P
;
ïïP Q
currentItem
ññ 
.
ññ 
State
ññ 
=
ññ 
currentState
ññ  ,
;
ññ, -
return
óó 
await
óó 
_unitOfWork
óó $
.
óó$ %
Items
óó% *
.
óó* +
Update
óó+ 1
(
óó1 2
currentItem
óó2 =
)
óó= >
;
óó> ?
}
òò 	
public
öö 
async
öö 
Task
öö 
<
öö 
int
öö 
>
öö 
SetSprintOfItem
öö .
(
öö. /
Guid
öö/ 3
itemId
öö4 :
)
öö: ;
{
õõ 	
using
úú 
(
úú 
var
úú 
transaction
úú "
=
úú# $
_unitOfWork
úú% 0
.
úú0 1
BeginTransaction
úú1 A
(
úúA B
)
úúB C
)
úúC D
{
ùù 
try
ûû 
{
üü 
var
†† $
isTransactionSucceeded
†† .
=
††/ 0
true
††1 5
;
††5 6
var
°° 
currentItem
°° #
=
°°$ %
await
°°& +
_unitOfWork
°°, 7
.
°°7 8
Items
°°8 =
.
°°= >
GetById
°°> E
(
°°E F
itemId
°°F L
)
°°L M
;
°°M N
var
¢¢ 
currentSprint
¢¢ %
=
¢¢& '
await
¢¢( -
_unitOfWork
¢¢. 9
.
¢¢9 :
Sprints
¢¢: A
.
¢¢A B
GetCurrentSprint
¢¢B R
(
¢¢R S
)
¢¢S T
;
¢¢T U
currentItem
££ 
.
££  
SprintId
££  (
=
££) *
currentSprint
££+ 8
.
££8 9
Id
££9 ;
;
££; <
var
§§ "
isCurrentItemUpdated
§§ ,
=
§§- .
await
§§/ 4
_unitOfWork
§§5 @
.
§§@ A
Items
§§A F
.
§§F G
Update
§§G M
(
§§M N
currentItem
§§N Y
)
§§Y Z
;
§§Z [
if
•• 
(
•• "
isCurrentItemUpdated
•• +
==
••, .
$num
••/ 0
)
••0 1
{
¶¶ $
isTransactionSucceeded
ßß .
=
ßß/ 0
false
ßß1 6
;
ßß6 7
}
®® 
currentSprint
©© !
.
©©! "!
TotalEstimatedHours
©©" 5
+=
©©6 8
currentItem
©©9 D
.
©©D E
EstimatedHours
©©E S
;
©©S T
var
™™ $
isCurrentSprintUpdated
™™ .
=
™™/ 0
await
™™1 6
_unitOfWork
™™7 B
.
™™B C
Sprints
™™C J
.
™™J K
Update
™™K Q
(
™™Q R
currentSprint
™™R _
)
™™_ `
;
™™` a
if
´´ 
(
´´ $
isTransactionSucceeded
´´ -
)
´´- .
{
¨¨ 
transaction
≠≠ #
.
≠≠# $
Commit
≠≠$ *
(
≠≠* +
)
≠≠+ ,
;
≠≠, -
return
ÆÆ 
await
ÆÆ $
Task
ÆÆ% )
.
ÆÆ) *

FromResult
ÆÆ* 4
(
ÆÆ4 5
$num
ÆÆ5 6
)
ÆÆ6 7
;
ÆÆ7 8
}
ØØ 
return
∞∞ 
await
∞∞  
Task
∞∞! %
.
∞∞% &

FromResult
∞∞& 0
(
∞∞0 1
$num
∞∞1 2
)
∞∞2 3
;
∞∞3 4
}
±± 
catch
≤≤ 
(
≤≤ 
	Exception
≤≤ 
ex
≤≤  "
)
≤≤" #
{
≥≥ 
transaction
¥¥ 
.
¥¥  
Rollback
¥¥  (
(
¥¥( )
)
¥¥) *
;
¥¥* +
return
µµ 
await
µµ  
Task
µµ! %
.
µµ% &

FromResult
µµ& 0
(
µµ0 1
$num
µµ1 2
)
µµ2 3
;
µµ3 4
}
∂∂ 
}
∑∑ 
}
∏∏ 	
public
ππ 
async
ππ 
Task
ππ 
<
ππ 
int
ππ 
>
ππ 
ClearSprintOfItem
ππ 0
(
ππ0 1
Guid
ππ1 5
itemId
ππ6 <
)
ππ< =
{
∫∫ 	
var
ªª 
currentItem
ªª 
=
ªª 
await
ªª #
_unitOfWork
ªª$ /
.
ªª/ 0
Items
ªª0 5
.
ªª5 6
GetById
ªª6 =
(
ªª= >
itemId
ªª> D
)
ªªD E
;
ªªE F
currentItem
ºº 
.
ºº 
SprintId
ºº  
=
ºº! "
null
ºº# '
;
ºº' (
return
ΩΩ 
await
ΩΩ 
_unitOfWork
ΩΩ $
.
ΩΩ$ %
Items
ΩΩ% *
.
ΩΩ* +
Update
ΩΩ+ 1
(
ΩΩ1 2
currentItem
ΩΩ2 =
)
ΩΩ= >
;
ΩΩ> ?
}
ææ 	
public
¿¿ 
async
¿¿ 
Task
¿¿ 
<
¿¿ 
int
¿¿ 
>
¿¿ 

DeleteItem
¿¿ )
(
¿¿) *
Guid
¿¿* .
itemId
¿¿/ 5
)
¿¿5 6
{
¡¡ 	
var
¬¬ 
currentItem
¬¬ 
=
¬¬ 
await
¬¬ #
_unitOfWork
¬¬$ /
.
¬¬/ 0
Items
¬¬0 5
.
¬¬5 6
GetById
¬¬6 =
(
¬¬= >
itemId
¬¬> D
)
¬¬D E
;
¬¬E F
return
√√ 
await
√√ 
_unitOfWork
√√ $
.
√√$ %
Items
√√% *
.
√√* +
Delete
√√+ 1
(
√√1 2
currentItem
√√2 =
)
√√= >
;
√√> ?
}
ƒƒ 	
}
≈≈ 
}∆∆ ∞R
ÑC:\Users\Radu\Desktop\Back-upRadu\4thYear\CerganRaduMihai_DevEfficient\DevEfficient_ServerSide\Application\Services\SprintService.cs
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
class 
SprintService 
: 
ISprintService  .
{ 
private 
readonly 
IUnitOfWork $
_unitOfWork% 0
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
;$ %
} 	
public 
async 
Task 
< "
RetrievedCurrentSprint 0
>0 1%
GetCurrentActivatedSprint2 K
(K L
)L M
{ 	
return 
await 
_unitOfWork $
.$ %
Sprints% ,
., -%
GetCurrentActivatedSprint- F
(F G
)G H
;H I
} 	
public 
List 
< 
RetrievedItemDto $
>$ %!
GetCurrentSprintItems& ;
(; <
)< =
{ 	
return 
_unitOfWork 
.  
Sprints  '
.' (!
GetCurrentSprintItems( =
(= >
)> ?
;? @
} 	
public 
async 
Task 
< 
Guid 
> 
RegisterSprint  .
(. /
RegisteredSprintDto/ B
registeredSprintDtoC V
)V W
{   	
using!! 
(!! 
var!! 
transaction!! "
=!!# $
_unitOfWork!!% 0
.!!0 1
BeginTransaction!!1 A
(!!A B
)!!B C
)!!C D
{"" 
try## 
{$$ 
var%% 
sprintId%%  
=%%! "
Guid%%# '
.%%' (
NewGuid%%( /
(%%/ 0
)%%0 1
;%%1 2
Sprint&& 
sprintToRegister&& +
=&&, -
new&&. 1
Sprint&&2 8
{'' 
Id(( 
=(( 
sprintId(( %
,((% &
Title)) 
=)) 
registeredSprintDto))  3
.))3 4
Title))4 9
,))9 :
Goal** 
=** 
registeredSprintDto** 2
.**2 3
Goal**3 7
,**7 8
	StartDate++ !
=++" #
registeredSprintDto++$ 7
.++7 8
	StartDate++8 A
,++A B
EndDate,, 
=,,  !
registeredSprintDto,," 5
.,,5 6
EndDate,,6 =
,,,= >
IsActive--  
=--! "
false--# (
}.. 
;.. 
var// "
isTransactionSucceeded// .
=/// 0
true//1 5
;//5 6
var00 
isSprintRegistered00 *
=00+ ,
await00- 2
_unitOfWork003 >
.00> ?
Sprints00? F
.00F G
Register00G O
(00O P
sprintToRegister00P `
)00` a
;00a b
if11 
(11 
isSprintRegistered11 *
==11+ -
$num11. /
)11/ 0
{22 "
isTransactionSucceeded33 .
=33/ 0
false331 6
;336 7
}44 
int55 
totalEstimatedHours55 +
=55, -
$num55. /
;55/ 0
foreach66 
(66 
var66  
itemId66! '
in66( *
registeredSprintDto66+ >
.66> ?
ItemIds66? F
)66F G
{77 
var88 
currentItem88 '
=88( )
await88* /
_unitOfWork880 ;
.88; <
Items88< A
.88A B
GetById88B I
(88I J
itemId88J P
)88P Q
;88Q R
totalEstimatedHours99 +
+=99, .
currentItem99/ :
.99: ;
EstimatedHours99; I
;99I J
currentItem:: #
.::# $
SprintId::$ ,
=::- .
sprintId::/ 7
;::7 8
var;; 
isItemUpdated;; )
=;;* +
await;;, 1
_unitOfWork;;2 =
.;;= >
Items;;> C
.;;C D
Update;;D J
(;;J K
currentItem;;K V
);;V W
;;;W X
if<< 
(<< 
isItemUpdated<< )
==<<* ,
$num<<- .
)<<. /
{== "
isTransactionSucceeded>> 2
=>>3 4
false>>5 :
;>>: ;
}?? 
}@@ 
sprintToRegisterAA $
.AA$ %
TotalEstimatedHoursAA% 8
=AA9 :
totalEstimatedHoursAA; N
;AAN O
varBB 
isSprintUpdatedBB '
=BB( )
awaitBB* /
_unitOfWorkBB0 ;
.BB; <
SprintsBB< C
.BBC D
UpdateBBD J
(BBJ K
sprintToRegisterBBK [
)BB[ \
;BB\ ]
ifCC 
(CC 
isSprintUpdatedCC '
==CC( *
$numCC+ ,
)CC, -
{DD "
isTransactionSucceededEE .
=EE/ 0
falseEE1 6
;EE6 7
}FF 
ifGG 
(GG "
isTransactionSucceededGG .
)GG. /
{HH 
transactionII #
.II# $
CommitII$ *
(II* +
)II+ ,
;II, -
returnJJ 
awaitJJ $
TaskJJ% )
.JJ) *

FromResultJJ* 4
(JJ4 5
sprintIdJJ5 =
)JJ= >
;JJ> ?
}KK 
returnLL 
awaitLL  
TaskLL! %
.LL% &

FromResultLL& 0
(LL0 1
GuidLL1 5
.LL5 6
EmptyLL6 ;
)LL; <
;LL< =
}MM 
catchNN 
(NN 
	ExceptionNN 
exNN  "
)NN" #
{OO 
transactionPP 
.PP  
RollbackPP  (
(PP( )
)PP) *
;PP* +
returnQQ 
awaitQQ  
TaskQQ! %
.QQ% &

FromResultQQ& 0
(QQ0 1
GuidQQ1 5
.QQ5 6
EmptyQQ6 ;
)QQ; <
;QQ< =
}RR 
}SS 
}TT 	
publicVV 
asyncVV 
TaskVV 
<VV 
intVV 
>VV 
ActivateSprintVV -
(VV- .
RegisteredSprintDtoVV. A
registeredSprintDtoVVB U
)VVU V
{WW 	
varXX 
activatedSprintXX 
=XX  !
awaitXX" '
_unitOfWorkXX( 3
.XX3 4
SprintsXX4 ;
.XX; <%
GetCurrentActivatedSprintXX< U
(XXU V
)XXV W
;XXW X
ifYY 
(YY 
activatedSprintYY 
!=YY !
nullYY" &
)YY& '
{ZZ 
return[[ 
await[[ 
Task[[ !
.[[! "

FromResult[[" ,
([[, -
$num[[- .
)[[. /
;[[/ 0
}\\ 
var]] 
currentSprint]] 
=]] 
await]]  %
_unitOfWork]]& 1
.]]1 2
Sprints]]2 9
.]]9 :
GetCurrentSprint]]: J
(]]J K
)]]K L
;]]L M
currentSprint^^ 
.^^ 
IsActive^^ "
=^^# $
true^^% )
;^^) *
currentSprint__ 
.__ 
Title__ 
=__  !
registeredSprintDto__" 5
.__5 6
Title__6 ;
;__; <
currentSprint`` 
.`` 
Goal`` 
=``  
registeredSprintDto``! 4
.``4 5
Goal``5 9
;``9 :
currentSprintaa 
.aa 
	StartDateaa #
=aa$ %
registeredSprintDtoaa& 9
.aa9 :
	StartDateaa: C
;aaC D
currentSprintbb 
.bb 
EndDatebb !
=bb" #
registeredSprintDtobb$ 7
.bb7 8
EndDatebb8 ?
;bb? @
returncc 
awaitcc 
_unitOfWorkcc $
.cc$ %
Sprintscc% ,
.cc, -
Updatecc- 3
(cc3 4
currentSprintcc4 A
)ccA B
;ccB C
}dd 	
publicff 
asyncff 
Taskff 
<ff 
intff 
>ff '
CloseCurrentActivatedSprintff :
(ff: ;
)ff; <
{gg 	
varhh 
activatedSprinthh 
=hh  !
awaithh" '
_unitOfWorkhh( 3
.hh3 4
Sprintshh4 ;
.hh; <%
GetCurrentActivatedSprinthh< U
(hhU V
)hhV W
;hhW X
ifii 
(ii 
activatedSprintii 
==ii  "
nullii# '
)ii' (
{jj 
returnkk 
awaitkk 
Taskkk !
.kk! "

FromResultkk" ,
(kk, -
$numkk- .
)kk. /
;kk/ 0
}ll 
varmm  
activatedSprintModelmm $
=mm% &
awaitmm' ,
_unitOfWorkmm- 8
.mm8 9
Sprintsmm9 @
.mm@ A
GetByIdmmA H
(mmH I
(mmI J
GuidmmJ N
)mmN O
activatedSprintmmO ^
.mm^ _
Idmm_ a
)mma b
;mmb c 
activatedSprintModelnn  
.nn  !
IsActivenn! )
=nn* +
falsenn, 1
;nn1 2 
activatedSprintModeloo  
.oo  !
IsClosedoo! )
=oo* +
trueoo, 0
;oo0 1
returnpp 
awaitpp 
_unitOfWorkpp $
.pp$ %
Sprintspp% ,
.pp, -
Updatepp- 3
(pp3 4 
activatedSprintModelpp4 H
)ppH I
;ppI J
}qq 	
publicss 
asyncss 
Taskss 
<ss 
intss 
>ss 
DeleteCurrentSprintss 2
(ss2 3
)ss3 4
{tt 	
varuu 
currentSprintuu 
=uu 
awaituu  %
_unitOfWorkuu& 1
.uu1 2
Sprintsuu2 9
.uu9 :
GetCurrentSprintuu: J
(uuJ K
)uuK L
;uuL M
returnvv 
awaitvv 
_unitOfWorkvv $
.vv$ %
Sprintsvv% ,
.vv, -
Deletevv- 3
(vv3 4
currentSprintvv4 A
)vvA B
;vvB C
}ww 	
}xx 
}yy ≥
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