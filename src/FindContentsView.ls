require! {
  \child_process : {spawnSync}
  path
  \atom-space-pen-views : {SelectListView, $$}
}

class FindContentsView extends SelectListView
  initialize: (@memodir)->
    super!
    @toggle!

  toggle: -> if @panel?.isVisible! then @cancel! else @show!

  getFilterKey: -> \preview

  show: ->
    @panel ?= atom.workspace.addModalPanel do
      item: @
    @panel.show!
    @storeFocusedElement!
    @filterEditorView.getModel!.getBuffer!.onDidChange ~>
      try
        res = spawnSync \pt, [@filterEditorView.getText!, @memodir]
        res = res.stdout.toString!.split \\n .map (row)->
          row.split \:
        .filter (row)->
          row.1?
        .map (row)->
          filename: row.0
          line: row.1
          preview: row.slice 2 .join \:
        |> @setItems
      catch err
        console.log err
    @focusFilterEditor!

  hide: -> @panel?.hide!

  viewForItem: ({filename, line, preview})->
    $$ ->
      @li do
        class: \event
        \data-event-name : filename
        ~>
          @p do
            class: \command-name
            filename
          @p do
            class: \command-description
            preview

  confirmed: (file)->
    atom.workspace.open path.join @memodir, file
    @cancel!

  cancelled: -> @hide!

module.exports = FindContentsView
