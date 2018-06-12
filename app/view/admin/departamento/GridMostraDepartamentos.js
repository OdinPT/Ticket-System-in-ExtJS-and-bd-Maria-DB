
Ext.define('TrackIT.view.admin.departamento.GridMostraDepartamentos', {
    extend: 'Ext.grid.Panel',
    id: 'griddepartamentos',
    xtype: 'mainlistdepartamentos',
    requires: [
        'TrackIT.store.admin.Departamentos',
        'Ext.toolbar.Paging',
        'TrackIT.view.admin.departamento.MostraDepartamento',
        'TrackIT.store.admin.DepartamentoSeleccionado'
    ],

    config: {
        autoLoad: true,
        scroll:true,
        style:{overflow: 'auto',overflowX: 'hidden'}
    },
    layout: {
        align: 'fit',
        type: 'form',
        width: 660

    },
    store: {
        type: 'departamentos'
    },

    columns: [
        { text: 'ID',  dataIndex: 'id_departamento', flex: 0.2, hidden:true},
        { text: 'Nome de Departamento',  dataIndex: 'nome_departamento', flex: 1}
    ],

    listeners: {
        itemclick: function(view, record, item, index, e) {
            var id = record.get('id_departamento');
            Ext.util.Cookies.set('cookieIDdepartamento', id);
            var myWin = Ext.create("Ext.window.Window", {
                title: 'Departamento',
                modal: true,
                width: 660,
                height: 160,

                items: [{
                    xtype: 'fielddepartamento'
                }]
            });
            myWin.show();
        }

    },

    onGridAfterRender: function(griddepartamentos){
        setInterval(function(){
            grid.store.load();
        }, 1);
    }
});