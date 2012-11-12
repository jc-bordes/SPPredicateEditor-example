/*
 * AppController.j
 *
 * Created by JC Bordes jcbordes@gmail.com
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
 */

@import <Foundation/CPObject.j>
@import <AppKit/CPScrollView.j>
@import <AppKit/CPSegmentedControl.j>
@import "LPMultiLineTextField.j"
@import <SPPredicateEditor/SPPredicateEditor.j>

@implementation AppController : CPObject
{
   	@outlet CPWindow    theWindow; //this "outlet" is connected automatically by the Cib
	@outlet CPScrollView scrollView;
   	@outlet SPPredicateEditor editor;
   	@outlet LPMultiLineTextField predicateField;
   	@outlet CPButton refreshButton;
   	@outlet CPButton autoRefreshButton;
	@outlet CPTextField rowHeightField;
	@outlet CPView bgView;
	@outlet CPView appView;
		
	BOOL _autoRefresh;
}

- (void)applicationDidFinishLaunching:(CPNotification)aNotification
{
    [bgView setBackgroundColor:[CPColor colorWithHexString:@"777777"]];
    [appView setBackgroundColor:[CPColor colorWithHexString:@"ededed"]];
    
    var dom=appView._DOMElement;
    dom.style.borderRadius="10px";
    dom.style.boxShadow="rgba(0, 0, 0, 0.5) 0px 0px 30px";
    dom.style.mozBoxShadow="rgba(0, 0, 0, 0.5) 0px 0px 30px";
	dom.style.webkitBoxShadow="rgba(0, 0, 0, 0.5) 0px 0px 30px";

	_autoRefresh=([autoRefreshButton state]==CPOnState);
	[rowHeightField setStringValue:[editor rowHeight]];
	
	var templates=[CPMutableArray array];
	[templates addObject:[self compoundRowTemplate]];
	[templates addObject:[self rowTemplateWithLeftKeys:[@"os"] rightConstants:[@"iOS",@"android",@"webapp"]]];
	[templates addObject:[self rowTemplateWithStringEditorAndLeftKeys:[@"model"] 
		options:CPCaseInsensitivePredicateOption|CPDiacriticInsensitivePredicateOption]];
	[templates addObject:[self rowTemplateWithStringEditorAndLeftKeys:[@"code"] options:0]];
	[templates addObject:[self rowTemplateWithBooleanEditorAndLeftKeys:[@"registered",@"connected"]]];
	[templates addObject:[self rowTemplateWithIntegerEditorAndLeftKeys:[@"nbCx"]]];
	[templates addObject:[self rowTemplateWithFloatEditorAndLeftKeys:[@"rating"]]];

	[editor setRowTemplates:templates];
	[editor addRow:nil];
}
	

- (void)awakeFromCib
{
    [theWindow setFullPlatformWindow:YES];

	[CPScrollView setGlobalScrollerStyle:CPScrollerStyleOverlay];
	[scrollView setBackgroundColor:[CPColor colorWithHexString:@"ededed"]];
   	[[theWindow contentView] setBackgroundColor:[CPColor colorWithHexString:@"ededed"]];

	[predicateField setTextColor:[CPColor blackColor]];
	[predicateField setEditable:NO];
	
	[[CPNotificationCenter defaultCenter] addObserver:self selector:@selector(rowsDidChange:) name:SPRuleEditorRowsDidChangeNotification object:editor];
}

-(void)refreshPredicate
{
	[editor reloadPredicate];
	var predicate=[editor predicate];
	var text=[predicate predicateFormat];
	
	[predicateField setStringValue:text];
}

-(void)roundtripPredicate
{
	var oldMode=_autoRefresh;
	_autoRefresh=NO;
	
	[editor reloadPredicate];
	var predicate=[editor predicate];
	var original=[predicate predicateFormat];

	[editor setObjectValue:predicate];
	predicate=[editor predicate];

	var roundtriped=[predicate predicateFormat];
	[predicateField setStringValue:roundtriped];

	_autoRefresh=oldMode;
	
	[self showRoundtripResult:(original===roundtriped)];
}

-(void)showRoundtripResult:(BOOL)ok
{
	var alert;
	var alert=ok?[CPAlert alertWithMessageText:@"Successful round trip" 
					defaultButton:@"Continue" alternateButton:nil otherButton:nil informativeTextWithFormat:nil]
				:[CPAlert alertWithError:@"Round trip failed"];
	[alert setTitle:@"Round trip result"];
	[alert runModal];
}

-(void)rowsDidChange:(CPNotification)notification
{
	if(_autoRefresh)
		[self refreshPredicate];
}

-(@action)stateChanged:(id)sender
{
	[editor setEditable:[sender selectedSegment]==0];
}

-(@action)modeChanged:(id)sender
{
	var selectedSegment=[sender selectedSegment];
	switch(selectedSegment)
	{
		case 0 :
			[editor setNestingMode:CPRuleEditorNestingModeCompound];
			[editor addRow:nil];
		break;
		case 1 :
			[editor setNestingMode:CPRuleEditorNestingModeSimple];
			[editor addRow:nil];
		break;
		case 2 :
			[editor setNestingMode:CPRuleEditorNestingModeList];
			[editor addRow:nil];
		break;
		case 3 :
			[editor setNestingMode:CPRuleEditorNestingModeSingle];
			[editor addRow:nil];
		break;
	}
}

