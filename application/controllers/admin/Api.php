<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Api extends CI_Controller {
	public function __construct(){
		parent::__construct();
		if($this->session->logged!==true){
	      redirect('auth');
	    }
	    $this->load->model('KecamatanModel');
	    $this->load->model('HotspotModel');
	    $this->load->model('KategorihotspotModel');
	}

	public function data($jenis='kecamatan',$type='point',$id='')
	{
		header('Content-Type: application/json');
		$response=[];
		if($jenis=='kecamatan'){
			$getKecamatan=$this->KecamatanModel->get();
			foreach ($getKecamatan->result() as $row) {
				$data=null;
				$data['id_kecamatan']=$row->id_kecamatan;
				$data['kd_kecamatan']=$row->kd_kecamatan;
				$data['geojson_kecamatan']=$row->geojson_kecamatan;
				$data['warna_kecamatan']=$row->warna_kecamatan;
				$data['nm_kecamatan']=$row->nm_kecamatan;
				$response[]=$data;
			}
			echo "var dataKecamatan=".json_encode($response,JSON_PRETTY_PRINT);
		}
		if($jenis=='kategorihotspot'){
			$getKategorihotspot=$this->KategorihotspotModel->get();
			foreach ($getKategorihotspot->result() as $row) {
				$data=null;
				$data['id_kategori_hotspot']=$row->id_kategori_hotspot;
				$data['nm_kategori_hotspot']=$row->nm_kategori_hotspot;
				$data['icon']=($row->marker=='')?assets('icons/marker.png'):assets('unggah/marker/'.$row->marker);
				$response[]=$data;
			}
			echo "var dataKategorihotspot=".json_encode($response,JSON_PRETTY_PRINT);
		}
		elseif($jenis=='hotspot'){
			if($type=='point'){
				if($id!=''){
					$this->db->where('a.id_kategori_hotspot',$id);
				}
				$getHotspot=$this->HotspotModel->get();
				foreach ($getHotspot->result() as $row) {
					$data=null;
					$data['type']="Feature";
					$data['properties']=[
												"name"=>$row->lokasi,
												"lokasi"=>$row->lokasi.' Kec. '.$row->nm_kecamatan,
												"keterangan"=>$row->keterangan,
												"tanggal"=>$row->tanggal,
												"icon"=>($row->marker=='')?assets('icons/marker.png'):assets('unggah/marker/'.$row->marker),
												"popUp"=>"Lokasi : ".$row->lokasi.", Kec. ".$row->nm_kecamatan."<br>Keterangan : ".$row->keterangan."<br>Tanggal : ".$row->tanggal
												];
					$data['geometry']=[
												"type" => "Point",
												"coordinates" => [$row->lng,$row->lat ] 
												];	

					$response[]=$data;
				}
				echo json_encode($response,JSON_PRETTY_PRINT);	
			}
			if($type=='varpoint'){
				if($id!=''){
					$this->db->where('a.id_kategori_hotspot',$id);
				}
				$getHotspot=$this->HotspotModel->get();
				foreach ($getHotspot->result() as $row) {
					$data=null;
					$data['type']="Feature";
					$data['properties']=[
												"name"=>$row->lokasi,
												"lokasi"=>$row->lokasi.' Kec. '.$row->nm_kecamatan,
												"keterangan"=>$row->keterangan,
												"tanggal"=>$row->tanggal,
												"icon"=>($row->marker=='')?assets('icons/marker.png'):assets('unggah/marker/'.$row->marker),
												"popUp"=>"Lokasi : ".$row->lokasi.", Kec. ".$row->nm_kecamatan."<br>Keterangan : ".$row->keterangan."<br>Tanggal : ".$row->tanggal
												];
					$data['geometry']=[
												"type" => "Point",
												"coordinates" => [$row->lng,$row->lat ] 
												];	

					$response[]=$data;
				}
				echo 'hotspotPoint ='.json_encode($response,JSON_PRETTY_PRINT);	
			}
			//elseif($type=="multipolygon"){
			elseif($type=="polygon"){
				$getHotspot=$this->HotspotModel->get();
				$polygon=null;
				foreach ($getHotspot->result() as $row) {
					if($row->polygon!=NULL){
						$polygon[]=$row->polygon;
					}
				}
				echo "var latlngs=[".implode(',', $polygon)."];";
			}
			
		}
		
	}
}
