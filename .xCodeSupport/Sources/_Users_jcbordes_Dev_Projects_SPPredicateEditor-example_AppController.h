
@interface AppController : NSObject
{
    IBOutlet NSWindow* theWindow;
    IBOutlet NSScrollView* scrollView;
    IBOutlet SPPredicateEditor* editor;
    IBOutlet LPMultiLineTextField* predicateField;
    IBOutlet NSButton* refreshButton;
    IBOutlet NSButton* autoRefreshButton;
    IBOutlet NSTextField* rowHeightField;
    IBOutlet NSView* bgView;
    IBOutlet NSView* appView;
}
- (IBAction)stateChanged:(id)aSender;
- (IBAction)modeChanged:(id)aSender;
- (IBAction)rowHeightChanged:(id)aSender;
- (IBAction)autoRefreshClicked:(id)aSender;
- (IBAction)refreshClicked:(id)aSender;
- (IBAction)roundTripClicked:(id)aSender;
@end