
http://www.mutt.org/doc/manual/

## Core Concepts

A line-based menu is the so-called “index” menu (listing all messages of the currently opened folder) 
the “alias” menu (allowing you to select recipients from a list). 
Examples for page-based menus are the “pager” (showing one message at a time)

Because Mutt allows for customizing almost all key bindings, there are
so-called “functions” which can be executed manually (using the command line)
or in macros.


### index

thread hierarchies: when you reply to an email, and the other person replies
back, you can see the other person's email in a "sub-tree" below. This is
especially useful for personal email between a group of people or when you've
subscribed to mailing lists.

### pager

The pager is responsible for showing the email content. On the top of the pager
you have an overview over the most important email headers like the sender, the
recipient, the subject, and much more information. How much information you
actually see depends on your configuration ## 

### File Browser

The file browser is the interface to the local or remote file system. When
selecting a mailbox to open, the browser allows custom sorting of items,
limiting the items shown by a regular expression and a freely adjustable format
of what to display in which way.

Some mail systems can nest mail folders inside other mail folders. The normal
open entry commands in mutt will open the mail folder and you can't see the
sub-folders. If you instead use the <descend-directory> function it will go
into the directory and not open it as a mail directory.


### Sidebar

The Sidebar shows a list of all your mailboxes. The list can be turned on and
off, it can be themed and the list style can be configured.

### Compose Menu

The compose menu features a split screen containing the information which
really matter before actually sending a message by mail: who gets the message
as what (recipients and who gets what kind of copy). Additionally, users may
set security options like deciding whether to sign, encrypt or sign and encrypt
a message with/for what keys. Also, it's used to attach messages, to re-edit
any attachment including the message itself.

### alias Menu

The alias menu is used to help users finding the recipients of messages. For
users who need to contact many people, there's no need to remember addresses or
names completely because it allows for searching, too. The alias mechanism and
thus the alias menu also features grouping several addresses by a shorter
nickname, the actual alias, so that users don't have to select each single
recipient manually.


### Attachment Menu

As will be later discussed in detail, Mutt features a good and stable MIME
implementation, that is, it supports sending and receiving messages of
arbitrary MIME types. The attachment menu displays a message's structure in
detail: what content parts are attached to which parent part (which gives a
true tree structure), which type is of what type and what size. Single parts
may saved, deleted or modified to offer great and easy access to message's
internals.

## a
