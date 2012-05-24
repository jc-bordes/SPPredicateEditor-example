@STATIC;1.0;I;20;AppKit/CPTextField.jt;9602;
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
