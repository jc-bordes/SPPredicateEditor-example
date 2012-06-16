@STATIC;1.0;p;15;AppController.jt;9991;@STATIC;1.0;I;21;Foundation/CPObject.jI;21;AppKit/CPScrollView.jI;27;AppKit/CPSegmentedControl.ji;22;LPMultiLineTextField.jI;37;SPPredicateEditor/SPPredicateEditor.jt;9819;
objj_executeFile("Foundation/CPObject.j",NO);
objj_executeFile("AppKit/CPScrollView.j",NO);
objj_executeFile("AppKit/CPSegmentedControl.j",NO);
objj_executeFile("LPMultiLineTextField.j",YES);
objj_executeFile("SPPredicateEditor/SPPredicateEditor.j",NO);
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
return objj_msgSend(objj_msgSend(SPPredicateEditorRowTemplate,"alloc"),"initWithCompoundTypes:",[1,2,0]);
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
return objj_msgSend(objj_msgSend(SPPredicateEditorRowTemplate,"alloc"),"initWithLeftExpressions:rightExpressionAttributeType:modifier:operators:options:",_35,CPStringAttributeType,0,_34,_33);
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
return objj_msgSend(objj_msgSend(SPPredicateEditorRowTemplate,"alloc"),"initWithLeftExpressions:rightExpressions:modifier:operators:options:",_3b,_3c,0,_3a,0);
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
return objj_msgSend(objj_msgSend(SPPredicateEditorRowTemplate,"alloc"),"initWithLeftExpressions:rightExpressionAttributeType:modifier:operators:options:",_41,CPBooleanAttributeType,0,_40,0);
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
return objj_msgSend(objj_msgSend(SPPredicateEditorRowTemplate,"alloc"),"initWithLeftExpressions:rightExpressionAttributeType:modifier:operators:options:",_46,CPDoubleAttributeType,0,_45,0);
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
return objj_msgSend(objj_msgSend(SPPredicateEditorRowTemplate,"alloc"),"initWithLeftExpressions:rightExpressionAttributeType:modifier:operators:options:",_4b,CPInteger64AttributeType,0,_4a,0);
}
})]);
p;22;LPMultiLineTextField.jt;9646;@STATIC;1.0;I;20;AppKit/CPTextField.jt;9602;
objj_executeFile("AppKit/CPTextField.j",NO);
var _1=nil;
var _2=objj_allocateClassPair(CPTextField,"LPMultiLineTextField"),_3=_2.isa;
class_addIvars(_2,[new objj_ivar("_DOMTextareaElement"),new objj_ivar("_stringValue"),new objj_ivar("_hideOverflow")]);
objj_registerClassPair(_2);
class_addMethods(_2,[new objj_method(sel_getUid("_DOMTextareaElement"),function(_4,_5){
with(_4){
if(!_DOMTextareaElement){
_DOMTextareaElement=document.createElement("textarea");
_DOMTextareaElement.style.position="absolute";
_DOMTextareaElement.style.background="none";
_DOMTextareaElement.style.border="0";
_DOMTextareaElement.style.outline="0";
_DOMTextareaElement.style.zIndex="100";
_DOMTextareaElement.style.resize="none";
_DOMTextareaElement.style.padding="0";
_DOMTextareaElement.style.margin="0";
_DOMTextareaElement.onblur=function(){
objj_msgSend(objj_msgSend(_1,"window"),"makeFirstResponder:",nil);
_1=nil;
};
_4._DOMElement.appendChild(_DOMTextareaElement);
}
return _DOMTextareaElement;
}
}),new objj_method(sel_getUid("initWithFrame:"),function(_6,_7,_8){
with(_6){
if(_6=objj_msgSendSuper({receiver:_6,super_class:objj_getClass("LPMultiLineTextField").super_class},"initWithFrame:",_8)){
}
return _6;
}
}),new objj_method(sel_getUid("isScrollable"),function(_9,_a){
with(_9){
return !_hideOverflow;
}
}),new objj_method(sel_getUid("setScrollable:"),function(_b,_c,_d){
with(_b){
_hideOverflow=!_d;
}
}),new objj_method(sel_getUid("setEditable:"),function(_e,_f,_10){
with(_e){
objj_msgSend(_e,"_DOMTextareaElement").style.cursor=_10?"cursor":"default";
objj_msgSendSuper({receiver:_e,super_class:objj_getClass("LPMultiLineTextField").super_class},"setEditable:",_10);
}
}),new objj_method(sel_getUid("selectText:"),function(_11,_12,_13){
with(_11){
objj_msgSend(_11,"_DOMTextareaElement").select();
}
}),new objj_method(sel_getUid("layoutSubviews"),function(_14,_15){
with(_14){
objj_msgSendSuper({receiver:_14,super_class:objj_getClass("LPMultiLineTextField").super_class},"layoutSubviews");
var _16=objj_msgSend(_14,"layoutEphemeralSubviewNamed:positioned:relativeToEphemeralSubviewNamed:","content-view",CPWindowAbove,"bezel-view");
objj_msgSend(_16,"setHidden:",YES);
var _17=objj_msgSend(_14,"_DOMTextareaElement"),_18=objj_msgSend(_14,"currentValueForThemeAttribute:","content-inset"),_19=objj_msgSend(_14,"bounds");
_17.style.top=_18.top+"px";
_17.style.bottom=_18.bottom+"px";
_17.style.left=_18.left+"px";
_17.style.right=_18.right+"px";
_17.style.width=(CGRectGetWidth(_19)-_18.left-_18.right)+"px";
_17.style.height=(CGRectGetHeight(_19)-_18.top-_18.bottom)+"px";
_17.style.color=objj_msgSend(objj_msgSend(_14,"currentValueForThemeAttribute:","text-color"),"cssString");
_17.style.font=objj_msgSend(objj_msgSend(_14,"currentValueForThemeAttribute:","font"),"cssString");
switch(objj_msgSend(_14,"currentValueForThemeAttribute:","alignment")){
case CPLeftTextAlignment:
_17.style.textAlign="left";
break;
case CPJustifiedTextAlignment:
_17.style.textAlign="justify";
break;
case CPCenterTextAlignment:
_17.style.textAlign="center";
break;
case CPRightTextAlignment:
_17.style.textAlign="right";
break;
default:
_17.style.textAlign="left";
}
_17.value=_stringValue||"";
if(_hideOverflow){
_17.style.overflow="hidden";
}
}
}),new objj_method(sel_getUid("scrollWheel:"),function(_1a,_1b,_1c){
with(_1a){
var _1d=objj_msgSend(_1a,"_DOMTextareaElement");
_1d.scrollLeft+=_1c._deltaX;
_1d.scrollTop+=_1c._deltaY;
}
}),new objj_method(sel_getUid("mouseDown:"),function(_1e,_1f,_20){
with(_1e){
if(objj_msgSend(_1e,"isEditable")&&objj_msgSend(_1e,"isEnabled")){
objj_msgSend(objj_msgSend(objj_msgSend(_1e,"window"),"platformWindow"),"_propagateCurrentDOMEvent:",YES);
}else{
objj_msgSendSuper({receiver:_1e,super_class:objj_getClass("LPMultiLineTextField").super_class},"mouseDown:",_20);
}
}
}),new objj_method(sel_getUid("mouseDragged:"),function(_21,_22,_23){
with(_21){
return objj_msgSend(objj_msgSend(objj_msgSend(_23,"window"),"platformWindow"),"_propagateCurrentDOMEvent:",YES);
}
}),new objj_method(sel_getUid("keyUp:"),function(_24,_25,_26){
with(_24){
if(_stringValue!==objj_msgSend(_24,"stringValue")){
_stringValue=objj_msgSend(_24,"stringValue");
if(!_isEditing){
_isEditing=YES;
objj_msgSend(_24,"textDidBeginEditing:",objj_msgSend(CPNotification,"notificationWithName:object:userInfo:",CPControlTextDidBeginEditingNotification,_24,nil));
}
objj_msgSend(_24,"textDidChange:",objj_msgSend(CPNotification,"notificationWithName:object:userInfo:",CPControlTextDidChangeNotification,_24,nil));
}
objj_msgSend(objj_msgSend(objj_msgSend(_24,"window"),"platformWindow"),"_propagateCurrentDOMEvent:",YES);
}
}),new objj_method(sel_getUid("performKeyEquivalent:"),function(_27,_28,_29){
with(_27){
var _2a=objj_msgSend(objj_msgSend(_27,"window"),"firstResponder")==_27;
if(_2a&&objj_msgSend(_29,"_couldBeKeyEquivalent")&&(objj_msgSend(_29,"modifierFlags")&CPPlatformActionKeyMask)){
objj_msgSend(CPTimer,"scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:",0,_27,sel_getUid("keyUp:"),nil,NO);
return YES;
}
objj_msgSend(objj_msgSend(objj_msgSend(_27,"window"),"platformWindow"),"_propagateCurrentDOMEvent:",YES);
return _2a;
}
}),new objj_method(sel_getUid("becomeFirstResponder"),function(_2b,_2c){
with(_2b){
_stringValue=objj_msgSend(_2b,"stringValue");
objj_msgSend(_2b,"setThemeState:",CPThemeStateEditing);
setTimeout(function(){
objj_msgSend(_2b,"_DOMTextareaElement").focus();
_1=_2b;
},0);
objj_msgSend(_2b,"textDidFocus:",objj_msgSend(CPNotification,"notificationWithName:object:userInfo:",CPTextFieldDidFocusNotification,_2b,nil));
return YES;
}
}),new objj_method(sel_getUid("resignFirstResponder"),function(_2d,_2e){
with(_2d){
objj_msgSend(_2d,"unsetThemeState:",CPThemeStateEditing);
objj_msgSend(_2d,"setStringValue:",objj_msgSend(_2d,"stringValue"));
objj_msgSend(_2d,"_DOMTextareaElement").blur();
if(_isEditing){
_isEditing=NO;
objj_msgSend(_2d,"textDidEndEditing:",objj_msgSend(CPNotification,"notificationWithName:object:userInfo:",CPControlTextDidEndEditingNotification,_2d,nil));
if(objj_msgSend(_2d,"sendsActionOnEndEditing")){
objj_msgSend(_2d,"sendAction:to:",objj_msgSend(_2d,"action"),objj_msgSend(_2d,"target"));
}
}
objj_msgSend(_2d,"textDidBlur:",objj_msgSend(CPNotification,"notificationWithName:object:userInfo:",CPTextFieldDidBlurNotification,_2d,nil));
return YES;
}
}),new objj_method(sel_getUid("stringValue"),function(_2f,_30){
with(_2f){
return (!!_DOMTextareaElement)?_DOMTextareaElement.value:"";
}
}),new objj_method(sel_getUid("setStringValue:"),function(_31,_32,_33){
with(_31){
_stringValue=_33;
objj_msgSend(_31,"setNeedsLayout");
}
}),new objj_method(sel_getUid("setTextColor:"),function(_34,_35,_36){
with(_34){
if(!_36){
return;
}
var _37=objj_msgSend(_34,"_DOMTextareaElement");
_37.style.color=objj_msgSend(_36,"cssString");
objj_msgSend(_34,"setValue:forThemeAttribute:",_36,"text-color");
}
}),new objj_method(sel_getUid("setEnabled:"),function(_38,_39,_3a){
with(_38){
objj_msgSendSuper({receiver:_38,super_class:objj_getClass("LPMultiLineTextField").super_class},"setEnabled:",_3a);
var _3b=objj_msgSend(_38,"_DOMTextareaElement");
_3b.disabled=!_3a;
}
}),new objj_method(sel_getUid("setEditable:"),function(_3c,_3d,_3e){
with(_3c){
objj_msgSendSuper({receiver:_3c,super_class:objj_getClass("LPMultiLineTextField").super_class},"setEditable:",_3e);
var _3f=objj_msgSend(_3c,"_DOMTextareaElement");
_3f.readOnly=!_3e;
}
}),new objj_method(sel_getUid("selectedRange"),function(_40,_41){
with(_40){
if(objj_msgSend(objj_msgSend(_40,"window"),"firstResponder")!==_40){
return CPMakeRange(0,0);
}
try{
var _42=objj_msgSend(_40,"_DOMTextareaElement"),_43=_42.selectionStart,_44=_42.selectionEnd;
if(objj_msgSend(_43,"isKindOfClass:",CPNumber)){
return CPMakeRange(_43,_44-_43);
}
var _45=_42.ownerDocument||_42.document,_46=_45.selection.createRange(),_47=_42.createTextRange();
if(_47.inRange(_46)){
_47.setEndPoint("EndToStart",_46);
return CPMakeRange(_47.text.length,_46.text.length);
}
}
catch(e){
}
return CPMakeRange(0,0);
}
}),new objj_method(sel_getUid("setSelectedRange:"),function(_48,_49,_4a){
with(_48){
if(!objj_msgSend(objj_msgSend(_48,"window"),"firstResponder")===_48){
return;
}
var _4b=objj_msgSend(_48,"_DOMTextareaElement");
try{
if(objj_msgSend(_4b.selectionStart,"isKindOfClass:",CPNumber)){
_4b.selectionStart=_4a.location;
_4b.selectionEnd=CPMaxRange(_4a);
}else{
var _4c=_4b.ownerDocument||_4b.document,_4d=_4c.selection.createRange(),_4e=_4b.createTextRange();
if(_4e.inRange(_4d)){
_4e.collapse(true);
_4e.move("character",_4a.location);
_4e.moveEnd("character",_4a.length);
_4e.select();
}
}
}
catch(e){
}
}
})]);
var _4f="LPMultiLineTextFieldStringValueKey",_50="LPMultiLineTextFieldScrollableKey";
var _2=objj_getClass("LPMultiLineTextField");
if(!_2){
throw new SyntaxError("*** Could not find definition for class \"LPMultiLineTextField\"");
}
var _3=_2.isa;
class_addMethods(_2,[new objj_method(sel_getUid("initWithCoder:"),function(_51,_52,_53){
with(_51){
if(_51=objj_msgSendSuper({receiver:_51,super_class:objj_getClass("LPMultiLineTextField").super_class},"initWithCoder:",_53)){
objj_msgSend(_51,"setStringValue:",objj_msgSend(_53,"decodeObjectForKey:",_4f));
objj_msgSend(_51,"setScrollable:",objj_msgSend(_53,"decodeBoolForKey:",_50));
}
return _51;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_54,_55,_56){
with(_54){
objj_msgSendSuper({receiver:_54,super_class:objj_getClass("LPMultiLineTextField").super_class},"encodeWithCoder:",_56);
objj_msgSend(_56,"encodeObject:forKey:",_stringValue,_4f);
objj_msgSend(_56,"encodeBool:forKey:",(_hideOverflow?NO:YES),_50);
}
})]);
p;6;main.jt;267;@STATIC;1.0;I;23;Foundation/Foundation.jI;15;AppKit/AppKit.ji;15;AppController.jt;181;
objj_executeFile("Foundation/Foundation.j",NO);
objj_executeFile("AppKit/AppKit.j",NO);
objj_executeFile("AppController.j",YES);
main=function(_1,_2){
CPApplicationMain(_1,_2);
};
e;