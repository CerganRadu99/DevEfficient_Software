¯[
ÜC:\Users\Radu\Desktop\Back-upRadu\4thYear\CerganRaduMihai_DevEfficient\DevEfficient_ServerSide\WebApi\Controllers\AccountController.cs
	namespace 	
WebApi
 
. 
Controllers 
{ 
public 

class 
AccountController "
:" #
BaseController$ 2
{ 
private 
readonly 
UserManager $
<$ %
IdentityUser% 1
>1 2
_userManager3 ?
;? @
private 
readonly 
RoleManager $
<$ %
IdentityRole% 1
>1 2
_roleManager3 ?
;? @
private 
readonly 
	JwtConfig "

_jwtConfig# -
;- .
private 
readonly 
IMapper  
_mapper! (
;( )
public 
AccountController  
(  !
UserManager! ,
<, -
IdentityUser- 9
>9 :
userManager; F
,F G
IOptionsMonitorH W
<W X
	JwtConfigX a
>a b
optionsMonitorc q
,q r
IMappers z
mapper	{ Å
,
Å Ç
RoleManager
É é
<
é è
IdentityRole
è õ
>
õ ú
roleManager
ù ®
)
® ©
{ 	
_userManager 
= 
userManager &
;& '
_roleManager 
= 
roleManager &
;& '

_jwtConfig 
= 
optionsMonitor '
.' (
CurrentValue( 4
;4 5
_mapper 
= 
mapper 
; 
} 	
[!! 	
Route!!	 
(!! 
$str!! 
)!! 
]!! 
["" 	
HttpPost""	 
]"" 
public## 
async## 
Task## 
<## 
ActionResult## &
<##& '
ResponseDto##' 2
>##2 3
>##3 4
Register##5 =
(##= >
[##> ?
FromBody##? G
]##G H
UserRegistrationDto##I \
userRegistrationDto##] p
)##p q
{$$ 	
if%% 
(%% 

ModelState%% 
.%% 
IsValid%% "
)%%" #
{&& 
var'' 
user'' 
='' 
_mapper'' "
.''" #
Map''# &
<''& '
IdentityUser''' 3
>''3 4
(''4 5
userRegistrationDto''5 H
)''H I
;''I J
var(( 
result(( 
=(( 
await(( "
_userManager((# /
.((/ 0
CreateAsync((0 ;
(((; <
user((< @
,((@ A
userRegistrationDto((B U
.((U V
PasswordHash((V b
)((b c
;((c d
if)) 
()) 
result)) 
.)) 
	Succeeded)) #
)))# $
{** 
var++ 
userRole++  
=++! "
await++# (
_roleManager++) 5
.++5 6
FindByNameAsync++6 E
(++E F
$str++F L
)++L M
;++M N
if,, 
(,, 
userRole,, 
!=,,  "
null,,# '
),,' (
{-- 
IdentityResult.. &

roleResult..' 1
=..2 3
await..4 9
_userManager..: F
...F G
AddToRoleAsync..G U
(..U V
user..V Z
,..Z [
userRole..\ d
...d e
Name..e i
)..i j
;..j k
if// 
(// 

roleResult// %
.//% &
	Succeeded//& /
)/// 0
{00 
return11 "
base11# '
.11' (
HandleResponse11( 6
(116 7
)117 8
;118 9
}22 
}33 
return44 
base44 
.44  
HandleResponse44  .
(44. /
DefaultErrors44/ <
.44< =
	GetErrors44= F
(44F G
DefaultErrors44G T
.44T U
BadRequestError44U d
)44d e
)44e f
;44f g
}55 
return66 
base66 
.66 
HandleResponse66 *
(66* +
DefaultErrors66+ 8
.668 9
	GetErrors669 B
(66B C
DefaultErrors66C P
.66P Q
BadRequestError66Q `
)66` a
)66a b
;66b c
}77 
else88 
{99 
return:: 
base:: 
.:: 
HandleResponse:: *
(::* +
DefaultErrors::+ 8
.::8 9
	GetErrors::9 B
(::B C
DefaultErrors::C P
.::P Q
BadRequestError::Q `
)::` a
)::a b
;::b c
};; 
}<< 	
[>> 	
Route>>	 
(>> 
$str>> 
)>> 
]>> 
[?? 	
HttpPost??	 
]?? 
[@@ 	 
ProducesResponseType@@	 
(@@ 
(@@ 
typeof@@ %
(@@% &
ResponseDto@@& 1
<@@1 2
SignInResponse@@2 @
>@@@ A
)@@A B
)@@B C
,@@C D
$num@@E H
)@@H I
]@@I J
[AA 	 
ProducesResponseTypeAA	 
(AA 
$numAA !
)AA! "
]AA" #
publicBB 
asyncBB 
TaskBB 
<BB 
ActionResultBB &
<BB& '
ResponseDtoBB' 2
<BB2 3
SignInResponseBB3 A
>BBA B
>BBB C
>BBC D
LoginBBE J
(BBJ K
[BBK L
FromBodyBBL T
]BBT U
UserDtoBBV ]
userDtoBB^ e
)BBe f
{CC 	
ifDD 
(DD 

ModelStateDD 
.DD 
IsValidDD "
)DD" #
{EE 
varFF 
existingUserFF  
=FF! "
awaitFF# (
_userManagerFF) 5
.FF5 6
FindByNameAsyncFF6 E
(FFE F
userDtoFFF M
.FFM N
UserNameFFN V
)FFV W
;FFW X
ifGG 
(GG 
existingUserGG  
isGG! #
notGG$ '
nullGG( ,
)GG, -
{HH 
varII 
checkedPasswordFlagII +
=II, -
awaitII. 3
_userManagerII4 @
.II@ A
CheckPasswordAsyncIIA S
(IIS T
existingUserIIT `
,II` a
userDtoIIb i
.IIi j
PasswordIIj r
)IIr s
;IIs t
varJJ 
rolesJJ 
=JJ 
awaitJJ  %
_userManagerJJ& 2
.JJ2 3
GetRolesAsyncJJ3 @
(JJ@ A
existingUserJJA M
)JJM N
;JJN O
ifKK 
(KK 
checkedPasswordFlagKK +
&&KK, .
rolesKK/ 4
.KK4 5
CountKK5 :
==KK; =
$numKK> ?
)KK? @
{LL 
varMM 
jwtTokenMM $
=MM% &
GenerateJwtTokenMM' 7
(MM7 8
existingUserMM8 D
)MMD E
;MME F
returnNN 
baseNN #
.NN# $
HandleResponseNN$ 2
<NN2 3
SignInResponseNN3 A
>NNA B
(NNB C
newNNC F
SignInResponseNNG U
{OO 
AccessTokenPP '
=PP( )
jwtTokenPP* 2
,PP2 3
RoleQQ  
=QQ! "
rolesQQ# (
[QQ( )
$numQQ) *
]QQ* +
,QQ+ ,
EmailRR !
=RR" #
existingUserRR$ 0
.RR0 1
EmailRR1 6
,RR6 7
UsernameSS $
=SS% &
existingUserSS' 3
.SS3 4
UserNameSS4 <
}TT 
)TT 
;TT 
}UU 
returnVV 
baseVV 
.VV  
HandleResponseVV  .
<VV. /
SignInResponseVV/ =
>VV= >
(VV> ?
nullVV? C
,VVC D
DefaultErrorsVVE R
.VVR S
	GetErrorsVVS \
(VV\ ]
DefaultErrorsVV] j
.VVj k
BadRequestErrorVVk z
)VVz {
)VV{ |
;VV| }
}WW 
elseXX 
{YY 

ModelStateZZ 
.ZZ 
AddModelErrorZZ ,
(ZZ, -
stringZZ- 3
.ZZ3 4
EmptyZZ4 9
,ZZ9 :
$strZZ; R
)ZZR S
;ZZS T
return[[ 
base[[ 
.[[  
HandleResponse[[  .
<[[. /
SignInResponse[[/ =
>[[= >
([[> ?
null[[? C
,[[C D
DefaultErrors[[E R
.[[R S
	GetErrors[[S \
([[\ ]
DefaultErrors[[] j
.[[j k
BadRequestError[[k z
)[[z {
)[[{ |
;[[| }
}\\ 
}]] 
else^^ 
{__ 
return`` 
base`` 
.`` 
HandleResponse`` *
<``* +
SignInResponse``+ 9
>``9 :
(``: ;
null``; ?
,``? @
DefaultErrors``A N
.``N O
	GetErrors``O X
(``X Y
DefaultErrors``Y f
.``f g
BadRequestError``g v
)``v w
)``w x
;``x y
}aa 
}bb 	
privatedd 
stringdd 
GenerateJwtTokendd '
(dd' (
IdentityUserdd( 4
userdd5 9
)dd9 :
{ee 	
varff 
jwtTokenHandlerff 
=ff  !
newff" %#
JwtSecurityTokenHandlerff& =
(ff= >
)ff> ?
;ff? @
vargg 
keygg 
=gg 
Encodinggg 
.gg 
ASCIIgg $
.gg$ %
GetBytesgg% -
(gg- .

_jwtConfiggg. 8
.gg8 9
Secretgg9 ?
)gg? @
;gg@ A
varhh 
tokenDescriptorhh 
=hh  !
newhh" %#
SecurityTokenDescriptorhh& =
{ii 
Subjectjj 
=jj 
newjj 
ClaimsIdentityjj ,
(jj, -
newjj- 0
[jj0 1
]jj1 2
{kk 
newll 
Claimll 
(ll 
$strll "
,ll" #
userll$ (
.ll( )
Idll) +
)ll+ ,
,ll, -
newmm 
Claimmm 
(mm #
JwtRegisteredClaimNamesmm 5
.mm5 6
Jtimm6 9
,mm9 :
Guidmm; ?
.mm? @
NewGuidmm@ G
(mmG H
)mmH I
.mmI J
ToStringmmJ R
(mmR S
)mmS T
)mmT U
}nn 
)nn 
,nn 
Expiresoo 
=oo 
DateTimeoo "
.oo" #
UtcNowoo# )
.oo) *
AddHoursoo* 2
(oo2 3
$numoo3 4
)oo4 5
,oo5 6
SigningCredentialspp "
=pp# $
newpp% (
SigningCredentialspp) ;
(pp; <
newpp< ? 
SymmetricSecurityKeypp@ T
(ppT U
keyppU X
)ppX Y
,ppY Z
SecurityAlgorithmspp[ m
.ppm n 
HmacSha256Signature	ppn Å
)
ppÅ Ç
}qq 
;qq 
varrr 
tokenrr 
=rr 
jwtTokenHandlerrr '
.rr' (
CreateTokenrr( 3
(rr3 4
tokenDescriptorrr4 C
)rrC D
;rrD E
varss 
jwtTokenss 
=ss 
jwtTokenHandlerss *
.ss* +

WriteTokenss+ 5
(ss5 6
tokenss6 ;
)ss; <
;ss< =
returntt 
jwtTokentt 
;tt 
}uu 	
}ww 
}xx £
ÉC:\Users\Radu\Desktop\Back-upRadu\4thYear\CerganRaduMihai_DevEfficient\DevEfficient_ServerSide\WebApi\Controllers\BaseController.cs
	namespace 	
WebApi
 
. 
Controllers 
{		 
[

 
Route

 

(


 
$str

 
)

 
]

 
[ 
ApiController 
] 
public 

class 
BaseController 
:  !

Controller" ,
{ 
	protected 
ResponseDto 
< 
T 
>  
HandleResponse! /
</ 0
T0 1
>1 2
(2 3
T3 4
data5 9
,9 :
List; ?
<? @
string@ F
>F G
errorsH N
=O P
nullQ U
)U V
whereW \
T] ^
:_ `
classa f
{ 	
if 
( 
errors 
is 
null 
|| !
errors" (
.( )
Count) .
==/ 1
$num2 3
)3 4
{ 
return 
ResponseDto "
<" #
T# $
>$ %
.% &
Success& -
(- .
data. 2
)2 3
;3 4
} 
else 
{ 
return 
ResponseDto "
<" #
T# $
>$ %
.% &
Failure& -
(- .
errors. 4
)4 5
;5 6
} 
} 	
	protected 
ResponseDto 
HandleResponse ,
(, -
List- 1
<1 2
string2 8
>8 9
errors: @
=A B
nullC G
)G H
{ 	
if 
( 
errors 
is 
null 
|| !
errors" (
.( )
Count) .
==/ 1
$num2 3
)3 4
{ 
return 
ResponseDto "
." #
Success# *
(* +
)+ ,
;, -
} 
else 
{   
return!! 
ResponseDto!! "
.!!" #
Failure!!# *
(!!* +
errors!!+ 1
)!!1 2
;!!2 3
}"" 
}## 	
}$$ 
}%% Ê
ÑC:\Users\Radu\Desktop\Back-upRadu\4thYear\CerganRaduMihai_DevEfficient\DevEfficient_ServerSide\WebApi\Controllers\EmailController.cs
	namespace 	
WebApi
 
. 
Controllers 
{		 
[

 
Route

 

(


 
$str

 
)

 
]

 
[ 
ApiController 
] 
public 

class 
EmailController  
:  !
BaseController" 0
{ 
private 
readonly 
IEmailSenderService ,
emailSenderService- ?
;? @
public 
EmailController 
( 
IEmailSenderService 2
emailSenderService3 E
)E F
{ 	
this 
. 
emailSenderService #
=$ %
emailSenderService& 8
;8 9
} 	
[ 	
HttpPost	 
( 
$str 
) 
] 
public 
async 
Task 
< 
ActionResult &
<& '
ResponseDto' 2
>2 3
>3 4
SendMail5 =
(= >
[> ?
FromBody? G
]G H
MailRequestI T
requestU \
)\ ]
{ 	
try 
{ 
await 
emailSenderService (
.( )
SendEmailAsync) 7
(7 8
request8 ?
)? @
;@ A
return 
base 
. 
HandleResponse *
(* +
)+ ,
;, -
} 
catch 
( 
	Exception 
ex 
)  
{ 
throw 
; 
}   
}!! 	
}"" 
}## Æc
ÑC:\Users\Radu\Desktop\Back-upRadu\4thYear\CerganRaduMihai_DevEfficient\DevEfficient_ServerSide\WebApi\Controllers\ItemsController.cs
	namespace 	
WebApi
 
. 
Controllers 
{ 
public 

class 
ItemsController  
:! "
BaseController# 1
{ 
private 
readonly 
IItemService %
_itemService& 2
;2 3
public 
ItemsController 
( 
IItemService +
itemService, 7
)7 8
{ 	
_itemService 
= 
itemService &
;& '
} 	
[ 	
HttpPost	 
] 
[ 	
Route	 
( 
$str 
) 
] 
public 
ActionResult 
< 
ResponseDto '
<' (
IEnumerable( 3
<3 4
RetrievedItemDto4 D
>D E
>E F
>F G
GetItemsH P
(P Q
[Q R
FromBodyR Z
]Z [
GetItemsBodyModel\ m
getItemsBodyModeln 
)	 Ä
{ 	
var 
items 
= 
_itemService $
.$ %
GetAll% +
(+ ,
getItemsBodyModel, =
)= >
.> ?
Result? E
;E F
return 
HandleResponse !
(! "
items" '
)' (
;( )
} 	
[ 	
HttpPost	 
] 
[   	
Route  	 
(   
$str   "
)  " #
]  # $
public!! 
ActionResult!! 
<!! 
ResponseDto!! '
<!!' (
List!!( ,
<!!, -
Guid!!- 1
>!!1 2
>!!2 3
>!!3 4%
GetItemsTopBottomDevboard!!5 N
(!!N O
[!!O P
FromBody!!P X
]!!X Y&
TopBottomDevboardBodyModel!!Z t"
topBottomDevBodyModel	!!u ä
)
!!ä ã
{"" 	
List## 
<## 
Guid## 
>## 
itemIds## 
=##  
_itemService##! -
.##- .)
ReorderItemsTopBottomDevboard##. K
(##K L!
topBottomDevBodyModel##L a
)##a b
;##b c
return$$ 
HandleResponse$$ !
($$! "
itemIds$$" )
)$$) *
;$$* +
}%% 	
['' 	
HttpPost''	 
]'' 
[(( 	
Route((	 
((( 
$str(( 
)(( 
](( 
public)) 
ActionResult)) 
<)) 
ResponseDto)) '
>))' (#
ChangeItemsOrderInCache))) @
())@ A
[))A B
FromBody))B J
]))J K
NewItemsOrderModel))L ^
newItemsOrderModel))_ q
)))q r
{** 	
var++ 
response++ 
=++ 
_itemService++ '
.++' (#
ChangeItemsOrderInCache++( ?
(++? @
newItemsOrderModel++@ R
)++R S
;++S T
if,, 
(,, 
response,, 
==,, 
true,,  
),,  !
{-- 
return.. 
HandleResponse.. %
(..% &
)..& '
;..' (
}// 
else00 
{11 
return22 
HandleResponse22 %
(22% &
DefaultErrors22& 3
.223 4
	GetErrors224 =
(22= >
DefaultErrors22> K
.22K L
BadRequestError22L [
)22[ \
)22\ ]
;22] ^
}33 
}44 	
[66 	
HttpPut66	 
]66 
[77 	
Route77	 
(77 
$str77  
)77  !
]77! "
public88 
ActionResult88 
<88 
ResponseDto88 '
>88' (

UpdateItem88) 3
(883 4
[884 5
	FromRoute885 >
]88> ?
Guid88@ D
itemId88E K
,88K L
[88M N
FromBody88N V
]88V W
ItemDetailsDto88X f
itemDetailsDto88g u
)88u v
{99 	
var:: 
response:: 
=:: 
_itemService:: '
.::' (

UpdateItem::( 2
(::2 3
itemDetailsDto::3 A
)::A B
.::B C
Result::C I
;::I J
if;; 
(;; 
response;; 
==;; 
$num;; 
);; 
{<< 
return== 
HandleResponse== %
(==% &
)==& '
;==' (
}>> 
else?? 
{@@ 
returnAA 
HandleResponseAA %
(AA% &
DefaultErrorsAA& 3
.AA3 4
	GetErrorsAA4 =
(AA= >
DefaultErrorsAA> K
.AAK L
BadRequestErrorAAL [
)AA[ \
)AA\ ]
;AA] ^
}BB 
}CC 	
[EE 	
HttpPutEE	 
]EE 
[FF 	
RouteFF	 
(FF 
$strFF %
)FF% &
]FF& '
publicGG 
ActionResultGG 
<GG 
ResponseDtoGG '
>GG' (
UpdateStateOfItemGG) :
(GG: ;
[GG; <
	FromRouteGG< E
]GGE F
GuidGGG K
itemIdGGL R
,GGR S
[GGT U
FromBodyGGU ]
]GG] ^"
UpdateStateOfItemModelGG_ u#
updateStateOfItemModel	GGv å
)
GGå ç
{HH 	
varII 
responseII 
=II 
_itemServiceII '
.II' (
UpdateStateOfItemII( 9
(II9 :
itemIdII: @
,II@ A"
updateStateOfItemModelIIB X
.IIX Y
StateIIY ^
)II^ _
.II_ `
ResultII` f
;IIf g
ifJJ 
(JJ 
responseJJ 
==JJ 
$numJJ 
)JJ 
{KK 
returnLL 
HandleResponseLL %
(LL% &
)LL& '
;LL' (
}MM 
elseNN 
{OO 
returnPP 
HandleResponsePP %
(PP% &
DefaultErrorsPP& 3
.PP3 4
	GetErrorsPP4 =
(PP= >
DefaultErrorsPP> K
.PPK L
BadRequestErrorPPL [
)PP[ \
)PP\ ]
;PP] ^
}QQ 
}RR 	
[TT 	
HttpGetTT	 
]TT 
[UU 	
RouteUU	 
(UU 
$strUU 
)UU 
]UU 
publicVV 
ActionResultVV 
<VV 
ResponseDtoVV '
<VV' (
ItemDetailsDtoVV( 6
>VV6 7
>VV7 8
GetItemVV9 @
(VV@ A
[VVA B
	FromRouteVVB K
]VVK L
GuidVVM Q
itemIdVVR X
)VVX Y
{WW 	
varXX 
itemXX 
=XX 
_itemServiceXX #
.XX# $
GetItemXX$ +
(XX+ ,
itemIdXX, 2
)XX2 3
.XX3 4
ResultXX4 :
;XX: ;
returnYY 
HandleResponseYY !
(YY! "
itemYY" &
)YY& '
;YY' (
}ZZ 	
[\\ 	
HttpPost\\	 
]\\ 
[]] 	
Route]]	 
(]] 
$str]] 
)]] 
]]] 
public^^ 
ActionResult^^ 
<^^ 
ResponseDto^^ '
<^^' (%
RegisteredItemReturnModel^^( A
>^^A B
>^^B C
RegisterItem^^D P
(^^P Q
[^^Q R
FromBody^^R Z
]^^Z [
RegisteredItemDto^^\ m
registeredItemDto^^n 
)	^^ Ä
{__ 	
var`` 
response`` 
=`` 
_itemService`` '
.``' (
RegisterItem``( 4
(``4 5
registeredItemDto``5 F
)``F G
.``G H
Result``H N
;``N O
ifaa 
(aa 
responseaa 
!=aa 
Guidaa  
.aa  !
Emptyaa! &
)aa& '
{bb 
returncc 
HandleResponsecc %
<cc% &%
RegisteredItemReturnModelcc& ?
>cc? @
(cc@ A
newccA D%
RegisteredItemReturnModelccE ^
{cc_ `
ItemIddd 
=dd 
responsedd &
}ee 
)ee 
;ee 
}ff 
elsegg 
{hh 
returnii 
HandleResponseii %
<ii% &%
RegisteredItemReturnModelii& ?
>ii? @
(ii@ A
nulliiA E
,iiE F
DefaultErrorsiiG T
.iiT U
	GetErrorsiiU ^
(ii^ _
DefaultErrorsii_ l
.iil m
BadRequestErroriim |
)ii| }
)ii} ~
;ii~ 
}jj 
}kk 	
[mm 	
HttpPutmm	 
]mm 
[nn 	
Routenn	 
(nn 
$strnn #
)nn# $
]nn$ %
publicoo 
ActionResultoo 
<oo 
ResponseDtooo '
>oo' (
SetSprintOfItemoo) 8
(oo8 9
[oo9 :
	FromRouteoo: C
]ooC D
GuidooE I
itemIdooJ P
)ooP Q
{pp 	
varqq 
responseqq 
=qq 
_itemServiceqq '
.qq' (
SetSprintOfItemqq( 7
(qq7 8
itemIdqq8 >
)qq> ?
.qq? @
Resultqq@ F
;qqF G
ifrr 
(rr 
responserr 
==rr 
$numrr 
)rr 
{ss 
returntt 
HandleResponsett %
(tt% &
)tt& '
;tt' (
}uu 
elsevv 
{ww 
returnxx 
HandleResponsexx %
(xx% &
DefaultErrorsxx& 3
.xx3 4
	GetErrorsxx4 =
(xx= >
DefaultErrorsxx> K
.xxK L
BadRequestErrorxxL [
)xx[ \
)xx\ ]
;xx] ^
}yy 
}zz 	
[}} 	
HttpPut}}	 
]}} 
[~~ 	
Route~~	 
(~~ 
$str~~ %
)~~% &
]~~& '
public 
ActionResult 
< 
ResponseDto '
>' (
ClearSprintOfItem) :
(: ;
[; <
	FromRoute< E
]E F
GuidG K
itemIdL R
)R S
{
ÄÄ 	
var
ÅÅ 
response
ÅÅ 
=
ÅÅ 
_itemService
ÅÅ '
.
ÅÅ' (
ClearSprintOfItem
ÅÅ( 9
(
ÅÅ9 :
itemId
ÅÅ: @
)
ÅÅ@ A
.
ÅÅA B
Result
ÅÅB H
;
ÅÅH I
if
ÇÇ 
(
ÇÇ 
response
ÇÇ 
==
ÇÇ 
$num
ÇÇ 
)
ÇÇ 
{
ÉÉ 
return
ÑÑ 
HandleResponse
ÑÑ %
(
ÑÑ% &
)
ÑÑ& '
;
ÑÑ' (
}
ÖÖ 
else
ÜÜ 
{
áá 
return
àà 
HandleResponse
àà %
(
àà% &
DefaultErrors
àà& 3
.
àà3 4
	GetErrors
àà4 =
(
àà= >
DefaultErrors
àà> K
.
ààK L
BadRequestError
ààL [
)
àà[ \
)
àà\ ]
;
àà] ^
}
ââ 
}
ää 	
[
åå 	

HttpDelete
åå	 
]
åå 
[
çç 	
Route
çç	 
(
çç 
$str
çç  
)
çç  !
]
çç! "
public
éé 
ActionResult
éé 
<
éé 
ResponseDto
éé '
>
éé' (

DeleteItem
éé) 3
(
éé3 4
[
éé4 5
	FromRoute
éé5 >
]
éé> ?
Guid
éé@ D
itemId
ééE K
)
ééK L
{
èè 	
var
êê 
response
êê 
=
êê 
_itemService
êê '
.
êê' (

DeleteItem
êê( 2
(
êê2 3
itemId
êê3 9
)
êê9 :
.
êê: ;
Result
êê; A
;
êêA B
if
ëë 
(
ëë 
response
ëë 
==
ëë 
$num
ëë 
)
ëë 
{
íí 
return
ìì 
HandleResponse
ìì %
(
ìì% &
)
ìì& '
;
ìì' (
}
îî 
else
ïï 
{
ññ 
return
óó 
HandleResponse
óó %
(
óó% &
DefaultErrors
óó& 3
.
óó3 4
	GetErrors
óó4 =
(
óó= >
DefaultErrors
óó> K
.
óóK L
BadRequestError
óóL [
)
óó[ \
)
óó\ ]
;
óó] ^
}
òò 
}
ôô 	
}
öö 
}õõ ¢?
ÜC:\Users\Radu\Desktop\Back-upRadu\4thYear\CerganRaduMihai_DevEfficient\DevEfficient_ServerSide\WebApi\Controllers\SprintsController.cs
	namespace 	
WebApi
 
. 
Controllers 
{ 
public 

class 
SprintsController "
:# $
BaseController% 3
{ 
private 
readonly 
ISprintService '
_sprintService( 6
;6 7
public 
SprintsController  
(  !
ISprintService! /
sprintService0 =
)= >
{ 	
_sprintService 
= 
sprintService *
;* +
} 	
[ 	
HttpGet	 
] 
[ 	
Route	 
( 
$str 
) 
]  
public 
ActionResult 
< 
ResponseDto '
<' ("
RetrievedCurrentSprint( >
>> ?
>? @%
GetCurrentActivatedSprintA Z
(Z [
)[ \
{ 	
var 
response 
= 
_sprintService )
.) *%
GetCurrentActivatedSprint* C
(C D
)D E
.E F
ResultF L
;L M
if 
( 
response 
== 
null 
)  
{ 
return 
HandleResponse %
(% &
response& .
,. /
new0 3
List4 8
<8 9
string9 ?
>? @
(@ A
)A B
{C D
$strD _
}_ `
)` a
;a b
} 
return 
HandleResponse !
(! "
response" *
)* +
;+ ,
} 	
[!! 	
HttpPut!!	 
]!! 
["" 	
Route""	 
("" 
$str"" $
)""$ %
]""% &
public## 
ActionResult## 
<## 
ResponseDto## '
>##' (
CloseCurrentSprint##) ;
(##; <
)##< =
{$$ 	
var%% 
response%% 
=%% 
_sprintService%% )
.%%) *'
CloseCurrentActivatedSprint%%* E
(%%E F
)%%F G
.%%G H
Result%%H N
;%%N O
if&& 
(&& 
response&& 
==&& 
$num&& 
)&& 
{'' 
return(( 
HandleResponse(( %
(((% &
DefaultErrors((& 3
.((3 4
	GetErrors((4 =
(((= >
DefaultErrors((> K
.((K L
BadRequestError((L [
)(([ \
)((\ ]
;((] ^
})) 
return** 
HandleResponse** !
(**! "
)**" #
;**# $
}++ 	
[-- 	
HttpGet--	 
]-- 
[.. 	
Route..	 
(.. 
$str.. 
).. 
].. 
public// 
ActionResult// 
<// 
ResponseDto// '
<//' (
List//( ,
<//, -
RetrievedItemDto//- =
>//= >
>//> ?
>//? @!
GetCurrentSprintItems//A V
(//V W
)//W X
{00 	
var11 
response11 
=11 
_sprintService11 )
.11) *!
GetCurrentSprintItems11* ?
(11? @
)11@ A
;11A B
if22 
(22 
response22 
==22 
null22 
)22  
{33 
return44 
HandleResponse44 %
(44% &
response44& .
,44. /
new440 3
List444 8
<448 9
string449 ?
>44? @
(44@ A
)44A B
{44C D
$str44E `
}44a b
)44b c
;44c d
}55 
return66 
HandleResponse66 !
(66! "
response66" *
)66* +
;66+ ,
}77 	
[99 	
HttpPost99	 
]99 
[:: 	
Route::	 
(:: 
$str:: 
):: 
]:: 
public;; 
ActionResult;; 
<;; 
ResponseDto;; '
<;;' ('
RegisteredSprintReturnModel;;( C
>;;C D
>;;D E
RegisterSprint;;F T
(;;T U
[;;U V
FromBody;;V ^
];;^ _
RegisteredSprintDto;;` s
registeredItemDto	;;t Ö
)
;;Ö Ü
{<< 	
var== 
response== 
=== 
_sprintService== )
.==) *
RegisterSprint==* 8
(==8 9
registeredItemDto==9 J
)==J K
.==K L
Result==L R
;==R S
if>> 
(>> 
response>> 
!=>> 
Guid>>  
.>>  !
Empty>>! &
)>>& '
{?? 
return@@ 
HandleResponse@@ %
<@@% &'
RegisteredSprintReturnModel@@& A
>@@A B
(@@B C
new@@C F'
RegisteredSprintReturnModel@@G b
{@@c d
SprintIdAA 
=AA 
responseAA '
}BB 
)BB 
;BB 
}CC 
elseDD 
{EE 
returnFF 
HandleResponseFF %
<FF% &'
RegisteredSprintReturnModelFF& A
>FFA B
(FFB C
nullFFC G
,FFG H
DefaultErrorsFFI V
.FFV W
	GetErrorsFFW `
(FF` a
DefaultErrorsFFa n
.FFn o
BadRequestErrorFFo ~
)FF~ 
)	FF Ä
;
FFÄ Å
}GG 
}HH 	
[JJ 	
HttpPostJJ	 
]JJ 
[KK 	
RouteKK	 
(KK 
$strKK 
)KK 
]KK 
publicLL 
ActionResultLL 
<LL 
ResponseDtoLL '
>LL' (
ActivateSprintLL) 7
(LL7 8
[LL8 9
FromBodyLL9 A
]LLA B
RegisteredSprintDtoLLC V
registeredItemDtoLLW h
)LLh i
{MM 	
varNN 
responseNN 
=NN 
_sprintServiceNN )
.NN) *
ActivateSprintNN* 8
(NN8 9
registeredItemDtoNN9 J
)NNJ K
.NNK L
ResultNNL R
;NNR S
ifOO 
(OO 
responseOO 
==OO 
$numOO 
)OO 
{PP 
returnQQ 
HandleResponseQQ %
(QQ% &
)QQ& '
;QQ' (
}RR 
elseSS 
{TT 
returnUU 
HandleResponseUU %
(UU% &
DefaultErrorsUU& 3
.UU3 4
	GetErrorsUU4 =
(UU= >
DefaultErrorsUU> K
.UUK L
BadRequestErrorUUL [
)UU[ \
)UU\ ]
;UU] ^
}VV 
}WW 	
[ZZ 	

HttpDeleteZZ	 
]ZZ 
[[[ 	
Route[[	 
([[ 
$str[[ 
)[[ 
][[ 
public\\ 
ActionResult\\ 
<\\ 
ResponseDto\\ '
>\\' (
DeleteCurrentSprint\\) <
(\\< =
)\\= >
{]] 	
var^^ 
response^^ 
=^^ 
_sprintService^^ )
.^^) *
DeleteCurrentSprint^^* =
(^^= >
)^^> ?
.^^? @
Result^^@ F
;^^F G
if__ 
(__ 
response__ 
==__ 
$num__ 
)__ 
{`` 
returnaa 
HandleResponseaa %
(aa% &
)aa& '
;aa' (
}bb 
elsecc 
{dd 
returnee 
HandleResponseee %
(ee% &
DefaultErrorsee& 3
.ee3 4
	GetErrorsee4 =
(ee= >
DefaultErrorsee> K
.eeK L
BadRequestErroreeL [
)ee[ \
)ee\ ]
;ee] ^
}ff 
}gg 	
}hh 
}ii Ë
äC:\Users\Radu\Desktop\Back-upRadu\4thYear\CerganRaduMihai_DevEfficient\DevEfficient_ServerSide\WebApi\Controllers\TeamMembersController.cs
	namespace 	
WebApi
 
. 
Controllers 
{ 
public 

class !
TeamMembersController &
:& '
BaseController( 6
{ 
private 
readonly 
ITeamMemberService +
_teamMemberService, >
;> ?
public !
TeamMembersController $
($ %
ITeamMemberService% 7
teamMemberService8 I
)I J
{ 	
_teamMemberService 
=  
teamMemberService! 2
;2 3
} 	
[ 	
HttpGet	 
] 
[ 	
Route	 
( 
$str 
) 
] 
public 
ActionResult 
< 
ResponseDto '
<' (
IEnumerable( 3
<3 4"
RetrievedTeamMemberDto4 J
>J K
>K L
>L M
GetItemsN V
(V W
)W X
{ 	
var 
teamMembers 
= 
_teamMemberService 0
.0 1
GetAll1 7
(7 8
)8 9
.9 :
Result: @
;@ A
return 
HandleResponse !
(! "
teamMembers" -
)- .
;. /
} 	
[ 	
HttpPost	 
] 
[ 	
Route	 
( 
$str 
) 
] 
public 
ActionResult 
< 
ResponseDto '
>' (
RegisterMember) 7
(7 8
[8 9
FromBody9 A
]A B
RegisteredMemberDtoC V
registeredMemberDtoW j
)j k
{   	
var!! 
response!! 
=!! 
_teamMemberService!! -
.!!- .
RegisterMember!!. <
(!!< =
registeredMemberDto!!= P
)!!P Q
.!!Q R
Result!!R X
;!!X Y
if"" 
("" 
response"" 
=="" 
$num"" 
)"" 
{## 
return$$ 
HandleResponse$$ %
($$% &
)$$& '
;$$' (
}%% 
else&& 
{'' 
return(( 
HandleResponse(( %
(((% &
DefaultErrors((& 3
.((3 4
	GetErrors((4 =
(((= >
DefaultErrors((> K
.((K L
BadRequestError((L [
)(([ \
)((\ ]
;((] ^
})) 
}** 	
}++ 
},, ¿2
yC:\Users\Radu\Desktop\Back-upRadu\4thYear\CerganRaduMihai_DevEfficient\DevEfficient_ServerSide\WebApi\Dtos\ResponseDto.cs
	namespace 	
WebApi
 
. 
Dtos 
{ 
public		 

class		 
ResponseDto		 
<		 
T		 
>		 
where		  %
T		& '
:		( )
class		* /
{

 
public 
bool 
	Succeeded 
{ 
get  #
;# $
set% (
;( )
}* +
public 
List 
< 
string 
> 
Errors "
{# $
get% (
;( )
set* -
;- .
}/ 0
public 
T 
Data 
{ 
get 
; 
set  
;  !
}" #
internal 
ResponseDto 
( 
bool !
	succeeded" +
,+ ,
List- 1
<1 2
string2 8
>8 9
errors: @
,@ A
TB C
dataD H
)H I
{ 	
	Succeeded 
= 
	succeeded !
;! "
Errors 
= 
errors 
; 
Data 
= 
data 
; 
} 	
public 
static 
ResponseDto !
<! "
T" #
># $
Success% ,
(, -
T- .
data/ 3
)3 4
{ 	
return 
new 
ResponseDto "
<" #
T# $
>$ %
(% &
true& *
,* +
new, /
List0 4
<4 5
string5 ;
>; <
{= >
}? @
,@ A
dataB F
)F G
;G H
} 	
public 
static 
ResponseDto !
<! "
T" #
># $
Failure% ,
(, -
List- 1
<1 2
string2 8
>8 9
errors: @
)@ A
{ 	
return 
new 
ResponseDto "
<" #
T# $
>$ %
(% &
false& +
,+ ,
errors- 3
,3 4
null5 9
)9 :
;: ;
} 	
public 
static 
ResponseDto !
<! "
T" #
># $
NotFound% -
(- .
). /
{ 	
return   
new   
ResponseDto   "
<  " #
T  # $
>  $ %
(  % &
false  & +
,  + ,
new  - 0
List  1 5
<  5 6
string  6 <
>  < =
{  > ?
DefaultErrors  @ M
.  M N
NotFoundError  N [
}  \ ]
,  ] ^
null  _ c
)  c d
;  d e
}!! 	
public## 
static## 
ResponseDto## !
<##! "
T##" #
>### $

BadRequest##% /
(##/ 0
)##0 1
{$$ 	
return%% 
new%% 
ResponseDto%% "
<%%" #
T%%# $
>%%$ %
(%%% &
false%%& +
,%%+ ,
new%%- 0
List%%1 5
<%%5 6
string%%6 <
>%%< =
{%%> ?
DefaultErrors%%@ M
.%%M N
BadRequestError%%N ]
}%%^ _
,%%_ `
null%%a e
)%%e f
;%%f g
}&& 	
public(( 
bool(( 
EntityNotFound(( "
(((" #
)((# $
{)) 	
return** 
Errors** 
.** 
Contains** "
(**" #
DefaultErrors**# 0
.**0 1
NotFoundError**1 >
)**> ?
;**? @
}++ 	
},, 
public.. 

class.. 
ResponseDto.. 
{// 
public00 
bool00 
	Succeeded00 
{00 
get00  #
;00# $
set00% (
;00( )
}00* +
public11 
List11 
<11 
string11 
>11 
Errors11 "
{11# $
get11% (
;11( )
set11* -
;11- .
}11/ 0
internal33 
ResponseDto33 
(33 
bool33 !
	succeeded33" +
,33+ ,
List33- 1
<331 2
string332 8
>338 9
errors33: @
)33@ A
{44 	
	Succeeded55 
=55 
	succeeded55 !
;55! "
Errors66 
=66 
errors66 
;66 
}77 	
public99 
static99 
ResponseDto99 !
Success99" )
(99) *
)99* +
{:: 	
return;; 
new;; 
ResponseDto;; "
(;;" #
true;;# '
,;;' (
new;;) ,
List;;- 1
<;;1 2
string;;2 8
>;;8 9
{;;: ;
};;< =
);;= >
;;;> ?
}<< 	
public>> 
static>> 
ResponseDto>> !
Failure>>" )
(>>) *
List>>* .
<>>. /
string>>/ 5
>>>5 6
errors>>7 =
)>>= >
{?? 	
return@@ 
new@@ 
ResponseDto@@ "
(@@" #
false@@# (
,@@( )
errors@@* 0
)@@0 1
;@@1 2
}AA 	
publicCC 
staticCC 
ResponseDtoCC !
NotFoundCC" *
(CC* +
)CC+ ,
{DD 	
returnEE 
newEE 
ResponseDtoEE "
(EE" #
falseEE# (
,EE( )
newEE* -
ListEE. 2
<EE2 3
stringEE3 9
>EE9 :
{EE; <
DefaultErrorsEE= J
.EEJ K
NotFoundErrorEEK X
}EEY Z
)EEZ [
;EE[ \
}FF 	
publicHH 
boolHH 
EntityNotFoundHH "
(HH" #
)HH# $
{II 	
returnJJ 
ErrorsJJ 
.JJ 
ContainsJJ "
(JJ" #
DefaultErrorsJJ# 0
.JJ0 1
NotFoundErrorJJ1 >
)JJ> ?
;JJ? @
}KK 	
}LL 
}MM Ø
|C:\Users\Radu\Desktop\Back-upRadu\4thYear\CerganRaduMihai_DevEfficient\DevEfficient_ServerSide\WebApi\Dtos\SignInResponse.cs
	namespace 	
WebApi
 
. 
Dtos 
{ 
public 

class 
SignInResponse 
{		 
public

 
string

 
AccessToken
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
string 
Role 
{ 
get  
;  !
set" %
;% &
}' (
public 
string 
Email 
{ 
get !
;! "
set# &
;& '
}( )
public 
string 
Username 
{  
get! $
;$ %
set& )
;) *
}+ ,
} 
} ü
uC:\Users\Radu\Desktop\Back-upRadu\4thYear\CerganRaduMihai_DevEfficient\DevEfficient_ServerSide\WebApi\Dtos\UserDto.cs
	namespace 	
WebApi
 
. 
Dtos 
{ 
public		 

class		 
UserDto		 
{

 
[ 	
Required	 
] 
[ 	
	MaxLength	 
( 
$num 
) 
] 
public 
string 
UserName 
{  
get! $
;$ %
set& )
;) *
}+ ,
[ 	
Required	 
] 
[ 	
	MaxLength	 
( 
$num 
) 
] 
public 
string 
Password 
{  
get! $
;$ %
set& )
;) *
}+ ,
} 
} ‚
ÅC:\Users\Radu\Desktop\Back-upRadu\4thYear\CerganRaduMihai_DevEfficient\DevEfficient_ServerSide\WebApi\Dtos\UserRegistrationDto.cs
	namespace 	
WebApi
 
. 
Dtos 
{ 
public 

class 
UserRegistrationDto $
{		 
public

 
string

 
Username

 
{

  
get

! $
;

$ %
set

& )
;

) *
}

+ ,
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
string 
PasswordHash "
{# $
get% (
;( )
set* -
;- .
}/ 0
public 
string 
ConfirmPassword %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
public 
string 
FullName 
{  
get! $
;$ %
set& )
;) *
}+ ,
} 
} Ÿ
zC:\Users\Radu\Desktop\Back-upRadu\4thYear\CerganRaduMihai_DevEfficient\DevEfficient_ServerSide\WebApi\Helpers\JwtConfig.cs
	namespace 	
WebApi
 
. 
Helpers 
{ 
public 

class 
	JwtConfig 
{		 
public

 
string

 
Secret

 
{

 
get

 "
;

" #
set

$ '
;

' (
}

) *
} 
} ±
C:\Users\Radu\Desktop\Back-upRadu\4thYear\CerganRaduMihai_DevEfficient\DevEfficient_ServerSide\WebApi\Helpers\MappingProfile.cs
	namespace		 	
WebApi		
 
.		 
Helpers		 
{

 
public 

class 
MappingProfile 
:  
Profile! (
{ 
public 
MappingProfile 
( 
) 
{ 	
	CreateMap 
< 
IdentityUser "
," #
UserRegistrationDto$ 7
>7 8
(8 9
)9 :
;: ;
	CreateMap 
< 
UserRegistrationDto )
,) *
IdentityUser+ 7
>7 8
(8 9
)9 :
;: ;
} 	
} 
} ƒ

pC:\Users\Radu\Desktop\Back-upRadu\4thYear\CerganRaduMihai_DevEfficient\DevEfficient_ServerSide\WebApi\Program.cs
	namespace

 	
WebApi


 
{ 
public 

class 
Program 
{ 
public 
static 
void 
Main 
(  
string  &
[& '
]' (
args) -
)- .
{ 	
CreateHostBuilder 
( 
args "
)" #
.# $
Build$ )
() *
)* +
.+ ,
Run, /
(/ 0
)0 1
;1 2
} 	
public 
static 
IHostBuilder "
CreateHostBuilder# 4
(4 5
string5 ;
[; <
]< =
args> B
)B C
=>D F
Host 
.  
CreateDefaultBuilder %
(% &
args& *
)* +
. $
ConfigureWebHostDefaults )
() *

webBuilder* 4
=>5 7
{ 

webBuilder 
. 

UseStartup )
<) *
Startup* 1
>1 2
(2 3
)3 4
;4 5
} 
) 
; 
} 
} €]
pC:\Users\Radu\Desktop\Back-upRadu\4thYear\CerganRaduMihai_DevEfficient\DevEfficient_ServerSide\WebApi\Startup.cs
	namespace 	
WebApi
 
{ 
public 

class 
Startup 
{ 
public 
Startup 
( 
IConfiguration %
configuration& 3
)3 4
{ 	
Configuration 
= 
configuration )
;) *
} 	
public!! 
IConfiguration!! 
Configuration!! +
{!!, -
get!!. 1
;!!1 2
}!!3 4
public$$ 
void$$ 
ConfigureServices$$ %
($$% &
IServiceCollection$$& 8
services$$9 A
)$$A B
{%% 	
services&& 
.&& 
	Configure&& 
<&& 
	JwtConfig&& (
>&&( )
(&&) *
Configuration&&* 7
.&&7 8

GetSection&&8 B
(&&B C
$str&&C N
)&&N O
)&&O P
;&&P Q
services'' 
.'' 
AddAuthentication'' &
(''& '
options''' .
=>''/ 1
{(( 
options)) 
.)) %
DefaultAuthenticateScheme)) 1
=))2 3
JwtBearerDefaults))4 E
.))E F 
AuthenticationScheme))F Z
;))Z [
options** 
.** 
DefaultScheme** %
=**& '
JwtBearerDefaults**( 9
.**9 : 
AuthenticationScheme**: N
;**N O
options++ 
.++ "
DefaultChallengeScheme++ .
=++/ 0
JwtBearerDefaults++1 B
.++B C 
AuthenticationScheme++C W
;++W X
},, 
),, 
.-- 
AddJwtBearer-- 
(-- 
jwt-- 
=>--  
{--! "
var.. 
key.. 
=.. 
Encoding.. "
..." #
ASCII..# (
...( )
GetBytes..) 1
(..1 2
Configuration..2 ?
[..? @
$str..@ R
]..R S
)..S T
;..T U
jwt// 
.// 
	SaveToken// 
=// 
true//  $
;//$ %
jwt00 
.00 %
TokenValidationParameters00 -
=00. /
new000 3%
TokenValidationParameters004 M
{11 $
ValidateIssuerSigningKey22 ,
=22- .
true22/ 3
,223 4
IssuerSigningKey33 $
=33% &
new33' * 
SymmetricSecurityKey33+ ?
(33? @
key33@ C
)33C D
,33D E
ValidateIssuer44 "
=44# $
false44% *
,44* +
ValidateAudience55 $
=55% &
false55' ,
,55, -
ValidateLifetime66 $
=66% &
true66' +
,66+ ,!
RequireExpirationTime77 )
=77* +
false77, 1
}88 
;88 
}99 
)99 
;99 
services;; 
.;; 
AddControllers;; #
(;;# $
);;$ %
;;;% &
services<< 
.<< 
AddSwaggerGen<< "
(<<" #
c<<# $
=><<% '
{== 
c>> 
.>> 

SwaggerDoc>> 
(>> 
$str>> !
,>>! "
new>># &
OpenApiInfo>>' 2
{>>3 4
Title>>5 :
=>>; <
$str>>= E
,>>E F
Version>>G N
=>>O P
$str>>Q U
}>>V W
)>>W X
;>>X Y
}?? 
)?? 
;?? 
varCC 
mapperConfigCC 
=CC 
newCC "
MapperConfigurationCC# 6
(CC6 7
mcCC7 9
=>CC: <
{DD 
mcEE 
.EE 

AddProfileEE 
(EE 
newEE !
MappingProfileEE" 0
(EE0 1
)EE1 2
)EE2 3
;EE3 4
}FF 
)FF 
;FF 
IMapperHH 
mapperHH 
=HH 
mapperConfigHH )
.HH) *
CreateMapperHH* 6
(HH6 7
)HH7 8
;HH8 9
servicesII 
.II 
AddMemoryCacheII #
(II# $
)II$ %
;II% &
servicesJJ 
.JJ 
AddSingletonJJ !
(JJ! "
mapperJJ" (
)JJ( )
;JJ) *
servicesKK 
.KK 
	AddScopedKK 
