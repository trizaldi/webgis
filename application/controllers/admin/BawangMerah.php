<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class BawangMerah extends CI_Controller{

    public function __construct()
    {
        parent::__construct();
		if($this->session->logged!==true){
	      redirect('admin/auth');
	    }
	    if($this->session->level!=='Admin'){
	      redirect('admin/beranda');
	    }
		$this->load->model('BawangMerahModel','Model');
    }

	public function index()
	{
		$datacontent['url']='admin/bawangmerah';
		$datacontent['title']='Data Master Komoditas Bawang Merah';
		$datacontent['datatable']=$this->Model->get();
		$data['content']=$this->load->view('admin/bawangmerah/tableView',$datacontent,TRUE);
		$data['js']=$this->load->view('admin/bawangmerah/tableJs',$datacontent,TRUE);
		$data['title']=$datacontent['title'];
		$this->load->view('admin/layouts/html',$data);
	}

	public function form($parameter='',$id='')
	{
		$datacontent['url']='admin/bawangmerah';
		$datacontent['parameter']=$parameter;
		$datacontent['id']=$id;
		$datacontent['title']='Form Data Master Bawang Merah';
		$datacontent['datakec']=$this->Model->get_kec();
		$datacontent['datatahun']=$this->Model->get_Tahun();
		$data['content']=$this->load->view('admin/bawangmerah/formView',$datacontent,TRUE);
		$data['title']=$datacontent['title'];
		$this->load->view('admin/layouts/html',$data);
	}

	public function simpan()
	{
		if($this->input->post()){

			// cek validasi
			$validation=null;
			// cek kode apakah sudah ada
			/*if($this->input->post('id_kecamatan')!=""){
				$this->db->where('id_kecamatan !='.$this->input->post('id_kecamatan'));
			}
			$this->db->where('kd_kecamatan',$this->input->post('kd_kecamatan'));
			$check=$this->db->get('m_kecamatan');
			if($check->num_rows()>0){
				$validation[]='Kode Kecamatan Sudah Ada';
			}
			//tidak boleh kosong
			if($this->input->post('nm_kecamatan')==''){
				$validation[]='Nama Kecamatan Tidak Boleh Kosong';
			}
			
			if(count($validation)>0){
				$this->session->set_flashdata('error_validation',$validation);
				$this->session->set_flashdata('error_value',$_POST);
				redirect($_SERVER['HTTP_REFERER']);
				return false;
			}*/
			// cek validasi
			$data=[
				'id_bawang_merah'=>$this->input->post('id_bawang_merah'),
				'kd_kecamatan'=>$this->input->post('kd_kecamatan'),
				'tahun'=>$this->input->post('tahun'),
				'jumlah'=>$this->input->post('jumlah'),
			];
			
			// upload
			/*
			if($_FILES['geojson_kecamatan']['name']!=''){
				$upload=upload('geojson_kecamatan','geojson','geojson');
				if($upload['info']==true){
					$data['geojson_kecamatan']=$upload['upload_data']['file_name'];
				}
				elseif($upload['info']==false){
					$info='<div class="alert alert-danger alert-dismissible">
	            		<button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
	            		<h4><i class="icon fa fa-ban"></i> Error!</h4> '.$upload['message'].' </div>';
					$this->session->set_flashdata('info',$info);
					redirect('admin/kecamatan');
					exit();
				}
			}*/
			// upload
			
			if($_POST['parameter']=="tambah"){
				$this->Model->insert($data);
			}
			else{
				$this->Model->update($data,['id_bawang_merah'=>$this->input->post('id_bawang_merah')]);
			}

		}

		redirect('admin/bawangmerah');
	}

	public function hapus($id=''){
		// hapus file di dalam folder
		$this->db->where('id_bawang_merah',$id);
		$get=$this->Model->get()->row();
		//$geojson_kecamatan=$get->geojson_kecamatan;
		//unlink('assets/unggah/geojson/'.$geojson_kecamatan);
		// end hapus file di dalam folder
		$this->Model->delete(["id_bawang_merah"=>$id]);
		redirect('admin/bawangmerah');
	}

	public function datatable(){
		header('Content-Type: application/json');
		$url = 'admin/bawangmerah';
		$kolom =['id_bawang_merah','nm_kecamatan','tahun','jumlah'];
		if ( $this->input->get('sSearch')){
			$this->db->group_start();
			for ( $i=0 ; $i<count($kolom) ; $i++ )
			{
		    	$this->db->or_like($kolom[$i],$this->input->get('sSearch',TRUE));
			}
			$this->db->group_end();
		}
		//order
		if ( $this->input->get('iSortCol_0') ){
			for ( $i=0 ; $i<intval( $this->input->get('iSortingCols',TRUE) ) ; $i++ )
			{
			    if ( $this->input->get( 'bSortable_'.intval($_GET['iSortCol_'.$i]),TRUE) == "true" )
			    {
			        $this->db->order_by($kolom[intval( $this->input->get('iSortCol_'.$i,TRUE))],$this->input->get('sSortDir_'.$i,TRUE) );
			    }
			}
		}

      	if($this->input->get('iDisplayLength',TRUE)!="-1"){
	        $this->db->limit($this->input->get('iDisplayLength',TRUE),$this->input->get('iDisplayStart'));
		}

		$dataTable = $this->Model->get();
		$iTotalDisplayRecords=$this->Model->get()->num_rows();
		$iTotalRecords=$dataTable->num_rows();
		$output = [
		  "sEcho" => intval($this->input->get('sEcho')),
		  "iTotalRecords" => $iTotalRecords,
		  "iTotalDisplayRecords" => $iTotalDisplayRecords,
		  "aaData" => array()
		];
		$no=1;
		foreach ($dataTable->result() as $row) {
			$r = null;
			$r[] = $no++;
			//$r[] = $row->id_bawang_merah;
			$r[] = $row->kd_kecamatan;
			$r[] = $row->nm_kecamatan;
			$r[] = $row->tahun;
			$r[] = $row->jumlah;
			$r[] = '<div class="btn-group">
								<a href="'.site_url($url.'/form/ubah/'.$row->id_bawang_merah).'" class="btn btn-info"><i class="fa fa-edit"></i> Ubah</a>
								<a href="'.site_url($url.'/hapus/'.$row->id_bawang_merah).'" class="btn btn-danger" onclick="return confirm(\'Hapus data?\')"><i class="fa fa-trash"></i> Hapus</a>
							</div>';
			$output['aaData'][] = $r;				
		}
		echo json_encode($output,JSON_PRETTY_PRINT);

	}
}

?>