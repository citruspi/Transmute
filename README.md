# What is Transmute?
Transmute is a lightweight, OS X wrapper for the `Calibre CLI` and for `kindlegen` which converts ebooks of various file types to the `MobiPocket` type. (I have a Kindle ♥).

#Why?
Obviously, Transmute is no marvel. It's not a converter per se, its a wrapper for two other converters. But, its easy and simple and I like it. 

Calibre's UI is a mess. It's clunky and not very "Mac-Like". It makes libraries with copies of all the books you import and convert.

I prefer to convert the `.epub`, copy the `.mobi` to my Kindle, and then delete the original. 

So, I used the `Calibre CLI`. But, many people __don't like Calibre__ AND __don't like the command line__. So, I wrote Transmute, a wrapper for the CLI which makes everyone happy. 

_Transmute isn't dependent on the installation of the Calibre CLI. If the user doesn't want to install it, Transmute is bundled with a copy of kindlegen (by Amazon) and it uses that._

# Screenshots

Main Window (for Conversions):

![Conversion](http://i.imgur.com/YzKJO.png)

***

Warning Window (if Calibre CLI isn't installed):

![Warning](http://i.imgur.com/IaL2X.png)

# Usage/Installation

## Transmute

Transmute is provided as an Xcode project. Developers, you know what to do. 

_If you're not a developer and have absolutely NO IDEA what to do, just shoot me an email._

## Calibre

If the Calibre CLI isn't installed and you chose to download it, you were brought to this page. Here's the deal:

* Download Calibre from <http://calibre-ebook.com>.
* Install it and set it up
* (In the menu) Go to `calibre --> Preferences`
* (In the sheet that drops down) Go to `Advanced --> Miscellaneous --> Install command line tools`
* Done!

## kindlegen

kindlegen comes bundled with the Transmute app. It's copied into the `Resources` directory of the app bundle.

# "Workflow"

```
if (calibre_cli not installed){
    if (users wants to install){
        open(URL);
        quit(app);
    }

    else{
        if(kindlegen not installed){
            copy(kindlegen);
        }
    }                 
}
```

# Compatible File Types

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

# License

The __code__ for Transmute is licensed under a WTFPL - do what the fuck you want to do. The terms are as follows:

```
         DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
                    Version 2, December 2004

 Copyright (C) 2012 The Royal Panda Company <mihir@royalpanda.co>

 Everyone is permitted to copy and distribute verbatim or modified
 copies of this license document, and changing it is allowed as long
 as the name is changed.

            DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
   TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION

  0. You just DO WHAT THE FUCK YOU WANT TO.
```

However, there are some other licenses for the graphics. Read more at the Credits section.

# Credits

* [TheRealMihir](https://github.com/TheRealMihir) started and maintains the project.
* The graphics (note, info icon, buttons, arrow) are from [Premium Pixels](http://premiumpixels.com).

At the time of writing this, the license for graphics from Premium Pixels is:

```
All resources made available on Premium Pixels, including but not limited to, icons, images, brushes, shapes, layer styles, layered PSD’s, patterns, textures, web elements and themes are free for use in both personal and commercial projects.

You may freely use my resources, without restriction, in software programs, web templates and other materials intended for sale or distribution. No attribution or backlinks are strictly required, but play the game, it’s always nice to be credited for your work. Any form of spreading the word is always appreciated!
```

So, don't be a jerk. Leave a link.

* The icon is from [PSD Graphics](http://www.psdgraphics.com/). 

I've included all the icon in the "graphics" folder. I'm on a Mac and I use [Pixelmator](http://pixelmator.com) for graphic editing - the icon is a `.pxm` file.

To use the icon commercially, you must pay for a commercial license [here](http://www.psdgraphics.com/commercial-use/). I have already purchased a license.

# Contribute

Want to contribute? We'd love to have you on board.