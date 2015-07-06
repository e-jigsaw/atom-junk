require! {
  moment
  path
}

module.exports = (memodir)->
  now = moment!.format \YYYY-MM-DD-HHmm
  newFile = path.join memodir, "./#{now}.md"
  atom.workspace.open newFile
