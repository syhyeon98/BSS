package kr.or.ddit.finapi.controller;

import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.databind.ObjectMapper;

import kr.or.ddit.finapi.dao.ApiDatabaseInsertDAO;
import kr.or.ddit.finapi.vo.AccountVO;
import kr.or.ddit.finapi.vo.DescriptionVO;
import kr.or.ddit.finapi.vo.FinMarketAccountVO;
import kr.or.ddit.finapi.vo.FinMarketItemVO;
import kr.or.ddit.finapi.vo.ManageBankVO;
import kr.or.ddit.finapi.vo.StatisticsInfoVO;
import kr.or.ddit.finapi.vo.StatisticsVO;

@Component
public class FinMarketProc {

	/**
	 * 금융시장
	 * @param itemList
	 * @param financeCd
	 * @param statCode
	 * @param cycle
	 * @param startBaseMm
	 * @param endBaseMm
	 * @param itemCode
	 */
	public void finMarketItemList(List<FinMarketItemVO> itemList,String statCode, String cycle,
			String startBaseMm, String endBaseMm,String itemCode) {
		FinMarketItemVO item = null;
		String urlStr =null;
		try {
			if(itemCode !=null && !itemCode.isEmpty()) {
				urlStr ="https://ecos.bok.or.kr/api/StatisticSearch/WWP4O08GD7Y4RNKX3XNP/json/kr/1/100/"+statCode+"/"+cycle+"/"+startBaseMm+"/"+endBaseMm+"/"+itemCode;
			}else {
				urlStr ="https://ecos.bok.or.kr/api/StatisticSearch/WWP4O08GD7Y4RNKX3XNP/json/kr/1/100/"+statCode+"/"+cycle+"/"+startBaseMm+"/"+endBaseMm+"/";
			}
			URL url = new URL(urlStr);
			HttpURLConnection connection = (HttpURLConnection) url.openConnection();
			connection.setRequestMethod("GET");

			int responseCode = connection.getResponseCode();
			if (responseCode == HttpURLConnection.HTTP_OK) {
				ObjectMapper objectMapper = new ObjectMapper();
				Map<String, Object> map = new HashMap<String, Object>();
				map = objectMapper.readValue(connection.getInputStream(), new HashMap().getClass());

				if(map.get("StatisticSearch")!=null && map.get("StatisticSearch")!="") {
				Map<String, Object> resultMap = (Map<String, Object>) map.get("StatisticSearch");
					List<Map<String, Object>> list = (List<Map<String, Object>>) resultMap.get("row");
					for (Map<String, Object> baseItem : list) {
						item = objectMapper.convertValue(baseItem, FinMarketItemVO.class);
						itemList.add(item);
					}
				}
				
				
			} else if (responseCode == 307) {
				// 수동 리다이렉션 처리
				String newURL = connection.getHeaderField("Location");
				URL newUrl = new URL(newURL);
				HttpURLConnection newConnection = (HttpURLConnection) newUrl.openConnection();
				newConnection.setRequestMethod("GET");
				ObjectMapper objectMapper = new ObjectMapper();
				Map<String, Object> map = new HashMap<String, Object>();
				map = objectMapper.readValue(newConnection.getInputStream(), new HashMap().getClass());

				Map<String, Object> resultMap = (Map<String, Object>) map.get("StatisticSearch");

				if (resultMap.containsKey("list")) {
					List<Map<String, Object>> list = (List<Map<String, Object>>) resultMap.get("row");
					for (Map<String, Object> baseItem : list) {
						item = objectMapper.convertValue(baseItem, FinMarketItemVO.class);
						itemList.add(item);
					}
				}
			} else {
				System.out.println("Server responded with status code: " + responseCode);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void mainMarketItemList(List<FinMarketItemVO> itemList,String statCode, String cycle,
			String startBaseMm, String endBaseMm,String itemCode) {
		FinMarketItemVO item = null;
		String urlStr =null;
		try {
			if(itemCode !=null && !itemCode.isEmpty()) {
				urlStr ="https://ecos.bok.or.kr/api/StatisticSearch/WWP4O08GD7Y4RNKX3XNP/json/kr/1/30/"+statCode+"/"+cycle+"/"+startBaseMm+"/"+endBaseMm+"/"+itemCode;
			}else {
				urlStr ="https://ecos.bok.or.kr/api/StatisticSearch/WWP4O08GD7Y4RNKX3XNP/json/kr/1/30/"+statCode+"/"+cycle+"/"+startBaseMm+"/"+endBaseMm+"/";
			}
			URL url = new URL(urlStr);
			HttpURLConnection connection = (HttpURLConnection) url.openConnection();
			connection.setRequestMethod("GET");
			
			int responseCode = connection.getResponseCode();
			if (responseCode == HttpURLConnection.HTTP_OK) {
				ObjectMapper objectMapper = new ObjectMapper();
				Map<String, Object> map = new HashMap<String, Object>();
				map = objectMapper.readValue(connection.getInputStream(), new HashMap().getClass());
				
				if(map.get("StatisticSearch")!=null && map.get("StatisticSearch")!="") {
					Map<String, Object> resultMap = (Map<String, Object>) map.get("StatisticSearch");
					List<Map<String, Object>> list = (List<Map<String, Object>>) resultMap.get("row");
					for (Map<String, Object> baseItem : list) {
						item = objectMapper.convertValue(baseItem, FinMarketItemVO.class);
						itemList.add(item);
					}
				}
			} else if (responseCode == 307) {
				// 수동 리다이렉션 처리
				String newURL = connection.getHeaderField("Location");
				URL newUrl = new URL(newURL);
				HttpURLConnection newConnection = (HttpURLConnection) newUrl.openConnection();
				newConnection.setRequestMethod("GET");
				ObjectMapper objectMapper = new ObjectMapper();
				Map<String, Object> map = new HashMap<String, Object>();
				map = objectMapper.readValue(newConnection.getInputStream(), new HashMap().getClass());
				
				Map<String, Object> resultMap = (Map<String, Object>) map.get("StatisticSearch");
				
				if (resultMap.containsKey("list")) {
					List<Map<String, Object>> list = (List<Map<String, Object>>) resultMap.get("row");
					for (Map<String, Object> baseItem : list) {
						item = objectMapper.convertValue(baseItem, FinMarketItemVO.class);
						itemList.add(item);
					}
				}
			} else {
				System.out.println("Server responded with status code: " + responseCode);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * 계정항목 가져오기
	 * 
	 * @param listNo
	 * @param accountList
	 */
	public void accountList(String statCode, List<FinMarketAccountVO> accountList) {
		FinMarketAccountVO account;
		try {
			URL url = new URL(
					"https://ecos.bok.or.kr/api/StatisticItemList/WWP4O08GD7Y4RNKX3XNP/JSON/kr/1/100/" + statCode);
			HttpURLConnection connection = (HttpURLConnection) url.openConnection();
			connection.setRequestMethod("GET");

			int responseCode = connection.getResponseCode();
			if (responseCode == HttpURLConnection.HTTP_OK) {
				ObjectMapper objectMapper = new ObjectMapper();
				Map<String, Object> map = new HashMap<String, Object>();
				map = objectMapper.readValue(connection.getInputStream(), new HashMap().getClass());

				Map<String, Object> resultMap = (Map<String, Object>) map.get("StatisticItemList");
				List<Map<String, Object>> list = (List<Map<String, Object>>) resultMap.get("row");

				for (Map<String, Object> baseItem : list) {
					account = objectMapper.convertValue(baseItem, FinMarketAccountVO.class);
					accountList.add(account);
				}
			} else if (responseCode == 307) {
				// 수동 리다이렉션 처리
				String newURL = connection.getHeaderField("Location");
				URL newUrl = new URL(newURL);
				HttpURLConnection newConnection = (HttpURLConnection) newUrl.openConnection();
				newConnection.setRequestMethod("GET");
				ObjectMapper objectMapper = new ObjectMapper();
				Map<String, Object> map = new HashMap<String, Object>();
				map = objectMapper.readValue(newConnection.getInputStream(), new HashMap().getClass());

				Map<String, Object> resultMap = (Map<String, Object>) map.get("result");
				List<Map<String, Object>> list = (List<Map<String, Object>>) resultMap.get("list");

				for (Map<String, Object> baseItem : list) {
					account = objectMapper.convertValue(baseItem, FinMarketAccountVO.class);
					accountList.add(account);
				}
			} else {
				System.out.println("Server responded with status code: " + responseCode);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
