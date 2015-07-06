module.exports = {
  activate: function(){
    require('livescript');
    require('./src/index.ls').activate();
  }
};
