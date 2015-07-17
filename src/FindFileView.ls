require! {
  fs: {readdirSync}
  path
  \atom-space-pen-views : {SelectListView, $$}
}

class FindFileView extends SelectListView
  initialize: (@memodir)->
    super!
    @toggle!

  toggle: -> if @panel?.isVisible! then @cancel! else @show!

  show: ->
    @panel ?= atom.workspace.addModalPanel do
      item: @
    @panel.show!
    @storeFocusedElement!
    readdirSync @memodir .reverse! |> @setItems
    @focusFilterEditor!

  hide: -> @panel?.hide!

  viewForItem: (file)->
    $$ ->
      @li file

  confirmed: (file)->
    atom.workspace.open path.join @memodir, file
    @cancel!

  cancelled: -> @hide!

module.exports = FindFileView
