/**
 * This view is an example list of people.
 */
Ext.define('TrackIT.view.main.tickets.respostas.ListaRespostas', {
    extend: 'Ext.grid.Panel',
    id: 'grid4',
    xtype: 'mainlistrespostas',

    width: 1050,
    height: 700,



    requires: [
        'TrackIT.store.respostas.Respostas',
        'Ext.toolbar.Paging',
        'TrackIT.view.main.tickets.respostas.MostraResposta',
        'TrackIT.store.respostas.RespostaSeleccionada'
    ],
    config: {
        autoLoad: true
    },
    title: 'Respostas',

    store: {
        type: 'respostas'
    },

    columns: [
      { text: 'ID',  dataIndex: 'id_resp', flex: 0.1},
      { text: 'ASSUNTO',  dataIndex: 'subject_resp', flex: 1.6},
      { text: 'DATA', dataIndex: 'datea_resp', flex: 1},
        { text: 'CORPO', dataIndex: 'body_resp', flex: 3},
      { text: 'ID TICKET', dataIndex: 'id_email', flex: 0.8}
    ],

    tbar: {
        defaultButtonUI: 'default',

        items: [
            {
              text: 'Atualizar',
              handler: function() {
    Ext.getCmp('grid4').store.reload();
}
    }]
  },
    listeners: {
        itemclick: function(view, record, item, index, e) {
            var id = record.get('id_resp');
            Ext.util.Cookies.set('cookieIDanswer', id);
            var myWin = Ext.create("Ext.window.Window", {
                title: 'Respostas',
                modal: true,
                // html: '<iframe src="app/php/mostraTicket.php" width="100%" height="100%" ></iframe>',
                width: 1100,
                height: 550,
                items: [{
                    xtype: 'maintabresposta'
                }]
            });
            myWin.show();
        }

    },
    onGridAfterRender: function(gridticket){
       setInterval(function(){
          grid.store.load();
       }, 1);
   }
});
