<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Blog extends CI_Controller {

	public function index()
	{   
        $query = $this->db->query("SELECT * FROM `articles` ORDER BY blogid DESC");
        $data['result'] = $query->result_array();
		$this->load->view('adminpanel/viewblog',$data);
    }
    
    function addblog()
    {
        $this->load->view('adminpanel/addblog');
    }

    function addblog_post()
    {
        print_r($_POST);
        print_r($_FILES);

        if ($_FILES) {
			$config['upload_path']          = './assets/upload/blogimg/';
            $config['allowed_types']        = 'gif|jpg|png|jpeg';

            $this->load->library('upload', $config);

            $file = 'file';
            if ( ! $this->upload->do_upload($file))
            {
                    $error = array('error' => $this->upload->display_errors());
                    die($error['error']);
                    //$this->load->view('upload_form', $error);
            }
            else
            {
                    $data = array('upload_data' => $this->upload->data());

                    //print_r($data);

                    //echo $data['upload_data']['file_name'];
                    //$this->load->view('upload_success', $data);

                    $fileurl = "/assets/upload/blogimg/".$data['upload_data']['file_name'];
                    $blog_title = $_POST['blog_title'];
                    $desc = $_POST['desc'];
                    
                    $query = $this->db->query("INSERT INTO `articles`(`blog_title`, `blog_desc`, `blog_img`) VALUES ('$blog_title','$desc','$fileurl')");
                    
                    if($query)
                    {
                        $this->session->set_flashdata('inserted', 'yes');
                        redirect('admin/blog/addblog');
                    }
                    /*else{
                        $this->session->set_flashdata('inserted', 'yes');
                        redirect('admin/blog/addblog');
                    }*/
            }
		}
        else
        {
            //image is not passed
        }
    }

    function editblog($blog_id)
    {
        print_r($blog_id);
    }
    function deleteblog($blog_id)
    {
        print_r($blog_id);
    }
}
