require! {
  moment
  path
  \./create.ls
  \./FindFileView.ls
  \./FindContentsView.ls
  \./FindTodoView.ls
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
    atom.commands.add do
      \atom-workspace
      \junk:find-contents
      ~> new FindContentsView @memodir
    atom.commands.add do
      \atom-workspace
      \junk:find-todo
      ~> new FindTodoView @memodir
