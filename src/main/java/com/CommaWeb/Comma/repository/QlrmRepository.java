package com.CommaWeb.Comma.repository;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;

import org.qlrm.mapper.JpaResultMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class QlrmRepository<T> {

	@Autowired
	EntityManager entityManager;

	public List<T> returnDataList(String queryText, Class<T> target) {
		Query query = entityManager.createNativeQuery(queryText);
		JpaResultMapper jpaResultMapper = new JpaResultMapper();
		return (List<T>) jpaResultMapper.list(query, target);
	}

}
