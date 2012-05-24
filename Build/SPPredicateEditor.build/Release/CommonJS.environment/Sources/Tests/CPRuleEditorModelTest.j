@STATIC;1.0;I;23;Foundation/Foundation.jI;26;AppKit/CPRuleEditorModel.jt;32919;
objj_executeFile("Foundation/Foundation.j",NO);
objj_executeFile("AppKit/CPRuleEditorModel.j",NO);
var _1=objj_allocateClassPair(OJTestCase,"CPRuleEditorModelTest"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("_setupListModel"),function(_3,_4){
with(_3){
var _5=objj_msgSend(objj_msgSend(CPRuleEditorModel,"alloc"),"initWithNestingMode:",CPRuleEditorNestingModeList);
for(var i=0;i<5;i++){
objj_msgSend(_5,"insertNewRowAtIndex:ofType:withParentRowIndex:criteria:",0,CPRuleEditorRowTypeSimple,-1,nil);
}
return _5;
}
}),new objj_method(sel_getUid("_setupCompoundModel"),function(_6,_7){
with(_6){
var _8=objj_msgSend(objj_msgSend(CPRuleEditorModel,"alloc"),"initWithNestingMode:",CPRuleEditorNestingModeCompound);
objj_msgSend(_8,"addNewRowOfType:criteria:",CPRuleEditorRowTypeCompound,nil);
for(var i=0;i<5;i++){
objj_msgSend(_8,"insertNewRowAtIndex:ofType:withParentRowIndex:criteria:",1,CPRuleEditorRowTypeSimple,0,nil);
}
objj_msgSend(_8,"insertNewRowAtIndex:ofType:withParentRowIndex:criteria:",3,CPRuleEditorRowTypeCompound,0,nil);
for(var i=0;i<3;i++){
objj_msgSend(_8,"insertNewRowAtIndex:ofType:withParentRowIndex:criteria:",4,CPRuleEditorRowTypeSimple,3,nil);
}
return _8;
}
}),new objj_method(sel_getUid("_setupComplexCompoundModel"),function(_9,_a){
with(_9){
var _b=objj_msgSend(objj_msgSend(CPRuleEditorModel,"alloc"),"initWithNestingMode:",CPRuleEditorNestingModeCompound);
objj_msgSend(_b,"addNewRowOfType:criteria:",CPRuleEditorRowTypeCompound,nil);
for(var i=0;i<5;i++){
objj_msgSend(_b,"insertNewRowAtIndex:ofType:withParentRowIndex:criteria:",1,CPRuleEditorRowTypeSimple,0,nil);
}
objj_msgSend(_b,"insertNewRowAtIndex:ofType:withParentRowIndex:criteria:",3,CPRuleEditorRowTypeCompound,0,nil);
for(var i=0;i<3;i++){
objj_msgSend(_b,"insertNewRowAtIndex:ofType:withParentRowIndex:criteria:",4,CPRuleEditorRowTypeSimple,3,nil);
}
objj_msgSend(_b,"insertNewRowAtIndex:ofType:withParentRowIndex:criteria:",8,CPRuleEditorRowTypeCompound,0,nil);
for(var i=0;i<3;i++){
objj_msgSend(_b,"insertNewRowAtIndex:ofType:withParentRowIndex:criteria:",9,CPRuleEditorRowTypeSimple,8,nil);
}
objj_msgSend(_b,"insertNewRowAtIndex:ofType:withParentRowIndex:criteria:",10,CPRuleEditorRowTypeCompound,8,nil);
for(var i=0;i<3;i++){
objj_msgSend(_b,"insertNewRowAtIndex:ofType:withParentRowIndex:criteria:",11,CPRuleEditorRowTypeSimple,10,nil);
}
return _b;
}
}),new objj_method(sel_getUid("test_initWithNestingMode_0"),function(_c,_d){
with(_c){
var _e=objj_msgSend(objj_msgSend(CPRuleEditorModel,"alloc"),"initWithNestingMode:",CPRuleEditorNestingModeSingle);
objj_msgSend(_c,"assertTrue:",_e!=nil);
objj_msgSend(_c,"assertTrue:",objj_msgSend(_e,"nestingMode")==CPRuleEditorNestingModeSingle);
objj_msgSend(_c,"assertTrue:",objj_msgSend(_e,"rootLess"));
}
}),new objj_method(sel_getUid("test_initWithNestingMode_1"),function(_f,_10){
with(_f){
var _11=objj_msgSend(objj_msgSend(CPRuleEditorModel,"alloc"),"initWithNestingMode:",CPRuleEditorNestingModeList);
objj_msgSend(_f,"assertTrue:",_11!=nil);
objj_msgSend(_f,"assertTrue:",objj_msgSend(_11,"nestingMode")==CPRuleEditorNestingModeList);
objj_msgSend(_f,"assertTrue:",objj_msgSend(_11,"rootLess"));
}
}),new objj_method(sel_getUid("test_initWithNestingMode_2"),function(_12,_13){
with(_12){
var _14=objj_msgSend(objj_msgSend(CPRuleEditorModel,"alloc"),"initWithNestingMode:",CPRuleEditorNestingModeCompound);
objj_msgSend(_12,"assertTrue:",_14!=nil);
objj_msgSend(_12,"assertTrue:",objj_msgSend(_14,"nestingMode")==CPRuleEditorNestingModeCompound);
objj_msgSend(_12,"assertFalse:",objj_msgSend(_14,"rootLess"));
}
}),new objj_method(sel_getUid("test_initWithNestingMode_3"),function(_15,_16){
with(_15){
var _17=objj_msgSend(objj_msgSend(CPRuleEditorModel,"alloc"),"initWithNestingMode:",CPRuleEditorNestingModeSimple);
objj_msgSend(_15,"assertTrue:",_17!=nil);
objj_msgSend(_15,"assertTrue:",objj_msgSend(_17,"nestingMode")==CPRuleEditorNestingModeSimple);
objj_msgSend(_15,"assertFalse:",objj_msgSend(_17,"rootLess"));
}
}),new objj_method(sel_getUid("test_allowNewRowInsertOfType_withParent_"),function(_18,_19){
with(_18){
var _1a=objj_msgSend(objj_msgSend(CPRuleEditorModel,"alloc"),"initWithNestingMode:",CPRuleEditorNestingModeSingle);
objj_msgSend(_18,"assertTrue:",objj_msgSend(_1a,"allowNewRowInsertOfType:withParent:",CPRuleEditorRowTypeSimple,nil));
objj_msgSend(_18,"assertFalse:",objj_msgSend(_1a,"allowNewRowInsertOfType:withParent:",CPRuleEditorRowTypeCompound,nil));
_1a=objj_msgSend(objj_msgSend(CPRuleEditorModel,"alloc"),"initWithNestingMode:",CPRuleEditorNestingModeList);
objj_msgSend(_18,"assertTrue:",objj_msgSend(_1a,"allowNewRowInsertOfType:withParent:",CPRuleEditorRowTypeSimple,nil));
objj_msgSend(_18,"assertFalse:",objj_msgSend(_1a,"allowNewRowInsertOfType:withParent:",CPRuleEditorRowTypeCompound,nil));
_1a=objj_msgSend(objj_msgSend(CPRuleEditorModel,"alloc"),"initWithNestingMode:",CPRuleEditorNestingModeSimple);
objj_msgSend(_1a,"addNewRowOfType:criteria:",CPRuleEditorRowTypeCompound,nil);
objj_msgSend(_18,"assertTrue:",objj_msgSend(_1a,"allowNewRowInsertOfType:withParent:",CPRuleEditorRowTypeSimple,objj_msgSend(_1a,"rowAtIndex:",0)));
objj_msgSend(_18,"assertFalse:",objj_msgSend(_1a,"allowNewRowInsertOfType:withParent:",CPRuleEditorRowTypeCompound,objj_msgSend(_1a,"rowAtIndex:",0)));
_1a=objj_msgSend(objj_msgSend(CPRuleEditorModel,"alloc"),"initWithNestingMode:",CPRuleEditorNestingModeCompound);
objj_msgSend(_1a,"addNewRowOfType:criteria:",CPRuleEditorRowTypeCompound,nil);
objj_msgSend(_18,"assertTrue:",objj_msgSend(_1a,"allowNewRowInsertOfType:withParent:",CPRuleEditorRowTypeSimple,objj_msgSend(_1a,"rowAtIndex:",0)));
objj_msgSend(_18,"assertTrue:",objj_msgSend(_1a,"allowNewRowInsertOfType:withParent:",CPRuleEditorRowTypeCompound,objj_msgSend(_1a,"rowAtIndex:",0)));
}
}),new objj_method(sel_getUid("test_addNewRowOfType_"),function(_1b,_1c){
with(_1b){
var _1d=objj_msgSend(objj_msgSend(CPRuleEditorModel,"alloc"),"initWithNestingMode:",CPRuleEditorNestingModeSingle);
var row=objj_msgSend(_1d,"addNewRowOfType:criteria:",CPRuleEditorRowTypeSimple,nil);
objj_msgSend(_1b,"assertTrue:message:",row!=nil,"Subtest 1.1 failed");
objj_msgSend(_1b,"assertTrue:message:",objj_msgSend(_1d,"rowsCount")==1,"Subtest 1.2 failed");
objj_msgSend(_1b,"assertTrue:message:",objj_msgSend(_1d,"flatRowsCount")==1,"Subtest 1.3 failed");
row=objj_msgSend(_1d,"addNewRowOfType:criteria:",CPRuleEditorRowTypeSimple,nil);
objj_msgSend(_1b,"assertTrue:message:",row==nil,"Subtest 1.4 failed");
objj_msgSend(_1b,"assertTrue:message:",objj_msgSend(_1d,"rowsCount")==1,"Subtest 1.5 failed");
objj_msgSend(_1b,"assertTrue:message:",objj_msgSend(_1d,"flatRowsCount")==1,"Subtest 1.6 failed");
_1d=objj_msgSend(objj_msgSend(CPRuleEditorModel,"alloc"),"initWithNestingMode:",CPRuleEditorNestingModeList);
row=objj_msgSend(_1d,"addNewRowOfType:criteria:",CPRuleEditorRowTypeSimple,nil);
objj_msgSend(_1b,"assertTrue:message:",row!=nil,"Subtest 2.1 failed");
objj_msgSend(_1b,"assertTrue:message:",objj_msgSend(_1d,"rowsCount")==1,"Subtest 2.2 failed");
objj_msgSend(_1b,"assertTrue:message:",objj_msgSend(_1d,"flatRowsCount")==1,"Subtest 2.3 failed");
row=objj_msgSend(_1d,"addNewRowOfType:criteria:",CPRuleEditorRowTypeCompound,nil);
objj_msgSend(_1b,"assertTrue:message:",row==nil,"Subtest 2.4 failed");
objj_msgSend(_1b,"assertTrue:message:",objj_msgSend(_1d,"rowsCount")==1,"Subtest 2.5 failed");
objj_msgSend(_1b,"assertTrue:message:",objj_msgSend(_1d,"flatRowsCount")==1,"Subtest 2.6 failed");
_1d=objj_msgSend(objj_msgSend(CPRuleEditorModel,"alloc"),"initWithNestingMode:",CPRuleEditorNestingModeSimple);
objj_msgSend(_1d,"addNewRowOfType:criteria:",CPRuleEditorRowTypeCompound,nil);
row=objj_msgSend(_1d,"addNewRowOfType:criteria:",CPRuleEditorRowTypeSimple,nil);
objj_msgSend(_1b,"assertTrue:message:",row==nil,"Subtest 3.1 failed");
objj_msgSend(_1b,"assertTrue:message:",objj_msgSend(_1d,"rowsCount")==1,"Subtest 3.2 failed");
objj_msgSend(_1b,"assertTrue:message:",objj_msgSend(_1d,"flatRowsCount")==1,"Subtest 3.3 failed");
row=objj_msgSend(_1d,"addNewRowOfType:criteria:",CPRuleEditorRowTypeCompound,nil);
objj_msgSend(_1b,"assertTrue:message:",row==nil,"Subtest 3.4 failed");
objj_msgSend(_1b,"assertTrue:message:",objj_msgSend(_1d,"rowsCount")==1,"Subtest 3.5 failed");
objj_msgSend(_1b,"assertTrue:message:",objj_msgSend(_1d,"flatRowsCount")==1,"Subtest 3.6 failed");
_1d=objj_msgSend(objj_msgSend(CPRuleEditorModel,"alloc"),"initWithNestingMode:",CPRuleEditorNestingModeCompound);
objj_msgSend(_1d,"addNewRowOfType:criteria:",CPRuleEditorRowTypeCompound,nil);
row=objj_msgSend(_1d,"addNewRowOfType:criteria:",CPRuleEditorRowTypeSimple,nil);
objj_msgSend(_1b,"assertTrue:message:",row==nil,"Subtest 4.1 failed");
objj_msgSend(_1b,"assertTrue:message:",objj_msgSend(_1d,"rowsCount")==1,"Subtest 4.2 failed");
objj_msgSend(_1b,"assertTrue:message:",objj_msgSend(_1d,"flatRowsCount")==1,"Subtest 4.3 failed");
row=objj_msgSend(_1d,"addNewRowOfType:criteria:",CPRuleEditorRowTypeCompound,nil);
objj_msgSend(_1b,"assertTrue:message:",row==nil,"Subtest 4.4 failed");
objj_msgSend(_1b,"assertTrue:message:",objj_msgSend(_1d,"rowsCount")==1,"Subtest 4.5 failed");
objj_msgSend(_1b,"assertTrue:message:",objj_msgSend(_1d,"flatRowsCount")==1,"Subtest 4.6 failed");
}
}),new objj_method(sel_getUid("test_rowAtIndex_indexOfRow_"),function(_1e,_1f){
with(_1e){
var _20=objj_msgSend(_1e,"_setupComplexCompoundModel");
objj_msgSend(_1e,"assertTrue:message:",objj_msgSend(_20,"rowsCount")==1,"Subtest 1.1 failed");
objj_msgSend(_1e,"assertTrue:message:",objj_msgSend(_20,"flatRowsCount")==18,"Subtest 1.2 failed");
var row,_21;
for(var i=0;i<18;i++){
row=objj_msgSend(_20,"rowAtIndex:",i);
_21=objj_msgSend(_20,"indexOfRow:",row);
objj_msgSend(_1e,"assertTrue:message:",(i==_21),"Subtest 1.3 failed");
}
}
}),new objj_method(sel_getUid("test_immediateSubrowsIndexesOfRowAtIndex_"),function(_22,_23){
with(_22){
var _24=objj_msgSend(_22,"_setupComplexCompoundModel");
indexSet=objj_msgSend(_24,"immediateSubrowsIndexesOfRowAtIndex:",0);
expected=objj_msgSend(objj_msgSend(CPMutableIndexSet,"alloc"),"init");
objj_msgSend(expected,"addIndex:",1);
objj_msgSend(expected,"addIndex:",2);
objj_msgSend(expected,"addIndex:",3);
objj_msgSend(expected,"addIndex:",7);
objj_msgSend(expected,"addIndex:",8);
objj_msgSend(expected,"addIndex:",16);
objj_msgSend(expected,"addIndex:",17);
objj_msgSend(_22,"assertTrue:message:",indexSet!=nil,"Subtest 1.1 failed");
objj_msgSend(_22,"assertTrue:message:",objj_msgSend(indexSet,"count")==7,"Subtest 1.2 failed");
objj_msgSend(_22,"assertTrue:message:",objj_msgSend(indexSet,"isEqualToIndexSet:",expected),"Subtest 1.3 failed");
indexSet=objj_msgSend(_24,"immediateSubrowsIndexesOfRowAtIndex:",1);
objj_msgSend(_22,"assertTrue:message:",indexSet==nil,"Subtest 2.1 failed");
indexSet=objj_msgSend(_24,"immediateSubrowsIndexesOfRowAtIndex:",3);
expected=objj_msgSend(objj_msgSend(CPMutableIndexSet,"alloc"),"init");
objj_msgSend(expected,"addIndex:",4);
objj_msgSend(expected,"addIndex:",5);
objj_msgSend(expected,"addIndex:",6);
objj_msgSend(_22,"assertTrue:message:",indexSet!=nil,"Subtest 3.1 failed");
objj_msgSend(_22,"assertTrue:message:",objj_msgSend(indexSet,"count")==3,"Subtest 3.2 failed");
objj_msgSend(_22,"assertTrue:message:",objj_msgSend(indexSet,"isEqualToIndexSet:",expected),"Subtest 3.3 failed");
indexSet=objj_msgSend(_24,"immediateSubrowsIndexesOfRowAtIndex:",8);
expected=objj_msgSend(objj_msgSend(CPMutableIndexSet,"alloc"),"init");
objj_msgSend(expected,"addIndex:",9);
objj_msgSend(expected,"addIndex:",10);
objj_msgSend(expected,"addIndex:",14);
objj_msgSend(expected,"addIndex:",15);
objj_msgSend(_22,"assertTrue:message:",indexSet!=nil,"Subtest 4.1 failed");
objj_msgSend(_22,"assertTrue:message:",objj_msgSend(indexSet,"count")==4,"Subtest 4.2 failed");
objj_msgSend(_22,"assertTrue:message:",objj_msgSend(indexSet,"isEqualToIndexSet:",expected),"Subtest 4.3 failed");
indexSet=objj_msgSend(_24,"immediateSubrowsIndexesOfRowAtIndex:",10);
expected=objj_msgSend(objj_msgSend(CPMutableIndexSet,"alloc"),"init");
objj_msgSend(expected,"addIndex:",11);
objj_msgSend(expected,"addIndex:",12);
objj_msgSend(expected,"addIndex:",13);
objj_msgSend(_22,"assertTrue:message:",indexSet!=nil,"Subtest 5.1 failed");
objj_msgSend(_22,"assertTrue:message:",objj_msgSend(indexSet,"count")==3,"Subtest 5.2 failed");
objj_msgSend(_22,"assertTrue:message:",objj_msgSend(indexSet,"isEqualToIndexSet:",expected),"Subtest 5.3 failed");
}
}),new objj_method(sel_getUid("test_insertNewRowAtIndex_ofType_withParentRowIndex"),function(_25,_26){
with(_25){
var _27,row,_28,_29;
var _2a=0;
var _2b=objj_msgSend(objj_msgSend(CPRuleEditorModel,"alloc"),"initWithNestingMode:",CPRuleEditorNestingModeCompound);
objj_msgSend(_2b,"addNewRowOfType:criteria:",CPRuleEditorRowTypeCompound,nil);
row=objj_msgSend(_2b,"insertNewRowAtIndex:ofType:withParentRowIndex:criteria:",0,CPRuleEditorRowTypeSimple,0,nil);
objj_msgSend(_25,"assertTrue:message:",row==nil,"Subtest 1 failed");
row=objj_msgSend(_2b,"insertNewRowAtIndex:ofType:withParentRowIndex:criteria:",1,CPRuleEditorRowTypeSimple,0,nil);
objj_msgSend(_25,"assertTrue:message:",row!=nil,"Subtest 2.1 failed");
objj_msgSend(_25,"assertTrue:message:",objj_msgSend(row,"parent")!=nil,"Subtest 2.2 failed");
objj_msgSend(_25,"assertTrue:message:",objj_msgSend(row,"depth")==1,"Subtest 2.3 failed");
row=objj_msgSend(_2b,"insertNewRowAtIndex:ofType:withParentRowIndex:criteria:",1,CPRuleEditorRowTypeSimple,0,nil);
objj_msgSend(_25,"assertTrue:message:",row!=nil,"Subtest 3 failed");
row=objj_msgSend(_2b,"insertNewRowAtIndex:ofType:withParentRowIndex:criteria:",2,CPRuleEditorRowTypeSimple,0,nil);
objj_msgSend(_25,"assertTrue:message:",row!=nil,"Subtest 4 failed");
row=objj_msgSend(_2b,"insertNewRowAtIndex:ofType:withParentRowIndex:criteria:",4,CPRuleEditorRowTypeSimple,0,nil);
objj_msgSend(_25,"assertTrue:message:",row!=nil,"Subtest 5 failed");
row=objj_msgSend(_2b,"insertNewRowAtIndex:ofType:withParentRowIndex:criteria:",3,CPRuleEditorRowTypeSimple,0,nil);
objj_msgSend(_25,"assertTrue:message:",row!=nil,"Subtest 6 failed");
var _2c=objj_msgSend(_2b,"insertNewRowAtIndex:ofType:withParentRowIndex:criteria:",3,CPRuleEditorRowTypeCompound,0,nil);
objj_msgSend(_25,"assertTrue:message:",_2c!=nil,"Subtest 7 failed");
row=objj_msgSend(_2b,"insertNewRowAtIndex:ofType:withParentRowIndex:criteria:",4,CPRuleEditorRowTypeSimple,3,nil);
objj_msgSend(_25,"assertTrue:message:",row!=nil,"Subtest 8.1 failed");
objj_msgSend(_25,"assertTrue:message:",objj_msgSend(row,"depth")==2,"Subtest 8.2 failed");
row=objj_msgSend(_2b,"insertNewRowAtIndex:ofType:withParentRowIndex:criteria:",6,CPRuleEditorRowTypeSimple,3,nil);
objj_msgSend(_25,"assertTrue:message:",row==nil,"Subtest 9 failed");
row=objj_msgSend(_2b,"insertNewRowAtIndex:ofType:withParentRowIndex:criteria:",3,CPRuleEditorRowTypeSimple,3,nil);
objj_msgSend(_25,"assertTrue:message:",row==nil,"Subtest 10 failed");
row=objj_msgSend(_2b,"insertNewRowAtIndex:ofType:withParentRowIndex:criteria:",2,CPRuleEditorRowTypeSimple,3,nil);
objj_msgSend(_25,"assertTrue:message:",row==nil,"Subtest 11 failed");
row=objj_msgSend(_2b,"insertNewRowAtIndex:ofType:withParentRowIndex:criteria:",4,CPRuleEditorRowTypeSimple,3,nil);
objj_msgSend(_25,"assertTrue:message:",row!=nil,"Subtest 12 failed");
row=objj_msgSend(_2b,"insertNewRowAtIndex:ofType:withParentRowIndex:criteria:",5,CPRuleEditorRowTypeSimple,3,nil);
objj_msgSend(_25,"assertTrue:message:",row!=nil,"Subtest 13 failed");
objj_msgSend(_25,"assertTrue:message:",objj_msgSend(_2b,"rowsCount")==1,"Subtest 14.1 failed");
objj_msgSend(_25,"assertTrue:message:",objj_msgSend(_2b,"flatRowsCount")==10,"Subtest 14.2 failed");
_29=objj_msgSend(_2b,"rowAtIndex:",0);
_27=objj_msgSend(_29,"subrowsCount");
for(var i=0;i<_27;i++){
row=objj_msgSend(_29,"childAtIndex:",i);
if(i==2){
objj_msgSend(_25,"assertTrue:",objj_msgSend(row,"rowType")==CPRuleEditorRowTypeCompound);
var _2d;
var _2e=objj_msgSend(row,"subrowsCount");
objj_msgSend(_25,"assertTrue:",_2e==3);
for(var j=0;j<_2e;j++){
_2d=objj_msgSend(row,"childAtIndex:",j);
objj_msgSend(_25,"assertTrue:message:",objj_msgSend(_2d,"rowType")==CPRuleEditorRowTypeSimple,"Subtest 14.4 failed");
objj_msgSend(_25,"assertTrue:message:",objj_msgSend(_2d,"parent")==row,"Subtest 14.5 failed");
objj_msgSend(_25,"assertTrue:message:",objj_msgSend(_2d,"depth")==2,"Subtest 14.6 failed");
}
continue;
}
objj_msgSend(_25,"assertTrue:message:",objj_msgSend(row,"rowType")==CPRuleEditorRowTypeSimple,"Subtest 14.7 failed");
objj_msgSend(_25,"assertTrue:message:",objj_msgSend(row,"parent")==_29,"Subtest 14.8 failed");
objj_msgSend(_25,"assertTrue:message:",objj_msgSend(row,"depth")==1,"Subtest 14.9 failed");
}
}
}),new objj_method(sel_getUid("test_removeRowAtIndex_includeSubrows_yes"),function(_2f,_30){
with(_2f){
var _31,row,_32,_33;
var _34=objj_msgSend(_2f,"_setupCompoundModel");
_33=objj_msgSend(_34,"rowAtIndex:",0);
objj_msgSend(_2f,"assertTrue:message:",objj_msgSend(_34,"rowsCount")==1,"Subtest 1.1 failed");
objj_msgSend(_2f,"assertTrue:message:",objj_msgSend(_34,"flatRowsCount")==10,"Subtest 1.2 failed");
objj_msgSend(_34,"removeRowAtIndex:includeSubrows:",0,YES);
objj_msgSend(_2f,"assertTrue:message:",objj_msgSend(_34,"rowsCount")==1,"Subtest 2.1 failed");
objj_msgSend(_2f,"assertTrue:message:",objj_msgSend(_34,"flatRowsCount")==10,"Subtest 2.2 failed");
objj_msgSend(_34,"removeRowAtIndex:includeSubrows:",2,YES);
objj_msgSend(_2f,"assertTrue:message:",objj_msgSend(_34,"rowsCount")==1,"Subtest 3.1 failed");
objj_msgSend(_2f,"assertTrue:message:",objj_msgSend(_34,"flatRowsCount")==9,"Subtest 3.2 failed");
objj_msgSend(_34,"removeRowAtIndex:includeSubrows:",4,YES);
objj_msgSend(_2f,"assertTrue:message:",objj_msgSend(_34,"rowsCount")==1,"Subtest 4.1 failed");
objj_msgSend(_2f,"assertTrue:message:",objj_msgSend(_34,"flatRowsCount")==8,"Subtest 4.2 failed");
objj_msgSend(_34,"removeRowAtIndex:includeSubrows:",2,YES);
objj_msgSend(_2f,"assertTrue:message:",objj_msgSend(_34,"rowsCount")==1,"Subtest 5.1 failed");
objj_msgSend(_2f,"assertTrue:message:",objj_msgSend(_34,"flatRowsCount")==5,"Subtest 5.2 failed");
_31=objj_msgSend(_33,"subrowsCount");
for(var i=0;i<_31;i++){
row=objj_msgSend(_33,"childAtIndex:",i);
objj_msgSend(_2f,"assertTrue:message:",objj_msgSend(row,"rowType")==CPRuleEditorRowTypeSimple,"Subtest 6.2 failed");
objj_msgSend(_2f,"assertTrue:message:",objj_msgSend(row,"parent")==_33,"Subtest 6.3 failed");
objj_msgSend(_2f,"assertTrue:message:",objj_msgSend(row,"depth")==1,"Subtest 6.4 failed");
}
}
}),new objj_method(sel_getUid("test_setCanRemoveAllRows"),function(_35,_36){
with(_35){
var _37=objj_msgSend(_35,"_setupListModel");
objj_msgSend(_35,"assertTrue:message:",objj_msgSend(_37,"rowsCount")==5,"Subtest 1.1 failed");
objj_msgSend(_35,"assertTrue:message:",objj_msgSend(_37,"flatRowsCount")==5,"Subtest 1.2 failed");
objj_msgSend(_37,"setCanRemoveAllRows:",NO);
for(var i=0;i<5;i++){
objj_msgSend(_37,"removeRowAtIndex:includeSubrows:",0,YES);
}
objj_msgSend(_35,"assertTrue:message:",objj_msgSend(_37,"flatRowsCount")==1,"Subtest 1.3 failed");
_37=objj_msgSend(_35,"_setupListModel");
objj_msgSend(_37,"setCanRemoveAllRows:",YES);
for(var i=0;i<5;i++){
objj_msgSend(_37,"removeRowAtIndex:includeSubrows:",0,YES);
}
objj_msgSend(_35,"assertTrue:message:",objj_msgSend(_37,"flatRowsCount")==0,"Subtest 2.1 failed");
objj_msgSend(_35,"assertTrue:message:",objj_msgSend(_37,"rowsCount")==0,"Subtest 2.2 failed");
_37=objj_msgSend(_35,"_setupCompoundModel");
objj_msgSend(_35,"assertTrue:message:",objj_msgSend(_37,"rowsCount")==1,"Subtest 3.1 failed");
objj_msgSend(_35,"assertTrue:message:",objj_msgSend(_37,"flatRowsCount")==10,"Subtest 3.2 failed");
objj_msgSend(_37,"setCanRemoveAllRows:",NO);
objj_msgSend(_37,"removeRowAtIndex:includeSubrows:",0,YES);
objj_msgSend(_35,"assertTrue:message:",objj_msgSend(_37,"rowsCount")==1,"Subtest 3.3 failed");
objj_msgSend(_35,"assertTrue:message:",objj_msgSend(_37,"flatRowsCount")==10,"Subtest 3.4 failed");
objj_msgSend(_37,"setCanRemoveAllRows:",YES);
objj_msgSend(_37,"removeRowAtIndex:includeSubrows:",0,YES);
objj_msgSend(_35,"assertTrue:message:",objj_msgSend(_37,"rowsCount")==0,"Subtest 3.5 failed");
objj_msgSend(_35,"assertTrue:message:",objj_msgSend(_37,"flatRowsCount")==0,"Subtest 3.6 failed");
}
}),new objj_method(sel_getUid("test_removeRowAtIndex_includeSubrows_no"),function(_38,_39){
with(_38){
var _3a,row,_3b,_3c;
var _3d=objj_msgSend(_38,"_setupCompoundModel");
_3c=objj_msgSend(_3d,"rowAtIndex:",0);
objj_msgSend(_3d,"removeRowAtIndex:includeSubrows:",0,NO);
objj_msgSend(_38,"assertTrue:message:",objj_msgSend(_3d,"rowsCount")==1,"Subtest 1.1 failed");
objj_msgSend(_38,"assertTrue:message:",objj_msgSend(_3d,"flatRowsCount")==10,"Subtest 1.2 failed");
objj_msgSend(_3d,"removeRowAtIndex:includeSubrows:",2,NO);
objj_msgSend(_38,"assertTrue:message:",objj_msgSend(_3d,"rowsCount")==1,"Subtest 2.1 failed");
objj_msgSend(_38,"assertTrue:message:",objj_msgSend(_3d,"flatRowsCount")==9,"Subtest 2.2 failed");
objj_msgSend(_3d,"removeRowAtIndex:includeSubrows:",4,NO);
objj_msgSend(_38,"assertTrue:message:",objj_msgSend(_3d,"rowsCount")==1,"Subtest 3.1 failed");
objj_msgSend(_38,"assertTrue:message:",objj_msgSend(_3d,"flatRowsCount")==8,"Subtest 3.2 failed");
objj_msgSend(_3d,"removeRowAtIndex:includeSubrows:",2,NO);
objj_msgSend(_38,"assertTrue:message:",objj_msgSend(_3d,"rowsCount")==1,"Subtest 4.1 failed");
objj_msgSend(_38,"assertTrue:message:",objj_msgSend(_3d,"flatRowsCount")==7,"Subtest 4.2 failed");
_3a=objj_msgSend(_3c,"subrowsCount");
objj_msgSend(_38,"assertTrue:message:",_3a==6,"Subtest 5.1 failed");
for(var i=0;i<_3a;i++){
row=objj_msgSend(_3c,"childAtIndex:",i);
objj_msgSend(_38,"assertTrue:message:",objj_msgSend(row,"rowType")==CPRuleEditorRowTypeSimple,"Subtest 5.2 failed");
objj_msgSend(_38,"assertTrue:message:",objj_msgSend(row,"parent")==_3c,"Subtest 5.3 failed");
objj_msgSend(_38,"assertTrue:message:",objj_msgSend(row,"depth")==1,"Subtest 5.4 failed");
}
}
}),new objj_method(sel_getUid("test_removeRowsAtIndexes_includeSubrows_yes_0"),function(_3e,_3f){
with(_3e){
var _40,row,_41,_42;
var _43=objj_msgSend(_3e,"_setupCompoundModel");
_42=objj_msgSend(_43,"rowAtIndex:",0);
_41=objj_msgSend(objj_msgSend(CPMutableIndexSet,"alloc"),"init");
objj_msgSend(_41,"addIndex:",1);
objj_msgSend(_41,"addIndex:",5);
objj_msgSend(_41,"addIndex:",8);
objj_msgSend(_43,"removeRowsAtIndexes:includeSubrows:",_41,YES);
objj_msgSend(_3e,"assertTrue:message:",objj_msgSend(_43,"rowsCount")==1,"Subtest 1.1 failed");
objj_msgSend(_3e,"assertTrue:message:",objj_msgSend(_43,"flatRowsCount")==7,"Subtest 1.2 failed");
row=objj_msgSend(_43,"rowAtIndex:",2);
objj_msgSend(_3e,"assertTrue:message:",objj_msgSend(row,"rowType")==CPRuleEditorRowTypeCompound,"Subtest 1.3 failed");
objj_msgSend(_3e,"assertTrue:message:",objj_msgSend(row,"subrowsCount")==2,"Subtest 1.4 failed");
_41=objj_msgSend(objj_msgSend(CPMutableIndexSet,"alloc"),"init");
objj_msgSend(_41,"addIndex:",2);
objj_msgSend(_41,"addIndex:",4);
objj_msgSend(_43,"removeRowsAtIndexes:includeSubrows:",_41,YES);
objj_msgSend(_3e,"assertTrue:message:",objj_msgSend(_43,"rowsCount")==1,"Subtest 2.1 failed");
objj_msgSend(_3e,"assertTrue:message:",objj_msgSend(_43,"flatRowsCount")==4,"Subtest 2.2 failed");
_42=objj_msgSend(_43,"rowAtIndex:",0);
_40=objj_msgSend(_42,"subrowsCount");
for(var i=0;i<_40;i++){
row=objj_msgSend(_42,"childAtIndex:",i);
objj_msgSend(_3e,"assertTrue:message:",objj_msgSend(row,"rowType")==CPRuleEditorRowTypeSimple,"Subtest 2.3 failed");
objj_msgSend(_3e,"assertTrue:message:",objj_msgSend(row,"parent")==_42,"Subtest 2.4 failed");
objj_msgSend(_3e,"assertTrue:message:",objj_msgSend(row,"depth")==1,"Subtest 2.5 failed");
}
}
}),new objj_method(sel_getUid("test_removeRowsAtIndexes_includeSubrows_yes_1"),function(_44,_45){
with(_44){
var _46,row,_47,_48;
var _49=objj_msgSend(_44,"_setupCompoundModel");
_48=objj_msgSend(_49,"rowAtIndex:",0);
objj_msgSend(_49,"insertNewRowAtIndex:ofType:withParentRowIndex:criteria:",5,CPRuleEditorRowTypeCompound,3,nil);
objj_msgSend(_49,"insertNewRowAtIndex:ofType:withParentRowIndex:criteria:",6,CPRuleEditorRowTypeSimple,5,nil);
objj_msgSend(_49,"insertNewRowAtIndex:ofType:withParentRowIndex:criteria:",6,CPRuleEditorRowTypeSimple,5,nil);
objj_msgSend(_49,"insertNewRowAtIndex:ofType:withParentRowIndex:criteria:",6,CPRuleEditorRowTypeSimple,5,nil);
objj_msgSend(_44,"assertTrue:message:",objj_msgSend(_49,"rowsCount")==1,"Subtest 3.1 failed");
objj_msgSend(_44,"assertTrue:message:",objj_msgSend(_49,"flatRowsCount")==14,"Subtest 3.2 failed");
_47=objj_msgSend(objj_msgSend(CPMutableIndexSet,"alloc"),"init");
objj_msgSend(_47,"addIndex:",2);
objj_msgSend(_47,"addIndex:",7);
objj_msgSend(_47,"addIndex:",12);
objj_msgSend(_49,"removeRowsAtIndexes:includeSubrows:",_47,YES);
objj_msgSend(_44,"assertTrue:message:",objj_msgSend(_49,"rowsCount")==1,"Subtest 4.1 failed");
objj_msgSend(_44,"assertTrue:message:",objj_msgSend(_49,"flatRowsCount")==11,"Subtest 4.2 failed");
row=objj_msgSend(_48,"childAtIndex:",1);
objj_msgSend(_44,"assertTrue:message:",objj_msgSend(row,"rowType")==CPRuleEditorRowTypeCompound,"Subtest 4.3 failed");
objj_msgSend(_44,"assertTrue:message:",objj_msgSend(row,"parent")==_48,"Subtest 4.4 failed");
objj_msgSend(_44,"assertTrue:message:",objj_msgSend(row,"depth")==1,"Subtest 4.5 failed");
objj_msgSend(_44,"assertTrue:message:",objj_msgSend(row,"subrowsCount")==4,"Subtest 4.6 failed");
var _4a=objj_msgSend(row,"childAtIndex:",1);
objj_msgSend(_44,"assertTrue:message:",objj_msgSend(_4a,"rowType")==CPRuleEditorRowTypeCompound,"Subtest 4.7 failed");
objj_msgSend(_44,"assertTrue:message:",objj_msgSend(_4a,"parent")==row,"Subtest 4.8 failed");
objj_msgSend(_44,"assertTrue:message:",objj_msgSend(_4a,"depth")==2,"Subtest 4.9 failed");
objj_msgSend(_44,"assertTrue:message:",objj_msgSend(_4a,"subrowsCount")==2,"Subtest 4.10 failed");
_47=objj_msgSend(objj_msgSend(CPMutableIndexSet,"alloc"),"init");
objj_msgSend(_47,"addIndex:",1);
objj_msgSend(_47,"addIndex:",4);
objj_msgSend(_49,"removeRowsAtIndexes:includeSubrows:",_47,YES);
objj_msgSend(_44,"assertTrue:message:",objj_msgSend(_49,"rowsCount")==1,"Subtest 5.1 failed");
objj_msgSend(_44,"assertTrue:message:",objj_msgSend(_49,"flatRowsCount")==7,"Subtest 5.2 failed");
row=objj_msgSend(_48,"childAtIndex:",0);
objj_msgSend(_44,"assertTrue:message:",objj_msgSend(row,"rowType")==CPRuleEditorRowTypeCompound,"Subtest 5.3 failed");
objj_msgSend(_44,"assertTrue:message:",objj_msgSend(row,"parent")==_48,"Subtest 5.4 failed");
objj_msgSend(_44,"assertTrue:message:",objj_msgSend(row,"depth")==1,"Subtest 5.5 failed");
objj_msgSend(_44,"assertTrue:message:",objj_msgSend(row,"subrowsCount")==3,"Subtest 5.6 failed");
_47=objj_msgSend(objj_msgSend(CPMutableIndexSet,"alloc"),"init");
objj_msgSend(_47,"addIndex:",1);
objj_msgSend(_47,"addIndex:",3);
objj_msgSend(_47,"addIndex:",6);
objj_msgSend(_49,"removeRowsAtIndexes:includeSubrows:",_47,YES);
objj_msgSend(_44,"assertTrue:message:",objj_msgSend(_49,"rowsCount")==1,"Subtest 6.1 failed");
objj_msgSend(_44,"assertTrue:message:",objj_msgSend(_49,"flatRowsCount")==2,"Subtest 6.2 failed");
row=objj_msgSend(_48,"childAtIndex:",0);
objj_msgSend(_44,"assertTrue:message:",objj_msgSend(row,"rowType")==CPRuleEditorRowTypeSimple,"Subtest 6.3 failed");
objj_msgSend(_44,"assertTrue:message:",objj_msgSend(row,"parent")==_48,"Subtest 6.4 failed");
objj_msgSend(_44,"assertTrue:message:",objj_msgSend(row,"depth")==1,"Subtest 6.5 failed");
objj_msgSend(_44,"assertTrue:message:",objj_msgSend(row,"subrowsCount")==0,"Subtest 6.6 failed");
}
}),new objj_method(sel_getUid("test_removeRowsAtIndexes_includeSubrows_no_0"),function(_4b,_4c){
with(_4b){
var _4d,row,_4e,_4f;
var _50=objj_msgSend(_4b,"_setupCompoundModel");
_4f=objj_msgSend(_50,"rowAtIndex:",0);
_4e=objj_msgSend(objj_msgSend(CPMutableIndexSet,"alloc"),"init");
objj_msgSend(_4e,"addIndex:",1);
objj_msgSend(_4e,"addIndex:",5);
objj_msgSend(_4e,"addIndex:",8);
objj_msgSend(_50,"removeRowsAtIndexes:includeSubrows:",_4e,NO);
objj_msgSend(_4b,"assertTrue:message:",objj_msgSend(_50,"rowsCount")==1,"Subtest 1.1 failed");
objj_msgSend(_4b,"assertTrue:message:",objj_msgSend(_50,"flatRowsCount")==7,"Subtest 1.2 failed");
row=objj_msgSend(_4f,"childAtIndex:",1);
objj_msgSend(_4b,"assertTrue:message:",objj_msgSend(row,"rowType")==CPRuleEditorRowTypeCompound,"Subtest 1.3 failed");
objj_msgSend(_4b,"assertTrue:message:",objj_msgSend(row,"subrowsCount")==2,"Subtest 1.4 failed");
_4e=objj_msgSend(objj_msgSend(CPMutableIndexSet,"alloc"),"init");
objj_msgSend(_4e,"addIndex:",2);
objj_msgSend(_4e,"addIndex:",4);
objj_msgSend(_50,"removeRowsAtIndexes:includeSubrows:",_4e,NO);
objj_msgSend(_4b,"assertTrue:message:",objj_msgSend(_50,"rowsCount")==1,"Subtest 2.1 failed");
objj_msgSend(_4b,"assertTrue:message:",objj_msgSend(_50,"flatRowsCount")==5,"Subtest 2.2 failed");
_4d=objj_msgSend(_4f,"subrowsCount");
for(var i=0;i<_4d;i++){
row=objj_msgSend(_4f,"childAtIndex:",i);
objj_msgSend(_4b,"assertTrue:message:",objj_msgSend(row,"rowType")==CPRuleEditorRowTypeSimple,"Subtest 2.3 failed");
objj_msgSend(_4b,"assertTrue:message:",objj_msgSend(row,"parent")==_4f,"Subtest 2.4 failed");
objj_msgSend(_4b,"assertTrue:message:",objj_msgSend(row,"depth")==1,"Subtest 2.5 failed");
}
}
}),new objj_method(sel_getUid("test_removeRowsAtIndexes_includeSubrows_no_1"),function(_51,_52){
with(_51){
var _53,row,_54,_55;
var _56=objj_msgSend(_51,"_setupCompoundModel");
_55=objj_msgSend(_56,"rowAtIndex:",0);
objj_msgSend(_56,"insertNewRowAtIndex:ofType:withParentRowIndex:criteria:",5,CPRuleEditorRowTypeCompound,3,nil);
objj_msgSend(_56,"insertNewRowAtIndex:ofType:withParentRowIndex:criteria:",6,CPRuleEditorRowTypeSimple,5,nil);
objj_msgSend(_56,"insertNewRowAtIndex:ofType:withParentRowIndex:criteria:",6,CPRuleEditorRowTypeSimple,5,nil);
objj_msgSend(_56,"insertNewRowAtIndex:ofType:withParentRowIndex:criteria:",6,CPRuleEditorRowTypeSimple,5,nil);
objj_msgSend(_51,"assertTrue:message:",objj_msgSend(_56,"rowsCount")==1,"Subtest 3.1 failed");
objj_msgSend(_51,"assertTrue:message:",objj_msgSend(_56,"flatRowsCount")==14,"Subtest 3.2 failed");
_54=objj_msgSend(objj_msgSend(CPMutableIndexSet,"alloc"),"init");
objj_msgSend(_54,"addIndex:",1);
objj_msgSend(_54,"addIndex:",3);
objj_msgSend(_54,"addIndex:",5);
objj_msgSend(_54,"addIndex:",7);
objj_msgSend(_54,"addIndex:",12);
objj_msgSend(_56,"removeRowsAtIndexes:includeSubrows:",_54,NO);
objj_msgSend(_51,"assertTrue:message:",objj_msgSend(_56,"rowsCount")==1,"Subtest 4.1 failed");
objj_msgSend(_51,"assertTrue:message:",objj_msgSend(_56,"flatRowsCount")==9,"Subtest 4.2 failed");
_53=objj_msgSend(_55,"subrowsCount");
for(var i=0;i<_53;i++){
row=objj_msgSend(_55,"childAtIndex:",i);
objj_msgSend(_51,"assertTrue:message:",objj_msgSend(row,"rowType")==CPRuleEditorRowTypeSimple,"Subtest 4.3 failed");
objj_msgSend(_51,"assertTrue:message:",objj_msgSend(row,"parent")==_55,"Subtest 4.4 failed");
objj_msgSend(_51,"assertTrue:message:",objj_msgSend(row,"depth")==1,"Subtest 4.5 failed");
}
}
}),new objj_method(sel_getUid("test_removeRowsAtIndexes_includeSubrows_no_2"),function(_57,_58){
with(_57){
var _59,row,_5a,_5b;
var _5c=objj_msgSend(_57,"_setupCompoundModel");
_5b=objj_msgSend(_5c,"rowAtIndex:",0);
objj_msgSend(_5c,"insertNewRowAtIndex:ofType:withParentRowIndex:criteria:",5,CPRuleEditorRowTypeCompound,3,nil);
objj_msgSend(_5c,"insertNewRowAtIndex:ofType:withParentRowIndex:criteria:",6,CPRuleEditorRowTypeSimple,5,nil);
objj_msgSend(_5c,"insertNewRowAtIndex:ofType:withParentRowIndex:criteria:",6,CPRuleEditorRowTypeSimple,5,nil);
objj_msgSend(_5c,"insertNewRowAtIndex:ofType:withParentRowIndex:criteria:",6,CPRuleEditorRowTypeSimple,5,nil);
objj_msgSend(_57,"assertTrue:message:",objj_msgSend(_5c,"rowsCount")==1,"Subtest 5.1 failed");
objj_msgSend(_57,"assertTrue:message:",objj_msgSend(_5c,"flatRowsCount")==14,"Subtest 5.2 failed");
_5a=objj_msgSend(objj_msgSend(CPMutableIndexSet,"alloc"),"init");
objj_msgSend(_5a,"addIndex:",1);
objj_msgSend(_5a,"addIndex:",2);
objj_msgSend(_5a,"addIndex:",5);
objj_msgSend(_5a,"addIndex:",11);
objj_msgSend(_5a,"addIndex:",13);
objj_msgSend(_5c,"removeRowsAtIndexes:includeSubrows:",_5a,NO);
objj_msgSend(_57,"assertTrue:message:",objj_msgSend(_5c,"rowsCount")==1,"Subtest 6.1 failed");
objj_msgSend(_57,"assertTrue:message:",objj_msgSend(_5c,"flatRowsCount")==9,"Subtest 6.2 failed");
var _5d=objj_msgSend(_5b,"childAtIndex:",0);
_59=objj_msgSend(_5d,"subrowsCount");
for(var i=0;i<_59;i++){
row=objj_msgSend(_5d,"childAtIndex:",i);
objj_msgSend(_57,"assertTrue:message:",objj_msgSend(row,"rowType")==CPRuleEditorRowTypeSimple,"Subtest 6.3 failed");
objj_msgSend(_57,"assertTrue:message:",objj_msgSend(row,"parent")==_5d,"Subtest 6.4 failed");
objj_msgSend(_57,"assertTrue:message:",objj_msgSend(row,"depth")==2,"Subtest 6.5 failed");
}
}
})]);
