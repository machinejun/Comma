package com.JMThouseWeb.JMThouse.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import com.JMThouseWeb.JMThouse.model.Reply;

public interface ReplyRepository extends JpaRepository<Reply, Integer>{

	@Modifying
	@Query(value = "DELETE FROM reply WHERE id = ?", nativeQuery = true)
	void deleteByReplyId(int id);
	
}
