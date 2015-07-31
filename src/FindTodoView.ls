require! {
  \./FindView.ls
}

class FindTodoView extends FindView
  show: ->
    @panel ?= atom.workspace.addModalPanel do
      item: @
    @panel.show!
    @storeFocusedElement!
    @filterEditorView.getModel!.setText \TODO
    @pt!
    @focusFilterEditor!

module.exports = FindTodoView