<KK  
IDatabaseTransactionKK 3
,KK3 4%
EntityDatabaseTransactionKK5 N
>KKN O
(KKO P
)KKP Q
;KKQ R
servicesLL 
.LL 
	AddScopedLL 
<LL 
IItemServiceLL +
,LL+ ,
ItemServiceLL- 8
>LL8 9
(LL9 :
)LL: ;
;LL; <
servicesMM 
.MM 
	AddScopedMM 
<MM 
ISprintServiceMM -
,MM- .
SprintServiceMM/ <
>MM< =
(MM= >
)MM> ?
;MM? @
servicesNN 
.NN 
	AddScopedNN 
<NN 
ITeamMemberServiceNN 1
,NN1 2
TeamMemberServiceNN3 D
>NND E
(NNE F
)NNF G
;NNG H
servicesOO 
.OO 
	AddScopedOO 
<OO 
IUnitOfWorkOO *
,OO* +

UnitOfWorkOO, 6
>OO6 7
(OO7 8
)OO8 9
;OO9 :
servicesPP 
.PP 
	AddScopedPP 
<PP 
IRepositoryPP *
<PP* +
ItemPP+ /
>PP/ 0
,PP0 1

RepositoryPP2 <
<PP< =
ItemPP= A
>PPA B
>PPB C
(PPC D
)PPD E
;PPE F
servicesQQ 
.QQ 
	AddScopedQQ 
