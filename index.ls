require! {
  moment
  path
}

module.exports =
  activate: ->
    atom.commands.add do
      \atom-workspace
      \junk:create
      ~> @create!

  create: ->
    memodir = atom.config.get \junk.dirPath .replace /~/, process.env.HOME
    now = moment!.format \YYYY-MM-DD-HHmm
    newFile = path.join memodir, "./#{now}.md"
    atom.workspace.open newFile
