package com.CommaWeb.Comma.repository.queryStorage;

import org.springframework.stereotype.Component;

@Component
public class AdminTableQueryStorage {
		
	public String findByMonthBestHouse(String month, int limit ){
		String cMonth = month.length() == 1 ? "0" + month : month;
		String queryText = "select h.name, u.username, count(r.id) as count "
				+ "from house as h "
				+ "inner join reservation as r "
				+ "on h.id = r.houseId "
				+ "inner join user as u "
				+ "on h.hostId = u.id "
				+ "where r.checkInDate like \"%-"+ cMonth +"-%\" "
				+ "group by h.id "
				+ "order by count desc "
				+ "limit " + limit;
		return queryText;
	}
	
	public String loadMonthTableCount(String table){
		String queryText ="select month(creationDate) as month , count(id) as count "
				+ "from " + table + " "
				+ "group by month(creationDate) order by month;";
		return queryText;
	}
	
	public String loadAddressHouseCount(){
		String queryText ="select address, count(address) as count "
				+ "from house "
				+ "group by address order by count desc;";
		return queryText;

	}
	
}