<QQ 
IRepositoryQQ *
<QQ* +
ItemTypeQQ+ 3
>QQ3 4
,QQ4 5

RepositoryQQ6 @
<QQ@ A
ItemTypeQQA I
>QQI J
>QQJ K
(QQK L
)QQL M
;QQM N
servicesRR 
.RR 
	AddScopedRR 
<RR 
IRepositoryRR *
<RR* +
TeamMemberRoleRR+ 9
>RR9 :
,RR: ;

RepositoryRR< F
<RRF G
TeamMemberRoleRRG U
>RRU V
>RRV W
(RRW X
)RRX Y
;RRY Z
servicesSS 
.SS 
	AddScopedSS 
<SS 
IRepositorySS *
<SS* +
StateSS+ 0
>SS0 1
,SS1 2

RepositorySS3 =
<SS= >
StateSS> C
>SSC D
>SSD E
(SSE F
)SSF G
;SSG H
servicesTT 
.TT 
	AddScopedTT 
<TT 
IRepositoryTT *
<TT* +

TeamMemberTT+ 5
>TT5 6
,TT6 7

RepositoryTT8 B
<TTB C

TeamMemberTTC M
>TTM N
>TTN O
(TTO P
)TTP Q
;TTQ R
servicesUU 
.UU 
	AddScopedUU 
