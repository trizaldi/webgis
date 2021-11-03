<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Mmbagian11 extends CI_Controller {

	public function __construct(){
		parent::__construct();
		$this->load->model('HotspotModel');
		$this->load->model('KecamatanModel');
	}

	public function index()
	{
		$datacontent['url']='admin/mmbagian11';
		$datacontent['title']='Halaman Mencoba Menjawab Bagian 11';
		// $datacontent['datatable']=$this->Model->get();
		$data['content']=$this->load->view('admin/mmbagian11/mapView',$datacontent,TRUE);
		$data['js']=$this->load->view('admin/mmbagian11/js/mapJs',$datacontent,TRUE);
		$data['title']=$datacontent['title'];
		$this->load->view('admin/layouts/html',$data);
	}
}
