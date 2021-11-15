<?php
$id_bawang_merah="";
$kd_kecamatan="";
$nm_kecamatan="";
$tahun="";
$jumlah="";
if($parameter=='ubah' && $id!=''){
    $this->db->where('id_bawang_merah',$id);
	$row=$this->Model->get()->row_array();
    extract($row);
}

// value ketika validasi
if($this->session->flashdata('error_value')){
    extract($this->session->flashdata('error_value'));
}

?>
<?=content_open('Form Data Produksi Bawang Merah')?>
    <?php
        // menampilkan error validasi
        if($this->session->flashdata('error_validation')){
            foreach ($this->session->flashdata('error_validation') as $key => $value) {
                echo '<div class="alert alert-danger">'.$value.'</div>';
            }
        }
    ?>
    <form method="post" action="<?=site_url($url.'/simpan')?>" enctype="multipart/form-data">
        <?=input_hidden('parameter',$parameter)?>
    	<?=input_hidden('id_bawang_merah',$id_bawang_merah)?>
		<?=input_hidden('kd_kecamatan',$kd_kecamatan)?>
		<div class="form-group">
    		<label>Nama Kecamatan</label>
    		<?php
			//echo $id_bawang_merah;
			//echo $kd_kecamatan;
				if ($parameter=='ubah'){?>
					<?=input_text('nm_kecamatan',$nm_kecamatan,'','readonly')?>
				 <?php }else{?>
				 	<select class="form-control" name="kd_kecamatan" id="nm_kecamatan">
            		<?php
					foreach ($datakec->result() as $value) {
                		echo "<option value='".$value->kd_kecamatan."'>".$value->kd_kecamatan."-".$value->nm_kecamatan."</option>";	}
            		?>
        		</select>
			<?php } ?>	
    	</div>
    	<div class="form-group">
    		<label>Tahun</label>
    		<div class="row">
	    		<div class="col-md-6">
				<?php
				if ($parameter=='ubah'){?>
					<?=input_text('tahun',$tahun,'','readonly')?>
				 <?php }else{?>
				 	<select class="form-control" name="tahun" id="tahun">
            		<?php
					foreach ($datatahun->result() as $value) {
                		echo "<option value='".$value->tahun."'>".$value->tahun."</option>";	}
            		?>
        		</select>
				<?php } ?>	
				</div>
			</div>
    	</div>
    	<div class="form-group">
    		<label>Jumlah Produksi</label>
    		<div class="row">
	    		<div class="col-md-6">
	    			<?=input_text('jumlah',$jumlah)?>
	    		</div>
    		</div>
    	</div>
    	<div class="form-group">
    		<button type="submit" name="simpan" value="true" class="btn btn-info"><i class="fa fa-save"></i> Simpan</button>
			<a href="<?=site_url($url)?>" class="btn btn-danger" ><i class="fa fa-reply"></i> Kembali</a>
    	</div>
    </form>
<?=content_close()?>