<UU 
IItemRepositoryUU .
,UU. /
ItemRepositoryUU0 >
>UU> ?
(UU? @
)UU@ A
;UUA B
servicesVV 
.VV 
	AddScopedVV 
<VV 
IItemTypeRepositoryVV 2
,VV2 3
ItemTypeRepositoryVV4 F
>VVF G
(VVG H
)VVH I
;VVI J
servicesWW 
.WW 
	AddScopedWW 
<WW 
IStateRepositoryWW /
,WW/ 0
StateRepositoryWW1 @
>WW@ A
(WWA B
)WWB C
;WWC D
servicesXX 
.XX 
	AddScopedXX 
<XX 
ISprintRepositoryXX 0
,XX0 1
SprintRepositoryXX2 B
>XXB C
(XXC D
)XXD E
;XXE F
servicesYY 
.YY 
	AddScopedYY 
<YY !
ITeamMemberRepositoryYY 4
,YY4 5 
TeamMemberRepositoryYY6 J
>YYJ K
(YYK L
)YYL M
;YYM N
servicesZZ 
.ZZ 
	AddScopedZZ 
<ZZ %
ITeamMemberRoleRepositoryZZ 8
,ZZ8 9$
TeamMemberRoleRepositoryZZ: R
>ZZR S
(ZZS T
)ZZT U
;ZZU V
services[[ 
.[[ 
AddIdentity[[  
<[[  !
IdentityUser[[! -
,[[- .
IdentityRole[[/ ;
>[[; <
([[< =
options[[= D
=>[[E G
options[[H O
.[[O P
SignIn[[P V
.[[V W#
RequireConfirmedAccount[[W n
=[[o p
true[[q u
)[[u v
.\\ $
AddEntityFrameworkStores\\ &
<\\& '!
DevEfficientDbContext\\' <
>\\< =
(\\= >
)\\> ?
;\\? @
services]] 
.]] 
AddDbContext]] !
<]]! "!
DevEfficientDbContext]]" 7
>]]7 8
(]]8 9
item]]9 =
=>]]> @
item]]A E
.]]E F
UseSqlServer]]F R
(]]R S
Configuration]]S `
.]]` a
GetConnectionString]]a t
(]]t u
$str	]]u É
)
]]É Ñ
)
]]Ñ Ö
)
]]Ö Ü
;
]]Ü á
services^^ 
.^^ 
	Configure^^ 
