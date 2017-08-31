Ext.define('TrackIT.view.admin.departamento.GridMostraDepFunc', {
    extend: 'Ext.grid.Panel',
    id: 'gridfuncdep',
    xtype: 'mainlistfuncdepartamentos',
    requires: [
        'TrackIT.store.admin.FuncDep'
    ],

    config: {
        autoLoad: true,
        scroll:true,
        style:{overflow: 'auto',overflowX: 'hidden'}
    },
    layout: {
        align: 'fit',
        type: 'form',
        width: 690,

    },
    store: {
        type: 'funcdepartamento'
    },

    columns: [
        { text: 'username',  dataIndex: 'username', flex: 1},
        { text: 'Tipo Utilizador',  dataIndex: 'Descricao_TipoUtilizador', flex: 1},
        { text: 'Nome Departamento',  dataIndex: 'nome_departamento', flex: 1}
    ],

/*    listeners: {
        itemclick: function(view, record, item, index, e) {
            var id = record.get('id_departamento');
            Ext.util.Cookies.set('cookieIDdepartamento', id);
            var myWin = Ext.create("Ext.window.Window", {
                title: 'Departamento',
                modal: true,
                width: 500,
                height: 190,
                items: [{
                    xtype: 'fielddepartamento'
                }]
            });
            myWin.show();
        }

    },
*/
    onGridAfterRender: function(gridfuncdep){
        setInterval(function(){
            grid.store.load();
        }, 1);
    }
});