<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Kategorihotspot extends CI_Controller {

	public function __construct(){
		parent::__construct();
		$this->load->model('KategorihotspotModel','Model');
	}

	public function index()
	{
		$datacontent['url']='admin/kategorihotspot';
		$datacontent['title']='Halaman Kategori Hotpost';
		$datacontent['datatable']=$this->Model->get();
		$data['content']=$this->load->view('admin/kategorihotspot/tableView',$datacontent,TRUE);
		$data['title']=$datacontent['title'];
		$this->load->view('admin/layouts/html',$data);
	}
	public function form($parameter='',$id='')
	{
		$datacontent['url']='admin/kategorihotspot';
		$datacontent['parameter']=$parameter;
		$datacontent['id']=$id;
		$datacontent['title']='Form Kategori Hotpost';
		$data['content']=$this->load->view('admin/kategorihotspot/formView',$datacontent,TRUE);
		$data['js']=$this->load->view('admin/kategorihotspot/js/formJs',$datacontent,TRUE);
		$data['title']=$datacontent['title'];
		$this->load->view('admin/layouts/html',$data);
	}
	public function simpan()
	{
		if($this->input->post()){
			$data=[
				'id_kategori_hotspot'=>$this->input->post('id_kategori_hotspot'),
				'nm_kategori_hotspot'=>$this->input->post('nm_kategori_hotspot'),
				'kd_kategori_hotspot'=>$this->input->post('kd_kategori_hotspot')
			];
			// upload
			if($_FILES['marker']['name']!=''){
				$upload=upload('marker','marker','image');
				if($upload['info']==true){
					$data['marker']=$upload['upload_data']['file_name'];
				}
				elseif($upload['info']==false){
					$info='<div class="alert alert-danger alert-dismissible">
	            		<button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
	            		<h4><i class="icon fa fa-ban"></i> Error!</h4> '.$upload['message'].' </div>';
					$this->session->set_flashdata('info',$info);
					redirect('admin/kategorihotspot');
					exit();
				}
			}
			// upload
			
			if($_POST['parameter']=="tambah"){
				$this->Model->insert($data);
			}
			else{
				$this->Model->update($data,['id_kategori_hotspot'=>$this->input->post('id_kategori_hotspot')]);
			}

		}
		redirect('admin/kategorihotspot');
	}

	public function hapus($id=''){
		// hapus file di dalam folder
		$this->db->where('id_kategori_hotspot',$id);
		$get=$this->Model->get()->row();
		$marker=$get->marker;
		unlink('assets/unggah/marker/'.$marker);
		// end hapus file di dalam folder
		$this->Model->delete(["id_kategori_hotspot"=>$id]);
		redirect('admin/kategorihotspot');
	}
}
