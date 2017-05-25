// Ext.define('TrackIT.store.Contatos', {
//     extend: 'Ext.data.Store',
//     id: 'store',
//     alias: 'store.contatos',
//     model: 'TrackIT.model.Contato',
//     remoteGroup: true,
//     buffered: true,
//     leadingBufferZone: 300,
//     pageSize: 100,
//     proxy: {
//         type: 'jsonp',
//         url: '/php/loadtickets.php', //this file should return json.
//         reader: {
//             rootProperty: 'contatos',
//             totalProperty: 'totalCount'
//         }},
//     autoLoad: true
// });

Ext.define('TrackIT.store.TicketsHistorico', {
    extend: 'Ext.data.Store',
    model: 'TrackIT.model.Ticket',
    alias: 'store.ticketshistorico',
	storeId: 'StagingHistorico',
	autoLoad: false,
	proxy: {
        type: 'ajax',
        url: 'app/php/CarregamStores/carregaticketshistorico.php',
        reader: {
        	type: 'json',
        	rootProperty: 'data'
        }
    },
    listeners: {
    	load: function(){
    		console.log('loaded');
    	}
    }
});
