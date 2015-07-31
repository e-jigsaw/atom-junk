require! {
  \./FindView.ls
}

class FindContentsView extends FindView
  show: ->
    @panel ?= atom.workspace.addModalPanel do
      item: @
    @panel.show!
    @storeFocusedElement!
    @filterEditorView.getModel!.getBuffer!.onDidChange @pt
    @focusFilterEditor!

module.exports = FindContentsView