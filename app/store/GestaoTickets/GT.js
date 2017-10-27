Ext.define('TrackIT.store.GestaoTickets.GT', {
    extend: 'Ext.data.Store',
    model: 'TrackIT.model.MaxTicket',
    alias: 'store.MT',
	storeId: 'Staging',

	autoLoad: true,
    autoSync: true,

	proxy: {
        type: 'ajax',
        url: 'app/php/GestaoTickets/MaxTickets.php',
        reader: {
        	type: 'json',
        	rootProperty: 'data'
        }
    },
    /*listeners: {
    	load: function(){
    		console.log(' ');
    	}
    },*/

});
