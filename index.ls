require! {
  moment
  path
}

module.exports =
  activate: (state)->
    atom.commands.add do
      \atom-workspace
      \atom-memolist-new:create
      ~> @create!

  create: ->
    memodir = atom.config.get \atom-memolist.memo_dir_path .replace /~/, process.env.HOME
    today = moment!.format \YYYY-MM-DD
    time = moment!.format \HHmm
    newFile = path.join memodir, "./#{today}", "#{time}.md"
    atom.workspace.open newFile
