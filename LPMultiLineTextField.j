/*
 * LPMultiLineTextField.j
 *
 * Created by Ludwig Pettersson on January 22, 2010.
 * 
 * The MIT License
 * 
 * Copyright (c) 2010 Ludwig Pettersson
 * 
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 * 
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 * 
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 * 
 */
@import <AppKit/CPTextField.j>

var CPTextFieldInputOwner = nil;

@implementation LPMultiLineTextField : CPTextField
{
    id          _DOMTextareaElement;
    CPString    _stringValue;
    BOOL        _hideOverflow;
}

- (DOMElement)_DOMTextareaElement
{
    if (!_DOMTextareaElement)
    {
        _DOMTextareaElement = document.createElement("textarea");
        _DOMTextareaElement.style.position = @"absolute";
        _DOMTextareaElement.style.background = @"none";
        _DOMTextareaElement.style.border = @"0";
        _DOMTextareaElement.style.outline = @"0";
        _DOMTextareaElement.style.zIndex = @"100";
        _DOMTextareaElement.style.resize = @"none";
        _DOMTextareaElement.style.padding = @"0";
        _DOMTextareaElement.style.margin = @"0";
        
        _DOMTextareaElement.onblur = function(){
                [[CPTextFieldInputOwner window] makeFirstResponder:nil];
                CPTextFieldInputOwner = nil;
            };

        self._DOMElement.appendChild(_DOMTextareaElement);
    }
    
    return _DOMTextareaElement;
}

- (id)initWithFrame:(CGRect)aFrame
{
    if (self = [super initWithFrame:aFrame])
    {
    }
    return self;
}

- (BOOL)isScrollable
{
   return !_hideOverflow;
}

- (void)setScrollable:(BOOL)shouldScroll
{
    _hideOverflow = !shouldScroll;
}

- (void)setEditable:(BOOL)shouldBeEditable
{
    [self _DOMTextareaElement].style.cursor = shouldBeEditable ? @"cursor" : @"default";
    [super setEditable:shouldBeEditable];
}

- (void)selectText:(id)sender
{
    [self _DOMTextareaElement].select();
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    var contentView = [self layoutEphemeralSubviewNamed:@"content-view"
                                             positioned:CPWindowAbove
                        relativeToEphemeralSubviewNamed:@"bezel-view"];
    [contentView setHidden:YES];
    
    var DOMElement = [self _DOMTextareaElement],
        contentInset = [self currentValueForThemeAttribute:@"content-inset"],
        bounds = [self bounds];

    DOMElement.style.top = contentInset.top + @"px";
    DOMElement.style.bottom = contentInset.bottom + @"px";
    DOMElement.style.left = contentInset.left + @"px";
    DOMElement.style.right = contentInset.right + @"px";
    
    DOMElement.style.width = (CGRectGetWidth(bounds) - contentInset.left - contentInset.right) + @"px";
    DOMElement.style.height = (CGRectGetHeight(bounds) - contentInset.top - contentInset.bottom) + @"px";
        
    DOMElement.style.color = [[self currentValueForThemeAttribute:@"text-color"] cssString];
    DOMElement.style.font = [[self currentValueForThemeAttribute:@"font"] cssString];
 
    switch ([self currentValueForThemeAttribute:@"alignment"])
    {
        case CPLeftTextAlignment:
            DOMElement.style.textAlign = "left";
            break;        
        case CPJustifiedTextAlignment:
            DOMElement.style.textAlign = "justify"; //not supported
            break;        
        case CPCenterTextAlignment:
            DOMElement.style.textAlign = "center";
            break;
        case CPRightTextAlignment:
            DOMElement.style.textAlign = "right";
            break;
        default:
            DOMElement.style.textAlign = "left";
    }
 
    DOMElement.value = _stringValue || @"";

    if(_hideOverflow)
        DOMElement.style.overflow=@"hidden";
}

- (void)scrollWheel:(CPEvent)anEvent
{
    var DOMElement = [self _DOMTextareaElement];
    DOMElement.scrollLeft += anEvent._deltaX;
    DOMElement.scrollTop += anEvent._deltaY;
}

-(void)mouseDown:(CPEvent)anEvent
{
    if ([self isEditable] && [self isEnabled])
        [[[self window] platformWindow] _propagateCurrentDOMEvent:YES];
    else
        [super mouseDown:anEvent];
}

 
-(void)mouseDragged:(CPEvent)anEvent
{
    return [[[anEvent window] platformWindow] _propagateCurrentDOMEvent:YES];
}

- (void)keyUp:(CPEvent)anEvent
{
    if (_stringValue !== [self stringValue])
    {
        _stringValue = [self stringValue];
        
        if (!_isEditing)
        {
            _isEditing = YES;
            [self textDidBeginEditing:[CPNotification notificationWithName:CPControlTextDidBeginEditingNotification object:self userInfo:nil]];
        }
 
        [self textDidChange:[CPNotification notificationWithName:CPControlTextDidChangeNotification object:self userInfo:nil]];
    }
 
    [[[self window] platformWindow] _propagateCurrentDOMEvent:YES];
}

