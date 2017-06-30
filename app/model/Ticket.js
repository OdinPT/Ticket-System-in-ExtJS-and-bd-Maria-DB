// Definição do modelo de para cada ticket.

Ext.define('TrackIT.model.Ticket', {
extend: 'Ext.data.Model',
fields: ['id', 'fromaddress', 'subject', 'datea','body','Descricao_Estado','id_func_emails','DesTipoRes','nome_departamento']
});
