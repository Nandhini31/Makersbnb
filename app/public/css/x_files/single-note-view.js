(function(exports) {
  function SingleNoteView(note) {
    this._note = note;
  };

  SingleNoteView.prototype = {
    display: function() {
      var note = this._note
      return "<div>" + note.text() + "</div>";
    }
  };

  exports.SingleNoteView = SingleNoteView;
})(this);
