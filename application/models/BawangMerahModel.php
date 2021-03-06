<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class BawangMerahModel extends CI_Model{
	function get(){
		$this->db->select('a.id_bawang_merah,a.kd_kecamatan,b.nm_kecamatan,a.tahun,a.jumlah`');
		$this->db->from('tb_bawang_merah a');
		$this->db->join('m_kecamatan b','a.kd_kecamatan =b.kd_kecamatan');
		$data = $this->db->get();
		return $data;
	}

	function get_kec(){
		$data=$this->db->get('m_kecamatan');
		return $data;
	}

		function get_Tahun(){
		$data=$this->db->get('tb_tahun');
		return $data;
	}

	function insert($data=array()){
		$this->db->insert('tb_bawang_merah',$data);
		$info='<div class="alert alert-success alert-dismissible">
	            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
	            <h4><i class="icon fa fa-check"></i> Sukses!</h4> Data Sukses Ditambah </div>';
	    $this->session->set_flashdata('info',$info);
	}

	function update($data=array(),$where=array()){
		foreach ($where as $key => $value) {
			$this->db->where($key,$value);
		}
		$this->db->update('tb_bawang_merah',$data);
		$info='<div class="alert alert-success alert-dismissible">
		                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
		                <h4><i class="icon fa fa-check"></i> Sukses!</h4> Data Sukses diubah </div>';
	    $this->session->set_flashdata('info',$info);
	}

	function delete($where=array()){
		foreach ($where as $key => $value) {
			$this->db->where($key,$value);
		}
		$this->db->delete('tb_bawang_merah');
		$info='<div class="alert alert-success alert-dismissible">
	            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
	            <h4><i class="icon fa fa-check"></i> Sukses!</h4> Data Sukses dihapus </div>';
	    $this->session->set_flashdata('info',$info);
	}
}