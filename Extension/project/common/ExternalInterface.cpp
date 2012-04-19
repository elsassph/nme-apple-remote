#ifndef IPHONE
#define IMPLEMENT_API
#endif

#if defined(HX_WINDOWS) || defined(HX_MACOS) || defined(HX_LINUX)
#define NEKO_COMPATIBLE
#endif

#include <stdio.h>
#include <hx/CFFI.h>
#include "Connector.h"
#include "Events.h"

using namespace appleRemote;

AutoGCRoot *remote_handler = 0;

extern "C" {

	// entry point
	void remote_main() 
	{
		InitConnector();
	}
	DEFINE_ENTRY_POINT (remote_main);

	int remote_register_prims() 
	{
		return 0; 
	}

	// event dispatcher
	void remote_send_event(Event &inEvent) 
	{
		value o = alloc_empty_object();
		alloc_field(o,val_id("type"),alloc_int(inEvent.type));
		alloc_field(o,val_id("code"),alloc_int(inEvent.code));
		alloc_field(o,val_id("value"),alloc_int(inEvent.value));
		alloc_field(o,val_id("data"),alloc_string(inEvent.data));
		
		val_call1(remote_handler->get(),o);
	}
}

/* 
 * AppleRemote events handler
 * Setting the handler activates monitoring of remote events
 */

static value remote_set_handler(value onEvent)
{
	if (onEvent == NULL) 
	{
		remote_handler = NULL;
		StopConnector();
	}
	else 
	{
		remote_handler = new AutoGCRoot(onEvent);
		StartConnector();
	}
	return alloc_bool(true);
}
DEFINE_PRIM(remote_set_handler,1);






