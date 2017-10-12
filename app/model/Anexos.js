// Definição do model que define os anexos do projeto que serão mostrados na grid de anexos em cada ticket
// individual

Ext.define('TrackIT.model.Anexos', {
    extend: 'Ext.data.Model',
    fields: ['id','nome','localizacao' ,'id_ticket']
});
