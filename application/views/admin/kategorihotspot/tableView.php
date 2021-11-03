<?=content_open($title)?>
<a href="<?=site_url($url.'/form/tambah')?>" class="btn btn-success" ><i class="fa fa-plus"></i> Tambah</a>
<hr>
<?=$this->session->flashdata('info')?>

<table class="table table-bordered">
	<thead>
		<tr>
			<th width="50px" class="text-center">No.</th>
			<th>Kode</th>
			<th>Nama Kategori</th>
			<th>Marker</th>
			<th width="200px">Aksi</th>
		</tr>
	</thead>
	<tbody>
		<?php
			$no=1;
			foreach ($datatable->result() as $row) {
				?>
					<tr>
						<td class="text-center"><?=$no++?></td>
						<td class="text-center"><?=$row->kd_kategori_hotspot?></td>
						<td><?=$row->nm_kategori_hotspot?></td>
						<td class="text-center"><?=($row->marker==''?'-':'<img src="'.assets('unggah/marker/'.$row->marker).'" width="40px">')?></td>
						<td class="text-center">
							<div class="btn-group">
								<a href="<?=site_url($url.'/form/ubah/'.$row->id_kategori_hotspot)?>" class="btn btn-info"><i class="fa fa-edit"></i> Ubah</a>
								<a href="<?=site_url($url.'/hapus/'.$row->id_kategori_hotspot)?>" class="btn btn-danger" onclick="return confirm('Hapus data?')"><i class="fa fa-trash"></i> Hapus</a>
							</div>
						</td>
					</tr>
				<?php
				$no++;
			}

		?>
	</tbody>
</table>
<?=content_close()?>

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Form Upload CSV</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
	  <form method="post" action="<?=site_url($url.'/importcsv')?>" enctype="multipart/form-data">
      <div class="modal-body">
	    	<div class="form-group">
	    		<label>File CSV</label>
	    		<div class="row">
		    		<div class="col-md-12">
	    				<?=input_file('csv','')?>
	    			</div>
	    		</div>
	    	</div>
      </div>
      <div class="modal-footer">
		<button type="submit" name="simpan" class="btn btn-info"><i class="fa fa-save"></i> Simpan</button>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      </div>
	  </form>
    </div>
  </div>
</div>