<^^ 
MailSettings^^ +
>^^+ ,
(^^, -
Configuration^^- :
.^^: ;

GetSection^^; E
(^^E F
$str^^F T
)^^T U
)^^U V
;^^V W
services__ 
.__ 
	AddScoped__ 
<__ 
IEmailSenderService__ 2
,__2 3
EmailSenderService__4 F
>__F G
(__G H
)__H I
;__I J
}`` 
publiccc 
voidcc 
	Configurecc 
(cc 
IApplicationBuildercc 1
appcc2 5
,cc5 6
IWebHostEnvironmentcc7 J
envccK N
)ccN O
{dd 	
ifee 
(ee 
envee 
.ee 
IsDevelopmentee !
(ee! "
)ee" #
)ee# $
{ff 
appgg 
.gg %
UseDeveloperExceptionPagegg -
(gg- .
)gg. /
;gg/ 0
apphh 
.hh 

UseSwaggerhh 
(hh 
)hh  
;hh  !
appii 
.ii 
UseSwaggerUIii  
(ii  !
cii! "
=>ii# %
cii& '
.ii' (
SwaggerEndpointii( 7
(ii7 8
$strii8 R
,iiR S
$striiT _
)ii_ `
)ii` a
;iia b
}jj 
appkk 
.kk 
UseCorskk 
(kk 
xkk 
=>kk 
xkk 
.ll 
WithMethodsll 
(ll 
$strll "
,ll" #
$strll$ *
,ll* +
$strll, 1
,ll1 2
$strll3 ;
,ll; <
$strll= F
)llF G
.mm 
AllowAnyHeadermm 
(mm  
)mm  !
.nn 
SetIsOriginAllowednn #
(nn# $
originnn$ *
=>nn+ -
truenn. 2
)nn2 3
.oo 
AllowCredentialsoo !
(oo! "
)oo" #
)oo# $
;oo$ %
appqq 
.qq 
UseHttpsRedirectionqq #
(qq# $
)qq$ %
;qq% &
appss 
.ss 

UseRoutingss 
(ss 
)ss 
;ss 
appuu 
.uu 
UseAuthenticationuu !
(uu! "
)uu" #
;uu# $
appvv 
.vv 
UseAuthorizationvv  
(vv  !
)vv! "
;vv" #
appyy 
.yy 
UseEndpointsyy 
(yy 
	endpointsyy &
=>yy' )
{zz 
	endpoints{{ 
.{{ 
MapControllers{{ (
({{( )
){{) *
;{{* +
}|| 
)|| 
;|| 
}}} 	
}~~ 
} á
ÅC:\Users\Radu\Desktop\Back-upRadu\4thYear\CerganRaduMihai_DevEfficient\DevEfficient_ServerSide\WebApi\Validation\DefaultErrors.cs
	namespace 	
WebApi
 
. 

Validation 
{ 
public 

static 
class 
DefaultErrors %
{		 
public

 
const

 
string

 
NotFoundError

 )
=

* +
$str

, =
;

= >
public 
const 
string 
BadRequestError +
=, -
$str. A
;A B
public 
static 
List 
< 
string !
>! "
	GetErrors# ,
(, -
params- 3
string4 :
[: ;
]; <
errors= C
)C D
{ 	
var 
result 
= 
new 
List !
<! "
string" (
>( )
() *
)* +
;+ ,
foreach 
( 
var 
error 
in !
errors" (
)( )
{ 
result 
. 
Add 
( 
error  
)  !
;! "
} 
return 
result 
; 
} 	
public 
static 
List 
< 
string !
>! "
	GetErrors# ,
(, -
List- 1
<1 2
string2 8
>8 9
existingErrors: H
,H I
paramsJ P
stringQ W
[W X
]X Y
errorsZ `
)` a
{ 	
var 
result 
= 
new 
List !
<! "
string" (
>( )
() *
)* +
;+ ,
result 
. 
AddRange 
( 
existingErrors *
)* +
;+ ,
foreach 
( 
var 
error 
in !
errors" (
)( )
{ 
result 
. 
Add 
( 
error  
)  !
;! "
} 
return 
result 
; 
}   	
}!! 
}"" 