-(@action)rowHeightChanged:(id)sender
{
	var value=[[sender stringValue] floatValue];
	[editor setRowHeight:value];
	[sender setStringValue:[editor rowHeight]];
}

-(@action)autoRefreshClicked:(id)sender
{
	if([sender state]==CPOffState)
	{
		_autoRefresh=NO;
		[refreshButton setEnabled:YES];
		return;
	}
	
	_autoRefresh=YES;
	[refreshButton setEnabled:NO];
	[self refreshPredicate];
}

-(@action)refreshClicked:(id)sender
{
	[self refreshPredicate];
}

-(@action)roundTripClicked:(id)sender
{
	[self roundtripPredicate];
}

-(SPPredicateEditorRowTemplate) compoundRowTemplate
{
	return [[SPPredicateEditorRowTemplate alloc] initWithCompoundTypes:[1,2,0]]; 
}

-(SPPredicateEditorRowTemplate) rowTemplateWithStringEditorAndLeftKeys:(CPArray)leftKeys options:(CPInteger)options
{
	if(!leftKeys)
		return;

	var operators=[
		CPEqualToPredicateOperatorType,
		CPNotEqualToPredicateOperatorType,
	 	CPLikePredicateOperatorType,
	 	CPBeginsWithPredicateOperatorType,
	 	CPEndsWithPredicateOperatorType,
	 	CPMatchesPredicateOperatorType
	 	];

	var leftExpressions=[CPMutableArray array];
	for(var i=0;i<[leftKeys count];i++)
		[leftExpressions addObject:[CPExpression expressionForKeyPath:[leftKeys objectAtIndex:i]]];

	return [[SPPredicateEditorRowTemplate alloc] initWithLeftExpressions:leftExpressions 
		rightExpressionAttributeType:CPStringAttributeType 
		modifier:0 
		operators:operators 
		options:options];	 
}
 
-(SPPredicateEditorRowTemplate) rowTemplateWithLeftKeys:(CPArray)leftKeys rightConstants:(CPArray)rightConstants
{
	if(!leftKeys||!rightConstants)
		return;

	var operators=[CPEqualToPredicateOperatorType,CPNotEqualToPredicateOperatorType];

	var leftExpressions=[CPMutableArray array];
	for(var i=0;i<[leftKeys count];i++)
		[leftExpressions addObject:[CPExpression expressionForKeyPath:[leftKeys objectAtIndex:i]]];

	var constants=[CPMutableArray array];
	for(var i=0;i<[rightConstants count];i++)
		[constants addObject:[CPExpression expressionForConstantValue:[rightConstants objectAtIndex:i]]];
	
	return [[SPPredicateEditorRowTemplate alloc] 
		initWithLeftExpressions:leftExpressions 
		rightExpressions:constants 
		modifier:0 
		operators:operators 
		options:0];
}

-(SPPredicateEditorRowTemplate) rowTemplateWithBooleanEditorAndLeftKeys:(CPArray)leftKeys
{
	if(!leftKeys)
		return;

	var operators=[
		CPEqualToPredicateOperatorType,
		CPNotEqualToPredicateOperatorType
		];

	var leftExpressions=[CPMutableArray array];
	for(var i=0;i<[leftKeys count];i++)
		[leftExpressions addObject:[CPExpression expressionForKeyPath:[leftKeys objectAtIndex:i]]];

	return [[SPPredicateEditorRowTemplate alloc] initWithLeftExpressions:leftExpressions 
		rightExpressionAttributeType:CPBooleanAttributeType 
		modifier:0 
		operators:operators 
		options:0];	 
}

-(SPPredicateEditorRowTemplate) rowTemplateWithFloatEditorAndLeftKeys:(CPArray)leftKeys
{
	if(!leftKeys)
		return;

	var operators=[
	 	CPEqualToPredicateOperatorType,	
 		CPNotEqualToPredicateOperatorType,
 		CPGreaterThanOrEqualToPredicateOperatorType,
 		CPGreaterThanPredicateOperatorType,
 		CPLessThanOrEqualToPredicateOperatorType,
 		CPLessThanPredicateOperatorType
 		];

	var leftExpressions=[CPMutableArray array];
	for(var i=0;i<[leftKeys count];i++)
		[leftExpressions addObject:[CPExpression expressionForKeyPath:[leftKeys objectAtIndex:i]]];

	return [[SPPredicateEditorRowTemplate alloc] initWithLeftExpressions:leftExpressions 
		rightExpressionAttributeType:CPDoubleAttributeType 
		modifier:0 
		operators:operators 
		options:0];	 
}

-(SPPredicateEditorRowTemplate) rowTemplateWithIntegerEditorAndLeftKeys:(CPArray)leftKeys
{
	if(!leftKeys)
		return;

	var operators=[
	 	CPEqualToPredicateOperatorType,	
 		CPNotEqualToPredicateOperatorType,
 		CPGreaterThanOrEqualToPredicateOperatorType,
 		CPGreaterThanPredicateOperatorType,
 		CPLessThanOrEqualToPredicateOperatorType,
 		CPLessThanPredicateOperatorType
 		];

	var leftExpressions=[CPMutableArray array];
	for(var i=0;i<[leftKeys count];i++)
		[leftExpressions addObject:[CPExpression expressionForKeyPath:[leftKeys objectAtIndex:i]]];

	return [[SPPredicateEditorRowTemplate alloc] initWithLeftExpressions:leftExpressions 
		rightExpressionAttributeType:CPInteger64AttributeType 
		modifier:0 
		operators:operators 
		options:0];	 
}


@end
