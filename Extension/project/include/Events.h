#ifndef Events_H_
#define Events_H_

enum EventType {
	etUnknown,                   // 0
	etAPPLE_REMOTE_KEY_DOWN,     // 1
	etAPPLE_REMOTE_KEY_UP        // 2
};

struct Event {

	Event(EventType inType=etUnknown, int inCode = 0, int inValue = 0, const char *inData = "")
		:type(inType), code(inCode), value(inValue), data(inData) {}

	EventType type;
	int       code;
	int       value;
	const char *data;
};

#endif