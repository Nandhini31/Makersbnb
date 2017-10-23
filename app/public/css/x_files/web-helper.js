(function(exports){
  function setEventListenersFor(controller){
    (function makeUrlChangeToDisplayNoteContent() {
      window.addEventListener("hashchange", showNoteContentForCurrentPage);
    })();

    (function submitEventListener() {
      document.getElementById('newNoteForm').addEventListener("submit", postRequestHandler);
    })();
  };

  // Private implementation

  function showNoteContentForCurrentPage() {
    controller.displayNoteTextForId(getNoteIdFromUrl());
  }

  function getNoteIdFromUrl (location) {
    id = this.location.hash.split("/")[1];
    return Number(this.location.hash.split("/")[1]);
  }

  function postRequestHandler(event) {
    event.preventDefault();
    controller.addNote(readTextField());
    clearTextField();
    controller.displayNoteList();
  }

  function readTextField() {
    return document.getElementById('textarea').value;
  }

  function clearTextField() {
    document.getElementById('textarea').value = "";
  }

  exports.setEventListenersFor = setEventListenersFor;
})(this);
