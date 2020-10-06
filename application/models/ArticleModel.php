<?php

    class ArticleModel extends CI_Model 
    {
        function fetch_all_articles() {
            $resultQuery = $this->db->query("SELECT `blogid`, `blog_title`, `blog_img`, `status`, `created_on`, `updated_on` FROM articles WHERE status='1'");
            return $resultQuery->result_array();
        }

        function fetch_blog_detail($blog_id) {
            $resultQuery = $this->db->query("SELECT `blogid`, `blog_title`, `blog_img`, `status`, `created_on`, `updated_on`, `blog_desc` FROM articles WHERE blogid = '$blog_id'");
            return $resultQuery->result_array();
        }

    }

?>