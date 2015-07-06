require! {
  moment
  path
  \./create.ls
  \./FindView.ls
}

module.exports =
  activate: ->
    @memodir = atom.config.get \junk.dirPath .replace /~/, process.env.HOME
    atom.commands.add do
      \atom-workspace
      \junk:create
      ~> @create @memodir
    atom.commands.add do
      \atom-workspace
      \junk:find
      ~> new FindView @memodir
