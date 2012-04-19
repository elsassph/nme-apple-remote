#include <stdio.h>
#import "Connector.h"
#import "RemoteControl.h"
#import "AppleRemote.h"
#import "MultiClickRemoteBehavior.h"
#include "Events.h"

extern "C" void remote_send_event(Event &inEvent);

@interface Connector : NSObject {
	RemoteControl* remoteControl;
	MultiClickRemoteBehavior* remoteBehavior;
}
@end

@implementation Connector

-(id)init
{
    if (self = [super init])
    {
        AppleRemote* newRemoteControl = [[[AppleRemote alloc] initWithDelegate: self] autorelease];
		[newRemoteControl setDelegate: self];

		/*remoteBehavior = [MultiClickRemoteBehavior new];		
		[remoteBehavior setDelegate: self];
		[newRemoteControl setDelegate: remoteBehavior];*/

		remoteControl = [newRemoteControl retain];
    }
    return self;
}

-(void) startListening
{
	[remoteControl startListening: self];
}

-(void) stopListening
{
	[remoteControl stopListening: self];
}

// delegate method for the AppleRemote
-(void) sendRemoteButtonEvent: (RemoteControlEventIdentifier) event 
                   pressedDown: (BOOL) pressedDown 
                 remoteControl: (RemoteControl*) remoteControl 
{
	NSString* buttonName = nil;
	NSString* pressed = pressedDown ? @"(pressed)" : @"(released)";
	
	switch(event) {
		case kRemoteButtonPlus:
			buttonName = @"Volume up";			
			break;
		case kRemoteButtonMinus:
			buttonName = @"Volume down";
			break;			
		case kRemoteButtonMenu:
			buttonName = @"Menu";
			break;			
		case kRemoteButtonPlay:
			buttonName = @"Play";
			break;			
		case kRemoteButtonRight:	
			buttonName = @"Right";
			break;			
		case kRemoteButtonLeft:
			buttonName = @"Left";
			break;			
		case kRemoteButtonRight_Hold:
			buttonName = @"Right holding";	
			break;	
		case kRemoteButtonLeft_Hold:
			buttonName = @"Left holding";		
			break;			
		case kRemoteButtonPlus_Hold:
			buttonName = @"Volume up holding";	
			break;				
		case kRemoteButtonMinus_Hold:			
			buttonName = @"Volume down holding";	
			break;				
		case kRemoteButtonPlay_Hold:
			buttonName = @"Play (sleep mode)";
			break;			
		case kRemoteButtonMenu_Hold:
			buttonName = @"Menu (long)";
			break;
		case kRemoteControl_Switched:
			buttonName = @"Remote Control Switched";
			break;
		default:
			NSLog(@"Unmapped event for button %d", event); 
			break;
	}

	NSLog(@"%@ %@", buttonName, pressed);
	//if (pressedDown == NO) printf("\n");
	Event evt(pressedDown ? etAPPLE_REMOTE_KEY_DOWN : etAPPLE_REMOTE_KEY_UP);
	evt.data = [buttonName UTF8String];
	evt.value = event;
	remote_send_event(evt);
}

// delegate method for the MultiClickRemoteBehavior
/*- (void) remoteButton: (RemoteControlEventIdentifier)buttonIdentifier 
          pressedDown: (BOOL) pressedDown 
           clickCount: (unsigned int)clickCount
{
}*/

@end 


namespace appleRemote 
{

	int inited = 0;
	NSAutoreleasePool *pool;
	Connector *connector;

	void InitConnector() 
	{
		if (inited) return;
		inited = 1;
		pool = [[NSAutoreleasePool alloc] init];
		connector = [[Connector alloc] init];
	}

	void StartConnector()
	{
		[connector startListening];
	}

	void StopConnector()
	{
		[connector stopListening];
	}

}


