Ext.define('TrackIT.view.main.tickets.respostas.ListaRespostas', {
    extend: 'Ext.grid.Panel',
    id: 'grid4',
    xtype: 'mainlistrespostas',

    requires: [
        'TrackIT.store.respostas.Respostas',
        'Ext.toolbar.Paging',
        'TrackIT.view.main.tickets.respostas.MostraResposta',
        'TrackIT.store.respostas.RespostaSeleccionada'
    ],
    config: {
        autoLoad: true,
        width: 1050,
        height:300
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
      { text: 'ID TICKET', dataIndex: 'id_email', flex: 0.8, hidden:true}
    ],


    listeners: {
        itemclick: function(view, record, item, index, e) {
            var id = record.get('id_resp');
            Ext.util.Cookies.set('cookieIDanswer', id);
            var myWin = Ext.create("Ext.window.Window", {
                title: 'Respostas',
                modal: true,
                width: 1180,
                height: 410,
                items: [{
                    xtype: 'maintabresposta'
                }]
            });
            myWin.show();
        }

    },
    onGridAfterRender: function(grid4){
       setInterval(function(){
          grid.store.load();
       }, 100);
   }




});
