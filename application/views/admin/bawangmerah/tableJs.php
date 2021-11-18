<script type="text/javascript">
let table=$('.dt').DataTable( {
	"ajaxSource": "<?=site_url($url)?>/datatable",
	"order": [[ 0, "desc" ]],
} );


</script>