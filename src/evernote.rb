# -*- coding: utf-8 -*-
require "evernote_oauth"

puts("NoteStore")
token = "S=s1:U=94b97:E=16bba6aba0c:C=16462b98dc8:P=1cd:A=en-devtoken:V=2:H=4c8f75f47088d977c950c90cc12ee3c6"
client = EvernoteOAuth::Client.new(:token => token, :sandbox => true)
note_store = client.note_store

puts("get notebook")
notebook_name = ".In-Box"
notebooks = note_store.listNotebooks.select do |notebook|
  notebook.name == notebook_name
end
notebook_guid = notebooks.first.guid
puts("notebook '#{notebook_name}' GUID:#{notebook_guid}")

puts("create notebook")

ENML_HEADER = <<HEADER
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE en-note SYSTEM "http://xml.evernote.com/pub/enml2.dtd">
HEADER

note_content = <<CONTENT
#{ENML_HEADER}
<en-note>Hello, my Evernote (from Ruby)!</en-note>
CONTENT

note = Evernote::EDAM::Type::Note.new
note.title        = "title"
note.notebookGuid = notebook_guid
note.content      = note_content

note_store.createNote(token, note)
puts("screen shot")
gets

puts("search note")
filter = Evernote::EDAM::NoteStore::NoteFilter.new
filter.words = "Ruby"

found_note = note_store.findNotes(token, filter, 0, 1).notes.first
p found_note #=>

puts("update note")

new_note = Evernote::EDAM::Type::Note.new
new_note.title   = "changing of #{found_note.title}"
new_note.guid    = found_note.guid
new_note.content = <<CONTENT
#{ENML_HEADER}
<en-note>
<h1>Hello Evernote!</h1>
<div>This is an example for my entry in Qiita.</div>
</en-note>
CONTENT

note_store.updateNote(token, new_note)
puts("screenshot")
