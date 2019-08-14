<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class M_user extends CI_Model {

    public function getTable(){
        $this->db->select('*');
        $this->db->from('karyawan');
        $this->db->join('level', 'level.id_level = karyawan.id_level');
        $query = $this->db->get();
        return $query->result();
    }
    public function getLevel(){
        $this->db->select('*');
        $this->db->from('level');
        $query = $this->db->get();
        return $query->result();
    }
    public function simpan_user($data, $table){
        $this->db->insert($table, $data);
    }
    public function masuk_db(){
        $scrt = "P3djaten";
        $data_karyawan=array(
            'nama'=>$this->input->post('nama'),
            'email'=>$this->input->post('email'),
            'password'=>sha1($this->input->post('password').$scrt),
            'id_level'=>$this->input->post('nama_level'),
            'jenis_kelamin'=>$this->input->post('jenis_kelamin'),
            'no_telepon'=>$this->input->post('no_telepon')
        );
        $masuk=$this->db->insert('Karyawan', $data_karyawan);
        return $masuk;
    }
    public function detail_user($id_karyawan=''){
        return $this->db->where('id_karyawan', $id_karyawan)->get('karyawan')->row();
    }
    public function update_user(){
        $scrt = "P3djaten";
        $dt_up_user=array(
            'id_karyawan'=>$this->input->post('id_karyawan'),
            'nama'=>$this->input->post('nama'),
            'email'=>$this->input->post('email'),
            'password'=>sha1($this->input->post('password').$scrt),
            'id_level'=>$this->input->post('nama_level'),
            'jenis_kelamin'=>$this->input->post('jenis_kelamin'),
            'no_telepon'=>$this->input->post('no_telepon')
        );
        return $this->db->where('id_karyawan', $this->input->post('id_karyawan'))->update('karyawan', $dt_up_user);
    }
	public function delete_user($id_karyawan){
        $this->db->where('id_karyawan', $id_karyawan);
        return $this->db->delete('karyawan');
    }
}