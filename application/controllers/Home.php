<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Home extends CI_Controller {

	/**
	 * Index Page for this controller.
	 *
	 * Maps to the following URL
	 * 		http://example.com/index.php/welcome
	 *	- or -
	 * 		http://example.com/index.php/welcome/index
	 *	- or -
	 * Since this controller is set as the default controller in
	 * config/routes.php, it's displayed at http://example.com/
	 *
	 * So any other public methods not prefixed with an underscore will
	 * map to /index.php/welcome/<method_name>
	 * @see https://codeigniter.com/user_guide/general/urls.html
	 */
	public function index()
	{
		$this->load->model('ArticleModel', "am");
		$result = $this->am->fetch_all_articles();
		// print_r($result); die();
		$data['result'] = $result;
		$this->load->view('blog_list_page', $data);
	}

	public function blog_detail($blog_id = 0) {
		$this->load->model('ArticleModel', "am");
		$result = $this->am->fetch_blog_detail($blog_id);
		$data['result'] = $result;
		$this->load->view("blog_detail", $data);
	}
}
