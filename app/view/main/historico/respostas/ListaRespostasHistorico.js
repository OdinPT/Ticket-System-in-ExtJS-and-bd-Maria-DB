Ext.define('TrackIT.view.main.historico.respostas.ListaRespostasHistorico', {
    extend: 'Ext.grid.Panel',
    id: 'grid5',
    xtype: 'mainlistrespostashistorico',


    width: 1050,
    // height: 500
    autoLoad: true,

    requires: [
        'TrackIT.store.respostas.RespostasHistorico',
        'Ext.toolbar.Paging',
        'TrackIT.view.main.historico.respostas.MostraRespostaHistorico'
        //'TrackIT.store.respostas.RespostaSeleccionadaHistorico'

    ],

    title: 'Respostas',

    store: {
        type: 'respostashistorico'
    },

    columns: [
        { text: 'ID',  dataIndex: 'id_resp', flex: 0.2,
            editor: {
                allowBlank: false,
                maxLength: 49
            } },
        { text: 'ASSUNTO',  dataIndex: 'body_resp', flex: 4,
            editor: {
                allowBlank: false,
                maxLength: 49
            }},
        { text: 'DATA', dataIndex: 'datea_resp', flex: 0.8,
            editor: {
                allowBlank: false,
                maxLength: 49
            }},
        { text: 'ID TICKET', dataIndex: 'id_email', flex: 0.4,
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

    onGridAfterRender: function(grid5){
       setInterval(function(){
          grid.store.load();
       }, 1);
   }
});
