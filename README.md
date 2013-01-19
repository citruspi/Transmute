## Transmute, A Calibre CLI and kindlegen Wrapper

### Introduction
Transmute is a lightweight, OS X wrapper for the `Calibre CLI` and for `kindlegen` which converts ebooks of various file types to the `MobiPocket` type. (I have a Kindle ♥).

### Why?


Calibre's UI is a mess. It's clunky and not very "Mac-Like". I used to dread having to convert ebook files. Eventually, I switched to using the Calibre CLI. Unfortunately, many friends of mine aren't comfortable with the CLI - they force themselves to continue using the GUI.

So, I wrote Transmute, a wrapper for the CLI which makes everyone happy. 

_Transmute doesn't depend on Calibre CLI being installed. If the user doesn't want to install it, Transmute is bundled with a copy of kindlegen (by Amazon) and it uses that._

### Screenshots

Main Window (for Conversions):

![Conversion](http://i.imgur.com/YzKJO.png)

<br/>

Warning Window (if Calibre CLI isn't installed):

![Warning](http://i.imgur.com/IaL2X.png)

### Installation

#### Calibre CLI

If the Calibre CLI isn't installed and you chose to download it, you were brought to this page. Here's the deal:

* Download Calibre from <http://calibre-ebook.com>.
* Install it and set it up
* (In the menu) Go to `calibre --> Preferences`
* (In the sheet that drops down) Go to `Advanced --> Miscellaneous --> Install command line tools`
* Done!

#### kindlegen

kindlegen comes bundled with the Transmute app. It's copied into the `Resources` directory of the app bundle.

### Compatible File Types

|File Type|Calibre CLI|Transmute (kindlegen)|
|:--------|:---------:|:--------------------|
|azw4|✓|✘|
|chm|✓|✘|
|djvu|✓|✘|
|epub|✓|✓|
|fb2|✓|✘|
|htlz|✓|✘|
|htm|✘|✓|
|html|✓|✓|
|lit|✓|✘|
|lrf|✓|✘|
|mobi|✓|✘|
|odt|✓|✘|
|opf|✘|✓|
|pdb|✓|✘|
|pdf|✓|✘|
|pml|✓|✘|
|rb|✓|✘|
|rtf|✓|✘|
|snb|✓|✘|
|tcr|✓|✘|
|txt|✓|✘|
|txtz|✓|✘|
|azw3|✓|✘|

### License

The graphics (note, info icon, buttons, arrow) are from [Premium Pixels](http://premiumpixels.com).

At the time of writing this, the license for graphics from Premium Pixels is:

```
All resources made available on Premium Pixels, including but not limited to, icons, images, brushes, shapes, layer styles, layered PSD’s, patterns, textures, web elements and themes are free for use in both personal and commercial projects.

You may freely use my resources, without restriction, in software programs, web templates and other materials intended for sale or distribution. No attribution or backlinks are strictly required, but play the game, it’s always nice to be credited for your work. Any form of spreading the word is always appreciated!
```

So, don't be a jerk. Leave a link.

* The icon is from [PSD Graphics](http://www.psdgraphics.com/). 

I've included all the icon in the "graphics" folder. I'm on a Mac and I use [Pixelmator](http://pixelmator.com) for graphic editing - the icon is a `.pxm` file.

To use the icon commercially, you must pay for a commercial license [here](http://www.psdgraphics.com/commercial-use/). I have already purchased a license.

Transmute is open source and is distributed under the MIT License:

    Copyright © 2012 Mihir Singh <me@mihirsingh.com>

	Permission is hereby granted, free of charge, to any person obtaining a copy of 
	this software and associated documentation files (the “Software”), to deal in 
	the Software without restriction, including without limitation the rights to 
	use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of 
	the Software, and to permit persons to whom the Software is furnished to do 
	so, subject to the following conditions:

	The above copyright notice and this permission notice shall be included in all 
	copies or substantial portions of the Software.

	THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY 
	KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE 
	WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR 
	PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE 
	AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, 
	DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF 
	CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN 
	CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS 
	IN THE SOFTWARE.
	
### Contributing
Just fork and submit a pull request ;)
