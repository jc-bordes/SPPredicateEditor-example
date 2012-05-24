@STATIC;1.0;I;21;Foundation/CPObject.jI;21;AppKit/CPScrollView.jI;27;AppKit/CPSegmentedControl.ji;22;LPMultiLineTextField.jI;26;AppKit/CPPredicateEditor.jt;9808;
objj_executeFile("Foundation/CPObject.j",NO);
objj_executeFile("AppKit/CPScrollView.j",NO);
objj_executeFile("AppKit/CPSegmentedControl.j",NO);
objj_executeFile("LPMultiLineTextField.j",YES);
objj_executeFile("AppKit/CPPredicateEditor.j",NO);
var _1=objj_allocateClassPair(CPObject,"AppController"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("theWindow"),new objj_ivar("scrollView"),new objj_ivar("editor"),new objj_ivar("predicateField"),new objj_ivar("refreshButton"),new objj_ivar("autoRefreshButton"),new objj_ivar("rowHeightField"),new objj_ivar("bgView"),new objj_ivar("appView"),new objj_ivar("_autoRefresh")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("applicationDidFinishLaunching:"),function(_3,_4,_5){
with(_3){
objj_msgSend(bgView,"setBackgroundColor:",objj_msgSend(CPColor,"colorWithHexString:","777777"));
objj_msgSend(appView,"setBackgroundColor:",objj_msgSend(CPColor,"colorWithHexString:","ededed"));
var _6=appView._DOMElement;
_6.style.borderRadius="10px";
_6.style.boxShadow="rgba(0, 0, 0, 0.5) 0px 0px 30px";
_6.style.mozBoxShadow="rgba(0, 0, 0, 0.5) 0px 0px 30px";
_6.style.webkitBoxShadow="rgba(0, 0, 0, 0.5) 0px 0px 30px";
_autoRefresh=(objj_msgSend(autoRefreshButton,"state")==CPOnState);
objj_msgSend(rowHeightField,"setStringValue:",objj_msgSend(editor,"rowHeight"));
var _7=objj_msgSend(CPMutableArray,"array");
objj_msgSend(_7,"addObject:",objj_msgSend(_3,"compoundRowTemplate"));
objj_msgSend(_7,"addObject:",objj_msgSend(_3,"rowTemplateWithLeftKeys:rightConstants:",["os"],["iOS","android","webapp"]));
objj_msgSend(_7,"addObject:",objj_msgSend(_3,"rowTemplateWithStringEditorAndLeftKeys:options:",["model"],CPCaseInsensitivePredicateOption|CPDiacriticInsensitivePredicateOption));
objj_msgSend(_7,"addObject:",objj_msgSend(_3,"rowTemplateWithStringEditorAndLeftKeys:options:",["code"],0));
objj_msgSend(_7,"addObject:",objj_msgSend(_3,"rowTemplateWithBooleanEditorAndLeftKeys:",["registered","connected"]));
objj_msgSend(_7,"addObject:",objj_msgSend(_3,"rowTemplateWithIntegerEditorAndLeftKeys:",["nbCx"]));
objj_msgSend(_7,"addObject:",objj_msgSend(_3,"rowTemplateWithFloatEditorAndLeftKeys:",["rating"]));
objj_msgSend(editor,"setRowTemplates:",_7);
objj_msgSend(editor,"addRow:",nil);
}
}),new objj_method(sel_getUid("awakeFromCib"),function(_8,_9){
with(_8){
objj_msgSend(theWindow,"setFullPlatformWindow:",YES);
objj_msgSend(CPScrollView,"setGlobalScrollerStyle:",CPScrollerStyleOverlay);
objj_msgSend(scrollView,"setBackgroundColor:",objj_msgSend(CPColor,"colorWithHexString:","ededed"));
objj_msgSend(objj_msgSend(theWindow,"contentView"),"setBackgroundColor:",objj_msgSend(CPColor,"colorWithHexString:","ededed"));
objj_msgSend(predicateField,"setTextColor:",objj_msgSend(CPColor,"blackColor"));
objj_msgSend(predicateField,"setEditable:",NO);
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"addObserver:selector:name:object:",_8,sel_getUid("rowsDidChange:"),CPRuleEditorRowsDidChangeNotification,editor);
}
}),new objj_method(sel_getUid("refreshPredicate"),function(_a,_b){
with(_a){
objj_msgSend(editor,"reloadPredicate");
var _c=objj_msgSend(editor,"predicate");
var _d=objj_msgSend(_c,"predicateFormat");
objj_msgSend(predicateField,"setStringValue:",_d);
}
}),new objj_method(sel_getUid("roundtripPredicate"),function(_e,_f){
with(_e){
var _10=_autoRefresh;
_autoRefresh=NO;
objj_msgSend(editor,"reloadPredicate");
var _11=objj_msgSend(editor,"predicate");
var _12=objj_msgSend(_11,"predicateFormat");
objj_msgSend(editor,"setObjectValue:",_11);
_11=objj_msgSend(editor,"predicate");
var _13=objj_msgSend(_11,"predicateFormat");
objj_msgSend(predicateField,"setStringValue:",_13);
_autoRefresh=_10;
objj_msgSend(_e,"showRoundtripResult:",(_12===_13));
}
}),new objj_method(sel_getUid("showRoundtripResult:"),function(_14,_15,ok){
with(_14){
var _16;
var _16=ok?objj_msgSend(CPAlert,"alertWithMessageText:defaultButton:alternateButton:otherButton:informativeTextWithFormat:","Successful round trip","Continue",nil,nil,nil):objj_msgSend(CPAlert,"alertWithError:","Round trip failed");
objj_msgSend(_16,"setTitle:","Round trip result");
objj_msgSend(_16,"runModal");
}
}),new objj_method(sel_getUid("rowsDidChange:"),function(_17,_18,_19){
with(_17){
if(_autoRefresh){
objj_msgSend(_17,"refreshPredicate");
}
}
}),new objj_method(sel_getUid("stateChanged:"),function(_1a,_1b,_1c){
with(_1a){
objj_msgSend(editor,"setEditable:",objj_msgSend(_1c,"selectedSegment")==0);
}
}),new objj_method(sel_getUid("modeChanged:"),function(_1d,_1e,_1f){
with(_1d){
var _20=objj_msgSend(_1f,"selectedSegment");
switch(_20){
case 0:
objj_msgSend(editor,"setNestingMode:",CPRuleEditorNestingModeCompound);
objj_msgSend(editor,"addRow:",nil);
break;
case 1:
objj_msgSend(editor,"setNestingMode:",CPRuleEditorNestingModeSimple);
objj_msgSend(editor,"addRow:",nil);
break;
case 2:
objj_msgSend(editor,"setNestingMode:",CPRuleEditorNestingModeList);
objj_msgSend(editor,"addRow:",nil);
break;
case 3:
objj_msgSend(editor,"setNestingMode:",CPRuleEditorNestingModeSingle);
objj_msgSend(editor,"addRow:",nil);
break;
}
}
}),new objj_method(sel_getUid("rowHeightChanged:"),function(_21,_22,_23){
with(_21){
var _24=objj_msgSend(objj_msgSend(_23,"stringValue"),"floatValue");
objj_msgSend(editor,"setRowHeight:",_24);
objj_msgSend(_23,"setStringValue:",objj_msgSend(editor,"rowHeight"));
}
}),new objj_method(sel_getUid("autoRefreshClicked:"),function(_25,_26,_27){
with(_25){
if(objj_msgSend(_27,"state")==CPOffState){
_autoRefresh=NO;
objj_msgSend(refreshButton,"setEnabled:",YES);
return;
}
_autoRefresh=YES;
objj_msgSend(refreshButton,"setEnabled:",NO);
objj_msgSend(_25,"refreshPredicate");
}
}),new objj_method(sel_getUid("refreshClicked:"),function(_28,_29,_2a){
with(_28){
objj_msgSend(_28,"refreshPredicate");
}
}),new objj_method(sel_getUid("roundTripClicked:"),function(_2b,_2c,_2d){
with(_2b){
objj_msgSend(_2b,"roundtripPredicate");
}
}),new objj_method(sel_getUid("compoundRowTemplate"),function(_2e,_2f){
with(_2e){
return objj_msgSend(objj_msgSend(CPPredicateEditorRowTemplate,"alloc"),"initWithCompoundTypes:",[1,2,0]);
}
}),new objj_method(sel_getUid("rowTemplateWithStringEditorAndLeftKeys:options:"),function(_30,_31,_32,_33){
with(_30){
if(!_32){
return;
}
var _34=[CPEqualToPredicateOperatorType,CPNotEqualToPredicateOperatorType,CPLikePredicateOperatorType,CPBeginsWithPredicateOperatorType,CPEndsWithPredicateOperatorType,CPMatchesPredicateOperatorType];
var _35=objj_msgSend(CPMutableArray,"array");
for(var i=0;i<objj_msgSend(_32,"count");i++){
objj_msgSend(_35,"addObject:",objj_msgSend(CPExpression,"expressionForKeyPath:",objj_msgSend(_32,"objectAtIndex:",i)));
}
return objj_msgSend(objj_msgSend(CPPredicateEditorRowTemplate,"alloc"),"initWithLeftExpressions:rightExpressionAttributeType:modifier:operators:options:",_35,CPStringAttributeType,0,_34,_33);
}
}),new objj_method(sel_getUid("rowTemplateWithLeftKeys:rightConstants:"),function(_36,_37,_38,_39){
with(_36){
if(!_38||!_39){
return;
}
var _3a=[CPEqualToPredicateOperatorType,CPNotEqualToPredicateOperatorType];
var _3b=objj_msgSend(CPMutableArray,"array");
for(var i=0;i<objj_msgSend(_38,"count");i++){
objj_msgSend(_3b,"addObject:",objj_msgSend(CPExpression,"expressionForKeyPath:",objj_msgSend(_38,"objectAtIndex:",i)));
}
var _3c=objj_msgSend(CPMutableArray,"array");
for(var i=0;i<objj_msgSend(_39,"count");i++){
objj_msgSend(_3c,"addObject:",objj_msgSend(CPExpression,"expressionForConstantValue:",objj_msgSend(_39,"objectAtIndex:",i)));
}
return objj_msgSend(objj_msgSend(CPPredicateEditorRowTemplate,"alloc"),"initWithLeftExpressions:rightExpressions:modifier:operators:options:",_3b,_3c,0,_3a,0);
}
}),new objj_method(sel_getUid("rowTemplateWithBooleanEditorAndLeftKeys:"),function(_3d,_3e,_3f){
with(_3d){
if(!_3f){
return;
}
var _40=[CPEqualToPredicateOperatorType,CPNotEqualToPredicateOperatorType];
var _41=objj_msgSend(CPMutableArray,"array");
for(var i=0;i<objj_msgSend(_3f,"count");i++){
objj_msgSend(_41,"addObject:",objj_msgSend(CPExpression,"expressionForKeyPath:",objj_msgSend(_3f,"objectAtIndex:",i)));
}
return objj_msgSend(objj_msgSend(CPPredicateEditorRowTemplate,"alloc"),"initWithLeftExpressions:rightExpressionAttributeType:modifier:operators:options:",_41,CPBooleanAttributeType,0,_40,0);
}
}),new objj_method(sel_getUid("rowTemplateWithFloatEditorAndLeftKeys:"),function(_42,_43,_44){
with(_42){
if(!_44){
return;
}
var _45=[CPEqualToPredicateOperatorType,CPNotEqualToPredicateOperatorType,CPGreaterThanOrEqualToPredicateOperatorType,CPGreaterThanPredicateOperatorType,CPLessThanOrEqualToPredicateOperatorType,CPLessThanPredicateOperatorType];
var _46=objj_msgSend(CPMutableArray,"array");
for(var i=0;i<objj_msgSend(_44,"count");i++){
objj_msgSend(_46,"addObject:",objj_msgSend(CPExpression,"expressionForKeyPath:",objj_msgSend(_44,"objectAtIndex:",i)));
}
return objj_msgSend(objj_msgSend(CPPredicateEditorRowTemplate,"alloc"),"initWithLeftExpressions:rightExpressionAttributeType:modifier:operators:options:",_46,CPDoubleAttributeType,0,_45,0);
}
}),new objj_method(sel_getUid("rowTemplateWithIntegerEditorAndLeftKeys:"),function(_47,_48,_49){
with(_47){
if(!_49){
return;
}
var _4a=[CPEqualToPredicateOperatorType,CPNotEqualToPredicateOperatorType,CPGreaterThanOrEqualToPredicateOperatorType,CPGreaterThanPredicateOperatorType,CPLessThanOrEqualToPredicateOperatorType,CPLessThanPredicateOperatorType];
var _4b=objj_msgSend(CPMutableArray,"array");
for(var i=0;i<objj_msgSend(_49,"count");i++){
objj_msgSend(_4b,"addObject:",objj_msgSend(CPExpression,"expressionForKeyPath:",objj_msgSend(_49,"objectAtIndex:",i)));
}
return objj_msgSend(objj_msgSend(CPPredicateEditorRowTemplate,"alloc"),"initWithLeftExpressions:rightExpressionAttributeType:modifier:operators:options:",_4b,CPInteger64AttributeType,0,_4a,0);
}
})]);
