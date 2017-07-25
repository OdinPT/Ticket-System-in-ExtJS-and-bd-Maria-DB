Ext.define('TrackIT.view.main.historico.respostas.MockListaRespostasHistorico', {
    extend: 'Ext.grid.Panel',
    id: 'grid501',
    xtype: 'Mockmainlistrespostashistorico',
    requires: [
        'TrackIT.store.respostas.RespostasHistorico',
        'Ext.toolbar.Paging',
        'TrackIT.view.main.historico.respostas.MostraRespostaHistorico'
        //'TrackIT.store.respostas.RespostaSeleccionadaHistorico'
    ],

    title: 'Respostas',
    width: 1050,
    height:300,
    autoLoad: true,

    store: {
        type: 'respostashistorico'
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
                title: 'Respostas Historico',
                modal: true,

                width: 1100,
                height: 550,
                items: [{
                    xtype: 'mockmaintabrespostahistorico'
                }]
            });
            myWin.show();
        }

    },
    onGridAfterRender: function(grid501){
       setInterval(function(){
          grid.store.load();
       }, 1);
   }
});