- (BOOL)performKeyEquivalent:(CPEvent)anEvent
{
	var isFirstResponder=[[self window] firstResponder]==self;    
	if(isFirstResponder&&[anEvent _couldBeKeyEquivalent]&&([anEvent modifierFlags] & CPPlatformActionKeyMask))
	{
        [CPTimer scheduledTimerWithTimeInterval:0.0 target:self selector:@selector(keyUp:) userInfo:nil repeats:NO];
        return YES;
	}
	
    [[[self window] platformWindow] _propagateCurrentDOMEvent:YES];

	return isFirstResponder;
}

- (BOOL)becomeFirstResponder
{
    _stringValue = [self stringValue];
    
    [self setThemeState:CPThemeStateEditing];
    
    setTimeout(function(){
        [self _DOMTextareaElement].focus();
        CPTextFieldInputOwner = self;
    }, 0.0);
    
    [self textDidFocus:[CPNotification notificationWithName:CPTextFieldDidFocusNotification object:self userInfo:nil]];
    
    return YES;
}

- (BOOL)resignFirstResponder
{
    [self unsetThemeState:CPThemeStateEditing];
    
    [self setStringValue:[self stringValue]];
    
    [self _DOMTextareaElement].blur();

    if (_isEditing)
    {
        _isEditing = NO;
        [self textDidEndEditing:[CPNotification notificationWithName:CPControlTextDidEndEditingNotification object:self userInfo:nil]];

        if ([self sendsActionOnEndEditing])
            [self sendAction:[self action] to:[self target]];
    }
    
    [self textDidBlur:[CPNotification notificationWithName:CPTextFieldDidBlurNotification object:self userInfo:nil]];
    
    return YES;
}

- (CPString)stringValue
{
    return (!!_DOMTextareaElement) ? _DOMTextareaElement.value : @"";
}

- (void)setStringValue:(CPString)aString
{
    _stringValue = aString;
    [self setNeedsLayout];
}

-(void)setTextColor:(CPColor)color
 {
 	if(!color)
 		return;
	var DOMElement=[self _DOMTextareaElement];
 	DOMElement.style.color=[color cssString];
 	[self setValue:color forThemeAttribute:@"text-color"];
 }

-(void)setEnabled:(BOOL)enabled
{
	[super setEnabled:enabled];
	var DOMElement=[self _DOMTextareaElement];
	DOMElement.disabled=!enabled;
}

-(void)setEditable:(BOOL)editable
{
	[super setEditable:editable];
	var DOMElement=[self _DOMTextareaElement];
	DOMElement.readOnly=!editable;
}


- (CPRange)selectedRange
{
    if ([[self window] firstResponder] !== self)
        return CPMakeRange(0, 0);

    try
    {
        var inputElement = [self _DOMTextareaElement],
            selectionStart = inputElement.selectionStart,
            selectionEnd = inputElement.selectionEnd;

        if ([selectionStart isKindOfClass:CPNumber])
            return CPMakeRange(selectionStart, selectionEnd - selectionStart);

        var theDocument = inputElement.ownerDocument || inputElement.document,
            selectionRange = theDocument.selection.createRange(),
            range = inputElement.createTextRange();

        if (range.inRange(selectionRange))
        {
            range.setEndPoint('EndToStart', selectionRange);
            return CPMakeRange(range.text.length, selectionRange.text.length);
        }
    }
    catch (e)
    {
    }

    return CPMakeRange(0, 0);
}

- (void)setSelectedRange:(CPRange)aRange
{
    if (![[self window] firstResponder] === self)
        return;

    var inputElement = [self _DOMTextareaElement];

    try
    {
        if ([inputElement.selectionStart isKindOfClass:CPNumber])
        {
            inputElement.selectionStart = aRange.location;
            inputElement.selectionEnd = CPMaxRange(aRange);
        }
        else
        {
            var theDocument = inputElement.ownerDocument || inputElement.document,
                existingRange = theDocument.selection.createRange(),
                range = inputElement.createTextRange();

            if (range.inRange(existingRange))
            {
                range.collapse(true);
                range.move('character', aRange.location);
                range.moveEnd('character', aRange.length);
                range.select();
            }
        }
    }
    catch (e)
    {
    }
}


@end


var LPMultiLineTextFieldStringValueKey = "LPMultiLineTextFieldStringValueKey",
    LPMultiLineTextFieldScrollableKey = "LPMultiLineTextFieldScrollableKey";
    
@implementation LPMultiLineTextField (CPCoding)

- (id)initWithCoder:(CPCoder)aCoder
{
    if (self = [super initWithCoder:aCoder])
    {
        [self setStringValue:[aCoder decodeObjectForKey:LPMultiLineTextFieldStringValueKey]];
        [self setScrollable:[aCoder decodeBoolForKey:LPMultiLineTextFieldScrollableKey]];
    }
    return self;
}

- (void)encodeWithCoder:(CPCoder)aCoder
{
    [super encodeWithCoder:aCoder];      
    [aCoder encodeObject:_stringValue forKey:LPMultiLineTextFieldStringValueKey];
    [aCoder encodeBool:(_hideOverflow?NO:YES) forKey:LPMultiLineTextFieldScrollableKey];
}

@end
