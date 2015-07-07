require! {
  moment
  path
  \./create.ls
  \./FindFileView.ls
}

module.exports =
  activate: ->
    @memodir = atom.config.get \junk.dirPath .replace /~/, process.env.HOME
    atom.commands.add do
      \atom-workspace
      \junk:create
      ~> create @memodir
    atom.commands.add do
      \atom-workspace
      \junk:find-file
      ~> new FindFileView @memodir
