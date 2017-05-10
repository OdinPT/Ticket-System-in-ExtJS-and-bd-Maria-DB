Ext.define('TrackIT.model.Ticket', {
extend: 'Ext.data.Model',
fields: [{name:'id', type: 'int'}, 'fromaddress', 'subject', 'datea','body','state','id_departamento_emails']
});
