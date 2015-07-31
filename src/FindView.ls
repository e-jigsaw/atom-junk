require! {
  \child_process : {spawnSync}
  path
  \atom-space-pen-views : {SelectListView, $$}
}

class FindView extends SelectListView
  initialize: (@memodir)->
    console.log @memodir
    super!
    @toggle!

  toggle: -> if @panel?.isVisible! then @cancel! else @show!

  getFilterKey: -> \preview

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
    atom.workspace.open do
      file.filename
      initialLine: file.line - 1
    @cancel!

  cancelled: -> @hide!

  pt: ~>
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

module.exports = FindView
