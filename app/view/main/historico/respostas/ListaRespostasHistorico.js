Ext.define('TrackIT.view.main.historico.respostas.ListaRespostasHistorico', {
    extend: 'Ext.grid.Panel',
    id: 'grid5',
    xtype: 'mainlistrespostashistorico',


    width: 1074,
    height: 600,
    autoLoad: true,

    requires: [
        'TrackIT.store.respostas.RespostasHistorico',
        'Ext.toolbar.Paging',
        'TrackIT.view.main.historico.respostas.MostraRespostaHistorico',
        'TrackIT.store.respostas.RespostaSeleccionadaHistorico'

    ],

    title: 'Respostas',

    store: {
        type: 'respostashistorico'
    },

    columns: [
        { text: 'ID',  dataIndex: 'id_resp', flex: 1,
            editor: {
                allowBlank: false,
                maxLength: 49
            } },
        { text: 'ASSUNTO',  dataIndex: 'body_resp', flex: 1,
            editor: {
                allowBlank: false,
                maxLength: 49
            }},
        { text: 'DATA', dataIndex: 'datea_resp', flex: 1,
            editor: {
                allowBlank: false,
                maxLength: 49
            }},
        { text: 'ID TICKET', dataIndex: 'id_email', flex: 1,maxWidth: 150,
            editor: {
                allowBlank: false,
                maxLength: 49
            }}
    ],
    tbar: {
        defaultButtonUI: 'default',

        items: [
            {
              text: 'Refresh!',
              handler: function() {
    Ext.getCmp('grid5').store.reload();
}
    },
    {
      text: 'Apagar Respostas!',
      id: 'apagar',
      handler: function(){
        myRequest = Ext.Ajax.request({
          url: 'app/php/Limpar/limparespostas.php',
          method: 'POST',
          success: function(response, opts) {
  Ext.getCmp('grid5').store.reload();
  }
        })
      }
    }]
  },

    listeners: {
 itemclick: function(view, record, item, index, e) {
  var id = record.get('ID');
  Ext.util.Cookies.set('cookieIDanswer', id);
                    var myWin = Ext.create("Ext.window.Window", {
                        title: 'Respostas',
                        modal: true,
                        // html: '<iframe src="app/php/mostraTicket.php" width="100%" height="100%" ></iframe>',
                        width: 1100,
                        height: 550,
                        items: [{
                            xtype: 'maintabrespostahistorico'
                        }]
                    });
                    myWin.show();
  // console.log(record);
 }
    },
    onGridAfterRender: function(grid5){
       setInterval(function(){
          grid.store.load();
       }, 1);
   }
});
