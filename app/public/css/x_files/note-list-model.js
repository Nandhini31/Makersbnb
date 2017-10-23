(function(exports) {

  function NoteList() {
    this._notes = [];
  };

  NoteList.prototype = {
    addNote: function(text) {
      noteId = this._getNewNoteId();
      this._notes.push(new Note(text, noteId));
    },

    _getNewNoteId: function() {
      var noteId = 0;
      if (this._notes.length > 0) {
        arrayIndex = this._notes.length - 1;
        previousId = this._notes[arrayIndex].getNoteId();
        noteId = previousId + 1;
      };
      return noteId;
    },

    getNotes: function(){
      return this._notes;
    },

    getNoteFromId: function(id) {
      notes = this.getNotes();
      var noteToReturn;
      notes.forEach(function(note){
        if(note.getNoteId() === id) {
          noteToReturn = note;
        };
      });
      return noteToReturn;
    }
  };

  exports.NoteList = NoteList;
})(this);
