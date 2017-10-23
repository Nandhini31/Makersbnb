// 0

(function(exports){
  function NoteController(NoteList) {
    this.noteListView = new NoteListView(NoteList);
  }

  NoteController.prototype = {
    displayNoteList: function () {
      document.getElementById("app").innerHTML = this.noteListView.display();
    },

    displayNoteTextForId: function(id){
      document.getElementById("noteText").innerHTML = this.noteListView.displayNoteTextForId(id);
    },

    addNote: function(text) {
      this.noteListView._noteList.addNote(text);
    }
  };

  exports.NoteController = NoteController;
})(this);



(function makeUrlChangeToDisplayNoteContent() {
  window.addEventListener("hashchange", showNoteContentForCurrentPage);
})();

function showNoteContentForCurrentPage() {
  NoteController.displayNoteTextForId(getNoteIdFromUrl());
}

function getNoteIdFromUrl (location) {
  id = this.location.hash.split("/")[1];
  return Number(this.location.hash.split("/")[1]);
}

(function submitEventListener() {
  document.getElementById('newNoteForm').addEventListener("submit", postRequestHandler);
})();

function postRequestHandler(event) {
  event.preventDefault();
  NoteController.addNote(readTextField());
  clearTextField();
  NoteController.displayNoteList();
}

function readTextField() {
  return document.getElementById('textarea').value;
}

function clearTextField() {
  document.getElementById('textarea').value = "";
}
