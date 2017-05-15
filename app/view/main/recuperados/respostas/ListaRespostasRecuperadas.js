/**
 * This view is an example list of people.
 */
Ext.define('TrackIT.view.main.recuperados.respostas.ListaRespostasRecuperadas', {
    extend: 'Ext.grid.Panel',
    id: 'grid6',
    xtype: 'mainlistrespostasrecuperadas',
    width: 1074,
    height: 600,
    requires: [
        'TrackIT.store.respostas.RespostasRecuperadas',
        'Ext.toolbar.Paging',
        'TrackIT.view.main.recuperados.respostas.MostraRespostaRecuperada',
        'TrackIT.store.respostas.RespostaSeleccionadaRecuperada'
        // 'TrackIT.view.main.AnswerController'
    ],

    title: 'Respostas',

    store: {
        type: 'respostasrecuperadas'
    },

    columns: [
      { text: 'ID',  dataIndex: 'ID', flex: 1,
    editor: {
        allowBlank: false,
        maxLength: 49
    } },
      { text: 'ASSUNTO',  dataIndex: 'subject', flex: 1,
    editor: {
        allowBlank: false,
        maxLength: 49
    }},
      { text: 'RESPOSTA', dataIndex: 'answer', flex: 1,
    editor: {
        allowBlank: false,
        maxLength: 49
    }},
      { text: 'IDTICKET', dataIndex: 'IDticket', flex: 1,
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
    Ext.getCmp('grid6').store.reload();
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
  Ext.getCmp('grid6').store.reload();
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
                            xtype: 'maintabrespostarecuperada'
                        }]
                    });
                    myWin.show();
  // console.log(record);
 }
    },
    onGridAfterRender: function(grid6){
       setInterval(function(){
          grid.store.load();
       }, 1);
   }
});
