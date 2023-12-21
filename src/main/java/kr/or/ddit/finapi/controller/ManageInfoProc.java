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
import kr.or.ddit.finapi.vo.ManageBankVO;
import kr.or.ddit.finapi.vo.StatisticsInfoVO;
import kr.or.ddit.finapi.vo.StatisticsVO;

@Component
public class ManageInfoProc {

	@Inject
	private ApiDatabaseInsertDAO dao;

	/**
	 * 통계정보
	 * 
	 * @param infoList
	 * @param financeCd
	 * @param listNo
	 * @param accountCd
	 * @param term
	 * @param startBaseMm
	 * @param endBaseMm
	 */
	public void statisticsInfo(List<StatisticsInfoVO> infoList, String financeCd, String listNo, String term,
			String startBaseMm, String endBaseMm) {
		StatisticsInfoVO info = null;
		try {
			URL url = new URL(
					"http://fisis.fss.or.kr/openapi/statisticsInfoSearch.json?lang=kr&auth=e81ca820290fdf2f8e55a6fd3791327c&financeCd="
							+ financeCd + "&listNo=" + listNo + "&term=" + term + "&startBaseMm=" + startBaseMm
							+ "&endBaseMm=" + endBaseMm);
			HttpURLConnection connection = (HttpURLConnection) url.openConnection();
			connection.setRequestMethod("GET");

			int responseCode = connection.getResponseCode();
			if (responseCode == HttpURLConnection.HTTP_OK) {
				ObjectMapper objectMapper = new ObjectMapper();
				Map<String, Object> map = new HashMap<String, Object>();
				map = objectMapper.readValue(connection.getInputStream(), new HashMap().getClass());

				Map<String, Object> resultMap = (Map<String, Object>) map.get("result");
				List<Map<String, Object>> list = (List<Map<String, Object>>) resultMap.get("list");

				for (Map<String, Object> baseItem : list) {
					info = objectMapper.convertValue(baseItem, StatisticsInfoVO.class);
//					dao.statisticInfoInsert(info);
					infoList.add(info);
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

				if (resultMap.containsKey("list")) {
					List<Map<String, Object>> list = (List<Map<String, Object>>) resultMap.get("list");

					for (Map<String, Object> baseItem : list) {
						info = objectMapper.convertValue(baseItem, StatisticsInfoVO.class);
						dao.statisticInfoInsert(info);
						if (resultMap.containsKey("description")) {
							System.out.println(info);
							List<Map<String, Object>> descriptionList = (List<Map<String, Object>>) resultMap.get("description");
							for (Map<String, Object> descriptionMap : descriptionList) {
								DescriptionVO description = objectMapper.convertValue(descriptionMap,
										DescriptionVO.class);
								description.setAccountCd(info.getAccountCd());
								description.setAccountNm(info.getAccountNm());
								description.setBaseMonth(info.getBaseMonth());
								description.setFinanceCd(info.getFinanceCd());
//								dao.statisticInfoDescriptionInsert(description);
							}
						}
						infoList.add(info);
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
	public void accountList(String listNo, List<AccountVO> accountList) {
		AccountVO account;
		try {
			URL url = new URL(
					"http://fisis.fss.or.kr/openapi/accountListSearch.json?lang=kr&auth=e81ca820290fdf2f8e55a6fd3791327c&listNo="
							+ listNo);
			HttpURLConnection connection = (HttpURLConnection) url.openConnection();
			connection.setRequestMethod("GET");

			int responseCode = connection.getResponseCode();
			if (responseCode == HttpURLConnection.HTTP_OK) {
				ObjectMapper objectMapper = new ObjectMapper();
				Map<String, Object> map = new HashMap<String, Object>();
				map = objectMapper.readValue(connection.getInputStream(), new HashMap().getClass());

				Map<String, Object> resultMap = (Map<String, Object>) map.get("result");
				List<Map<String, Object>> list = (List<Map<String, Object>>) resultMap.get("list");

				for (Map<String, Object> baseItem : list) {
					account = objectMapper.convertValue(baseItem, AccountVO.class);
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
					account = objectMapper.convertValue(baseItem, AccountVO.class);
					accountList.add(account);
				}
			} else {
				System.out.println("Server responded with status code: " + responseCode);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * 은행리스트 불러오기
	 * 
	 * @param bankList
	 */
	public void bankList(List<ManageBankVO> bankList) {
		ManageBankVO bank;
		try {
			URL url = new URL(
					"https://fisis.fss.or.kr/openapi/companySearch.json?lang=kr&auth=e81ca820290fdf2f8e55a6fd3791327c&partDiv=A");

			HttpURLConnection connection = (HttpURLConnection) url.openConnection();
			connection.setRequestMethod("GET");

			// JSON 데이터를 map으로 매핑
			ObjectMapper objectMapper = new ObjectMapper();
			Map<String, Object> map = new HashMap<String, Object>();
			map = objectMapper.readValue(connection.getInputStream(), new HashMap().getClass());

			// json의 result로 담겨서 온다
			Map<String, Object> resultMap = (Map<String, Object>) map.get("result");

			// result.list -> 은행정보
			List<Map<String, Object>> list = (List<Map<String, Object>>) resultMap.get("list");

			for (Map<String, Object> baseItem : list) {
				bank = objectMapper.convertValue(baseItem, ManageBankVO.class);
				if (bank.getFinanceNm().contains("(구)") || bank.getFinanceNm().contains("[폐]"))
					continue;
				bankList.add(bank);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * 통계검색목록
	 * 
	 * @param statisticsList
	 */
	public void statisticsList(List<StatisticsVO> statisticsList) {
		StatisticsVO statistics;
		try {
			URL url = new URL(
					"https://fisis.fss.or.kr/openapi/statisticsListSearch.json?lang=kr&auth=e81ca820290fdf2f8e55a6fd3791327c&lrgDiv=A");

			HttpURLConnection connection = (HttpURLConnection) url.openConnection();
			connection.setRequestMethod("GET");

			// JSON 데이터를 map으로 매핑
			ObjectMapper objectMapper = new ObjectMapper();
			Map<String, Object> map = new HashMap<String, Object>();
			map = objectMapper.readValue(connection.getInputStream(), new HashMap().getClass());

			// json의 result로 담겨서 온다
			Map<String, Object> resultMap = (Map<String, Object>) map.get("result");

			// result.list -> 은행정보
			List<Map<String, Object>> list = (List<Map<String, Object>>) resultMap.get("list");

			for (Map<String, Object> baseItem : list) {
				statistics = objectMapper.convertValue(baseItem, StatisticsVO.class);
				statisticsList.add(statistics);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	public void statisticsList(List<StatisticsVO> statisticsList,String smlDiv) {
		StatisticsVO statistics;
		try {
			URL url = new URL(
					"https://fisis.fss.or.kr/openapi/statisticsListSearch.json?lang=kr&auth=e81ca820290fdf2f8e55a6fd3791327c&lrgDiv=A&smlDiv="+smlDiv);
			
			HttpURLConnection connection = (HttpURLConnection) url.openConnection();
			connection.setRequestMethod("GET");
			
			// JSON 데이터를 map으로 매핑
			ObjectMapper objectMapper = new ObjectMapper();
			Map<String, Object> map = new HashMap<String, Object>();
			map = objectMapper.readValue(connection.getInputStream(), new HashMap().getClass());
			
			// json의 result로 담겨서 온다
			Map<String, Object> resultMap = (Map<String, Object>) map.get("result");
			
			// result.list -> 은행정보
			List<Map<String, Object>> list = (List<Map<String, Object>>) resultMap.get("list");
			
			for (Map<String, Object> baseItem : list) {
				statistics = objectMapper.convertValue(baseItem, StatisticsVO.class);
				statisticsList.add(statistics);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}


	public void statisticsInfo(List<StatisticsInfoVO> infoList, String financeCd, String listNo, String accountCd,
			String term, String startBaseMm, String endBaseMm, List<String> unitList) {
		StatisticsInfoVO info = null;
		try {
			URL url = new URL(
					"http://fisis.fss.or.kr/openapi/statisticsInfoSearch.json?lang=kr&auth=e81ca820290fdf2f8e55a6fd3791327c&financeCd="
							+ financeCd + "&listNo=" + listNo + "&term=" + term + "&startBaseMm=" + startBaseMm
							+ "&endBaseMm=" + endBaseMm+"&accountCd=" +accountCd);
			HttpURLConnection connection = (HttpURLConnection) url.openConnection();
			connection.setRequestMethod("GET");

			int responseCode = connection.getResponseCode();
			if (responseCode == HttpURLConnection.HTTP_OK) {
				ObjectMapper objectMapper = new ObjectMapper();
				Map<String, Object> map = new HashMap<String, Object>();
				map = objectMapper.readValue(connection.getInputStream(), new HashMap().getClass());

				Map<String, Object> resultMap = (Map<String, Object>) map.get("result");
				List<Map<String, Object>> list = (List<Map<String, Object>>) resultMap.get("list");
				for (Map<String, Object> baseItem : list) {
					info = objectMapper.convertValue(baseItem, StatisticsInfoVO.class);
//					dao.statisticInfoInsert(info);
					infoList.add(info);
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
				unitList.add((String) resultMap.get("unit") ) ;
				if (resultMap.containsKey("list")) {
					List<Map<String, Object>> list = (List<Map<String, Object>>) resultMap.get("list");
					
					for (Map<String, Object> baseItem : list) {
						info = objectMapper.convertValue(baseItem, StatisticsInfoVO.class);
//						dao.statisticInfoInsert(info);
//						if (resultMap.containsKey("description")) {
//							System.out.println(info);
//							List<Map<String, Object>> descriptionList = (List<Map<String, Object>>) resultMap.get("description");
//							for (Map<String, Object> descriptionMap : descriptionList) {
//								DescriptionVO description = objectMapper.convertValue(descriptionMap,
//										DescriptionVO.class);
//								description.setAccountCd(info.getAccountCd());
//								description.setAccountNm(info.getAccountNm());
//								description.setBaseMonth(info.getBaseMonth());
//								description.setFinanceCd(info.getFinanceCd());
//								dao.statisticInfoDescriptionInsert(description);
//							}
//						}
						infoList.add(info);
					}
				}
			} else {
				System.out.println("Server responded with status code: " + responseCode);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
//	public void statisticsInfo(List<StatisticsInfoVO> infoList, String financeCd, String listNo, String accountCd,
//			String term, String startBaseMm, String endBaseMm) {
//		StatisticsInfoVO info = null;
//		try {
//			URL url = new URL(
//					"http://fisis.fss.or.kr/openapi/statisticsInfoSearch.json?lang=kr&auth=e81ca820290fdf2f8e55a6fd3791327c&financeCd="
//							+ financeCd + "&listNo=" + listNo + "&term=" + term + "&startBaseMm=" + startBaseMm
//							+ "&endBaseMm=" + endBaseMm+"&accountCd=" +accountCd);
//			HttpURLConnection connection = (HttpURLConnection) url.openConnection();
//			connection.setRequestMethod("GET");
//			
//			int responseCode = connection.getResponseCode();
//			if (responseCode == HttpURLConnection.HTTP_OK) {
//				ObjectMapper objectMapper = new ObjectMapper();
//				Map<String, Object> map = new HashMap<String, Object>();
//				map = objectMapper.readValue(connection.getInputStream(), new HashMap().getClass());
//				
//				Map<String, Object> resultMap = (Map<String, Object>) map.get("result");
//				List<Map<String, Object>> list = (List<Map<String, Object>>) resultMap.get("list");
//				
//				for (Map<String, Object> baseItem : list) {
//					info = objectMapper.convertValue(baseItem, StatisticsInfoVO.class);
////					dao.statisticInfoInsert(info);
//					infoList.add(info);
//				}
//			} else if (responseCode == 307) {
//				// 수동 리다이렉션 처리
//				String newURL = connection.getHeaderField("Location");
//				URL newUrl = new URL(newURL);
//				HttpURLConnection newConnection = (HttpURLConnection) newUrl.openConnection();
//				newConnection.setRequestMethod("GET");
//				ObjectMapper objectMapper = new ObjectMapper();
//				Map<String, Object> map = new HashMap<String, Object>();
//				map = objectMapper.readValue(newConnection.getInputStream(), new HashMap().getClass());
//				
//				Map<String, Object> resultMap = (Map<String, Object>) map.get("result");
//				
//				if (resultMap.containsKey("list")) {
//					List<Map<String, Object>> list = (List<Map<String, Object>>) resultMap.get("list");
//					
//					for (Map<String, Object> baseItem : list) {
//						info = objectMapper.convertValue(baseItem, StatisticsInfoVO.class);
////						dao.statisticInfoInsert(info);
////						if (resultMap.containsKey("description")) {
////							System.out.println(info);
////							List<Map<String, Object>> descriptionList = (List<Map<String, Object>>) resultMap.get("description");
////							for (Map<String, Object> descriptionMap : descriptionList) {
////								DescriptionVO description = objectMapper.convertValue(descriptionMap,
////										DescriptionVO.class);
////								description.setAccountCd(info.getAccountCd());
////								description.setAccountNm(info.getAccountNm());
////								description.setBaseMonth(info.getBaseMonth());
////								description.setFinanceCd(info.getFinanceCd());
////								dao.statisticInfoDescriptionInsert(description);
////							}
////						}
//						infoList.add(info);
//					}
//				}
//			} else {
//				System.out.println("Server responded with status code: " + responseCode);
//			}
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//	}

}
