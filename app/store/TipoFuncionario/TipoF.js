// The data store holding the states
var tipo = new Ext.data.JsonStore({
fields:[
    {name: ID_TipoUtilizador},
    {name: Descricao_TipoUtilizador}
],
root:'rows',
    autoDestroy:true,
    autoLoad:true,
    proxy:new Ext.data.HttpProxy({
        url:'TipoFuncionario/MostraEstado.php'
    }),
})

/*
 var estado = Ext.create('Ext.data.Store', {
 model: 'State',
 data: states
 });
 */

/*Ext.define('TrackIT.store.AlteraEstado.AlteraEstado', {
    extend: 'Ext.data.Store',
    model: 'TrackIT.model.Cliente',
    alias: 'store.clientes',

	autoLoad: true,
	proxy: {
        type: 'ajax',
        url: 'app/php/CarregamStores/carregaClientes.php',
        reader: {
        	type: 'json',
        	rootProperty: 'data'
        }
    },
    listeners: {
    	load: function(){
    		console.log('loaded Clientes');
    	}
    }
});


*/