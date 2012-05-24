@STATIC;1.0;i;33;SPPredicateEditorFloatTextField.ji;35;SPPredicateEditorIntegerTextField.jt;26101;
objj_executeFile("SPPredicateEditorFloatTextField.j",YES);
objj_executeFile("SPPredicateEditorIntegerTextField.j",YES);
CPUndefinedAttributeType=0;
CPInteger16AttributeType=100;
CPInteger32AttributeType=200;
CPInteger64AttributeType=300;
CPDecimalAttributeType=400;
CPDoubleAttributeType=500;
CPFloatAttributeType=600;
CPStringAttributeType=700;
CPBooleanAttributeType=800;
CPDateAttributeType=900;
CPBinaryDataAttributeType=1000;
CPTransformableAttributeType=1800;
var _1=objj_allocateClassPair(CPObject,"SPPredicateEditorRowTemplate"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("_templateType"),new objj_ivar("_predicateOptions"),new objj_ivar("_predicateModifier"),new objj_ivar("_leftAttributeType"),new objj_ivar("_rightAttributeType"),new objj_ivar("_leftIsWildcard"),new objj_ivar("_rightIsWildcard"),new objj_ivar("_views")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("_templateType"),function(_3,_4){
with(_3){
return _templateType;
}
}),new objj_method(sel_getUid("_setTemplateType:"),function(_5,_6,_7){
with(_5){
_templateType=_7;
}
}),new objj_method(sel_getUid("_predicateOptions"),function(_8,_9){
with(_8){
return _predicateOptions;
}
}),new objj_method(sel_getUid("_setOptions:"),function(_a,_b,_c){
with(_a){
_predicateOptions=_c;
}
}),new objj_method(sel_getUid("_predicateModifier"),function(_d,_e){
with(_d){
return _predicateModifier;
}
}),new objj_method(sel_getUid("_setModifier:"),function(_f,_10,_11){
with(_f){
_predicateModifier=_11;
}
}),new objj_method(sel_getUid("leftAttributeType"),function(_12,_13){
with(_12){
return _leftAttributeType;
}
}),new objj_method(sel_getUid("_setLeftAttributeType:"),function(_14,_15,_16){
with(_14){
_leftAttributeType=_16;
}
}),new objj_method(sel_getUid("rightAttributeType"),function(_17,_18){
with(_17){
return _rightAttributeType;
}
}),new objj_method(sel_getUid("_setRightAttributeType:"),function(_19,_1a,_1b){
with(_19){
_rightAttributeType=_1b;
}
}),new objj_method(sel_getUid("leftIsWildcard"),function(_1c,_1d){
with(_1c){
return _leftIsWildcard;
}
}),new objj_method(sel_getUid("setLeftIsWildcard:"),function(_1e,_1f,_20){
with(_1e){
_leftIsWildcard=_20;
}
}),new objj_method(sel_getUid("rightIsWildcard"),function(_21,_22){
with(_21){
return _rightIsWildcard;
}
}),new objj_method(sel_getUid("setRightIsWildcard:"),function(_23,_24,_25){
with(_23){
_rightIsWildcard=_25;
}
}),new objj_method(sel_getUid("_views"),function(_26,_27){
with(_26){
return _views;
}
}),new objj_method(sel_getUid("setTemplateViews:"),function(_28,_29,_2a){
with(_28){
_views=_2a;
}
}),new objj_method(sel_getUid("initWithLeftExpressions:rightExpressions:modifier:operators:options:"),function(_2b,_2c,_2d,_2e,_2f,_30,_31){
with(_2b){
_2b=objj_msgSendSuper({receiver:_2b,super_class:objj_getClass("SPPredicateEditorRowTemplate").super_class},"init");
if(_2b!=nil){
_templateType=1;
_leftIsWildcard=NO;
_rightIsWildcard=NO;
_leftAttributeType=0;
_rightAttributeType=0;
_predicateModifier=_2f;
_predicateOptions=_31;
var _32=objj_msgSend(_2b,"_viewFromExpressions:",_2d),_33=objj_msgSend(_2b,"_viewFromExpressions:",_2e),_34=objj_msgSend(_2b,"_viewFromOperatorTypes:",_30),_35=objj_msgSend(_2b,"_viewFromOptions:",_31);
if(!_35){
_views=objj_msgSend(objj_msgSend(CPArray,"alloc"),"initWithObjects:",_32,_34,_33);
}else{
_views=objj_msgSend(objj_msgSend(CPArray,"alloc"),"initWithObjects:",_32,_34,_33,_35);
}
}
return _2b;
}
}),new objj_method(sel_getUid("initWithLeftExpressions:rightExpressionAttributeType:modifier:operators:options:"),function(_36,_37,_38,_39,_3a,_3b,_3c){
with(_36){
_36=objj_msgSendSuper({receiver:_36,super_class:objj_getClass("SPPredicateEditorRowTemplate").super_class},"init");
if(_36!=nil){
var _3d=objj_msgSend(_36,"_viewFromExpressions:",_38),_3e=objj_msgSend(_36,"_viewFromOperatorTypes:",_3b),_3f=objj_msgSend(_36,"_viewFromAttributeType:",_39),_40=objj_msgSend(_36,"_viewFromOptions:",_3c);
_templateType=1;
_leftIsWildcard=NO;
_rightIsWildcard=YES;
_leftAttributeType=0;
_rightAttributeType=_39;
_predicateModifier=_3a;
_predicateOptions=_3c;
if(!_40){
_views=objj_msgSend(objj_msgSend(CPArray,"alloc"),"initWithObjects:",_3d,_3e,_3f);
}else{
_views=objj_msgSend(objj_msgSend(CPArray,"alloc"),"initWithObjects:",_3d,_3e,_3f,_40);
}
}
return _36;
}
}),new objj_method(sel_getUid("initWithCompoundTypes:"),function(_41,_42,_43){
with(_41){
_41=objj_msgSendSuper({receiver:_41,super_class:objj_getClass("SPPredicateEditorRowTemplate").super_class},"init");
if(_41!=nil){
var _44=objj_msgSend(_41,"_viewFromCompoundTypes:",_43),_45=objj_msgSend(objj_msgSend(CPPopUpButton,"alloc"),"init");
objj_msgSend(_45,"addItemWithTitle:","of the following are true");
_templateType=2;
_leftIsWildcard=NO;
_rightIsWildcard=NO;
_rightAttributeType=0;
_views=objj_msgSend(objj_msgSend(CPArray,"alloc"),"initWithObjects:",_44,_45);
}
return _41;
}
}),new objj_method(sel_getUid("matchForPredicate:"),function(_46,_47,_48){
with(_46){
if(objj_msgSend(_46,"_templateType")==2&&objj_msgSend(_48,"isKindOfClass:",objj_msgSend(CPCompoundPredicate,"class"))){
if(objj_msgSend(objj_msgSend(_46,"compoundTypes"),"containsObject:",objj_msgSend(_48,"compoundPredicateType"))){
return 1;
}
}else{
if(objj_msgSend(_46,"_templateType")==1&&objj_msgSend(_48,"isKindOfClass:",objj_msgSend(CPComparisonPredicate,"class"))){
if(!_leftIsWildcard&&!objj_msgSend(objj_msgSend(_46,"leftExpressions"),"containsObject:",objj_msgSend(_48,"leftExpression"))){
return 0;
}
if(!objj_msgSend(objj_msgSend(_46,"operators"),"containsObject:",objj_msgSend(_48,"predicateOperatorType"))){
return 0;
}
if(!_rightIsWildcard&&!objj_msgSend(objj_msgSend(_46,"rightExpressions"),"containsObject:",objj_msgSend(_48,"rightExpression"))){
return 0;
}
if((objj_msgSend(_46,"options")&objj_msgSend(_48,"options"))==0){
return 0.5;
}
return 1;
}
}
return 0;
}
}),new objj_method(sel_getUid("templateViews"),function(_49,_4a){
with(_49){
return _views;
}
}),new objj_method(sel_getUid("setPredicate:"),function(_4b,_4c,_4d){
with(_4b){
if(_templateType==2){
objj_msgSend(_4b,"_setCompoundPredicate:",_4d);
}else{
objj_msgSend(_4b,"_setComparisonPredicate:",_4d);
}
}
}),new objj_method(sel_getUid("displayableSubpredicatesOfPredicate:"),function(_4e,_4f,_50){
with(_4e){
if(objj_msgSend(_50,"isKindOfClass:",objj_msgSend(CPCompoundPredicate,"class"))){
var _51=objj_msgSend(_50,"subpredicates");
if(objj_msgSend(_51,"count")==0){
return nil;
}
return _51;
}
return nil;
}
}),new objj_method(sel_getUid("predicateWithSubpredicates:"),function(_52,_53,_54){
with(_52){
if(_templateType==2){
var _55=objj_msgSend(objj_msgSend(_views[0],"selectedItem"),"representedObject");
return objj_msgSend(objj_msgSend(CPCompoundPredicate,"alloc"),"initWithType:subpredicates:",_55,_54);
}
if(_templateType==1){
var lhs=objj_msgSend(_52,"_leftExpression"),rhs=objj_msgSend(_52,"_rightExpression"),_56=objj_msgSend(objj_msgSend(_views[1],"selectedItem"),"representedObject"),_57=0;
var _58=objj_msgSend(_52,"options")&&objj_msgSend(_views,"count")>3?objj_msgSend(_views,"objectAtIndex:",3):nil;
if(_58){
_57=objj_msgSend(objj_msgSend(_58,"selectedItem"),"representedObject");
}
return objj_msgSend(CPComparisonPredicate,"predicateWithLeftExpression:rightExpression:modifier:type:options:",lhs,rhs,objj_msgSend(_52,"modifier"),_56,_57);
}
return nil;
}
}),new objj_method(sel_getUid("leftExpressions"),function(_59,_5a){
with(_59){
if(_templateType==1&&!_leftIsWildcard){
var _5b=objj_msgSend(_views,"objectAtIndex:",0);
return objj_msgSend(objj_msgSend(_5b,"itemArray"),"valueForKey:","representedObject");
}
return nil;
}
}),new objj_method(sel_getUid("rightExpressions"),function(_5c,_5d){
with(_5c){
if(_templateType==1&&!_rightIsWildcard){
var _5e=objj_msgSend(_views,"objectAtIndex:",2);
return objj_msgSend(objj_msgSend(_5e,"itemArray"),"valueForKey:","representedObject");
}
return nil;
}
}),new objj_method(sel_getUid("compoundTypes"),function(_5f,_60){
with(_5f){
if(_templateType==2){
var _61=objj_msgSend(_views,"objectAtIndex:",0);
return objj_msgSend(objj_msgSend(_61,"itemArray"),"valueForKey:","representedObject");
}
return nil;
}
}),new objj_method(sel_getUid("modifier"),function(_62,_63){
with(_62){
if(_templateType==1){
return _predicateModifier;
}
return nil;
}
}),new objj_method(sel_getUid("operators"),function(_64,_65){
with(_64){
if(_templateType==1){
var _66=objj_msgSend(_views,"objectAtIndex:",1);
return objj_msgSend(objj_msgSend(_66,"itemArray"),"valueForKey:","representedObject");
}
return nil;
}
}),new objj_method(sel_getUid("options"),function(_67,_68){
with(_67){
if(_templateType==1){
return _predicateOptions;
}
return nil;
}
}),new objj_method(sel_getUid("rightExpressionAttributeType"),function(_69,_6a){
with(_69){
return _rightAttributeType;
}
}),new objj_method(sel_getUid("leftExpressionAttributeType"),function(_6b,_6c){
with(_6b){
return _leftAttributeType;
}
}),new objj_method(sel_getUid("_setCompoundPredicate:"),function(_6d,_6e,_6f){
with(_6d){
var _70=objj_msgSend(_views,"objectAtIndex:",0),_71=objj_msgSend(_6f,"compoundPredicateType"),_72=objj_msgSend(_70,"indexOfItemWithRepresentedObject:",_71);
objj_msgSend(_70,"selectItemAtIndex:",_72);
}
}),new objj_method(sel_getUid("_setComparisonPredicate:"),function(_73,_74,_75){
with(_73){
var _76=nil,_77=objj_msgSend(_views,"objectAtIndex:",0),_78=objj_msgSend(_views,"objectAtIndex:",1),_79=objj_msgSend(_views,"objectAtIndex:",2),_7a=objj_msgSend(_75,"leftExpression"),_7b=objj_msgSend(_75,"rightExpression"),_7c=objj_msgSend(_75,"predicateOperatorType"),_7d=objj_msgSend(_75,"predicateOptions");
if(objj_msgSend(_views,"count")>3){
_76=objj_msgSend(_views,"objectAtIndex:",3);
}
if(_leftIsWildcard){
objj_msgSend(_77,"setObjectValue:",objj_msgSend(_7a,"constantValue"));
}else{
var _7e=objj_msgSend(_77,"indexOfItemWithRepresentedObject:",_7a);
objj_msgSend(_77,"selectItemAtIndex:",_7e);
}
var _7f=objj_msgSend(_78,"indexOfItemWithRepresentedObject:",_7c);
objj_msgSend(_78,"selectItemAtIndex:",_7f);
if(_rightIsWildcard){
objj_msgSend(_79,"setObjectValue:",objj_msgSend(_7b,"constantValue"));
}else{
var _7e=objj_msgSend(_79,"indexOfItemWithRepresentedObject:",_7b);
objj_msgSend(_79,"selectItemAtIndex:",_7e);
}
if(_76&&objj_msgSend(_73,"_shouldSetOptionsForOperatorType:",objj_msgSend(_75,"predicateOperatorType"))){
var _80=objj_msgSend(_76,"indexOfItemWithRepresentedObject:",objj_msgSend(CPNumber,"numberWithInt:",_7d));
objj_msgSend(_76,"setSelectedIndex:",_80);
}
}
}),new objj_method(sel_getUid("_shouldSetOptionsForOperatorType:"),function(_81,_82,_83){
with(_81){
return (_83==CPMatchesPredicateOperatorType||_83==CPLikePredicateOperatorType||_83==CPBeginsWithPredicateOperatorType||_83==CPEndsWithPredicateOperatorType||_83==CPInPredicateOperatorType||_83==CPContainsPredicateOperatorType);
}
}),new objj_method(sel_getUid("_leftExpression"),function(_84,_85){
with(_84){
return objj_msgSend(_84,"_expressionFromView:forAttributeType:",_views[0],_leftAttributeType);
}
}),new objj_method(sel_getUid("_rightExpression"),function(_86,_87){
with(_86){
return objj_msgSend(_86,"_expressionFromView:forAttributeType:",_views[2],_rightAttributeType);
}
}),new objj_method(sel_getUid("_expressionFromView:forAttributeType:"),function(_88,_89,_8a,_8b){
with(_88){
switch(_8b){
case CPUndefinedAttributeType:
return objj_msgSend(objj_msgSend(_8a,"selectedItem"),"representedObject");
case CPInteger16AttributeType:
case CPInteger32AttributeType:
case CPInteger64AttributeType:
case CPDecimalAttributeType:
value=objj_msgSend(_8a,"intValue");
break;
case CPDoubleAttributeType:
case CPFloatAttributeType:
value=objj_msgSend(_8a,"doubleValue");
break;
case CPStringAttributeType:
value=objj_msgSend(_8a,"stringValue");
break;
case CPBooleanAttributeType:
value=objj_msgSend(objj_msgSend(_8a,"selectedItem"),"representedObject");
break;
case CPDateAttributeType:
value=objj_msgSend(_8a,"objectValue");
break;
default:
if(objj_msgSend(_8a,"respondsToSelector:",sel_getUid("objectValue"))){
value=objj_msgSend(_8a,"objectValue");
}else{
if(objj_msgSend(_8a,"respondsToSelector:",sel_getUid("stringValue"))){
value=objj_msgSend(_8a,"stringValue");
}else{
return nil;
}
}
}
return objj_msgSend(CPExpression,"expressionForConstantValue:",value);
}
}),new objj_method(sel_getUid("_rowType"),function(_8c,_8d){
with(_8c){
return (_templateType-1);
}
}),new objj_method(sel_getUid("copy"),function(_8e,_8f){
with(_8e){
return objj_msgSend(CPKeyedUnarchiver,"unarchiveObjectWithData:",objj_msgSend(CPKeyedArchiver,"archivedDataWithRootObject:",_8e));
}
}),new objj_method(sel_getUid("_templateType"),function(_90,_91){
with(_90){
return _templateType;
}
}),new objj_method(sel_getUid("_displayValueForPredicateOperator:"),function(_92,_93,_94){
with(_92){
var _95;
switch(_94){
case CPLessThanPredicateOperatorType:
_95="is less than";
break;
case CPLessThanOrEqualToPredicateOperatorType:
_95="is less than or equal to";
break;
case CPGreaterThanPredicateOperatorType:
_95="is greater than";
break;
case CPGreaterThanOrEqualToPredicateOperatorType:
_95="is greater than or equal to";
break;
case CPEqualToPredicateOperatorType:
_95="is";
break;
case CPNotEqualToPredicateOperatorType:
_95="is not";
break;
case CPMatchesPredicateOperatorType:
_95="matches";
break;
case CPLikePredicateOperatorType:
_95="is like";
break;
case CPBeginsWithPredicateOperatorType:
_95="begins with";
break;
case CPEndsWithPredicateOperatorType:
_95="ends with";
break;
case CPInPredicateOperatorType:
_95="in";
break;
case CPContainsPredicateOperatorType:
_95="contains";
break;
case CPBetweenPredicateOperatorType:
_95="between";
break;
default:
CPLogConsole("unknown predicate operator %d"+_94);
}
return _95;
}
}),new objj_method(sel_getUid("_displayValueForCompoundPredicateType:"),function(_96,_97,_98){
with(_96){
var _99;
switch(_98){
case CPNotPredicateType:
_99="None";
break;
case CPAndPredicateType:
_99="All";
break;
case CPOrPredicateType:
_99="Any";
break;
default:
_99=objj_msgSend(CPString,"stringWithFormat:","unknown compound predicate type %d",_98);
}
return _99;
}
}),new objj_method(sel_getUid("_displayValueForConstantValue:"),function(_9a,_9b,_9c){
with(_9a){
return objj_msgSend(_9c,"description");
}
}),new objj_method(sel_getUid("_displayValueForKeyPath:"),function(_9d,_9e,_9f){
with(_9d){
return _9f;
}
}),new objj_method(sel_getUid("_viewFromExpressions:"),function(_a0,_a1,_a2){
with(_a0){
var _a3=objj_msgSend(objj_msgSend(CPPopUpButton,"alloc"),"initWithFrame:",CPMakeRect(0,0,100,18)),_a4=objj_msgSend(_a2,"count");
for(var i=0;i<_a4;i++){
var exp=_a2[i],_a5=objj_msgSend(exp,"expressionType"),_a6;
switch(_a5){
case CPKeyPathExpressionType:
_a6=objj_msgSend(exp,"description");
break;
case CPConstantValueExpressionType:
_a6=objj_msgSend(_a0,"_displayValueForConstantValue:",objj_msgSend(exp,"constantValue"));
break;
default:
objj_msgSend(CPException,"raise:reason:",CPInvalidArgumentException,"Invalid Expression type "+_a5);
break;
}
var _a7=objj_msgSend(objj_msgSend(CPMenuItem,"alloc"),"initWithTitle:action:keyEquivalent:",_a6,nil,"");
objj_msgSend(_a7,"setRepresentedObject:",exp);
objj_msgSend(_a3,"addItem:",_a7);
}
objj_msgSend(_a3,"sizeToFit");
return _a3;
}
}),new objj_method(sel_getUid("_viewFromOperatorTypes:"),function(_a8,_a9,_aa){
with(_a8){
var _ab=objj_msgSend(objj_msgSend(CPPopUpButton,"alloc"),"initWithFrame:",CGRectMake(0,0,100,18)),_ac=objj_msgSend(_aa,"count");
for(var i=0;i<_ac;i++){
var op=_aa[i],_ad=objj_msgSend(_a8,"_displayValueForPredicateOperator:",op),_ae=objj_msgSend(objj_msgSend(CPMenuItem,"alloc"),"initWithTitle:action:keyEquivalent:",_ad,nil,"");
objj_msgSend(_ae,"setRepresentedObject:",op);
objj_msgSend(_ab,"addItem:",_ae);
}
objj_msgSend(_ab,"sizeToFit");
return _ab;
}
}),new objj_method(sel_getUid("_viewFromOptions:"),function(_af,_b0,_b1){
with(_af){
if(!(_b1&(CPCaseInsensitivePredicateOption|CPDiacriticInsensitivePredicateOption))){
return nil;
}
var _b2=objj_msgSend(objj_msgSend(CPPopUpButton,"alloc"),"initWithFrame:",CGRectMake(0,0,50,26));
var _b3=objj_msgSend(objj_msgSend(CPMenuItem,"alloc"),"initWithTitle:action:keyEquivalent:","case sensitive",nil,nil);
objj_msgSend(_b3,"setRepresentedObject:",objj_msgSend(CPNumber,"numberWithInt:",0));
objj_msgSend(_b2,"addItem:",_b3);
if(_b1&CPCaseInsensitivePredicateOption){
_b3=objj_msgSend(objj_msgSend(CPMenuItem,"alloc"),"initWithTitle:action:keyEquivalent:","case insensitive",nil,nil);
objj_msgSend(_b3,"setRepresentedObject:",objj_msgSend(CPNumber,"numberWithInt:",CPCaseInsensitivePredicateOption));
objj_msgSend(_b2,"addItem:",_b3);
}
if(_b1&CPDiacriticInsensitivePredicateOption){
_b3=objj_msgSend(objj_msgSend(CPMenuItem,"alloc"),"initWithTitle:action:keyEquivalent:","diacritic insensitive",nil,nil);
objj_msgSend(_b3,"setRepresentedObject:",objj_msgSend(CPNumber,"numberWithInt:",CPDiacriticInsensitivePredicateOption));
objj_msgSend(_b2,"addItem:",_b3);
}
if((_b1&CPCaseInsensitivePredicateOption)&&(_b1&CPDiacriticInsensitivePredicateOption)){
_b3=objj_msgSend(objj_msgSend(CPMenuItem,"alloc"),"initWithTitle:action:keyEquivalent:","case + diacritic insensitive",nil,nil);
objj_msgSend(_b3,"setRepresentedObject:",objj_msgSend(CPNumber,"numberWithInt:",CPCaseInsensitivePredicateOption|CPDiacriticInsensitivePredicateOption));
objj_msgSend(_b2,"addItem:",_b3);
}
objj_msgSend(_b2,"sizeToFit");
return _b2;
}
}),new objj_method(sel_getUid("_viewFromCompoundTypes:"),function(_b4,_b5,_b6){
with(_b4){
var _b7=objj_msgSend(objj_msgSend(CPPopUpButton,"alloc"),"initWithFrame:",CGRectMake(0,0,100,18)),_b8=objj_msgSend(_b6,"count");
for(var i=0;i<_b8;i++){
var _b9=_b6[i],_ba=objj_msgSend(_b4,"_displayValueForCompoundPredicateType:",_b9),_bb=objj_msgSend(objj_msgSend(CPMenuItem,"alloc"),"initWithTitle:action:keyEquivalent:",_ba,nil,"");
objj_msgSend(_bb,"setRepresentedObject:",_b9);
objj_msgSend(_b7,"addItem:",_bb);
}
objj_msgSend(_b7,"sizeToFit");
return _b7;
}
}),new objj_method(sel_getUid("_viewFromAttributeType:"),function(_bc,_bd,_be){
with(_bc){
var _bf;
switch(_be){
case CPInteger16AttributeType:
case CPInteger32AttributeType:
case CPInteger64AttributeType:
case CPDecimalAttributeType:
_bf=objj_msgSend(_bc,"_integerTextFieldWithFrame:",CGRectMake(0,0,50,26));
break;
case CPDoubleAttributeType:
case CPFloatAttributeType:
_bf=objj_msgSend(_bc,"_floatTextFieldWithFrame:",CGRectMake(0,0,50,26));
break;
case CPStringAttributeType:
_bf=objj_msgSend(_bc,"_textFieldWithFrame:",CGRectMake(0,0,150,26));
break;
case CPBooleanAttributeType:
_bf=objj_msgSend(objj_msgSend(CPPopUpButton,"alloc"),"initWithFrame:",CGRectMake(0,0,50,26));
var _c0=objj_msgSend(objj_msgSend(CPMenuItem,"alloc"),"initWithTitle:action:keyEquivalent:","true",nil,nil);
objj_msgSend(_c0,"setRepresentedObject:",objj_msgSend(CPNumber,"numberWithBool:",YES));
objj_msgSend(_bf,"addItem:",_c0);
_c0=objj_msgSend(objj_msgSend(CPMenuItem,"alloc"),"initWithTitle:action:keyEquivalent:","false",nil,nil);
objj_msgSend(_c0,"setRepresentedObject:",objj_msgSend(CPNumber,"numberWithBool:",NO));
objj_msgSend(_bf,"addItem:",_c0);
break;
case CPDateAttributeType:
_bf=objj_msgSend(objj_msgSend(CPDatePicker,"alloc"),"initWithFrame:",CGRectMake(0,0,150,26));
break;
default:
return nil;
}
objj_msgSend(_bf,"setTag:",_be);
return _bf;
}
}),new objj_method(sel_getUid("_textFieldWithFrame:"),function(_c1,_c2,_c3){
with(_c1){
var _c4=objj_msgSend(objj_msgSend(CPTextField,"alloc"),"initWithFrame:",_c3);
objj_msgSend(_c4,"setBezeled:",YES);
objj_msgSend(_c4,"setBezelStyle:",CPTextFieldSquareBezel);
objj_msgSend(_c4,"setBordered:",YES);
objj_msgSend(_c4,"setEditable:",YES);
objj_msgSend(_c4,"setFont:",objj_msgSend(CPFont,"systemFontOfSize:",10));
return _c4;
}
}),new objj_method(sel_getUid("_integerTextFieldWithFrame:"),function(_c5,_c6,_c7){
with(_c5){
var _c8=objj_msgSend(objj_msgSend(SPPredicateEditorIntegerTextField,"alloc"),"initWithFrame:",_c7);
objj_msgSend(_c8,"setBezeled:",YES);
objj_msgSend(_c8,"setBezelStyle:",CPTextFieldSquareBezel);
objj_msgSend(_c8,"setBordered:",YES);
objj_msgSend(_c8,"setEditable:",YES);
objj_msgSend(_c8,"setFont:",objj_msgSend(CPFont,"systemFontOfSize:",10));
return _c8;
}
}),new objj_method(sel_getUid("_floatTextFieldWithFrame:"),function(_c9,_ca,_cb){
with(_c9){
var _cc=objj_msgSend(objj_msgSend(SPPredicateEditorFloatTextField,"alloc"),"initWithFrame:",_cb);
objj_msgSend(_cc,"setBezeled:",YES);
objj_msgSend(_cc,"setBezelStyle:",CPTextFieldSquareBezel);
objj_msgSend(_cc,"setBordered:",YES);
objj_msgSend(_cc,"setEditable:",YES);
objj_msgSend(_cc,"setFont:",objj_msgSend(CPFont,"systemFontOfSize:",10));
return _cc;
}
}),new objj_method(sel_getUid("_setOptions:"),function(_cd,_ce,_cf){
with(_cd){
if(_predicateOptions==_cf){
return;
}
if(_predicateOptions&&!_cf){
objj_msgSend(_views,"removeObjectAtIndex:",3);
}else{
if(!_predicateOptions&&_cf){
var _d0=objj_msgSend(_cd,"_viewFromOptions:",_cf);
if(!_d0){
return;
}
objj_msgSend(_views,"addObject:",_d0);
}
}
_predicateOptions=_cf;
}
}),new objj_method(sel_getUid("_setModifier:"),function(_d1,_d2,_d3){
with(_d1){
_predicateModifier=_d3;
}
}),new objj_method(sel_getUid("preProcessCriteria:"),function(_d4,_d5,_d6){
with(_d4){
if(!objj_msgSend(_d4,"options")||objj_msgSend(_d6,"count")<4){
return _d6;
}
var _d7=objj_msgSend(_d6,"objectAtIndex:",1);
var _d8=objj_msgSend(_d6,"objectAtIndex:",3);
var _d9=objj_msgSend(objj_msgSend(_d7,"displayValue"),"representedObject");
objj_msgSend(_d8,"setHidden:",!objj_msgSend(_d4,"_shouldSetOptionsForOperatorType:",_d9));
return _d6;
}
}),new objj_method(sel_getUid("description"),function(_da,_db){
with(_da){
if(_templateType==2){
return objj_msgSend(CPString,"stringWithFormat:","<%@ %p %@>",objj_msgSend(_da,"className"),_da,objj_msgSend(objj_msgSend(_da,"compoundTypes"),"componentsJoinedByString:",", "));
}else{
if(_templateType==1&&_rightIsWildcard){
return objj_msgSend(CPString,"stringWithFormat:","<%@ %p [%@] [%@] %d>",objj_msgSend(_da,"className"),_da,objj_msgSend(objj_msgSend(_da,"leftExpressions"),"componentsJoinedByString:",", "),objj_msgSend(objj_msgSend(_da,"operators"),"componentsJoinedByString:",", "),objj_msgSend(_da,"rightExpressionAttributeType"));
}else{
return objj_msgSend(CPString,"stringWithFormat:","<%@ %p [%@] [%@] [%@]>",objj_msgSend(_da,"className"),_da,objj_msgSend(objj_msgSend(_da,"leftExpressions"),"componentsJoinedByString:",", "),objj_msgSend(objj_msgSend(_da,"operators"),"componentsJoinedByString:",", "),objj_msgSend(objj_msgSend(_da,"rightExpressions"),"componentsJoinedByString:",", "));
}
}
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("_bestMatchForPredicate:inTemplates:quality:"),function(_dc,_dd,_de,_df,_e0){
with(_dc){
var _e1=objj_msgSend(_df,"count"),_e2=0,_e3=CPNotFound,i;
for(i=0;i<_e1;i++){
var _e4=objj_msgSend(_df,"objectAtIndex:",i),_e5=objj_msgSend(_e4,"matchForPredicate:",_de);
if(_e5>_e2){
_e3=i;
_e2=_e5;
}
}
if(_e3==CPNotFound){
objj_msgSend(CPException,"raise:reason:",CPRangeException,"Unable to find template matching predicate: "+objj_msgSend(_de,"predicateFormat"));
return nil;
}
return objj_msgSend(_df,"objectAtIndex:",_e3);
}
}),new objj_method(sel_getUid("_operatorsForAttributeType:"),function(_e6,_e7,_e8){
with(_e6){
var _e9=objj_msgSend(CPMutableArray,"array");
switch(_e8){
case CPInteger16AttributeType:
objj_msgSend(_e9,"addObjects:",4,5,0,2,1,3);
break;
case CPInteger32AttributeType:
objj_msgSend(_e9,"addObjects:",4,5,0,2,1,3);
break;
case CPInteger64AttributeType:
objj_msgSend(_e9,"addObjects:",4,5,0,2,1,3);
break;
case CPDecimalAttributeType:
objj_msgSend(_e9,"addObjects:",4,5,0,2,1,3);
break;
case CPDoubleAttributeType:
objj_msgSend(_e9,"addObjects:",4,5,0,2,1,3);
break;
case CPFloatAttributeType:
objj_msgSend(_e9,"addObjects:",4,5,0,2,1,3);
break;
case CPStringAttributeType:
objj_msgSend(_e9,"addObjects:",99,4,5,8,9);
break;
case CPBooleanAttributeType:
objj_msgSend(_e9,"addObjects:",4,5);
break;
case CPDateAttributeType:
objj_msgSend(_e9,"addObjects:",4,5,0,2,1,3);
break;
default:
CPLogConsole("Cannot create operators for an CPAttributeType "+_e8);
break;
}
return _e9;
}
})]);
var _ea="CPPredicateTemplateType",_eb="CPPredicateTemplateOptions",_ec="CPPredicateTemplateModifier",_ed="CPPredicateTemplateLeftAttributeType",_ee="CPPredicateTemplateRightAttributeType",_ef="CPPredicateTemplateLeftIsWildcard",_f0="CPPredicateTemplateRightIsWildcard",_f1="CPPredicateTemplateViews";
var _1=objj_getClass("SPPredicateEditorRowTemplate");
if(!_1){
throw new SyntaxError("*** Could not find definition for class \"SPPredicateEditorRowTemplate\"");
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("initWithCoder:"),function(_f2,_f3,_f4){
with(_f2){
_f2=objj_msgSendSuper({receiver:_f2,super_class:objj_getClass("SPPredicateEditorRowTemplate").super_class},"init");
if(_f2!=nil){
_templateType=objj_msgSend(_f4,"decodeIntForKey:",_ea);
_predicateOptions=objj_msgSend(_f4,"decodeIntForKey:",_eb);
_predicateModifier=objj_msgSend(_f4,"decodeIntForKey:",_ec);
_leftAttributeType=objj_msgSend(_f4,"decodeIntForKey:",_ed);
_rightAttributeType=objj_msgSend(_f4,"decodeIntForKey:",_ee);
_leftIsWildcard=objj_msgSend(_f4,"decodeBoolForKey:",_ef);
_rightIsWildcard=objj_msgSend(_f4,"decodeBoolForKey:",_f0);
_views=objj_msgSend(_f4,"decodeObjectForKey:",_f1);
if(_templateType==1&&_leftIsWildcard==NO){
var _f5=objj_msgSend(_views[0],"itemArray"),_f6=objj_msgSend(_f5,"count");
for(var i=0;i<_f6;i++){
var _f7=_f5[i];
if(objj_msgSend(_f7,"representedObject")==nil){
var exp=objj_msgSend(CPExpression,"expressionForKeyPath:",objj_msgSend(_f7,"title"));
objj_msgSend(_f7,"setRepresentedObject:",exp);
}
}
}
}
return _f2;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_f8,_f9,_fa){
with(_f8){
objj_msgSend(_fa,"encodeInt:forKey:",_templateType,_ea);
objj_msgSend(_fa,"encodeInt:forKey:",_predicateOptions,_eb);
objj_msgSend(_fa,"encodeInt:forKey:",_predicateModifier,_ec);
objj_msgSend(_fa,"encodeInt:forKey:",_leftAttributeType,_ed);
objj_msgSend(_fa,"encodeInt:forKey:",_rightAttributeType,_ee);
objj_msgSend(_fa,"encodeBool:forKey:",_leftIsWildcard,_ef);
objj_msgSend(_fa,"encodeBool:forKey:",_rightIsWildcard,_f0);
objj_msgSend(_fa,"encodeObject:forKey:",_views,_f1);
}
})]);
