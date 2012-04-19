**haxe NME extension for Apple Remote (Mac)**

This is a native extension for haxe NME, allowing Mac applications to easily 
interact with the Apple Remote Control.

**Usage**

Add reference in your .nmml:

    <extension name="appleRemote" path="../Extension" />

Add a listener in your code:

    import nme.peripherals.AppleRemote;
    ...
    AppleRemote.setEventHandler(onRemote);
    ...
    private function onRemote(e) {
	received(e);
    }


**Recompilation**

    cd Extension/project
    haxelib run hxcpp Build.xml

**License:**

This extension and example license:

    Unless indicated otherwise, this code was created by Philippe Elsass and
    provided under a MIT-style license. 
    Copyright (c) Philippe Elsass. All rights reserved.

    Permission is hereby granted, free of charge, to any person obtaining a 
    copy of this software and associated documentation files (the "Software"),
    to deal in the Software without restriction, including without limitation
    the rights to use, copy, modify, merge, publish, distribute, sublicense,
    and/or sell copies of the Software, and to permit persons to whom the
    Software is furnished to do so, subject to the following conditions:

    The above copyright notice and this permission notice shall be included
    in all copies or substantial portions of the Software.

    THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
    IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
    FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL 
    THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
    LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
    OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
    THE SOFTWARE.

The extension includes a copy of some classes from Martin Kahr's [Remote Control 
Wrapper][1], released under the MIT license (see license information in the relevant
files).

[1]: http://martinkahr.com/source-code/


